# Debug LSP Signature Help

## Pasos para diagnosticar:

### 1. Verificar estado de LSP
```vim
:LspInfo
```
- Debe mostrar `metals` como activo
- Estado debe ser "attached"

### 2. Verificar capabilities
```vim
:lua =vim.lsp.get_active_clients()[1].server_capabilities
```
- Buscar `signatureHelpProvider = true`

### 3. Verificar que metals esté funcionando
```vim
:lua =vim.lsp.get_active_clients()
```
- Debe mostrar al menos un cliente activo

### 4. Test manual básico
En un archivo .scala, crear:
```scala
object Test {
  def hello(name: String, age: Int): String = s"Hello $name, age $age"
  
  // Coloca cursor después del paréntesis y prueba <leader>k
  val result = hello(
}
```

### 5. Verificar logs de metals
```vim
:lua vim.lsp.set_log_level("debug")
:lua print(vim.lsp.get_log_path())
```

### 6. Alternative: Usar hover en su lugar
```vim
# Coloca cursor en 'hello' y presiona:
K
```