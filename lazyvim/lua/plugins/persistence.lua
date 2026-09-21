return {
  "folke/persistence.nvim",
  opts = {
    -- Key sessions by directory only. The default (branch = true) appends the
    -- git branch, but branch detection is flaky (depends on cwd/git state), so
    -- a save and a later restore could land on different session files and
    -- bring back a stale set of buffers.
    branch = false,
    -- Always save on exit, even when down to a single (or zero) file buffer,
    -- so closing everything but one file still updates the session.
    need = 0,
  },
  init = function()
    -- Diagnostic: log every completed save to a file (a floating notify
    -- can fail to render if nvim exits right after, so this needs to
    -- survive the process dying immediately after). If a session goes
    -- stale again, check this log to see whether the save even ran.
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceSavePost",
      callback = function()
        local log = vim.fn.stdpath("state") .. "/persistence-save.log"
        local line = os.date("%Y-%m-%d %H:%M:%S") .. " " .. require("persistence").current() .. "\n"
        local fd = io.open(log, "a")
        if fd then
          fd:write(line)
          fd:close()
        end
      end,
    })
  end,
}
