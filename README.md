# `cmp-mocword`

[Mocword](https://github.com/high-moctane/mocword) completion source for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

Forked from [cmp-fish](https://github.com/mtoohey31/cmp-fish).

```lua
require("packer").use({ "TODO", ft = {"markdown", "text"} })

cmp.setup({
  sources = cmp.config.sources({
    { name = 'mocword' }
  })
})
```
