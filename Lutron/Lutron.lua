local StateMachine = require("Lutron/State/StateMachine")
local FontLarge = require("Lutron/Font/FontLarge")
local Lutron
do
  local _class_0
  local _parent_0 = StateMachine
  local _base_0 = {
    load = function(self)
      math.randomseed(self.randomseed)
      self.defaultFont:load()
      self.defaultFont:set()
      lutro.graphics.setBackgroundColor(self.r, self.g, self.b)
      for name, state in pairs(self.states) do
        state:load()
      end
      return self:currentState():enter(nil)
    end,
    update = function(self, dt)
      return self:currentState():update(dt)
    end,
    draw = function(self)
      lutro.graphics.clear()
      return self:currentState():draw()
    end,
    addEntity = function(self, entity, name)
      if name == nil then
        name = nil
      end
      return self:currentState():addEntity(entity, name)
    end,
    entities = function(self)
      return self:currentState().entities
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, width, height, startingState)
      if width == nil then
        width = 320
      end
      if height == nil then
        height = 240
      end
      if startingState == nil then
        startingState = nil
      end
      _class_0.__parent.__init(self, startingState)
      self.width = width
      self.height = height
      self.r = 0
      self.g = 0
      self.b = 0
      self.randomseed = os.time()
      self.defaultFont = FontLarge()
    end,
    __base = _base_0,
    __name = "Lutron",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Lutron = _class_0
  return _class_0
end
