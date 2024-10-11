local love = require "love";
local Color = require "KrsLibs.Structs.Color";
local Size = require "KrsLibs.Structs.Size";
local Point = require "KrsLibs.Structs.Point";
local delegate = require "KrsLibs.Utils.Delegate";
local MouseUtils = require "KrsLibs.Utils.MouseUtils";
local GUIUtils = require "KrsLibs.GUI.GUIUtils"

---@alias Font any

---@class EVENT_Click
---@field clickedX number
---@field clickedY number
---@field buttonClicked ClickType
---@field hasClicked boolean

---@class Control
---@field Position Point
---@field Size Size
---@field BackGroundColor RGB
---@field protected Text string
---@field FontText Font
---@field ForeGroundColor RGB
---@field IsFocused boolean
---@field Padding {leftright:number, topbottom:number} --- In pixels
---@field DrawUpdate fun(self:Control):nil
---@field LogicUpdate fun(self:Control, clickX: integer, clickY:integer, buttonClickNum:integer):nil
---@field onClick DelegateType<fun(clickEvent: EVENT_Click), EVENT_Click>
---@field setText fun(self:Control, newText:string)
---@field getText fun(self:Control):string
local Button = {
  Position = Point(0,0),
  Size = Size(100,100), -- Width, Height, Position, Offset
  BackGroundColor = Color.Black;
  Text = "Button",
  FontText = love.graphics.newFont(12, "normal", 12),
  ForeGroundColor = Color.White,
  IsFocused = false,
  --- In pixels
  Padding = { leftright = 20, topbottom = 5 },
  onClick = delegate()
}
---                         GETTERS / SETTERS SECTION

function Button:setText(newText) self.Text = newText end
function Button:getText() return self.Text end

--                           RENDER SECTION

---@private
---@param self Control
local function __RenderUpdate(self)
    Color.SetThisColor(self.BackGroundColor);
    love.graphics.rectangle("fill", self.Position.x, self.Position.y, self.Size.Width, self.Size.Height, 0, 0, nil);

    Color.SetThisColor(self.ForeGroundColor);
    love.graphics.print(
        self:getText(),
        self.FontText,
        self.Position.x + self.Padding.leftright, --Should consider padding
        self.Position.y + self.Padding.topbottom, --Same as above
        0,                                        --radians
        1,                                        --scale factor x
        1,                                        --scale factor y
        0,                                        --origin offset x
        0,                                        --origin offset y
        0,                                        --shearing factor x
        0                                         --shearing factor y
    )
    Color.SetThisColor(Color.White);
end

---@private
---@param self Control
---@param clickedX integer
---@param clickedY integer
---@param buttonClickNum integer
local function __EventsUpdate(self, clickedX, clickedY, buttonClickNum)
    local clicked = MouseUtils.HasClicked(
        self.Position.x, 
        self.Position.y,  
        self.Size.Width, 
        self.Size.Height,
        clickedX,
        clickedY
    );
    
    ---@type EVENT_Click
    local EVENT_Click_Obj = {
        buttonClicked = MouseUtils.GetClickButtonFromNumber(buttonClickNum),
        clickedX = clickedX,
        clickedY = clickedY,
        hasClicked = clicked
    };
    self.onClick:CallAll(EVENT_Click_Obj);
end

function Button:DrawUpdate()
    __RenderUpdate(self)
end

function Button:LogicUpdate(clickX, clickY, buttonClickNum)
    __EventsUpdate(self, clickX, clickY, buttonClickNum)
end

--- Button constructor for GUI!
---@overload fun(x:number, y:number):Control
---@overload fun(x:number, y:number, text:string):Control
---@param x number
---@param y number
---@param text string
---@param width number|nil
---@param height number|nil
---@return Control Button A new freshly created button
return function(x, y, text, width, height)
    local _ = setmetatable({}, { __index = Button })

    _:setText(text or "Button Default");
    _.Size = GUIUtils.CalculateSizeBasedOnText(_, text)
    _.Position = Point(x,y);

    return _;
end

