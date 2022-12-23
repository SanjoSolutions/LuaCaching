local addOnName = ...
local version = '1.0.0'

if not Library.isRegistered(addOnName, version) then
  --- @class Caching
  local Caching = {}

  Library.register(addOnName, version, Caching)

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
end
