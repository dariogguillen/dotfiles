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
}
