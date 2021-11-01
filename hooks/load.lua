class:bindHook('ToME:birthDone', function(self)
    game.addons = game.addons or {}
    game.addons.suns_vengeance_shader = game.addons.suns_vengeance_shader or {}
    local addon = game.addons.suns_vengeance_shader

    local EFF_SUN_VENGEANCE = game.player.tempeffect_def.EFF_SUN_VENGEANCE
    
    addon.base_activate = EFF_SUN_VENGEANCE.activate
    EFF_SUN_VENGEANCE.activate = function(self, eff)
        eff.suns_vengeance_shader_id = self:addTemporaryValue('suns_vengeance_shader', 1)
        if addon.base_activate then
            return addon.base_activate(self, eff)
        end
    end

    addon.base_deactivate = EFF_SUN_VENGEANCE.deactivate
    EFF_SUN_VENGEANCE.deactivate = function(self, eff)
        self:removeTemporaryValue('suns_vengeance_shader', eff.suns_vengeance_shader_id)
        if addon.base_deactivate then
            return addon.base_deactivate(self, eff)
        end
    end

    addon.base_updateMainShader = game.player.updateMainShader
    game.player.updateMainShader = function(self)
        local base_return = addon.base_updateMainShader(self)

        if game.fbo_shader and self:attr('suns_vengeance_shader') then
            game.fbo_shader:setUniform('colorize', {1, 0.3, 0, 0.3})
        end

        return base_return
    end
end)
