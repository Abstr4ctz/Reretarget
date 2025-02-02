local Reretarget = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0")

-- Time window in seconds
Reretarget.retargetTimeout = 19 

-- Tracked spells (by spell ID or name)
Reretarget.trackedSpells = {
    [11392] = true,  -- Invisibility Potion
    [3680] = true,   -- Lesser Invisibility Potion
    [4079] = true,   -- Gnomish Cloaking Device
    ["Feign Death"] = true,
    ["Vanish"] = true,
    ["Stealth"] = true,
	["Shadowmeld"] = true,
}

Reretarget.lastTargetGUID = nil
Reretarget.searchTargetGUID = nil
Reretarget.searchStartTime = 0
Reretarget.frame = CreateFrame("Frame")

function Reretarget:StartSearchLoop(targetGUID)
    self.searchTargetGUID = targetGUID
    self.searchStartTime = GetTime()
    
    self.frame:SetScript("OnUpdate", function()
        if GetTime() - self.searchStartTime > self.retargetTimeout then
            Reretarget:StopSearchLoop()
            return
        end

        if self.searchTargetGUID then
            TargetUnit(self.searchTargetGUID)
            local exists, guid = UnitExists("target")
            if exists and guid == self.searchTargetGUID then
                Reretarget:StopSearchLoop()
            end
        end
    end)
end

function Reretarget:StopSearchLoop()
    self.searchTargetGUID = nil
    self.frame:SetScript("OnUpdate", nil)
end

function Reretarget:OnUnitCastEvent(casterGUID, _, _, spellID)
    if self.trackedSpells[spellID] or self.trackedSpells[SpellInfo(spellID)] then
        if casterGUID == self.lastTargetGUID then
            Reretarget:StartSearchLoop(casterGUID)
        end
    end
end

function Reretarget:OnTargetChanged()
    if UnitExists("target") and UnitCanAttack("player", "target") then
        _, self.lastTargetGUID = UnitExists("target")
    end
end

function Reretarget:OnInitialize()
    self:RegisterEvent("UNIT_CASTEVENT", "OnUnitCastEvent")
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "OnTargetChanged")
end
