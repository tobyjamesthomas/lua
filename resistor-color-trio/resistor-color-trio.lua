values = {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9
}

return {
  decode = function(c1, c2, c3)
    local v1 = values[c1]
    local v2 = values[c2]
    local v3 = values[c3]

    local value = (v1 * 10 + v2) * (10 ^ v3)
    local unit = 'ohms'

    if value >= 1000 then
      value = value / 1000
      unit = 'kiloohms'
    end

    return value, unit
  end
}
