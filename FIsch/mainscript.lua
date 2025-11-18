if not game:IsLoaded() then 
    repeat 
       game.Loaded:Wait() 
    until game:IsLoaded() 
end

_G.OptimizeGame = false
script_key="iITAcWAZWwavNyBVbJcrtmwfgMkHFjOX";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7cc6c928be31fd9f4054d5e7354270e1.lua"))()