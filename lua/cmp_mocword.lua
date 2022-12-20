-- luacheck: globals vim
local source = {}

local create_job = function(self)
  return vim.fn.jobstart({ "mocword" }, {
    shell = "mocword",
    on_stdout = function(_, data)
      local complete_items = {}
      for _, line in ipairs(data) do
        local words = string.gmatch(line, "%S+")
        local score = 100
        for suggestion in words do
          -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionItem
          score = score - 1
          table.insert(complete_items, {
            label = suggestion,
            kind = 1,
            score = score,
            --detail = '',
          })
        end
      end
      self.callback(complete_items)
    end,
  })
end

source.new = function()
  local self = setmetatable({}, {
    __index = source,
  })
  self.mocword_job = create_job(self)
  return self
end

source.reset = function(self)
  vim.fn.jobstop(self.mocword_job)
  self.mocword_job = create_job(self)
end

source.is_available = function()
  return true  -- allow the user to use it whereever
end

source.get_debug_name = function()
  return "mocword"
end

source.get_keyword_pattern = function(_)
  return [[.]]
end

source.complete = function(self, params, callback)
  vim.fn.chansend(self.mocword_job, params.context.cursor_before_line .. "\n")
  self.callback = callback
end

return source
