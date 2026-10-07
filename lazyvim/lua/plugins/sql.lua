-- vim-dadbod(-completion) connects to $DATABASE_URL when a sql buffer opens. Prisma-style
-- URLs carry `?schema=x`, which psql rejects ("invalid URI query parameter"), so hand
-- dadbod an equivalent libpq URL that sets search_path instead.
local function libpq_url(url)
  if not (url and url:match("^postgres") and url:match("[?&]schema=")) then
    return nil
  end
  local schema = url:match("[?&]schema=([^&]*)")
  url = url:gsub("([?&])schema=[^&]*&?", "%1"):gsub("[?&]$", "")
  return url .. (url:find("?", 1, true) and "&" or "?") .. "options=-csearch_path%3D" .. schema
end

return {
  {
    "tpope/vim-dadbod",
    init = function()
      local url = libpq_url(vim.env.DATABASE_URL)
      if url and vim.g.db == nil then
        vim.g.db = url
      end
    end,
  },
}
