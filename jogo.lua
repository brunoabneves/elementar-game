require"AnAL"
require"conf"

function love.load()
	gr=love.graphics
	kb=love.keyboard
	au=love.audio
	
	--criando o avatar
	avatar={}
	avatar.width=49
	avatar.height=43
	avatar.x=100
	avatar.y=100
	avatar.speed=300
	avatar.img=gr.newImage("Texturas/avatar.png")
    
    --CRIANDO O AS PLATAFORMAS (CHÃO) 
	ground1={}
	ground1.width=375
	ground1.height=115
	ground1.x=0                              --posição da plataforma x
	ground1.y=160                            --posição da plataforma y
	ground1.img=gr.newImage("Texturas/ground1.png")

	ground2={}
	ground2.width=1
	ground2.height=10
	ground2.x=370                           --posição da plataforma x
	ground2.y=160                            --posição da plataforma y
	ground2.img=gr.newImage("Texturas/ground2.png")

	ground3={}
	ground3.width=1
	ground3.height=10
	ground3.x=0                              --posição da plataforma x
	ground3.y=-170                            --posição da plataforma y
	ground3.img=gr.newImage("Texturas/ground3.png")

	ground4={}
	ground4.width=1
	ground4.height=10
	ground4.x=750                            --posição da plataforma x
	ground4.y=70                            --posição da plataforma y
	ground4.img=gr.newImage("Texturas/ground4.png")

	ground5={}
	ground5.width=1
	ground5.height=10
	ground5.x=380                            --posição da plataforma x
	ground5.y=70                            --posição da plataforma y
	ground5.img=gr.newImage("Texturas/ground5.png")

	ground6={}
	ground6.width=1
	ground6.height=10
	ground6.x=942                           --posição da plataforma x
	ground6.y=213                            --posição da plataforma y
	ground6.img=gr.newImage("Texturas/ground6.png")

	ground7={}
	ground7.width=1
	ground7.height=10
	ground7.x=680                           --posição da plataforma x
	ground7.y=230                            --posição da plataforma y
	ground7.img=gr.newImage("Texturas/ground7.png")

	ground8={}
	ground8.width=1
	ground8.height=10
	ground8.x=1070                           --posição da plataforma x
	ground8.y=70                            --posição da plataforma y
	ground8.img=gr.newImage("Texturas/ground8.png")
 
 	ground9={}
	ground9.width=1
	ground9.height=10
	ground9.x=1245                           --posição da plataforma x
	ground9.y=120                            --posição da plataforma y
	ground9.img=gr.newImage("Texturas/ground9.png")
 
 	ground10={}
	ground10.width=1
	ground10.height=10
	ground10.x=360                           --posição da plataforma x
	ground10.y=330                            --posição da plataforma y
	ground10.img=gr.newImage("Texturas/ground10.png")

	ground11={}
	ground11.width=1
	ground11.height=10
	ground11.x=260                           --posição da plataforma x
	ground11.y=330                            --posição da plataforma y
	ground11.img=gr.newImage("Texturas/ground11.png")

	ground12={}
	ground12.width=1
	ground12.height=10
	ground12.x=120                          --posição da plataforma x
	ground12.y=284                            --posição da plataforma y
	ground12.img=gr.newImage("Texturas/ground12.png")
	
	ground13={}
	ground13.width=1
	ground13.height=10
	ground13.x=0                           --posição da plataforma x
	ground13.y=520                          --posição da plataforma y
	ground13.img=gr.newImage("Texturas/ground13.png")

	ground14={}
	ground14.width=1
	ground14.height=10
	ground14.x=640                           --posição da plataforma x
	ground14.y=520                          --posição da plataforma y
	ground14.img=gr.newImage("Texturas/ground14.png")

	ground15={}
	ground15.width=1
	ground15.height=10
	ground15.x=880                           --posição da plataforma x
	ground15.y=245                          --posição da plataforma y
	ground15.img=gr.newImage("Texturas/ground15.png")

	ground16={}
	ground16.width=1
	ground16.height=10
	ground16.x=700                           --posição da plataforma x
	ground16.y=415                          --posição da plataforma y
	ground16.img=gr.newImage("Texturas/ground16.png")
	
	ground17={}
	ground17.width=1
	ground17.height=10
	ground17.x=990                           --posição da plataforma x
	ground17.y=430                          --posição da plataforma y
	ground17.img=gr.newImage("Texturas/ground17.png")

	ground18={}
	ground18.width=1
	ground18.height=10
	ground18.x=1100                           --posição da plataforma x
	ground18.y=245                          --posição da plataforma y
	ground18.img=gr.newImage("Texturas/ground18.png")
	
	ground19={}
	ground19.width=1
	ground19.height=10
	ground19.x=738                           --posição da plataforma x
	ground19.y=565                          --posição da plataforma y
	ground19.img=gr.newImage("Texturas/ground19.png")

	ground20={}
	ground20.width=1
	ground20.height=10
	ground20.x=890                           --posição da plataforma x
	ground20.y=530                          --posição da plataforma y
	ground20.img=gr.newImage("Texturas/ground20.png")

	ground21={}
	ground21.width=1
	ground21.height=10
	ground21.x=635                           --posição da plataforma x
	ground21.y=690                          --posição da plataforma y
	ground21.img=gr.newImage("Texturas/ground21.png")

	ground22={}
	ground22.width=1
	ground22.height=10
	ground22.x=235                           --posição da plataforma x
	ground22.y=735                          --posição da plataforma y
	ground22.img=gr.newImage("Texturas/ground22.png")

	ground23={}
	ground23.width=1
	ground23.height=10
	ground23.x=0                           --posição da plataforma x
	ground23.y=690                          --posição da plataforma y
	ground23.img=gr.newImage("Texturas/ground23.png")
	
	ground24={}
	ground24.width=1
	ground24.height=10
	ground24.x=340                           --posição da plataforma x
	ground24.y=650                          --posição da plataforma y
	ground24.img=gr.newImage("Texturas/ground24.png")

	ground25={}
	ground25.width=1
	ground25.height=10
	ground25.x=100                           --posição da plataforma x
	ground25.y=620                          --posição da plataforma y
	ground25.img=gr.newImage("Texturas/ground25.png")

	ground26={}
	ground26.width=1
	ground26.height=10
	ground26.x=460                           --posição da plataforma x
	ground26.y=440                          --posição da plataforma y
	ground26.img=gr.newImage("Texturas/ground26.png")
 
 -- FOGO
	flame={}
	flame.x=170
	flame.y=45
	width=20
	height=200
	local img=gr.newImage("Texturas/fogoo.png")
	anim=newAnimation(img,32,32,0.1,0)
	anim:setMode("loop")

-- GELO
	gelo={}
	gelo.x=170
	gelo.y=120
	width=10
	height=10
	gelo.img=gr.newImage("Texturas/gelo.png")

--PEDRAS
	pedra={}
	pedra.x=170
	pedra.y=85
	width=10
	height=10
	pedra.img=gr.newImage("Texturas/pedra.png")
end

-- FUNÇÕES PARA MOVIMENTOS
function love.update(dt)
	if kb.isDown("left")  then avatar.x=avatar.x - avatar.speed*dt end
	if kb.isDown("right") then avatar.x=avatar.x + avatar.speed*dt end
	if kb.isDown("up")    then avatar.y=avatar.y - avatar.speed*dt end
	if kb.isDown("down")  then avatar.y=avatar.y + avatar.speed*dt end
	anim:update(dt) -- Animação do fogo
	
	avatar.y= avatar.y+avatar.speed*dt

	if avatar.x<ground1.width and
	
	  avatar.y >ground1.height then
		avatar.y=ground1.height
	else
		avatar.y=avatar.y+2
	end
end
 
 --desenhando o avatar e plataformas
 function love.draw()
 	gr.draw(avatar.img,avatar.x,avatar.y)
	gr.draw(ground1.img,ground1.x,ground1.y) --TAMANHO DA PLATAFORMA
	gr.draw(ground2.img,ground2.x,ground2.y)
	gr.draw(ground3.img,ground3.x,ground3.y)
	gr.draw(ground4.img,ground4.x,ground4.y)
	gr.draw(ground5.img,ground5.x,ground5.y)
	gr.draw(ground6.img,ground6.x,ground6.y)
	gr.draw(ground7.img,ground7.x,ground7.y)
	gr.draw(ground8.img,ground8.x,ground8.y)
	gr.draw(ground9.img,ground9.x,ground9.y)
	gr.draw(ground10.img,ground10.x,ground10.y)
	gr.draw(ground11.img,ground11.x,ground11.y)
	gr.draw(ground12.img,ground12.x,ground12.y)
	gr.draw(ground13.img,ground13.x,ground13.y)
	gr.draw(ground14.img,ground14.x,ground14.y)
	gr.draw(ground15.img,ground15.x,ground15.y)
	gr.draw(ground16.img,ground16.x,ground16.y)
	gr.draw(ground17.img,ground17.x,ground17.y)
	gr.draw(ground18.img,ground18.x,ground18.y)
	gr.draw(ground19.img,ground19.x,ground19.y)
	gr.draw(ground20.img,ground20.x,ground20.y)
	gr.draw(ground21.img,ground21.x,ground21.y)
	gr.draw(ground22.img,ground22.x,ground22.y)
	gr.draw(ground23.img,ground23.x,ground23.y)
	gr.draw(ground24.img,ground24.x,ground24.y)
	gr.draw(ground25.img,ground25.x,ground25.y)
	gr.draw(ground26.img,ground26.x,ground26.y)
	anim:draw(flame.x,flame.y)                       --Animação e posição do fogo!
 
 -- Obstaculos de gelo
 	gr.draw(gelo.img,gelo.x,gelo.y)

 --Obstaculos de pedra
 	gr.draw(pedra.img,pedra.x,pedra.y)
 end