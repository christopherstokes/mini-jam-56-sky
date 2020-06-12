pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- utility
function ospr(n,col_outline,x,y,w,h,flip_x,flip_y)
  -- reset palette to black
  for c=1,15 do
    pal(c,col_outline)
  end
  -- draw outline
  for xx=-1,1 do
    for yy=-1,1 do
      spr(n,x+xx,y+yy,w,h,flip_x,flip_y)
    end
  end
  -- reset palette
  pal()
  -- draw final sprite
  spr(n,x,y,w,h,flip_x,flip_y)	
end

function print_centered(str,y,col)
  print(str, 64 - (#str * 2), (y or 60),col or 7) 
end

function abs_box(s)
	local box = {}
	box.x1 = s.box.x1 + s.x
	box.y1 = s.box.y1 + s.y
	box.x2 = s.box.x2 + s.x
	box.y2 = s.box.y2 + s.y
	return box
end

function coll(a,b)
	local box_a = abs_box(a)
	local box_b = abs_box(b)
	
	if box_a.x1 > box_b.x2 or
		box_a.y1 > box_b.y2 or
		box_b.x1 > box_a.x2 or
		box_b.y1 > box_a.y2 then
		return false
	end
	
	return true
end

function copy(tbl)
	local t={}
	for key, value in pairs(tbl) do t[key] = value end
	return t
end
-->8
-- player
-->8
-- enemies
-->8
-- particles
-->8
-- menu state
-->8
-- game state
-->8
-- gameover state
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
