AutoRaidCheck_Enabled = true
local function OnCommand(...)
	AutoRaidCheck_Enabled = not AutoRaidCheck_Enabled
	print("Auto Raid Check:", AutoRaidCheck_Enabled)
end

SLASH_AUTORAIDCHECK1 = "/raidcheck"
SLASH_AUTORAIDCHECK2 = "/rc"
SlashCmdList["AUTORAIDCHECK"] = OnCommand

local function OnEvent(self, event, ...)
	if AutoRaidCheck_Enabled then
		ConfirmReadyCheck(1)
		print("Raid check confirmed")
	end
end

local rc = CreateFrame("frame")
rc:RegisterEvent("READY_CHECK")
rc:SetScript("OnEvent", OnEvent)
