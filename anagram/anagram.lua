local Anagram = {}

-- Count the letters in a given word
local function countLetters(word)
  local count = {}

  for i = 1, word:len() do
    local letter = word:byte(i)

    if count[letter] == nil then
      count[letter] = 1
    else
      count[letter] = count[letter] + 1
    end
  end

  return count
end

function Anagram:new(word)
  obj = {length = word:len(), count = countLetters(word:lower())}
  self.__index = self
  return setmetatable(obj, self)
end

function Anagram:match(list)
  local matches = {}

  for i = 1, #list do
    local word = list[i]

    -- If the words are the size size
    if word:len() == self.length then
      local count = countLetters(word:lower())
      local match = true

      -- Compare the letter counts
      for key, val in pairs(count) do
        -- If a letter doesn't match, then it's not an anagram
        if count[key] ~= self.count[key] then match = false end
      end

      if match then table.insert(matches, word) end
    end
  end

  return matches
end

return Anagram
