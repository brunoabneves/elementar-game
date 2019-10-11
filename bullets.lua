world = love.physics.newWorld( 0, 500, true )
cont_fogo=0
cont_pedra=0
cont_agua=0
cont_vento=0

pedra={}
pedra.img=love.graphics.newImage("Texturas/pedra.png")     --define a imagem da bala de pedra
width= pedra.img:getWidth()
height=pedra.img:getHeight()
pedra.speed=200
local img=love.graphics.newImage("Texturas/pedra.png")     ---define a animação das balas de pedra
anim2=newAnimation(img,32,30,0.1,0)
anim2:setMode("loop")

fogo={}
--fogo.img=love.graphics.newImage("Texturas/fogo.png")       --define a imagem da bala de fogo
--width= fogo.img:getWidth()
--height=fogo.img:getHeight()
fogo.speed=200
local img=love.graphics.newImage("Texturas/fogo.png")      --define a animação das balas de fogo 
anim3=newAnimation(img,46,32,0.1,0)
anim3:setMode("loop")

agua={}
agua.img=love.graphics.newImage("Texturas/agua.png")     --define a imagem da bala de pedra
width= agua.img:getWidth()
height=agua.img:getHeight()
agua.speed=200
local img=love.graphics.newImage("Texturas/agua.png")     ---define a animação das balas de pedra
anim4=newAnimation(img,32,37,0.1,0)
anim4:setMode("loop")

vento={}
vento.img=love.graphics.newImage("Texturas/vento.png")     --define a imagem da bala de vento
width= vento.img:getWidth()
height=vento.img:getHeight()
vento.speed=200
local img=love.graphics.newImage("Texturas/vento.png")     ---define a animação das balas de vento
anim5=newAnimation(img,54,60,0.1,0)
anim5:setMode("loop")

function fogo.spawn(x,y,dir)
	table.insert(fogo,{width,height,x=x, y=y, dir=dir})
end 
function pedra.spawn(x,y,dir)
	table.insert(pedra,{width,height,x=x, y=y, dir=dir})
end
function agua.spawn(x,y,dir)
	table.insert(agua,{width,height,x=x, y=y, dir=dir})
end
function vento.spawn(x,y,dir)
	table.insert(vento,{width,height,x=x, y=y, dir=dir})
end

function fogo.draw()
	for i,v in ipairs(pedra) do
		anim2:draw(v.x,v.y,v.width,v.height)			 --desenha a animação das balas de pedra
	end
	for i,v in ipairs(fogo) do
		anim3:draw(v.x,v.y,v.width,v.height)             --desenha a animação das balas de fogo
	end
	for i,v in ipairs(agua) do
		anim4:draw(v.x,v.y,v.width,v.height)			 --desenha a animação das balas de água
	end
	for i,v in ipairs(vento) do
		anim5:draw(v.x,v.y,v.width,v.height)			 --desenha a animação das balas de vento
	end
end

function fogo.update(dt)
	for i,v in ipairs(fogo) do                		 ---balas de fogo
		if v.dir=="right" then
			v.x=v.x+fogo.speed*dt
		end
		if v.dir=="left" then
			v.x=v.x-fogo.speed*dt
		end
		--COLISÕES DAS BALAS DE FOGO
	    if (v.x>=gelo1.x and v.x<=gelo1.x+gelo1.width/3) and (v.y>=gelo1.y or v.y<=gelo1.y+gelo1.height) or
	       (v.x>=pedra1.x and v.x<=pedra1.x+gelo1.width/3) and (v.y>=pedra1.y or v.y<=pedra1.y+pedra1.height) then
    		gelo1.x,pedra1.x,flame1.x=-50,-50,-50
    		table.remove (fogo)
    		gelo1.body:destroy()
		end
	    if (v.x>=gelo2.x and v.x<=gelo2.x+gelo2.width/3) and (v.y>=gelo2.y and v.y<=gelo2.y+gelo2.height) or
	       (v.x>=pedra2.x and v.x<=gelo2.x+gelo2.width/3) and (v.y>=pedra2.y and v.y<=pedra2.y+pedra2.height) then
    		gelo2.x,pedra2.x=-50,-50
    		table.remove (fogo)
    		gelo2.body:destroy()
		end
		if (v.x>=gelo3.x and v.x<=gelo3.x+gelo3.width/3) and (v.y>=gelo3.y and v.y<=gelo3.y+gelo3.height) then
    		gelo3.x=-50
    		table.remove (fogo)
    		gelo3.body:destroy()
		end
	    if (v.x>=gelo4.x and v.x<=gelo4.x+gelo4.width/3) and (v.y>=gelo5.y and v.y<=gelo5.y+gelo5.height) or
	       (v.x>=flame6.x and v.x<=flame6.x+flame6.width/3) and (v.y>=flame6.y and v.y<=flame6.y+flame6.height)then
    		gelo4.x,flame6.x=-50,-50
    		table.remove (fogo)
    		gelo4.body:destroy()
		end
	    if (v.x>=gelo5.x and v.x<=gelo5.x+gelo5.width/3) and (v.y>=gelo5.y and v.y<=gelo5.y+gelo5.height) then
    		gelo5.x=-50
    		table.remove (fogo)
    		gelo5.body:destroy()
		end
	    if (v.x>=gelo7.x and v.x<=gelo7.x+gelo7.width/3) and (v.y>=gelo7.y and v.y<=gelo7.y+gelo7.height) then
    		gelo7.x=-50
    		table.remove (fogo)
    		gelo7.body:destroy()
		end
	    if (v.x>=gelo8.x and v.x<=gelo8.x+gelo8.width/3) and (v.y>=gelo8.y and v.y<=gelo8.y+gelo8.height) then
    		gelo8.x=-50
    		table.remove (fogo)
    		gelo8.body:destroy()
		end
		 if (v.x>=pedra10.x and v.x<=pedra10.x+pedra10.width/3) and (v.y>=pedra10.y and v.y<=pedra10.y+pedra10.height) or
		    (v.x>=gelo6.x and v.x<=gelo6.x+gelo6.width/3) and (v.y>=gelo6.y and v.y<=gelo6.y+gelo6.height) then
    		pedra10.x,gelo6.x=-50,-50
    		table.remove (fogo)
    		pedra10.body:destroy()
		end


	end
	anim3:update(dt)	  --carrega a animação das balas de fogo
	anim2:update(dt)      --carrega a animação das balas de pedra
	anim4:update(dt)      --carrega a animação das balas de agua
	anim5:update(dt)	  --carrega a animação das balas de vento

	for j,v in ipairs(pedra) do                 ---balas de pedra
		if v.dir=="right" then
			v.x=v.x+pedra.speed*dt
		end
		if v.dir=="left" then
			v.x=v.x-pedra.speed*dt
		end
		--COLISÕES DAS BALAS DE PEDRA
	    if (v.x>=gelo1.x and v.x<=gelo1.x+gelo1.width/3) and (v.y>=gelo1.y and v.y<=gelo1.y+gelo1.height) or
	       (v.x>=pedra1.x and v.x<=pedra1.x+pedra1.width/3) and (v.y>=pedra1.y and v.y<=pedra1.y+pedra1.height) or
	       (v.x>=flame1.x and v.x<=flame1.x+flame1.width/3) and (v.y>=flame1.y and v.y<=flame1.y+flame1.height) then
    		table.remove (pedra)
    		gelo1.x,pedra1.x,flame1.x=-50,-50,-50
    		gelo1.body:destroy()
		end
		if (v.x>=gelo2.x and v.x<=gelo2.x+gelo2.width/3) and (v.y>=gelo2.y and v.y<=gelo2.y+gelo2.height) or 
		   (v.x>=pedra2.x and v.x<=gelo2.x+pedra2.width/3) and (v.y>=pedra2.y and v.y<=pedra2.y+pedra2.height)then
    		table.remove (pedra)
    		gelo2.x,pedra2.x=-50,-50
    		gelo2.body:destroy()
		end
		if (v.x>=pedra3.x and v.x<=pedra3.x+pedra3.width/3) and (v.y>=pedra3.y and v.y<=pedra3.y+pedra3.height) then
    		table.remove (pedra)
    		pedra3.x=-50
    		pedra3.body:destroy()
		end
		if (v.x>=pedra4.x and v.x<=pedra4.x+pedra4.width/3) and (v.y>=pedra4.y and v.y<=pedra4.y+pedra4.height) then
    		table.remove (pedra)
    		pedra4.x=-50
    		pedra4.body:destroy()
		end
		if (v.x>=pedra5.x and v.x<=pedra5.x+pedra5.width/3) and (v.y>=pedra5.y and v.y<=pedra5.y+pedra5.height) then
    		table.remove (pedra)
    		pedra5.x=-50
    		pedra5.body:destroy()
		end
		if (v.x>pedra6.x and v.x<pedra6.x+pedra6.width/3) and (v.y>pedra6.y and v.y<pedra6.y+pedra6.height) then
    		table.remove (pedra)
    		pedra6.x=-50
    		pedra6.body:destroy()
		end
		if (v.x>=pedra7.x and v.x<=pedra7.x+pedra7.width/3) and (v.y>=pedra7.y and v.y<=pedra7.y+pedra7.height+pedra7.height) then
    		table.remove (pedra)
    		pedra7.x,pedra8.x=-50,-50
    		pedra7.body:destroy()
		end
		if (v.x>=pedra9.x and v.x<=pedra9.x+pedra9.width/3) and (v.y>=pedra9.y and v.y<=pedra9.y+pedra9.height) or 
		   (v.x>=flame5.x and v.x<=flame5.x+flame5.width/3) and (v.y>=flame5.y and v.y<=flame5.y+flame5.height)then
    		table.remove (pedra)
    		pedra9.x,flame5.x=-50,-50
    		pedra9.body:destroy()
		end
		if (v.x>=pedra10.x and v.x<=pedra10.x+pedra10.width/3) and (v.y>=pedra10.y and v.y<=pedra10.y+pedra10.height) then
    		table.remove (pedra)
    		gelo6.x,pedra10.x=-50,-50
    		pedra10.body:destroy()
		end
		if (v.x>=gelo9.x and v.x<=gelo9.x+gelo9.width/3) and (v.y>=gelo9.y and v.y<=gelo9.y+gelo9.height) then
    		gamestate="win"
    		table.remove (fogo)
    		gelo9.body:destroy()
    	end
	end
	--COLISÕES DAS BALAS DE ÁGUA
	for k,v in ipairs(agua) do                 ---balas de água
		if v.dir=="right" then
			v.x=v.x+agua.speed*dt
		end
		if v.dir=="left" then
			v.x=v.x-agua.speed*dt
		end
		if (v.x>=gelo1.x and v.x<=gelo1.x+gelo1.width/3) and (v.y>=gelo1.y and v.y<=gelo1.y+gelo1.height) or
		   (v.x>=flame1.x and v.x<=flame1.x+flame1.width/3) and (v.y>=flame1.y and v.y<=flame1.y+flame1.height) or
		   (v.x>=pedra1.x and v.x<=pedra1.x+pedra1.width/3) and (v.y>=pedra1.y and v.y<=pedra1.y+pedra1.height) then
    		table.remove (agua)
    		gelo1.x,pedra1.x,flame1.x=-50,-50,-50
    		gelo1.body:destroy()
    	end
    	if (v.x>=flame2.x and v.x<=flame2.x+flame2.width/3) and (v.y>=flame2.y and v.y<=flame2.y+flame2.height) then
    		table.remove (agua)
    		flame2.x=-50
    		flame2.body:destroy()
    	end
    	if (v.x>=flame3.x and v.x<=flame3.x+flame3.width/3) and (v.y>=flame3.y and v.y<=flame3.y+flame3.height) then
    		table.remove (agua)
    		flame3.x=-50
    		flame3.body:destroy()
    	end
    	 if (v.x>=flame4.x and v.x<=flame4.x+flame4.width/3) and (v.y>=flame4.y and v.y<=flame4.y+flame4.height) then
    		table.remove (agua)
    		flame4.x=-50
    		flame5.body:destroy()
    	end
    	if (v.x>=flame5.x and v.x<=flame5.x+flame5.width/3) and (v.y>=flame5.y and v.y<=flame5.y+flame5.height) or
    		(v.x>=pedra9.x and v.x<=pedra9.x+pedra9.width/3) and (v.y>=pedra9.y and v.y<=pedra9.y+pedra9.height) then
    		table.remove (agua)
    		flame5.x,pedra9.x=-50,-50
    		pedra9.body:destroy()
    	end
    	 if (v.x>=gelo4.x and v.x<=gelo4.x+gelo4.width/3) and (v.y>=gelo4.y and v.y<=gelo4.y+gelo4.height) or
    	    (v.x>=gelo4.x and v.x<=flame6.x+flame6.width/3) and (v.y>=flame6.y and v.y<=flame6.y+flame6.height) then
    		table.remove (agua)
    		gelo4.x,flame6.x=-50,-50
    		gelo4.body:destroy()
    	end
    	if (v.x>=flame7.x and v.x<=flame7.x+flame7.width/3) and (v.y>=flame7.y and v.y<=flame7.y+flame7.height) then
    		table.remove (agua)
    		flame7.x=-50
    		flame7.body:destroy()
    	end
	end

	for l,v in ipairs(vento) do                 ---balas de vento
		if v.dir=="right" then             --direção da bala "direita"
			v.x=v.x+vento.speed*dt        -- direção da bala "esquerda"
		end
		if v.dir=="left" then
			v.x=v.x-vento.speed*dt
		end
		if (v.x>=gelo1.x and v.x<=gelo1.x+gelo1.width/3) and (v.y>=gelo1.y or v.y<=gelo1.y+gelo1.height) or
		   (v.x>=flame1.x and v.x<=flame1.x+flame1.width/3) and (v.y>=flame1.y and v.y<=flame1.y+flame1.height) or
		   (v.x>=pedra1.x and v.x<=pedra1.x+pedra1.width/3) and (v.y>=pedra1.y and v.y<=pedra1.y+pedra1.height) then
    		table.remove (vento)
    		gelo1.x,pedra1.x,flame1.x=-50,-50,-50
    		gelo1.body:destroy()
		end
		if (v.x>=flame2.x and v.x<=flame2.x+flame2.width/3) and (v.y>=flame2.y/2 and v.y<=flame2.y+flame2.height) then
    		table.remove (vento)
    		flame2.x=-50
    		flame2.body:destroy()
    	end
    	if (v.x>=flame3.x and v.x<=flame3.x+flame3.width/3) and (v.y>=flame3.y/2 and v.y<=flame3.y+flame3.height) then
    		table.remove (vento)
    		flame3.x=-50
    		flame3.body:destroy()
    	end
    	 if (v.x>=flame4.x and v.x<=flame4.x+flame4.width/3) and (v.y>=flame4.y/2 and v.y<=flame4.y+flame4.height) then
    		table.remove (vento)
    		flame4.x=-50
    		flame5.body:destroy()
    	end
    	if (v.x>=flame5.x and v.x<=flame5.x+flame5.width/3) and (v.y>=flame5.y and v.y<=flame5.y+flame5.height) or
    		(v.x>=pedra9.x and v.x<=pedra9.x+pedra9.width/3) and (v.y>=pedra9.y and v.y<=pedra9.y+pedra9.height) then
    		table.remove (vento)
    		flame5.x,pedra9.x=-50,-50
    		pedra9.body:destroy()
    	end
    	 if (v.x>=gelo4.x and v.x<=gelo4.x+gelo4.width/3) and (v.y>=gelo4.y and v.y<=gelo4.y+gelo4.height) then
    		table.remove (vento)
    		gelo4.x=-50
    		gelo4.body:destroy()
    	end
    	if (v.x>=flame7.x and v.x<=flame7.x+flame7.width/3) and (v.y>=flame7.y/2 and v.y<=flame7.y+flame7.height) then
    		table.remove (vento)
    		flame7.x=-50
    		flame7.body:destroy()
    	end
	end
end

function fogo.shoot(key)
	if gamestate == "menu" then
		if key == "c" then
			gamestate = "menu_instrucoes"
		elseif key == "q" then
			love.event.quit()
		end
	end
	-- Menu2
	if gamestate == "menu_instrucoes" then
		if key == "i" then
			gamestate = "game"
		end
	end
	--DISPAROS BALAS DE FOGO
	if key=="s" and sent=="right" then
		fogo.spawn(avatar.body:getX()+avatar.width,avatar.body:getY()+avatar.height/4,'right')
		cont_fogo=cont_fogo+1
	end
	if key=="s" and sent=="left" then
		fogo.spawn(avatar.body:getX()-7,avatar.body:getY()+avatar.height/4,'left')
		cont_fogo=cont_fogo+1    
	end
	if cont_fogo>=4 then 		--define um limite as balas de fogo.
		table.remove(fogo)
	end
	--DISPAROS BALAS DE PEDRA
	if key=="a" and sent=="right" then
		pedra.spawn(avatar.body:getX()+avatar.width,avatar.body:getY()+avatar.height/4,'right')
		cont_pedra=cont_pedra+1	
	end
	if key=="a" and sent=="left" then
		pedra.spawn(avatar.body:getX()-5,avatar.body:getY()+avatar.height/4,'left')
		cont_pedra=cont_pedra+1
	end

	if cont_pedra>=4 then
		table.remove(pedra)		--define um limite as balas de pedra.
	end
	--DISPAROS BALAS DE ÁGUA
	if key=="d" and sent=="right" then
		agua.spawn(avatar.body:getX()+avatar.width,avatar.body:getY()+avatar.height/4,'right')
		cont_agua=cont_agua+1
	end
	if key=="d" and sent=="left" then
		agua.spawn(avatar.body:getX()-7,avatar.body:getY()+avatar.height/4,'left')
		cont_agua=cont_agua+1
	end
	if cont_agua>=2 then
		table.remove(agua)		--define um limite as balas de água.
	end
	--DISPAROS BALAS DE VENTO
	if key=="f" and sent=="right" then
		vento.spawn(avatar.body:getX()+avatar.width,avatar.body:getY()-avatar.height/8,'right')
		cont_vento=cont_vento+1
	end
	if key=="f" and sent=="left" then
		vento.spawn(avatar.body:getX()-7,avatar.body:getY()-avatar.height/8,'left')
		cont_vento=cont_vento+1
	end
	if cont_vento>=4 then
		table.remove(vento)		--define um limite as balas de pedra.
	end
	if key=="space" and sent=="right" then
		avatar.body:setLinearVelocity(150,-300)
	elseif key=="space" and sent=="left" then
		avatar.body:setLinearVelocity(-150,-300)
	end

	if key=="a" and cont_pedra==1 then    --exclui os contadores das balas de terra.
		bala_terra1.x=-50
	elseif key=="a" and cont_pedra==2 then 
		bala_terra2.x=-50
	elseif key=="a" and cont_pedra==3 then 
		bala_terra3.x=-50
	end

	if key=="s" and cont_fogo==1 then    --exclui os contadores das balas de fogo.
		bala_fogo1.x=-50
	elseif key=="s" and cont_fogo==2 then 
		bala_fogo2.x=-50
	elseif key=="s" and cont_fogo==3 then 
		bala_fogo3.x=-50
	end

	if key=="d" and cont_agua==1 then    --exclui os contadores das balas de agua.
		bala_agua1.x=-50
	end

	if key=="f" and cont_vento==1 then    --exclui os contadores das balas de vento.
		bala_vento1.x=-50
	elseif key=="f" and cont_vento==2 then 
		bala_vento2.x=-50
	elseif key=="f" and cont_vento==3 then 
		bala_vento3.x=-50
	end

	--teste game over
	if cont_vento>=3 and cont_pedra>=3 and cont_fogo>=3 and cont_agua>=1 then
		gamestate="gameover"
	end
end