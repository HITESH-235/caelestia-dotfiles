local conf = os.getenv("HOME") .. "/.config/hypr/monitors.conf"
local f = io.open(conf, "r")
if f then
  for line in f:lines() do
    if line:match("^monitor=") then
      local val = line:sub(9)
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
  f:close()
end

hl.config({
    general = {
        border_size = 1,
        gaps_in = 3,
        gaps_out = 4,
    },
    group = {
        groupbar = {
            gaps_in = 2,
            gaps_out = 4,
            gradient_rounding = 8,
        }
    },
    decoration = {
    rounding = 10,
    }
})
