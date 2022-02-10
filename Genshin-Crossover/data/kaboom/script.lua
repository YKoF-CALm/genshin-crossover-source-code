function onCreate()
    makeAnimatedLuaSprite('whittyfire', 'whitty/Whitty and Echo ability Sprites', -30.3, -64.2)
    luaSpriteAddAnimationByPrefix('whittyfire', 'blast', 'Fire Blast BF instance 1', 24, false)

    makeAnimatedLuaSprite('kleebullet', 'whitty/Whitty and Echo ability Sprites', -450, 130)
    luaSpriteAddAnimationByPrefix('kleebullet', 'shoot', 'Fire Shot instance', 1, false)

    makeAnimatedLuaSprite('whittybullet', 'whitty/Whitty and Echo ability Sprites', 150, 130)
    luaSpriteAddAnimationByPrefix('whittybullet', 'shot', 'Fire Shot BF instance 1', 24, false)
end

kleeSFX = {
    [264] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [265] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [268] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [269] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [280] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [281] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [282] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [283] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [284] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [285] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [296] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [297] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [300] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [301] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [312] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [313] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [314] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [315] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [316] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [317] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [392] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [393] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [396] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [397] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [408] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [409] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [410] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [411] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [412] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [413] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [424] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [425] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [428] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [429] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [440] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [441] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [442] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [443] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [444] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [445] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [444] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [445] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [770] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [771] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [774] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [775] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [778] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [779] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [782] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [783] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [786] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [787] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [790] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [791] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [794] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [795] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [790] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [791] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [798] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [799] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [802] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [803] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [806] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [807] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [810] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [811] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [814] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [815] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [818] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [819] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [822] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [823] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [826] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [827] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [830] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [831] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [834] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [835] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [838] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [839] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [842] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [843] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [846] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [847] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [850] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [851] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [854] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [855] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [858] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [859] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [862] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [863] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [866] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [867] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [870] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [871] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [874] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [875] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [878] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [879] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [882] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [883] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [886] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [887] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [890] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [891] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [894] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [895] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1032] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1033] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1036] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1037] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1048] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1049] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1050] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1051] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1052] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1053] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1064] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1065] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1068] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1069] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1080] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1081] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1082] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1083] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1084] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1085] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1160] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1161] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1164] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1165] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1176] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1177] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1178] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1179] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1180] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1181] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1192] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1193] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1196] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1197] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1208] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1209] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1210] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1211] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1212] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1213] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1288] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1289] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1292] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1293] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1304] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1305] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1306] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1307] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1308] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1309] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1320] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1321] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1324] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1325] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1336] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1337] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1338] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1339] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1340] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1341] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1416] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1417] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1420] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1421] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1432] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1433] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1434] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1435] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1436] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1437] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1448] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1449] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1452] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1453] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1464] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1465] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1466] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1467] = function()
        removeLuaSprite('kleebullet', false)
    end,
    [1468] = function()
        addLuaSprite('kleebullet', true)
        luaSpritePlayAnimation('kleebullet', 'shoot', true)
    end,
    [1469] = function()
        removeLuaSprite('kleebullet', false)
    end,
}

whittySFX = {
}