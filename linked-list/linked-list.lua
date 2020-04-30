Node = {}

function Node:Create(val)
  local v = {}
  v.value = val
  v.next = nil
  v.prev = nil
  return v
end

return function()
  local list = {}

  local head = nil
  local tail = nil
  local count = 0

  function list:push(val)
    node = Node:Create(val)

    if tail == nil then
      head = node
    else
      node.prev = tail
      tail.next = node
    end

    tail = node
    count = count + 1
  end

  function list:pop()
    local val = nil

    if tail ~= nil then
      val = tail.value
      tail = tail.prev
      count = count - 1
    end

    return val
  end

  function list:unshift(val)
    node = Node:Create(val)

    if head == nil then
      tail = node
    else
      node.next = head
      head.prev = node
    end

    head = node
    count = count + 1
  end

  function list:shift()
    local val = nil

    if head ~= nil then
      val = head.value
      head = head.next
      count = count - 1
    end

    return val
  end

  function list:count()
    return count
  end

  function list:delete(val)
    local cur = head

    while cur ~= nil do
      if cur.value == val then
        if cur == head then head = cur.next end
        if cur == tail then tail = cur.prev end
        if cur.prev ~= nil then cur.prev.next = cur.next end
        if cur.next ~= nil then cur.next.prev = cur.prev end
        count = count - 1
      end

      cur = cur.next
    end
  end

  return list
end
