RegisterNetEvent('cd_dispatch:AddNotification', function (data)
    local priority = "medium"
    if data.flash == 1 then
        priority = "high"
    end

    exports["lb-tablet"]:AddDispatch({
        priority = priority,
        code = '',
        title = data?.title or 'Dispatch Notification',
        description = data?.message or '',
        location = {
          label = data?.blip.text or "Call Origin",
          coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = data?.blip.time and math.floor(data?.blip.time * 60) or CONFIG['default-time'],
        job = "police"
    })
end)