minetest.override_item("default:goldblock", {
	on_punch = (function(pos, node, puncher, pointed_thing)
	local ms = minetest.find_node_near(pos, 1, {"default:mese"})
	if ms == nil then
	else
		local gl = {}
		gl["x"] = ms["x"]-pos["x"]
		gl["y"] = ms["y"]-pos["y"]
		gl["z"] = ms["z"]-pos["z"]
		if gl["y"] == 0 then
			if gl["z"] == 0 then
				while minetest.get_node(ms)["name"] == "default:mese" do
					ms["x"] = ms["x"] + gl["x"]
				end
				puncher:setpos({x=pos["x"]+((ms["x"]-pos["x"]-gl["x"])*100), y=pos["y"]+1, z=pos["z"]})
			end
			if gl["x"] == 0 then
				while minetest.get_node(ms)["name"] == "default:mese" do
					ms["z"] = ms["z"] + gl["z"]
				end
				puncher:setpos({x=pos["x"], y=pos["y"]+1, z=pos["z"]+((ms["z"]-pos["z"]-gl["z"])*100)})
			end
		end
	end		
	end)
})
