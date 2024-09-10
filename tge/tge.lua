local tge_path = (...):sub(1,-5)

local tge = {
  path = tge_path,
  vec3 = require(tge_path..".vec3"),
}

return tge
