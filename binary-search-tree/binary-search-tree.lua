local BinarySearchTree = {}

function BinarySearchTree:new(val)
  local tree = {value = val}
  tree.left = nil
  tree.right = nil

  self.__index = self
  return setmetatable(tree, self)
end

function BinarySearchTree:from_list(values)
  assert(#values > 0)

  local tree = BinarySearchTree:new(values[1])

  for i = 2, #values do
    tree:insert(values[i])
  end

  return tree
end

function BinarySearchTree:insert(val)
  local side = val <= self.value and 'left' or 'right'

  if self[side] then
    self[side]:insert(val)
  else
    self[side] = BinarySearchTree:new(val)
  end
end

function BinarySearchTree:getValues(values)
  local values = values or {}

  if self.left ~= nil then values = self.left:getValues(values) end
  table.insert(values, self.value)
  if self.right ~= nil then values = self.right:getValues(values) end

  return values
end

function BinarySearchTree:values()
  local values = self:getValues()
  local index = 0
  local count = #values

  return function()
    index = index + 1
    if index <= count then
      return values[index]
    end
  end
end

return BinarySearchTree
