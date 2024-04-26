testWindowButton = nil
testWindowWindow = nil

-- This function creates the screen elements, the button tat will make the window appear and the window itself.
function init()
  testWindowButton = modules.client_topmenu.addRightToggleButton('testWindowButton', tr('Test Window'), '/testWindow/testWindow/testWindow', closing)
  testWindowButton:setOn(false)

  testWindowWindow = g_ui.displayUI('testWindow')
  testWindowWindow:setVisible(false)

  moveButton()                -- Calling the function to move the buttun when the window initialises 

end

-- Function to destroy the elements
function terminate()
  testWindowButton:destroy()
  testWindowWindow:destroy()
end

-- Closing of the window
function closing()
  if testWindowButton:isOn() then
    testWindowWindow:setVisible(false)
    testWindowButton:setOn(false)
  else
    testWindowWindow:setVisible(true)
    testWindowButton:setOn(true)
  end
end

-- function to move the button continuously
function moveButton()
  button = testWindowWindow:recursiveGetChildById('jump')                     -- Get the button object fron the window
  local parent = button:getParent()                                           -- The parent is the window
  local xmin = parent:getX()                                                  -- Set the limits of the position for the button depending on the window
  local xmax = parent:getX() + parent:getWidth() - button:getWidth()          -- Adding the size of the button to prevent it from being outside the window
  local ymin = parent:getY() + button:getHeight()
  local ymax = parent:getY() + parent:getHeight() - button:getHeight() - 5

  button:setPosition({ x = button:getX() - 1, y = button:getY()})             -- The movement: taking one from the x value as the button needs to move to the left and the 0 values are on the left of the screen
  if button:getX() < xmin then                                                -- If the button reaches the border of the window, set its position bact to the right of the window at a random height in the window
    button:setPosition({ x = xmax , y = math.random(ymin, ymax) })
  end
  button:setVisible(true)                                                     -- Make the button visible after every move
  scheduleEvent(function() moveButton() end, 25)                              -- Calling the function recursively every 25 milliseconds
end

-- function that defines the action hapenning when we click the button
function buttonClick()
  button = testWindowWindow:recursiveGetChildById('jump')                     
  local parent = button:getParent()
  local xmin = parent:getX()                                                  
  local xmax = parent:getX() + parent:getWidth() - button:getWidth()        
  local ymin = parent:getY() + button:getHeight()
  local ymax = parent:getY() + parent:getHeight() - button:getHeight() - 5
  
  button:setPosition({ x = xmax , y = math.random(ymin, ymax) })              -- When the button is cliked, move the button to the right of the window at a random height
  button:setVisible(true)
end