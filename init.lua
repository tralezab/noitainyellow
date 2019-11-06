
function OnPlayerSpawned( player_entity ) -- this runs when player entity has been created

	-- prevents doing this on every startup
	local init_check_flag = "start_loadouts_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	local x,y = EntityGetTransform( player_entity )

	local inventory = nil
	local cape = nil
	local player_arm = nil
	
	local loadout_cape_color = loadout_choice.cape_color
	local loadout_cape_color_edge = loadout_choice.cape_color_edge

	-- find the quick inventory, player cape and arm
	local player_child_entities = EntityGetAllChildren( player_entity )
	if ( player_child_entities ~= nil ) then
		for i,child_entity in ipairs( player_child_entities ) do
			local child_entity_name = EntityGetName( child_entity )
			
			if ( child_entity_name == "inventory_quick" ) then
				inventory = child_entity
			end
			
			if ( child_entity_name == "cape" ) then
				cape = child_entity
			end
			
			if ( child_entity_name == "arm_r" ) then
				player_arm = child_entity
			end
		end
	end
end