local function foo(t)
  local function traverse(t, f)
    local iter = function(t)
        local i = 0
        return function()
            i = i + 1
            if i > #t then return nil end
            return i, t[i]
        end
    end

    local function iter_pairs(t)
        local i = 0
        local keys = {}
        for k, _ in pairs(t) do
          table.insert(keys, k)
        end
        return function()
            i = i + 1
            if i > #keys then return nil end
            local k = keys[i]
            return k, t[k]
        end
    end

    local it
    if type(t) == 'table' then
      it = iter_pairs(t)
    else
      return
    end
    
    for k, v in it do
        if type(v) == "table" then
            traverse(v, f)
        end
        f(k,v)
    end
  end

traverse(t, function(k,v) print(k,v) end)
end

local t = {a = 1, b = {c = 2, d = {e = 3, f = {g = 4, h = {i = 5}}}} }
foo(t)
--This code avoids a stack overflow by using an iterative approach.