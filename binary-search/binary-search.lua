return function(array, target)
  local left = 1
  local right = #array

  while left <= right do
    local mid = math.floor((left + right) / 2)

    if array[mid] < target then
      left = mid + 1
    elseif array[mid] > target then
      right = mid - 1
    else
      return mid
    end
  end

  return -1
end
