-- luacheck: globals vim

local source = {}

local create_job = function(self)
  return vim.fn.jobstart({ "mocword" }, {
    shell = "mocword",
    on_stdout = function(_, data)
      local complete_items = {}
      for _, line in ipairs(data) do
        for suggestion in string.gmatch(line, "%S+") do
          table.insert(complete_items, {
            label = suggestion,
            kind = 1,  -- text https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/types/lsp.lua
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
  self.output_buffer = {}
  self.mocword_job = create_job(self)
  return self
end

source.reset = function(self)
  vim.fn.jobstop(self.mocword_job)
  self.output_buffer = {}
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
  self.output_buffer = {}
  vim.fn.chansend(self.mocword_job, params.context.cursor_before_line .. "\n")
  self.callback = callback
end

return source
