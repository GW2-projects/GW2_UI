BuffFrame:ClearAllPoints()
BuffFrame:SetScale(1)
BuffFrame:Show()
BuffFrame:SetParent(unitframePowerbg)
BuffFrame:SetPoint('BOTTOMLEFT',unitframePowerbg,'TOPLEFT',0,10)



BuffFrame:HookScript("OnUpdate", function(self)
    if MultiBarBottomRight:GetAlpha()>0.0 then
        BuffFrame:SetPoint('BOTTOMLEFT',unitframePowerbg,'TOPLEFT',0,110)
        
    else
        BuffFrame:SetPoint('BOTTOMLEFT',unitframePowerbg,'TOPLEFT',0,10)
        
    end
        
        
      
end)        
BuffFrame:HookScript("OnEvent", function(self, event, unit)
    if unit == 'player' then
    local x = 1;
    local y = 1;
    local row = 0;
    local col = 0;
    local max = 0;
    for i = 1,100 do
        px = col*26;
        py = row*35;
        if UnitBuff("player",i) then   
            _G["BuffButton" .. i]:SetWidth(25)
             _G["BuffButton" .. i]:SetHeight(25)
            _G["BuffButton" .. i]:ClearAllPoints()
            _G["BuffButton" .. i]:SetPoint('BOTTOMLEFT',BuffFrame,'BOTTOMLEFT', px, py)
                col = col +1
                    max = max +1;
                    if col == 10 then
                        row  = row + 1
                        col  = 0
                    end
            if  _G["BuffButton"..i.."Icon"] then
                _G["BuffButton"..i.."Icon"]:SetTexCoord(0.1,0.9,0.1,0.9)
            end
        end
    end
        row = row +1
        col = 0
        for i = 1,50 do
                px = col*31;
                py = row*31;
             if UnitDebuff("player",i) then     
            _G["DebuffButton" .. i]:ClearAllPoints()
            _G["DebuffButton" .. i]:SetPoint('BOTTOMLEFT',BuffFrame,'BOTTOMLEFT', px, py)
                     col = col +1
                   
                    if col == 10 then
                        row  = row + 1
                        col  = 0
                    end
                if  _G["DebuffButton"..i.."Icon"] then
                _G["DebuffButton"..i.."Icon"]:SetTexCoord(0.1,0.9,0.1,0.9)
                end
            end
        end
    if max>10 then
        max = 10
    end
            local p = (-15 * max) + 15
            --BuffFrame:SetHeight(30*row)
           -- BuffFrame:SetPoint('BOTTOM',unitBGf,'BOTTOM',p,150)
       --     BuffFrame:SetPoint('BOTTOM',unitBGf,'BOTTOM',p,150)
        end
    end)
BuffFrame:RegisterEvent("UNIT_AURA");
BuffFrame:RegisterEvent("PLAYER_ENTERING_WORLD");