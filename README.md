# `cmp-mocword`

[mocword][] completion source for [nvim-cmp][].

Forked from [cmp-fish](https://github.com/mtoohey31/cmp-fish).

## Usage

```lua
require("packer").use({ "jan9103/cmp-mocword", ft = {"markdown", "text"} })

cmp.setup({
  sources = cmp.config.sources({
    { name = 'mocword' }
  })
})
```

## Dependencies

- (neo-)vim with [nvim-cmp][]
- A working [mocword][] cli
  - <https://github.com/high-moctane/mocword>
  - <https://github.com/high-moctane/mocword-data>
  - `MOCWORD_DATA` environment variable


[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[mocword]: https://github.com/high-moctane/mocword
