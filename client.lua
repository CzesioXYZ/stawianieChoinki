spawned = false
obj = nil

RegisterCommand('postawChoinke', function(raw, args)
    if not spawned then
        spawned = true
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(source)))
        obj = CreateObject(GetHashKey('prop_xmas_tree_int'), x + 1.0, y + 1.0, z-1.0, true, false)
        FreezeEntityPosition(obj, true)
    else
        local pl = GetEntityCoords(GetPlayerPed(source))
        local objectc = GetEntityCoords(obj)
        local distance = #(pl - objectc)

        if distance < 3.0 then
            DeleteEntity(obj)
            spawned = false
            obj = nil
        end
    end
end)