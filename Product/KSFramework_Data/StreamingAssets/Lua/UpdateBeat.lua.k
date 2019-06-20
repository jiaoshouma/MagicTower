UpdateBeat = class("UpdateBeat", nil)

local m_updateList = {}
local m_fixedUpdateList = {}
local m_lateUpdateList = {}

function UpdateBeat.Add(func, ins)
    UpdateBeat.AddUpdate(ins,func)
end
function UpdateBeat.AddUpdate(ins, func)
    local add = {};
    add.ins = ins;
    add.func = func;
    table.insert(m_updateList, add);
end
function UpdateBeat.Remove(func,ins)
    UpdateBeat.RemoveUpdate(ins,func)
end
function UpdateBeat.RemoveUpdate( ins, func)
    for i, v in pairs(m_updateList) do
        if v.ins == ins and v.func == func then
            table.remove(m_updateList, i);
        end
    end
end

function UpdateBeat.AddFixedUpdate(ins, func)
    local add = {};
    add.ins = ins;
    add.func = func;
    table.insert(m_fixedUpdateList, add);
end
function UpdateBeat.RemoveFixedUpdate( ins, func)
    for i, v in pairs(m_fixedUpdateList) do
        if v.ins == ins and v.func == func then
            table.remove(m_fixedUpdateList, i);
        end
    end
end

function UpdateBeat.AddLateUpdate(ins, func)
    local add = {};
    add.ins = ins;
    add.func = func;
    table.insert(m_lateUpdateList, add);
end
function UpdateBeat.RemoveLateUpdate( ins, func)
    for i, v in pairs(m_lateUpdateList) do
        if v.ins == ins and v.func == func then
            table.remove(m_lateUpdateList, i);
        end
    end
end

function UpdateBeat.Update()
    local deltaTime = CS.UnityEngine.Time.deltaTime;
    for i, v in pairs(m_updateList) do
        if v.ins ~= nil then
            v.func(v.ins,deltaTime);
        else
            v.func(deltaTime);
        end
    end
end

function UpdateBeat.FixedUpdate()
    local fixedDeltaTime = CS.UnityEngine.Time.fixedDeltaTime;
    for i, v in pairs(m_fixedUpdateList) do
        if v.ins ~= nil then
            v.func(v.ins,fixedDeltaTime);
        else
            v.func(fixedDeltaTime);
        end
    end
end

function UpdateBeat.LateUpdate()
    local deltaTime = CS.UnityEngine.Time.deltaTime;
    for i, v in pairs(m_lateUpdateList) do
        if v.ins ~= nil then
            v.func(v.ins,deltaTime);
        else
            v.func(deltaTime);
        end
    end
end

local gameobject = CS.UnityEngine.GameObject("UpdateRunner")
CS.UnityEngine.Object.DontDestroyOnLoad(gameobject)
local update_runner = gameobject:AddComponent(typeof(CS.UpdateRunner))
update_runner.luaUpdate = UpdateBeat.Update
update_runner.luaLateUpdate = UpdateBeat.LateUpdate
update_runner.luaFixedUpdate = UpdateBeat.FixedUpdate

