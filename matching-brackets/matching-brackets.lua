Stack = {}

function Stack:Create()
  local s = {}
  s.table = {}

  function s:push(e)
    table.insert(self.table, e)
  end

  function s:pop()
    return table.remove(self.table)
  end

  function s:empty()
    return #self.table == 0
  end

  return s
end

return {
  valid = function(s)
    local open = {['['] = true, ['{'] = true, ['('] = true}
    local close = {[']'] = '[', ['}'] = '{', [')'] = '('}

    local stack = Stack:Create()

    for i = 1, s:len() do
      local char = s:sub(i,i)

      if open[char] then
        stack:push(char)
      elseif close[char] then
        if stack:pop() ~= close[char] then return false end
      end
    end

    return stack:empty()
  end
}
