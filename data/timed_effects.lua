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

local suns_vengeance = TemporaryEffects.tempeffect_def.EFF_SUN_VENGEANCE

local suns_vengeance_activate = suns_vengeance.activate
suns_vengeance.activate = function(self, eff)
    suns_vengeance_activate(self, eff)
    eff.tmpid = self:addTemporaryValue('suns_vengeance', 1)
end

suns_vengeance.deactivate = function(self, eff)
    self:removeTemporaryValue('suns_vengeance', eff.tmpid)
end
