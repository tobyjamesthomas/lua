return function(s)
  -- return s:reverse()

  local reverse = ''

  for c in s:gmatch(".") do
    reverse = c .. reverse
  end

  return reverse
end
