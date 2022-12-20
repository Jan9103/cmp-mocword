# `cmp-mocword`

[mocword][] completion source for [nvim-cmp][].

Forked from [cmp-fish](https://github.com/mtoohey31/cmp-fish).

## Usage

```lua
require("packer").use({ "jan9103/cmp-mocword", ft = {"markdown", "text"} })

local compare = require('cmp.config.compare')

cmp.setup({
  sorting = {
    comparators = {
      compare.score,
      -- …
      compare.order,
    },
  },
  sources = cmp.config.sources({
    { name = 'mocword' },
  })
})
```

| Note | As far as i am aware it is not yet possible to have source specific sorting. If you wan't to have a correct order your top comparator should be `score` or `order`. |
| --- | --- |

## Dependencies

- (neo-)vim with [nvim-cmp][]
- A working [mocword][] cli
  - <https://github.com/high-moctane/mocword>
  - <https://github.com/high-moctane/mocword-data>
  - `MOCWORD_DATA` environment variable


[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[mocword]: https://github.com/high-moctane/mocword
