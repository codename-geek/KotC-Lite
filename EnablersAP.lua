STEAM_READ = ReadByte(0x143C11)
EPIC_READ = ReadByte(0x102891)

function _OnFrame()
    if STEAM_READ ~= 0x8B and ReadString(0x09A98B0, 0x04) == 'KH2J' then
        ConsolePrint("Steam - v1.0.0.10 | Initializing AP Enablers...")

        ConsolePrint("Writing the gateway to Information/Prize Show...")
        WriteArray(0x1816B4, { 0xE9, 0x58, 0x25, 0xFC, 0xFF}) -- JMP 0x143C11
         
        ConsolePrint("Writing the Cutscene Checker for Information/Prize Show...")
        WriteArray(0x143C11, { 0x8B, 0x2D, 0x61, 0xD8, 0x8C, 0x02 }) -- MOV EBP, [0x2A11478]
        WriteArray(0x143C17, { 0x81, 0xFD, 0x00, 0x00, 0x00, 0x00 }) -- CMP EBP, 0x00
        WriteArray(0x143C1D, { 0x74, 0x33, 0xC3 }) --  JE 0x143C52 / RET
        
        ConsolePrint("Writing the Enable-Line Checker for Information/Prize Show...")
        WriteArray(0x143C52, { 0x40, 0x8A, 0x2D, 0xA7, 0xC3, 0x6B, 0x00 }) -- MOV BPL, [0x800000]
        WriteArray(0x143C59, { 0x40, 0xFE, 0xCD }) --  DEC BPL
        WriteArray(0x143C5C, { 0x74, 0x44 }) -- JE 0x143CA2
        WriteArray(0x143C5E, { 0xEB, 0x74 }) -- JMP 0x143CD4

        WriteArray(0x143CD4, { 0x40, 0xFE, 0xCD }) -- DEC BPL
        WriteArray(0x143CD7, { 0x0F, 0x84, 0x66, 0x01, 0x00, 0x00, 0xC3 }) -- JMP 0x143E43 / RET

        ConsolePrint("Writing the Information Bar Portion of Information/Prize Show...")
        WriteArray(0x143CA2, { 0xFF, 0x0D, 0x58, 0xC3, 0x6B, 0x00 }) -- DEC [0x800000]
        WriteArray(0x143CA8, { 0xEB, 0x79 }) -- JMP 0x143D23

        WriteArray(0x143D23, { 0x48, 0x8D, 0x0D, 0xDA, 0xC2, 0x6B, 0x00 }) -- LEA RCX, [0x800004]
        WriteArray(0x143D2A, { 0xE9, 0xE1, 0x79, 0x03, 0x00 }) -- JMP 0x17B710

        ConsolePrint("Writing the Prize Bar Portion of Information/Prize Show...")
        WriteArray(0x143E43, { 0xFF, 0x0D, 0xB7, 0xC1, 0x6B, 0x00 }) -- DEC [0x800000]
        WriteArray(0x143E49, { 0xE9, 0x37, 0x01, 0x00, 0x00 }) -- JMP 0x143F85
 
        WriteArray(0x143F85, { 0xFF, 0x0D, 0x75, 0xC0, 0x6B, 0x00 }) -- DEC [0x800000]
        WriteArray(0x143F8B, { 0xE9, 0x53, 0x01, 0x00, 0x00 }) -- JMP 0x1440E3

        WriteArray(0x1440E3, { 0x48, 0x8D, 0x0D, 0x1A, 0xC0, 0x6B, 0x00 }) -- LEA RCX, [0x800104]
        WriteArray(0x1440EA, { 0xE9, 0xE1, 0x54, 0x01, 0x00 }) -- JMP 0x1595D0

        ConsolePrint("Information/Prize Show has been enabled!")

        ConsolePrint("AP Enablers have been initialized successfully!")

        STEAM_READ = 0x8B
    elseif EPIC_READ ~= 0x8B and ReadString(0x09A9330, 0x04) == 'KH2J' then
        ConsolePrint("Epic Games Store - v1.0.0.10 | Initializing AP Enablers...")

        ConsolePrint("Writing the gateway to Information/Prize Show...")
        WriteArray(0x180D64, { 0xE9, 0x28, 0x1B, 0xF8, 0xFF }) -- JMP 0x102891

        ConsolePrint("Writing the Cutscene Checker for Information/Prize Show...")
        WriteArray(0x102891, { 0x8B, 0x2D, 0x61, 0xE6, 0x90, 0x02 }) -- MOV EBP, [0x2A10EF8]
        WriteArray(0x102897, { 0x81, 0xFD, 0x00, 0x00, 0x00, 0x00 }) -- CMP EBP, 0x00
        WriteArray(0x10289D, { 0x74, 0x08, 0xC3 }) -- JE 0x1028A7 / RET
        
        WriteArray(0x1028A7, { 0xE9, 0xE6, 0xFC, 0xFF, 0xFF }) -- JMP 0x102592
       
        ConsolePrint("Writing the Enable-Line Checker for Information/Prize Show...")
        WriteArray(0x102592, { 0x40, 0x8A, 0x2D, 0x67, 0xDA, 0x6F, 0x00 }) -- MOV BPL, [0x800000]    
        WriteArray(0x102599, { 0x40, 0xFE, 0xCD }) -- DEC BPL
        WriteArray(0x10259C, { 0x74, 0x18 }) -- JZ 0x1025B6
        WriteArray(0x10259E, { 0xEB, 0x03 }) -- JMP 0x1025A3

        WriteArray(0x1025A3, { 0x40, 0xFE, 0xCD }) -- DEC BPL
        WriteArray(0x1025A6, { 0x0F, 0x84, 0xB4, 0x5E, 0x03, 0x00, 0xC3 }) -- JZ 0x138460 / RET

        WriteArray(0x1025B6, { 0xE9, 0xAD, 0x06, 0x00, 0x00 }) -- JMP 0x012C68

        ConsolePrint("Writing the Information Bar Portion of Information/Prize Show...")
        WriteArray(0x102C68, { 0xFF, 0x0D, 0x92, 0xD3, 0x6F, 0x00 }) -- DEC [0x800000]
        WriteArray(0x102C6E, { 0xEB, 0x69 }) -- JMP 0x102CD9
    
        WriteArray(0x102CD9, { 0xE9, 0xA6, 0x01, 0x00, 0x00 }) -- JMP 0x102E84
    
        WriteArray(0x102E84, { 0x48, 0x8D, 0x0D, 0x79, 0xD1, 0x6F, 0x00 }) -- LEA RCX, [0x800004]
        WriteArray(0x102E8B, { 0xE9, 0x30, 0x7F, 0x07, 0x00 }) -- JMP 0x17ADC0

        ConsolePrint("Writing the Prize Bar Portion of Information/Prize Show...")
        WriteArray(0x138460, { 0xC7, 0x05, 0x96, 0x7B, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00 }) -- MOV [0x800000], 0x00000000
        WriteArray(0x13846A, { 0xEB, 0x09 }) -- JMP 0x138475

        WriteArray(0x138475, { 0x48, 0x8D, 0x0D, 0x88, 0x7C, 0x6C, 0x00 }) -- LEA RCX, [0x800104]
        WriteArray(0x13847C, { 0xEB, 0x6B, 0xC3 }) -- JMP 0x1384E9 / RET
        WriteArray(0x1384E9, { 0xE9, 0x92, 0x07, 0x02, 0x00, 0xC3 }) -- JMP 10x58C80 / RET

        ConsolePrint("Information/Prize Show has been enabled!")

        ConsolePrint("AP Enablers have been initialized successfully!")

        EPIC_READ = 0x8B
    end
end