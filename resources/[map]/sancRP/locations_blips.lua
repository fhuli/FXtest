local blipsConfig = true

local locations = {
  {name="Altruist Cult Camp #Frankie", id=269, c=4, x=-1042.29, y=4910.17, z=94.92},
  {name="Comedy Club", id=102, c=4, x=-420.087, y=264.681, z=83.1927},
  {name="Facility", id=590, c=8, x=1837.92, y=220.767, z=176.917},
  {name="Movie Theater", id=135, c=4, x=298.278, y=195.984, z=104.313},
  {name="Masks store", id=362, c=4, x= -1166.284, y= -1586.368, z=4.377},
  {name="Strip club", id=121, c=4, x=134.476, y=-1307.887, z=28.983},
  {name="Tequil-La La", id=93, c=4, x=-565.171, y=276.625, z=83.286},
  {name="Gang", id=437, c=9, x=298.68, y=-2010.10, z=20.07},
  {name="Gang", id=437, c=9, x=86.64, y=-1924.60, z=20.79},
  {name="Gang", id=437, c=9, x=-183.52, y=-1632.62, z=33.34},
  {name="Gang", id=437, c=9, x=989.37, y=-1777.56, z=31.32},
  {name="Gang", id=437, c=9, x=960.24, y=-140.31, z=74.50},
  {name="Gang", id=437, c=9, x=29.4838, y=3735.593, z=38.688},
  {name="Gang", id=437, c=9, x=-455.752, y=-1711.884, z=18.642},
  {name="FIB", id=106, c=4, x=105.455, y=-745.483, z=44.754}
}

Citizen.CreateThread(function()
 if blipsConfig then
    for _, item in pairs(locations) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.c)

      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)

      SetBlipAsShortRange(item.blip, true)
    end
  end
end)
