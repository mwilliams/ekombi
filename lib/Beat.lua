local Cycle = include 'ekombi-v2/lib/Cycle'
local SubBeat = include 'ekombi-v2/lib/SubBeat'

local Beat = {
  class_name = "Beat",
  editing = false,
  on = true,
  speed = 1,
  subs = {},
  sub_beat = nil
}

function Beat:new(n)
    local o = {}
    self.__index = self
    setmetatable(o, self)
    o.class_name = "Beat"
    o.editing = false
    o.on = true
    o.num = n
    o.speed = 1
    o.subs = Cycle:new(SubBeat, 1)
    o.sub_beat = o.subs:next()
    return o
end

function Beat:toggle()
    self.on = not self.on
end

return Beat