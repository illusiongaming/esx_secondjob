---SECONDJOB INCLUDED
ESX.StartPayCheck = function()

  function payCheck ()
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
      local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	  for j=1,2,1 do   --- j=1= job1   j=2=job2
		if j ==1 then 
		if xPlayer.job.grade_name == 'interim' or xPlayer.job.grade_name == 'rsa' or xPlayer.job.grade_name == 'employee'  then -- Si il n'est pas dans une société, au rsa ou employee, je prends chez l'état
			if xPlayer.job.grade_salary > 0 then
				xPlayer.addAccountMoney('bank',xPlayer.job.grade_salary)
				TriggerClientEvent('esx:showNotification', xPlayer.source, ('~b~SUBVENTION~s~<br>Der Staat zahlt Dir: ~g~') .. xPlayer.job.grade_salary .. ' $')
			
				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_president', function (account)
				account.removeMoney(xPlayer.job.grade_salary)
				end)
			
			end
		else  --otherwise I take over the account of the company
			TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
				TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
					if account.money >= xPlayer.job.grade_salary then
					  xPlayer.addAccountMoney('bank',xPlayer.job.grade_salary)
					  account.removeMoney(xPlayer.job.grade_salary)
					 TriggerClientEvent('esx:showNotification', xPlayer.source,"~y~GEHALT~s~<br>" .. xPlayer.job.label .. " bezahlt Dir: " .. '<br>~g~' .. xPlayer.job.grade_salary .. ' $')
					else
					  TriggerClientEvent('esx:showNotification', xPlayer.source, 'Deine Firma ist Pleite und kann Dich nicht mehr bezahlen!')
					end
			
				end)
			end) 
		end
	 else --job2
	 if xPlayer.job2.grade_name == 'rsa' then -- If he is not in a company, I take the state
        if xPlayer.job2.grade_salary > 0 then
			xPlayer.addAccountMoney('bank',xPlayer.job2.grade_salary)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('~b~SUBVENTION~s~<br>Der Staat bezahlt Dir: ~g~') .. xPlayer.job2.grade_salary .. ' $')
		
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_president', function (account)
			account.removeMoney(xPlayer.job2.grade_salary)
			end)
		
        end
		else
        TriggerEvent('esx_society:getSociety', xPlayer.job2.name, function (society)
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
				if account.money >= xPlayer.job2.grade_salary then
					xPlayer.addAccountMoney('bank',xPlayer.job2.grade_salary)
					account.removeMoney(xPlayer.job2.grade_salary)
					TriggerClientEvent('esx:showNotification', xPlayer.source,"~y~GEHALT~s~<br>" .. xPlayer.job2.label .. " hat dich bezahlt: " .. '<br>~g~' .. xPlayer.job2.grade_salary .. ' $')
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, 'Deine Firma ist Pleite und kann Dich nicht mehr bezahlen!')
				end
		
			end)
		end) 	  
	  end
	  
	end
    end
    --end
	end
	

		SetTimeout(Config.PaycheckInterval, payCheck)

	end

	SetTimeout(Config.PaycheckInterval, payCheck)

end
