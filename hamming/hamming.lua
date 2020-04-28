local Hamming = {}

function Hamming.compute(a,b)
  -- Not the same size
  if a:len() ~= b:len() then return -1 end

  -- Strings are equal
  if a == b then return 0 end

  local len = a:len()
  local count = 0

  -- String are not equal
  for i = 1, len do
    if a:byte(i) ~= b:byte(i) then count = count + 1 end
  end

  return count
end

return Hamming
