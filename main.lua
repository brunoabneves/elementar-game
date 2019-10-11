require "AnAL"
require "bullets"

function love.load()
	world = love.physics.newWorld( 0, 1000, true )
	gamestate = "menu"
	music= love.audio.newSource("Texturas/music.mp3", "stream")
	love.audio.play (music)
	fundo=love.graphics.newImage("Texturas/fundo.png")
	menu=love.graphics.newImage("Texturas/menu.png")

	instrucoes=love.graphics.newImage("Texturas/instrucoes.png")
	game_over=love.graphics.newImage("Texturas/game_over.png")
	win=love.graphics.newImage("Texturas/win.png")

	bala_terra1={}
	bala_terra1.x=40
	bala_terra1.y=25
	bala_terra1.img=love.graphics.newImage("Texturas/bala_terra1.png")

	bala_terra2={}
	bala_terra2.x=60
	bala_terra2.y=25
	bala_terra2.img=love.graphics.newImage("Texturas/bala_terra2.png")

	bala_terra3={}
	bala_terra3.x=80
	bala_terra3.y=25
	bala_terra3.img=love.graphics.newImage("Texturas/bala_terra3.png")

	bala_fogo1={}
	bala_fogo1.x=32
	bala_fogo1.y=45
	bala_fogo1.img=love.graphics.newImage("Texturas/bala_fogo1.png")

	bala_fogo2={}
	bala_fogo2.x=52
	bala_fogo2.y=45
	bala_fogo2.img=love.graphics.newImage("Texturas/bala_fogo2.png")

	bala_fogo3={}
	bala_fogo3.x=72
	bala_fogo3.y=45
	bala_fogo3.img=love.graphics.newImage("Texturas/bala_fogo3.png")

	bala_agua1={}
	bala_agua1.x=40
	bala_agua1.y=65
	bala_agua1.img=love.graphics.newImage("Texturas/bala_agua1.png")

	bala_vento1={}
	bala_vento1.x=40
	bala_vento1.y=85
	bala_vento1.img=love.graphics.newImage("Texturas/bala_vento1.png")

	bala_vento2={}
	bala_vento2.x=60
	bala_vento2.y=85
	bala_vento2.img=love.graphics.newImage("Texturas/bala_vento2.png")

	bala_vento3={}
	bala_vento3.x=80
	bala_vento3.y=85
	bala_vento3.img=love.graphics.newImage("Texturas/bala_vento3.png")

	avatar={}
	avatar.width=48
	avatar.height=49
	avatar.x=100
	avatar.y=100
	avatar.speed=300
	avatar.img=love.graphics.newImage("Texturas/avatar.png")
	local img=love.graphics.newImage("Texturas/avatar1.png")
	anim_avatar1=newAnimation(img,60,50,0.2,0)
	anim_avatar1:setMode("loop")
	local img=love.graphics.newImage("Texturas/avatar2.png")
	anim_avatar2=newAnimation(img,60,50,0.2,0)
	anim_avatar2:setMode("loop")
	
	mestre={}
	mestre.width=49
	avatar.height=86
	mestre.x=20
	mestre.y=608
	mestre.img=love.graphics.newImage("Texturas/mestre.png")

	--CRIANDO O AS PLATAFORMAS (CHÃO)
	ground1={}
	ground1.width=375
	ground1.height=15
	ground1.x=0                              --posição da plataforma x
	ground1.y=160                            --posição da plataforma y
	ground1.img=love.graphics.newImage("Texturas/ground1.png")

	ground2={}                              --horizontal da primeira linha
	ground2.width=193
	ground2.height=80
	ground2.x=370                           --posição da plataforma x
	ground2.y=160                            --posição da plataforma y
	ground2.img=love.graphics.newImage("Texturas/ground2.png")

	ground3={}
	ground3.width=194
	ground3.height=50
	ground3.x=0                              --posição da plataforma x
	ground3.y=-170                            --posição da plataforma y
	ground3.img=love.graphics.newImage("Texturas/ground3.png")

	ground4={}                              --horizontal da primeira linha
	ground4.width=375
	ground4.height=15
	ground4.x=380                            --posição da plataforma x
	ground4.y=70                            --posição da plataforma y
	ground4.img=love.graphics.newImage("Texturas/ground4.png")

	ground5={}                              --horizontal da primeira linha
	ground5.width=188
	ground5.height=175
	ground5.x=750                            --posição da plataforma x
	ground5.y=70                            --posição da plataforma y
	ground5.img=love.graphics.newImage("Texturas/ground5.png")

	ground6={}                              --horizontal da primeira linha
	ground6.width=193
	ground6.height=33
	ground6.x=942                           --posição da plataforma x
	ground6.y=213                            --posição da plataforma y
	ground6.img=love.graphics.newImage("Texturas/ground6.png")

	ground7={}                              --horizontal da primeira linha
	ground7.width=70
	ground7.height=15
	ground7.x=680                           --posição da plataforma x
	ground7.y=230                            --posição da plataforma y
	ground7.img=love.graphics.newImage("Texturas/ground7.png")

	ground8={}
	ground8.width=186
	ground8.height=50
	ground8.x=1070                           --posição da plataforma x
	ground8.y=70                            --posição da plataforma y
	ground8.img=love.graphics.newImage("Texturas/ground8.png")
 
 	ground9={}                                -- vertical primeira linha
	ground9.width=12
	ground9.height=225
	ground9.x=1245                           --posição da plataforma x
	ground9.y=120                            --posição da plataforma y
	ground9.img=love.graphics.newImage("Texturas/ground9.png")
 
 	ground10={}                              --horizontal da segunda linha
	ground10.width=350
	ground10.height=15
	ground10.x=360                           --posição da plataforma x
	ground10.y=330                            --posição da plataforma y
	ground10.img=love.graphics.newImage("Texturas/ground10.png")

	ground11={}                              --horizontal da segunda linha
	ground11.width=100
	ground11.height=74
	ground11.x=262                           --posição da plataforma x
	ground11.y=330                            --posição da plataforma y
	ground11.img=love.graphics.newImage("Texturas/ground11.png")

	ground12={}                             --horizontal da segunda linha
	ground12.width=134
	ground12.height=120
	ground12.x=124                          --posição da plataforma x
	ground12.y=284                            --posição da plataforma y
	ground12.img=love.graphics.newImage("Texturas/ground12.png")
	
	ground13={}                            --horizontal da terceira linha
	ground13.width=630
	ground13.height=15
	ground13.x=0                           --posição da plataforma x
	ground13.y=520                          --posição da plataforma y
	ground13.img=love.graphics.newImage("Texturas/ground13.png")

	ground14={}                              --horizontal da terceira linha
	ground14.width=96
	ground14.height=61
	ground14.x=640                           --posição da plataforma x
	ground14.y=520                          --posição da plataforma y
	ground14.img=love.graphics.newImage("Texturas/ground14.png")

	ground15={}                              --vertical da terceira linha
	ground15.width=12
	ground15.height=170
	ground15.x=880                           --posição da plataforma x
	ground15.y=245                          --posição da plataforma y
	ground15.img=love.graphics.newImage("Texturas/ground15.png")

	ground16={}                              --horizontal segunda linha
	ground16.width=194
	ground16.height=15
	ground16.x=700                           --posição da plataforma x
	ground16.y=415                          --posição da plataforma y
	ground16.img=love.graphics.newImage("Texturas/ground16.png")
	
	ground17={}                              -- horizontal segunda linha
	ground17.width=375
	ground17.height=15
	ground17.x=990                           --posição da plataforma x
	ground17.y=430                          --posição da plataforma y
	ground17.img=love.graphics.newImage("Texturas/ground17.png")

	ground18={}                               --vertical segunda linha
	ground18.width=28
	ground18.height=100
	ground18.x=1102                           --posição da plataforma x
	ground18.y=245                          --posição da plataforma y
	ground18.img=love.graphics.newImage("Texturas/ground18.png")
	
	ground19={}                              -- vertical segunda linha
	ground19.width=144
	ground19.height=16
	ground19.x=738                           --posição da plataforma x
	ground19.y=565                          --posição da plataforma y
	ground19.img=love.graphics.newImage("Texturas/ground19.png")

	ground20={}                             -- horizontal terceira linha
	ground20.width=240
	ground20.height=20
	ground20.x=890                           --posição da plataforma x
	ground20.y=530                          --posição da plataforma y
	ground20.img=love.graphics.newImage("Texturas/ground20.png")

	ground21={}                              --horizontal da ultima linha
	ground21.width=735
	ground21.height=80
	ground21.x=635                           --posição da plataforma x
	ground21.y=690                          --posição da plataforma y
	ground21.img=love.graphics.newImage("Texturas/ground21.png")

	ground22={}                              --horizontal da ultima linha
	ground22.width=405
	ground22.height=33
	ground22.x=235                           --posição da plataforma x
	ground22.y=735                          --posição da plataforma y
	ground22.img=love.graphics.newImage("Texturas/ground22.png")

	ground23={}                            -- horizontal ultima linha
	ground23.width=240
	ground23.height=194
	ground23.x=0                           --posição da plataforma x
	ground23.y=690                          --posição da plataforma y
	ground23.img=love.graphics.newImage("Texturas/ground23.png")
	
	ground24={}                              --vertical da ultima linha
	ground24.width=193
	ground24.height=16
	ground24.x=340                           --posição da plataforma x
	ground24.y=650                          --posição da plataforma y
	ground24.img=love.graphics.newImage("Texturas/ground24.png")

	ground25={}                              --vertical da ultima linha
	ground25.width=68
	ground25.height=15
	ground25.x=110                           --posição da plataforma x
	ground25.y=620                          --posição da plataforma y
	ground25.img=love.graphics.newImage("Texturas/ground25.png")

	ground26={}
	ground26.width=150
	ground26.height=17
	ground26.x=460                           --posição da plataforma x
	ground26.y=440                          --posição da plataforma y
	ground26.img=love.graphics.newImage("Texturas/ground26.png")
 
 -- FOGO
	flame1={}
	flame1.x=155
	flame1.y=22
	flame1.width=30
	flame1.height=43
	local img=love.graphics.newImage("Texturas/fogoo1.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

	flame2={}
	flame2.x=550
	flame2.y=16
	flame2.width=30
	flame2.height=43
	local img=love.graphics.newImage("Texturas/fogoo2.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

	flame3={}
	flame3.x=1090
	flame3.y=160
	flame3.width=30
	flame3.height=60
	local img=love.graphics.newImage("Texturas/fogoo3.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

	flame4={}
	flame4.x=1090
	flame4.y=376
	flame4.width=95
	flame4.height=80
	local img=love.graphics.newImage("Texturas/fogoo4.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

	flame5={}
	flame5.x=1223
	flame5.y=334
	flame5.width=30
	flame5.height=80
	local img=love.graphics.newImage("Texturas/fogoo5.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

	flame6={}
	flame6.x=120
	flame6.y=405
	flame6.width=95
	flame6.height=80
	local img=love.graphics.newImage("Texturas/fogoo6.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

	flame7={}
	flame7.x=488
	flame7.y=597
	flame7.width=30
	flame7.height=90
	local img=love.graphics.newImage("Texturas/fogoo7.png")
	anim=newAnimation(img,64,58,0.1,0)
	anim:setMode("loop")

-- GELO
	gelo1={}
	gelo1.x=170
	gelo1.y=119
	gelo1.width=30
	gelo1.height=43
	gelo1.img=love.graphics.newImage("Texturas/gelo1.png")

	gelo2={}
	gelo2.x=390
	gelo2.y=119
	gelo2.width=30
	gelo2.height=43
	gelo2.img=love.graphics.newImage("Texturas/gelo2.png")

	gelo3={}
	gelo3.x=685
	gelo3.y=248
	gelo3.width=40
	gelo3.height=83
	gelo3.img=love.graphics.newImage("Texturas/gelo3.png")

	gelo4={}
	gelo4.x=130
	gelo4.y=461
	gelo4.width=40
	gelo4.height=60
	gelo4.img=love.graphics.newImage("Texturas/gelo4.png")

	gelo5={}
	gelo5.x=530
	gelo5.y=454
	gelo5.width=40
	gelo5.height=67
	gelo5.img=love.graphics.newImage("Texturas/gelo5.png")

	gelo6={}
	gelo6.x=796
	gelo6.y=498
	gelo6.width=40
	gelo6.height=67
	gelo6.img=love.graphics.newImage("Texturas/gelo6.png")

	gelo7={}
	gelo7.x=1096
	gelo7.y=446
	gelo7.width=40
	gelo7.height=83
	gelo7.img=love.graphics.newImage("Texturas/gelo7.png")

	gelo8={}
	gelo8.x=645
	gelo8.y=590
	gelo8.width=40
	gelo8.height=100
	gelo8.img=love.graphics.newImage("Texturas/gelo8.png")

	gelo9={}
	gelo9.x=140
	gelo9.y=633
	gelo9.width=40
	gelo9.height=60
	gelo9.img=love.graphics.newImage("Texturas/gelo9.png")

--PEDRAS
	pedra1={}
	pedra1.x=170
	pedra1.y=78
	pedra1.width=30
	pedra1.height=43
	pedra1.img=love.graphics.newImage("Texturas/pedra1.png")

	pedra2={}
	pedra2.x=390
	pedra2.y=85
	pedra2.width=30
	pedra2.height=35
	pedra2.img=love.graphics.newImage("Texturas/pedra2.png")

	pedra3={}
	pedra3.x=720
	pedra3.y=3
	pedra3.width=40
	pedra3.height=70
	pedra3.img=love.graphics.newImage("Texturas/pedra3.png")

	pedra4={}
	pedra4.x=390
	pedra4.y=243
	pedra4.width=40
	pedra4.height=90
	pedra4.img=love.graphics.newImage("Texturas/pedra4.png")

	pedra5={}
	pedra5.x=530
	pedra5.y=353
	pedra5.width=40
	pedra5.height=65
	pedra5.img=love.graphics.newImage("Texturas/pedra5.png")

	pedra6={}
	pedra6.x=700
	pedra6.y=346
	pedra6.width=40
	pedra6.height=70
	pedra6.img=love.graphics.newImage("Texturas/pedra6.png")

	pedra7={}
	pedra7.x=996
	pedra7.y=256
	pedra7.width=40
	pedra7.height=90
	pedra7.img=love.graphics.newImage("Texturas/pedra7.png")

	pedra8={}
	pedra8.x=996
	pedra8.y=342
	pedra8.width=40
	pedra8.height=90
	pedra8.img=love.graphics.newImage("Texturas/pedra8.png")

	pedra9={}
	pedra9.x=1240
	pedra9.y=390
	pedra9.width=30
	pedra9.height=43
	pedra9.img=love.graphics.newImage("Texturas/pedra9.png")

	pedra10={}
	pedra10.x=795
	pedra10.y=430
	pedra10.width=40
	pedra10.height=70
	pedra10.img=love.graphics.newImage("Texturas/pedra10.png")

	pedra11={}
	pedra11.x=505
	pedra11.y=665
	pedra11.width=40
	pedra11.height=90
	pedra11.img=love.graphics.newImage("Texturas/pedra11.png")

--vertical
	barreira1={}
	barreira1.body = love.physics.newBody(world,70,450)
	barreira1.shape = love.physics.newRectangleShape(10,768)
	barreira1.fixture = love.physics.newFixture( barreira1.body,barreira1.shape, 0 )

--vertical
	barreira2={}
	barreira2.body = love.physics.newBody(world,1453,450)
	barreira2.shape = love.physics.newRectangleShape(10,768)
	barreira2.fixture = love.physics.newFixture( barreira2.body,barreira2.shape, 0 )

	--horizontal
	barreira3={}
	barreira3.body = love.physics.newBody(world,770,70)
	barreira3.shape = love.physics.newRectangleShape(1330,10)
	barreira3.fixture = love.physics.newFixture( barreira3.body,barreira3.shape, 0 )

	avatar.body = love.physics.newBody(world, avatar.x,avatar.y,"dynamic" )
	avatar.shape = love.physics.newCircleShape( avatar.x, avatar.y, 25 )
	avatar.fixture = love.physics.newFixture( avatar.body, avatar.shape, 0 )

	mestre.body = love.physics.newBody(world,106,740 )
	mestre.shape = love.physics.newRectangleShape(49,86)
	mestre.fixture = love.physics.newFixture( mestre.body, mestre.shape, 0 )

	ground1.body= love.physics.newBody(world,256,243)
	ground1.shape = love.physics.newRectangleShape(ground1.width,ground1.height)
	ground1.fixture = love.physics.newFixture(ground1.body,ground1.shape,0)

	ground2.body= love.physics.newBody(world,550,276)
	ground2.shape = love.physics.newRectangleShape(ground2.width,ground2.height)
	ground2.fixture = love.physics.newFixture(ground2.body,ground2.shape,0)

	ground3.body= love.physics.newBody(world,170,79)
	ground3.shape = love.physics.newRectangleShape(ground3.width,ground3.height)
	ground3.fixture = love.physics.newFixture(ground3.body,ground3.shape,0)

	ground4.body= love.physics.newBody(world,650,154)
	ground4.shape = love.physics.newRectangleShape(ground4.width,ground4.height)
	ground4.fixture = love.physics.newFixture(ground4.body,ground4.shape,0)

	ground5.body= love.physics.newBody(world,927,234)
	ground5.shape = love.physics.newRectangleShape(ground5.width,ground5.height)
	ground5.fixture = love.physics.newFixture(ground5.body,ground5.shape,0)

	ground6.body= love.physics.newBody(world,1115,305.3)
	ground6.shape = love.physics.newRectangleShape(ground6.width,ground6.height)
	ground6.fixture = love.physics.newFixture(ground6.body,ground6.shape,0)

	ground7.body= love.physics.newBody(world,797,313.2)
	ground7.shape = love.physics.newRectangleShape(ground7.width,ground7.height)
	ground7.fixture = love.physics.newFixture(ground7.body,ground7.shape,0)

	ground8.body= love.physics.newBody(world,1245,170)
	ground8.shape = love.physics.newRectangleShape(ground8.width,ground8.height)
	ground8.fixture = love.physics.newFixture(ground8.body,ground8.shape,0)

	ground9.body= love.physics.newBody(world,1333,313)
	ground9.shape = love.physics.newRectangleShape(ground9.width,ground9.height)
	ground9.fixture = love.physics.newFixture(ground9.body,ground9.shape,0)


	ground10.body= love.physics.newBody(world,610,413)
	ground10.shape = love.physics.newRectangleShape(ground10.width,ground10.height)
	ground10.fixture = love.physics.newFixture(ground10.body,ground10.shape,0)

	ground11.body= love.physics.newBody(world,387,442.3)
	ground11.shape = love.physics.newRectangleShape(ground11.width,ground11.height)
	ground11.fixture = love.physics.newFixture(ground11.body,ground11.shape,0)

	ground12.body= love.physics.newBody(world,269,419.5)
	ground12.shape = love.physics.newRectangleShape(ground12.width,ground12.height)
	ground12.fixture = love.physics.newFixture(ground12.body,ground12.shape,0)

	ground13.body= love.physics.newBody(world,400,603)
	ground13.shape = love.physics.newRectangleShape(ground13.width,ground13.height)
	ground13.fixture = love.physics.newFixture(ground13.body,ground13.shape,0)

	ground14.body= love.physics.newBody(world,770,626)
	ground14.shape = love.physics.newRectangleShape(ground14.width,ground14.height)
	ground14.fixture = love.physics.newFixture(ground14.body,ground14.shape,0)

	ground15.body= love.physics.newBody(world,967,423.3)
	ground15.shape = love.physics.newRectangleShape(ground15.width,ground15.height)
	ground15.fixture = love.physics.newFixture(ground15.body,ground15.shape,0)

	ground16.body= love.physics.newBody(world,877,498)
	ground16.shape = love.physics.newRectangleShape(ground16.width,ground16.height)
	ground16.fixture = love.physics.newFixture(ground16.body,ground16.shape,0)

	ground17.body= love.physics.newBody(world,1255,513)
	ground17.shape = love.physics.newRectangleShape(ground17.width,ground17.height)
	ground17.fixture = love.physics.newFixture(ground17.body,ground17.shape,0)

	ground18.body= love.physics.newBody(world,1198,375)
	ground18.shape = love.physics.newRectangleShape(ground18.width,ground18.height)
	ground18.fixture = love.physics.newFixture(ground18.body,ground18.shape,0)

	ground19.body= love.physics.newBody(world,613,523.5)
	ground19.shape = love.physics.newRectangleShape(ground19.width,ground19.height)
	ground19.fixture = love.physics.newFixture(ground19.body,ground19.shape,0)

	ground20.body= love.physics.newBody(world,1086,616)
	ground20.shape = love.physics.newRectangleShape(ground20.width,ground20.height)
	ground20.fixture = love.physics.newFixture(ground20.body,ground20.shape,0)

	ground21.body= love.physics.newBody(world,1087,805)
	ground21.shape = love.physics.newRectangleShape(ground21.width,ground21.height)
	ground21.fixture = love.physics.newFixture(ground21.body,ground21.shape,0)

	ground22.body= love.physics.newBody(world,515,826.5)
	ground22.shape = love.physics.newRectangleShape(ground22.width,ground22.height)
	ground22.fixture = love.physics.newFixture(ground22.body,ground22.shape,0)

	ground23.body= love.physics.newBody(world,196,863.5)
	ground23.shape = love.physics.newRectangleShape(ground23.width,ground23.height)
	ground23.fixture = love.physics.newFixture(ground23.body,ground23.shape,0)

	ground24.body= love.physics.newBody(world,517,733.5)
	ground24.shape = love.physics.newRectangleShape(ground24.width,ground24.height)
	ground24.fixture = love.physics.newFixture(ground24.body,ground24.shape,0)

	ground25.body= love.physics.newBody(world,217,704.5)
	ground25.shape = love.physics.newRectangleShape(ground25.width,ground25.height)
	ground25.fixture = love.physics.newFixture(ground25.body,ground25.shape,0)

	ground26.body= love.physics.newBody(world,891,651)
	ground26.shape = love.physics.newRectangleShape(ground26.width,ground26.height)
	ground26.fixture = love.physics.newFixture(ground26.body,ground26.shape,0)


	gelo1.body=love.physics.newBody(world,265,170)
	gelo1.shape = love.physics.newRectangleShape(gelo1.width,(gelo1.height+pedra1.height))
	gelo1.fixture = love.physics.newFixture(gelo1.body,gelo1.shape)

	gelo2.body=love.physics.newBody(world,488,200)
	gelo2.shape = love.physics.newRectangleShape(gelo2.width,gelo2.height+pedra2.width)
	gelo2.fixture = love.physics.newFixture(gelo2.body,gelo2.shape)

	gelo3.body=love.physics.newBody(world,784,370)
	gelo3.shape = love.physics.newRectangleShape(gelo3.width,gelo3.height)
	gelo3.fixture = love.physics.newFixture(gelo3.body,gelo3.shape)

	gelo4.body=love.physics.newBody(world,230,520)
	gelo4.shape = love.physics.newRectangleShape(gelo4.width,gelo4.height+gelo4.height)
	gelo4.fixture = love.physics.newFixture(gelo4.body,gelo4.shape)

	gelo5.body=love.physics.newBody(world,630,546)
	gelo5.shape = love.physics.newRectangleShape(gelo5.width,gelo5.height)
	gelo5.fixture = love.physics.newFixture(gelo5.body,gelo5.shape)

	gelo7.body=love.physics.newBody(world,1198,548)
	gelo7.shape = love.physics.newRectangleShape(gelo7.width,gelo7.height)
	gelo7.fixture = love.physics.newFixture(gelo7.body,gelo7.shape)

	gelo8.body=love.physics.newBody(world,742,693)
	gelo8.shape = love.physics.newRectangleShape(gelo8.width,gelo8.height)
	gelo8.fixture = love.physics.newFixture(gelo8.body,gelo8.shape)

	gelo9.body=love.physics.newBody(world,230,740)
	gelo9.shape = love.physics.newRectangleShape(gelo9.width,gelo9.height)
	gelo9.fixture = love.physics.newFixture(gelo9.body,gelo9.shape)

	pedra3.body=love.physics.newBody(world,817,100)
	pedra3.shape = love.physics.newRectangleShape(pedra3.width,pedra3.height)
	pedra3.fixture = love.physics.newFixture(pedra3.body,pedra3.shape)

	pedra4.body=love.physics.newBody(world,488,370)
	pedra4.shape = love.physics.newRectangleShape(pedra4.width,pedra4.height)
	pedra4.fixture = love.physics.newFixture(pedra4.body,pedra4.shape)

	pedra5.body=love.physics.newBody(world,630,450)
	pedra5.shape = love.physics.newRectangleShape(pedra5.width,pedra5.height)
	pedra5.fixture = love.physics.newFixture(pedra5.body,pedra5.shape)

	pedra6.body=love.physics.newBody(world,798,458)
	pedra6.shape = love.physics.newRectangleShape(pedra6.width,pedra6.height)
	pedra6.fixture = love.physics.newFixture(pedra6.body,pedra6.shape)

	pedra7.body=love.physics.newBody(world,1094,420)
	pedra7.shape = love.physics.newRectangleShape(pedra7.width,pedra7.height+pedra8.height)
	pedra7.fixture = love.physics.newFixture(pedra7.body,pedra7.shape)

	pedra9.body=love.physics.newBody(world,1333,474)
	pedra9.shape = love.physics.newRectangleShape(pedra9.width,pedra9.height+flame1.height)
	pedra9.fixture = love.physics.newFixture(pedra9.body,pedra9.shape)

	pedra10.body=love.physics.newBody(world,887,560)
	pedra10.shape = love.physics.newRectangleShape(pedra10.width,pedra10.height+gelo6.height)
	pedra10.fixture = love.physics.newFixture(pedra10.body,pedra10.shape)

	flame2.body=love.physics.newBody(world,660,120)
	flame2.shape=love.physics.newRectangleShape(flame2.width,flame2.height)
	flame2.fixture = love.physics.newFixture(flame2.body,flame2.shape)

	flame3.body=love.physics.newBody(world,1190,230)
	flame3.shape=love.physics.newRectangleShape(flame3.width,flame3.height)
	flame3.fixture = love.physics.newFixture(flame3.body,flame3.shape)

	flame5.body=love.physics.newBody(world,1190,474)
	flame5.shape=love.physics.newRectangleShape(flame5.width,flame5.height)
	flame5.fixture = love.physics.newFixture(flame5.body,flame5.shape)

	flame7.body=love.physics.newBody(world,600,680)
	flame7.shape=love.physics.newRectangleShape(flame7.width,flame7.height)
	flame7.fixture = love.physics.newFixture(flame7.body,flame7.shape)

end
function love.update(dt)
	if gamestate == "game"  then
  		--backmenu = false
		world:update(dt)
		fogo.update(dt)
		if love.keyboard.isDown("right") then
			sent="right"
			avatar.body:setLinearVelocity(200,200)
			anim_avatar1:update(dt)
			img=love.graphics.newImage ("Texturas/fogo.png")
    	elseif love.keyboard.isDown("left") then
    		sent="left"
  			avatar.body:setLinearVelocity(-200,300)
    		anim_avatar2:update(dt)
    		img=love.graphics.newImage ("Texturas/fogo.png")
    	end
		anim:update(dt) -- Animação do fogo
	end
end

function love.keypressed(key)
	fogo.shoot(key)
end

function love.draw()
	if gamestate=="menu" then
		love.graphics.draw(menu)

	elseif gamestate=="menu_instrucoes" then
		love.graphics.draw(instrucoes)
	elseif gamestate=="gameover" then
		love.graphics.draw(game_over)
	elseif gamestate=="win" then
		love.graphics.draw(win)
	elseif gamestate=="game" then
		love.graphics.draw(fundo,0,0)
		fogo.draw()
 		if sent=="right" then
 			anim_avatar1:draw(avatar.body:getX(),avatar.body:getY())
 		elseif sent=="left" then
 			anim_avatar2:draw(avatar.body:getX(),avatar.body:getY())
 		else anim_avatar1:draw(avatar.body:getX(),avatar.body:getY())
 		end

 		love.graphics.draw(mestre.img,mestre.x,mestre.y) ---imagem do mestre

 		love.graphics.draw(bala_terra1.img,bala_terra1.x,bala_terra1.y)
 		love.graphics.draw(bala_terra2.img,bala_terra2.x,bala_terra2.y)
 		love.graphics.draw(bala_terra3.img,bala_terra3.x,bala_terra3.y)

 		love.graphics.draw(bala_fogo1.img,bala_fogo1.x,bala_fogo1.y)
 		love.graphics.draw(bala_fogo2.img,bala_fogo2.x,bala_fogo2.y)
 		love.graphics.draw(bala_fogo3.img,bala_fogo3.x,bala_fogo3.y)

 		love.graphics.draw(bala_agua1.img,bala_agua1.x,bala_agua1.y)

 		love.graphics.draw(bala_vento1.img,bala_vento1.x,bala_vento1.y)
 		love.graphics.draw(bala_vento2.img,bala_vento2.x,bala_vento2.y)
 		love.graphics.draw(bala_vento3.img,bala_vento3.x,bala_vento3.y)

		love.graphics.draw(ground1.img,ground1.x,ground1.y) --TAMANHO DA PLATAFORMA
		love.graphics.draw(ground2.img,ground2.x,ground2.y)
		love.graphics.draw(ground3.img,ground3.x,ground3.y)
		love.graphics.draw(ground4.img,ground4.x,ground4.y)
		love.graphics.draw(ground5.img,ground5.x,ground5.y)
		love.graphics.draw(ground6.img,ground6.x,ground6.y)
		love.graphics.draw(ground7.img,ground7.x,ground7.y)
		love.graphics.draw(ground8.img,ground8.x,ground8.y)
		love.graphics.draw(ground9.img,ground9.x,ground9.y)
		love.graphics.draw(ground10.img,ground10.x,ground10.y)
		love.graphics.draw(ground11.img,ground11.x,ground11.y)
		love.graphics.draw(ground12.img,ground12.x,ground12.y)
		love.graphics.draw(ground13.img,ground13.x,ground13.y)
		love.graphics.draw(ground14.img,ground14.x,ground14.y)
		love.graphics.draw(ground15.img,ground15.x,ground15.y)
		love.graphics.draw(ground16.img,ground16.x,ground16.y)
		love.graphics.draw(ground17.img,ground17.x,ground17.y)
		love.graphics.draw(ground18.img,ground18.x,ground18.y)
		love.graphics.draw(ground19.img,ground19.x,ground19.y)
		love.graphics.draw(ground20.img,ground20.x,ground20.y)
		love.graphics.draw(ground21.img,ground21.x,ground21.y)
		love.graphics.draw(ground22.img,ground22.x,ground22.y)
		love.graphics.draw(ground23.img,ground23.x,ground23.y)
		love.graphics.draw(ground24.img,ground24.x,ground24.y)
		love.graphics.draw(ground25.img,ground25.x,ground25.y)
		love.graphics.draw(ground26.img,ground26.x,ground26.y)
	
		--Animação e posição do fogo!
		anim:draw(flame1.x,flame1.y)
		anim:draw(flame2.x,flame2.y)
		anim:draw(flame3.x,flame3.y)
 		anim:draw(flame4.x,flame4.y)
 		anim:draw(flame5.x,flame5.y)
 		anim:draw(flame6.x,flame6.y)
 		anim:draw(flame7.x,flame7.y)
 		-- Obstaculos de gelo
 		love.graphics.draw(gelo1.img,gelo1.x,gelo1.y)
 		love.graphics.draw(gelo2.img,gelo2.x,gelo2.y)
 		love.graphics.draw(gelo3.img,gelo3.x,gelo3.y)
 		love.graphics.draw(gelo4.img,gelo4.x,gelo4.y)
 		love.graphics.draw(gelo5.img,gelo5.x,gelo5.y)
 		love.graphics.draw(gelo6.img,gelo6.x,gelo6.y)
 		love.graphics.draw(gelo7.img,gelo7.x,gelo7.y)
 		love.graphics.draw(gelo8.img,gelo8.x,gelo8.y)
 		--love.graphics.draw(gelo9.img,gelo9.x,gelo9.y)
	 --Obstaculos de pedra
 		love.graphics.draw(pedra1.img,pedra1.x,pedra1.y)
 		love.graphics.draw(pedra2.img,pedra2.x,pedra2.y)
 		love.graphics.draw(pedra3.img,pedra3.x,pedra3.y)
 		love.graphics.draw(pedra4.img,pedra4.x,pedra4.y)
 		love.graphics.draw(pedra5.img,pedra5.x,pedra5.y)
 		love.graphics.draw(pedra6.img,pedra6.x,pedra6.y)
 		love.graphics.draw(pedra7.img,pedra7.x,pedra7.y)
 		love.graphics.draw(pedra8.img,pedra8.x,pedra8.y) 
 		love.graphics.draw(pedra9.img,pedra9.x,pedra9.y)
 		love.graphics.draw(pedra10.img,pedra10.x,pedra10.y) 
 	end  	
 end