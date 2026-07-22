-- Java formatting via google-java-format (matches Spotless on chess-backend-java).
--
-- LazyVim's conform.nvim setup uses lsp_format = "fallback" by default, so
-- registering a formatter for the `java` filetype here means jdtls will not
-- format Java files on save — conform delegates to google-java-format instead,
-- producing byte-identical output to `./mvnw spotless:apply`.
--
-- Version is pinned to match `spotless-maven-plugin` configuration in the
-- chess-backend-java pom.xml (`googleJavaFormat.version = 1.22.0`). If that
-- version is bumped in any project, update the path below to match.
local gjf_jar = vim.fn.expand(
  "~/.local/share/google-java-format/google-java-format-1.22.0-all-deps.jar"
)

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
      formatters = {
        ["google-java-format"] = {
          command = "java",
          args = {
            -- google-java-format >= 1.16 reflects into jdk.compiler internals
            -- that are encapsulated since JDK 16 (JEP 396). These exports are
            -- mandatory; without them the formatter throws IllegalAccessError.
            "--add-exports", "jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
            "--add-exports", "jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED",
            "--add-exports", "jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
            "--add-exports", "jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
            "--add-exports", "jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED",
            "--add-exports", "jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
            "-jar", gjf_jar,
            "-",
          },
          stdin = true,
        },
      },
    },
  },
}
