-- Adaptación a NixOS.
--
-- Mason instala binarios precompilados que NO corren en NixOS (el linker de
-- NixOS no encuentra las librerías dinámicas esperadas). Por eso deshabilitamos
-- Mason y proveemos los LSP/formatters/DAP por Nix (ver nixos/home/neovim.nix).
-- LazyVim usa nvim-lspconfig, que arranca cualquier server que esté en el PATH.
--
-- Solo aplica en NixOS: en otras máquinas (Omarchy, WSL, etc.) Mason sigue
-- siendo la forma normal de instalar LSP/formatters/DAP.
if not vim.uv.fs_stat("/etc/NIXOS") then
  return {}
end

return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
}
