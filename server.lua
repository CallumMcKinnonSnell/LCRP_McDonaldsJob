ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'mcdonalds', 'McDonalds', 'society_cluckinbell', 'society_mcdonalds', 'society_mcdonalds', {type = 'public'})


RegisterServerEvent('LCRP_McDonaldsJob:getStockItem')
AddEventHandler('LCRP_McDonaldsJob:getStockItem', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mcdonalds', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_entry'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source,"You removed " .. count .. 'x ' .. item.label)
  end)
end)

ESX.RegisterServerCallback('LCRP_McDonaldsJob:getStockItems', function(source, cb)
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mcdonalds', function(inventory)
  
      cb(inventory.items)
    end)
  end)

RegisterServerEvent('LCRP_McDonaldsJob:putStockItems')
AddEventHandler('LCRP_McDonaldsJob:putStockItems', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mcdonalds', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, "You added " .. count .. 'x ' .. item.label)
  end)
end)

ESX.RegisterServerCallback('LCRP_McDonaldsJob:getPlayerInventory', function(source, cb)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local items = xPlayer.inventory
  
  cb({items = items})
end)

RegisterServerEvent('LCRP_McDonaldsJob:addItem')
AddEventHandler('LCRP_McDonaldsJob:addItem', function(item)

  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addInventoryItem(item, 1)
end)

RegisterServerEvent('LCRP_McDonaldsJob:removeItem')
AddEventHandler('LCRP_McDonaldsJob:removeItem', function(item)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem(item, 1)
end)

ESX.RegisterUsableItem('mcdonalds_drink', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mcdonalds_drink', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	--TriggerClientEvent('esx_basicneeds:onDrink', source)
  TriggerClientEvent('LCRP:McDonaldsJob:GiveBonus', source, 'drink')
	--TriggerClientEvent('esx:showNotification', source, "~b~You drank a ~y~McDonalds ~b~ Drink.")
  --Add the speed boost
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You drank a McDonalds Drink."})
end)


ESX.RegisterUsableItem('mcdonalds_fries', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mcdonalds_fries', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	--TriggerClientEvent('esx_basicneeds:onEat', source)
  TriggerClientEvent('LCRP:McDonaldsJob:GiveBonus', source, 'fries')
	--TriggerClientEvent('esx:showNotification', source, "~b~You ate some ~y~McDonalds ~b~ Fries.")
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You ate some McDonalds Fries."})
  --Add 5% armor
end)

ESX.RegisterUsableItem('mcdonalds_burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mcdonalds_burger', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	--TriggerClientEvent('esx_basicneeds:onEat', source)
  TriggerClientEvent('LCRP:McDonaldsJob:GiveBonus', source, 'burger')
	--TriggerClientEvent('esx:showNotification', source, "~b~You ate a ~y~McDonalds ~b~ Burger.")
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You ate a McDonalds Burger."})
end)

ESX.RegisterUsableItem('mcdonalds_meal', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mcdonalds_meal', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 750000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 750000)
	--TriggerClientEvent('esx_basicneeds:onEat', source)
  TriggerClientEvent('LCRP:McDonaldsJob:GiveBonus', source, 'meal')
	--TriggerClientEvent('esx:showNotification', source, "~b~You ate and drank a ~y~McDonalds ~b~Meal.")
  --Add 15% armor
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "You wolfed down a McDonalds Meal."})
end)