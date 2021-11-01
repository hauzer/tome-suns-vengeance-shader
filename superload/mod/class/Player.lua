local _M = loadPrevious(...)

local base_updateMainShader = _M.updateMainShader
function _M:updateMainShader()
  local retval = base_updateMainShader(self)
  
  if game.fbo_shader and self:attr('amplify_sun_beam') then
    game.fbo_shader:setUniform('colorize', {1, 0.3, 0, 0.3})
  end

  return retval
end

return _M
