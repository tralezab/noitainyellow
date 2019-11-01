
function OnPlayerSpawned( player_entity ) -- this runs when player entity has been created

	-- prevents doing this on every startup
	local init_check_flag = "start_loadouts_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )


	local inventory = nil
	local x,y = EntityGetTransform( player_entity )

	-- find the quick inventory
	local player_child_entities = EntityGetAllChildren( player_entity )
	if ( player_child_entities ~= nil ) then
		for i,child_entity in ipairs( player_child_entities ) do
			local child_entity_name = EntityGetName( child_entity )
			
			if ( child_entity_name == "inventory_quick" ) then
				inventory = child_entity
			end
		end
	end
end