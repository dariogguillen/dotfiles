-- Cursor smear animation (LazyVim extra `ui.smear-cursor`, enabled in lazyvim.json).
-- Kitty (cursor_trail) and Ghostty (custom shader) already animate the cursor
-- themselves, so only enable it in the other terminals (Alacritty, WezTerm, ...).
-- Inside tmux these vars are refreshed on attach via `update-environment` in tmux.conf.
local function terminal_has_trail()
  local env = vim.env
  return env.KITTY_WINDOW_ID ~= nil
    or env.GHOSTTY_RESOURCES_DIR ~= nil
    or env.TERM_PROGRAM == "ghostty"
    or env.TERM == "xterm-kitty"
    or env.TERM == "xterm-ghostty"
end

return {
  "sphamba/smear-cursor.nvim",
  cond = vim.g.neovide == nil and not terminal_has_trail(),
}
