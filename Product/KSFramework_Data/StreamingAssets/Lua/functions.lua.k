function clone( object )
    local lookup_table = {}
    local function copyObj( object )
        if type( object ) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs( object ) do
            new_table[copyObj( key )] = copyObj( value )
        end
        return setmetatable( new_table, getmetatable( object ) )
    end
    return copyObj( object )
end

--also can use this to extends instead
function class(classname,super)
    local superType = type(super)
    local cls
    if superType ~= "table" then
        superType = nil
        super = nil
    end

    if super then
        cls = {}
        setmetatable(cls,{__index = super})
        cls.super = super
    else
        cls = {ctor = function() end}       
    end
    cls.__cname = classname
    cls.__index = cls

    function cls.new(...)
        local instance = setmetatable({},cls)
        instance.class = cls
        instance:ctor(...)
        return instance
    end

    return cls
end

function IsNil(obj)
    if type(obj) ~= "userdata" then
        return obj == nil 
    else
        return obj:Equals(nil)
    end
end

function handler(obj,func)
    if not func then
        error("handler:arg error,no func!")
        return
    end
    return function(...)
        if not IsNil(obj) then
            func(obj,...)
        end 
    end
end

-- simple class extends
function extends(class, base)
    base.__index = base
    setmetatable(class, base)
end

-- simple new table to a object
function new(table, ctorFunc)
    assert(table ~= nil)

    table.__index = table

    local tb = {}
    setmetatable(tb, table)

    if ctorFunc then
        ctorFunc(tb)
    end

    return tb
end

function __TRACE(...)
    print(...)
    print(debug.traceback())
end

function print_r ( t )  
    local printStr = ""
    function printStrAdd(str)
        printStr = printStr .. str .. "\n"
    end
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            printStrAdd(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        printStrAdd(indent.."["..tostring(pos).."] => "..tostring(t).." {")
                        if type(pos) == "string" or type(pos) == "number" then
                            pos = tostring(pos)
                            sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                            printStrAdd(indent..string.rep(" ",string.len(pos)+6).."}")
                        end
                    elseif (type(val)=="string") then
                        printStrAdd(indent.."["..tostring(pos)..'] => "'..val..'"')
                    else
                        printStrAdd(indent.."["..tostring(pos).."] => "..tostring(val))
                    end
                end
            else
                printStrAdd(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        printStrAdd(tostring(t).." {")
        sub_print_r(t,"  ")
        printStrAdd("}")
    else
        sub_print_r(t,"  ")
    end
    print(printStr)
end

-- >>summary------------------------------------
-- This iter function is used to ipair array in C#(userdata).
-- Sending other type of value for arg[1] will cause error!!!.
function arrayIter(t, i)
    if type(t) == "userdata" then
        if i >= t.Length then
            return nil,nil
        end
    end
    local v = t[i]
    i = i + 1
    if v then
        return i, v
    else
        return nil, nil
    end
end

function ipairsArray(t)
    return arrayIter,t,0
end
--<<summary------------------------------------

function __(str)
    if not str or str == "" then
        return ""
    end
    local resultStr = I18N.Str(str)
    if not resultStr or resultStr == "" then
        return str
    else
        return resultStr
    end
end