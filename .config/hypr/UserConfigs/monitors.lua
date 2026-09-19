-- Parse nwg-displays output
local conf = os.getenv("HOME") .. "/.config/hypr/monitors.conf"
local f = io.open(conf, "r")
if f then
  for line in f:lines() do
    if line:match("^monitor=") then
      local val = line:sub(9)
      local p1, p2, p3, p4, p5, p6 = val:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
      if p1 then
        hl.monitor({
          output = p1:match("^%s*(.-)%s*$"),
          mode = p2:match("^%s*(.-)%s*$"),
          position = p3:match("^%s*(.-)%s*$"),
          scale = tonumber(p4:match("^%s*(.-)%s*$")) or 1
        })
      else
        local output, mode, position, scale = val:match("([^,]+),([^,]+),([^,]+),([^,]+)")
        if output then
          hl.monitor({
            output = output:match("^%s*(.-)%s*$"),
            mode = mode:match("^%s*(.-)%s*$"),
            position = position:match("^%s*(.-)%s*$"),
            scale = tonumber(scale:match("^%s*(.-)%s*$")) or 1
          })
        end
      end
    end
  end
  f:close()
end
