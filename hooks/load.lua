class:bindHook('ToME:birthDone', function(self, data)
    if not game.addons then
        game.addons = {}
    end

    if not game.addons.suns_vengeance_shader then
        game.addons.suns_vengeance_shader = {}
    end

    game.addons.suns_vengeance_shader.base_activate = game.player.tempeffect_def.EFF_SUN_VENGEANCE.activate
    game.player.tempeffect_def.EFF_SUN_VENGEANCE.activate = function(self, eff)
        eff.suns_vengeance_shader_id = self:addTemporaryValue('suns_vengeance_shader', 1)
        if game.addons.suns_vengeance_shader.base_activate then
            return game.addons.suns_vengeance_shader.base_activate(self, eff)
        end
    end

    game.addons.suns_vengeance_shader.base_deactivate = game.player.tempeffect_def.EFF_SUN_VENGEANCE.deactivate
    game.player.tempeffect_def.EFF_SUN_VENGEANCE.deactivate = function(self, eff)
        self:removeTemporaryValue('suns_vengeance_shader', eff.suns_vengeance_shader_id)
        if game.addons.suns_vengeance_shader.base_deactivate then
            return game.addons.suns_vengeance_shader.base_deactivate(self, eff)
        end
    end

    game.addons.suns_vengeance_shader.base_updateMainShader = game.player.updateMainShader
    game.player.updateMainShader = function(self)
        local retval = game.addons.suns_vengeance_shader.base_updateMainShader(self)

        if game.fbo_shader and self:attr('suns_vengeance_shader') then
            game.fbo_shader:setUniform('colorize', {1, 0.3, 0, 0.3})
        end

        return retval
    end
end)
