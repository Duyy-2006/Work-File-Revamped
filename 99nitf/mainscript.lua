script_key="ZtFliGcxzrGkYHjIjrzNKMeGJlAEdsCw";
getgenv().ScriptMode = "Diamond" -- ตัวเปลี่ยนโหมดสคริป Diamond / Class

-- Mode Diamond
getgenv().Configs = {
    -- แจ้งเตือน ( Notify )
    WebhookUrl = "",      -- Webhook Discord
    LimitDiamonds = 200000000,    -- แจ้งเตือนว่าฟาร์มครบแล้วถ้าเพรชถึงจำนวนนี้
    EnableLogRam = false, -- เปิด/ปิด Log ของ Account Manager

    -- การฟาร์ม ( Farm )
    LimitDay = 10,           -- จำกัดวันถ้าถึงแล้วให้เริ่มเกมใหม่
    MaxStrongholdLevel = 5, -- ระดับสูงสุดของดันถ้าถึงแล้วให้เริ่มเกมใหม่
    CountStronghold = 3,    -- นับจำนวนสดันที่ผ่านครบแล้วให้เริ่มเกมใหม่
    ClaimBadges = false,    -- รับเหรียญทั้งหมด
    HardMode = false,        -- เปิดโหมดยาก

    -- คลาส & ร้านค้า ( Class & Shop )
    BuyClass = {""},            -- ชื้อคลาส
    DoFirstTimeReroll = false,  -- รีร้านคลาสครั้งแรกฟรี
    GuaranteeReroll = false,    -- รีร้านคลาสจนกว่าจะได้คลาสที่ต้องการ
    AutoEquipClass = "",        -- สวมใส่ Class
    UpgradeClass = false,       -- อัพเวลคลาสอัตโนมัติ

    -- Perks
    AutoRollTalent = {
        Enable = false,         -- เปิด/ปิดระบบ
        DiamondLimit = 200,     -- เพชรขั้นต่ำก่อนสุ่ม
        ClassToReroll = "",     -- คลาสหลักที่จะสุ่ม
        BothSlot = false,       -- ต้องตรงทั้งดาวและคลาสรอง
        TargetClassTalent = "", -- คลาสรอง
        TargetStar = 1,         -- ดาว
    },

    -- Misc
    UI = true,              -- เปิด/ปิด UI
    LowGraphics = true,    -- โหมดกราฟฟิคต่ำ
    FpsCap = 15,             -- จำกัด FPS
}

-- Mode Class
getgenv().AutoClass = {
    -- ID Class
    ClassID = 0,

    -- แจ้งเตือน ( Notify )
    WebhookUrl = "",
    EnableLogRam = false,

    -- Misc
    UI = true,
}
loadstring(game:HttpGet("https://gist.githubusercontent.com/Clehxb/a0512b13f2bcc539e037712e13572d14/raw/Night_Loader"))()