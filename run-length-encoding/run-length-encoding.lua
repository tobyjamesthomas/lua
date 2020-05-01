return {
  encode = function(s)
    local output = ''
    local cur = ''
    local num = 0

    for c in s:gmatch('.') do
      if c == cur then
        num = num + 1
      else
        output = num > 1 and output .. num .. cur or output .. cur
        cur = c
        num = 1
      end
    end

    output = num > 1 and output .. num .. cur or output .. cur

    return output
  end,

  decode = function(s)
    local output = ''

    for word in s:gmatch('(%d*.)') do
      local num = tonumber(word:sub(1, -2)) or 1
      local char = word:sub(-1)
      output = output .. char:rep(num)
    end

    return output
  end
}
