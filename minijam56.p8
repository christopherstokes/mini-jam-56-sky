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
      spr(n,x+xx,y+yy,(w or 1),(h or 1),(flip_x or false),(flip_y or false))
    end
  end
  -- reset palette
  pal()
  -- draw final sprite
  spr(n,x,y,(w or 1),(h or 1),(flip_x or false),(flip_y or false))	
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

plyr = {
    sp=1,
    x=60,
    y=60
}
-->8
-- enemies
-->8
-- particles
-->8
-- init
function _init()
    _update = game_update
    _draw = game_draw
end
-->8
-- menu state
-->8
-- game state
function game_update()
end
function game_draw()
    cls(2)
    ospr(plyr.sp,0,plyr.x,plyr.y)
end
-->8
-- gameover state
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000eeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000ee7eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000e7e00e7e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770009eeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007009ee7eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000009eeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
