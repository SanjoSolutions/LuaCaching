local addOnName = 'Caching'
local version = '1.0.0'

if _G.Library and not Library.isRegistered(addOnName, version) then
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
else
  error(addOnName + ' requires Library. It seems absent.')
end
