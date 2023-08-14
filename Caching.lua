local addOnName = 'Caching'
local version = '2.0.0'

if _G.Library then
  if not Library.isRegistered(addOnName, version) then
    --- @class Caching
    local Caching = {}

    function Caching.cached(fn)
      local hasResultBeenCached = false
      local cachedResult = nil
      return function(...)
        if not hasResultBeenCached then
          cachedResult = { fn(...) }
          hasResultBeenCached = true
        end
        return unpack(cachedResult)
      end
    end

    Library.register(addOnName, version, Caching)
  end
else
  error(addOnName .. ' requires Library. It seems absent.')
end
