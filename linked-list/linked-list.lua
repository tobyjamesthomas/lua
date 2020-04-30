return function()
  local list = {}
  list.values = {}

  function list:push(val)
    table.insert(self.values, val)
  end

  function list:pop()
    return table.remove(self.values)
  end

  function list:unshift(val)
    table.insert(self.values, 1, val)
  end

  function list:shift()
    return table.remove(self.values, 1)
  end

  function list:count()
    return #self.values
  end

  function list:delete(val)
    local i = 1
    while i <= self:count() do
      if self.values[i] == val then
        table.remove(self.values, i)
      else
        i = i + 1
      end
    end
  end

  return list
end
