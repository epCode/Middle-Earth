
local noise = PerlinNoise({offset = 0, scale = 1, spread = {x = 500, y = 500, z = 500}, seed = 571347, octaves = 5, persistence = 0.63, lacunarity = 2.0, flags = "defaults, absvalue"})

local noise_mult = PerlinNoise({offset = 0, scale = 1, spread = {x = 100, y = 100, z = 100}, seed = 75849, octaves = 5, persistence = 0.63, lacunarity = 2.0, flags = "defaults, absvalue"})

local noise_river = PerlinNoise({offset = 0, scale = 1, spread = {x = 70, y = 30, z = 70}, seed = 7584449, octaves = 1, persistence = 0.63, lacunarity = 2.0, flags = "defaults, absvalue"})

local noise_ocean = PerlinNoise({offset = 0, scale = 1, spread = {x = 700, y = 400, z = 700}, seed = 34213, octaves = 4, persistence = 0.63, lacunarity = 2.0, flags = "defaults, absvalue"})


function math.clamp(x, min, max)
  if x < min then return min end
  if x > max then return max end
  return x
end




core.register_on_generated(function(vmanip, minp, maxp, blockseed)
  if minp.y > 100 then return end



  local c_stone = core.get_content_id("default:granite")
  local c_water = core.get_content_id("default:water")
  local c_grass = core.get_content_id("default:grass")

  local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local data = vmanip:get_data()
	local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})






  for z = minp.z, maxp.z do
    for y = minp.y, maxp.y do
      for x = minp.x, maxp.x do
        print(noise_river:get_2d({x=x,y=z}))
        -- vi, voxel index, is a common variable name here
        local vi = a:index(x, y, z)

        local used_noise = 1

        if true then
          used_noise = (
            noise:get_2d({x=x,y=z})*5 -- base
            --+math.clamp(noise_river:get_2d({x=x,y=z}), 0,0.1) * 100 -- rivers
            +math.clamp(noise_ocean:get_2d({x=x,y=z}), 0,1) * 100 - 100 -- ocean
          )
        end


        if y < used_noise-1 then
          data[vi] = c_stone
        elseif y < used_noise then
          data[vi] = c_grass
        elseif y < 1 then
          data[vi] = c_water
        end
      end
    end
  end

  vmanip:set_data(data)
end)
