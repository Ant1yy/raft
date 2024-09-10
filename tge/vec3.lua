local keysEnum = {
  [ 1 ] = 1, [ 2 ] = 2, [ 3 ] = 3,
  ["x"] = 1, ["y"] = 2, ["z"] = 3,
  ["r"] = 1, ["g"] = 2, ["b"] = 3,
}

local vec3 = {}

vec3.__index = function(self, key)
  if keysEnum[key] then
    return rawget(self, keysEnum[key])
  else
    return vec3[key]
  end
end

vec3.__newindex = function(self, key, value)
  if keysEnum[key] then
    rawset(self, keysEnum[key], value)
  else
    -- No
  end
end

function vec3.new(x, y, z)
  return setmetatable({ x, y, z }, vec3)
end

function vec3.clone(self)
  return vec3.new(self[1], self[2], self[3])
end

function vec3.copy(self, other)
  self[1] = other[1]
  self[2] = other[2]
  self[3] = other[3]
end

function vec3.add_number(self, number)
  self[1] = self[1] + number
  self[2] = self[2] + number
  self[3] = self[3] + number
end

function vec3.sub_number(self, number)
  self[1] = self[1] - number
  self[2] = self[2] - number
  self[3] = self[3] - number
end

function vec3.mul_number(self, number)
  self[1] = self[1] * number
  self[2] = self[2] * number
  self[3] = self[3] * number
end

function vec3.div_number(self, number)
  self[1] = self[1] / number
  self[2] = self[2] / number
  self[3] = self[3] / number
end

function vec3.add_other(self, other)
  self[1] = self[1] + other[1]
  self[2] = self[2] + other[2]
  self[3] = self[3] + other[3]
end

function vec3.sub_other(self, other)
  self[1] = self[1] - other[1]
  self[2] = self[2] - other[2]
  self[3] = self[3] - other[3]
end

function vec3.mul_other(self, other)
  self[1] = self[1] * other[1]
  self[2] = self[2] * other[2]
  self[3] = self[3] * other[3]
end

function vec3.div_other(self, other)
  self[1] = self[1] / other[1]
  self[2] = self[2] / other[2]
  self[3] = self[3] / other[3]
end

function vec3.dot(self, other)
  return self[1] * other[1] + self[2] * other[2] + self[3] * other[3]
end

function vec3.length(self)
  return math.sqrt(self:dot(self))
end

function vec3.normalize(self)
  self:div_number(self:length())
end

function vec3.cross(self, other)
  local x = self[2] * other[3] - self[3] * other[2]
  local y = self[3] * other[1] - self[1] * other[3]
  local z = self[1] * other[2] - self[2] * other[1]
  return vec3.new(x, y, z)
end

return vec3
