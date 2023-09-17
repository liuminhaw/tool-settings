# Helix settingsoj

- [Preview Markdown](##preview-markdown)

## Preview Markdown
Setup markdown preview in Helix using Markdown Preview Language Server [mdpls](https://github.com/euclio/mdpls)
1. Installing mdpls: [mdpls installation](https://github.com/euclio/mdpls#installation)
2. Setup language config 
    ```toml
    # <config_dir>/helix/languages.toml 
    [[language]]
    name = "markdown"
    language-server = { command = "/path/to/mdpls" }
    config = { markdown.preview.auto = true, markdown.preview.browser = "google-chrome" }
    ```
3. Open preview (Optional): `:lsp-workspace-command Open\ Preview`

### Reference
- [MarkDown Preview](https://github.com/helix-editor/helix/issues/2824)
