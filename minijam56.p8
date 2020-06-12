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
-- queue system

-->8
-- init
function _init()
    _update = game_update
    _draw = game_draw
end
-->8
-- player

plyr = {
    sp=1,
    x=1,
    y=1
}

function player_update()	
	-- plyr input
	if btnp(0) and plyr.x>0 then 
		plyr.x-=1
	end
	if btnp(1) and plyr.x<15 then 
		plyr.x+=1
	end
	if btnp(2) and plyr.y>0 then 
		plyr.y-=1 
	end
	if btnp(3) and plyr.y<15 then 
		plyr.y+=1 
	end
	if btnp(4) then end
	if btnp(5) then end
end
-->8
-- enemies
-->8
-- particles
-->8
-- menu state
-->8
-- game state
function game_update()
    player_update()
end
function game_draw()
    cls(2)
    -- grid
    for x=0,16 do
        for y=0, 16 do
            local x1,x2,y1,y2 = x*8,y*8,(x*8)+8,(y*8)+8
            rect(x1,x2,y1,y2,0)
        end
    end
    ospr(plyr.sp,0,plyr.x*8,plyr.y*8)
end
-->8
-- gameover state
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000eeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000ee7eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700007e00e700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000eeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000ee7ee900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
