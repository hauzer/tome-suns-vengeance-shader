-- Sun's Vengeance Shader - ToME addon
-- Copyright (C) 2014 Никола "hauzer" Вукосављевић
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local _M = loadPrevious(...)

local updateMainShader = _M.updateMainShader
function _M:updateMainShader()
    updateMainShader(self)
    
    if game.fbo_shader then
        if self:attr('suns_vengeance') then game.fbo_shader:setUniform('colorize', {1, 0.3, 0, 0.3}) end
    end
end

return _M
