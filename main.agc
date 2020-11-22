// Project: genesis67 
// Created: 2015-10-22
// set window properties
rem fucker
#include "keys.agc" 
//remstart
#include "../funlib/StringLibrary.agc"
#include "../funlib/GraphicsLibrary.agc"
#include"../funlib/SpriteLineLibrary.agc"
#include "../funlib/CoreLibrary.agc"
#include "../funlib/GUILibrary.agc"
//remend
LoadSound(1,"copied.wav")
LoadSound(2,"nice.wav")
loadsound(3,"loaded.wav")

loadsound(4,"gunshot.wav")
loadsound(5,"zombie.wav")
//***************************************
//*** Main program ***
//***************************************
//***************************************
//InitialiseScreen(1024, 768, "Genesis67", 0xF2D8AA, %11)
// set display properties
setWindowTitle("fuck you")
SetWindowSize(1024, 768, 1)
SetVirtualResolution( 800,600)
setsyncrate(0,0)
//SetScissor(0,0,0,0)
//Create3DPhysicsWorld(40)
SetPhysicsScale(1)
//SetOrientationAllowed( 1, 1, 1, 1 )
SetPhysicsGravity(0,300)
#constant maxsprites=7000
#constant maxbuttons=12 
#constant maxanimframes=200
#constant maxbullets=1
#constant staticstate=0
#constant walkingstate=1
#constant runningstate=2
#constant swimmingstate=3
#constant flyingstate=4
#constant dyingstate=5
#constant jumpingstate=6
type TMouse
     x1#
     y1#
     x2#
     y2#
     x3
     y3
endtype
type mysprites
	xp# as float
	yp# as float
	sizex# as float
	sizey# as float
	scalex as integer
	scaley as integer
	restitution# as float
	friction# as float
	speed# as float
	negspeed# as float
	spritenumber as integer
	imagenumber as integer
	transparency as integer
	visibility as integer
	groupnumber as integer
	physicstype as integer
	shape as integer
	angle as integer
	depth as integer
	host as integer
	client as integer
	tilevalue as integer
	tilevalue2 as integer
	tilevalue3 as integer
	tilevalue4 as integer
	tilevalue5 as integer
	tilevalue6 as integer
	canrotate as integer
	red as integer
	green as integer
	blue as integer
	oldred as integer
	oldgreen as integer
	oldblue as integer
	selected as integer
	framestart as integer
	frameamount as integer
	frameend as integer
	spriteanimframes as integer[maxanimframes]
	bullet as integer[maxbullets]
	loopframe   as integer
	texturerep as integer
	alpha as integer
	animframes as integer
	caller as integer
	ammo as integer
	health as integer
	delay as integer
	aitype as integer
	deleted as integer
	seeingdistance# as float
	pcount as integer
	state as integer
	hasanim as integer
	jumpspeed as integer
endtype
type baddies
	spriteID as integer
	oldx# as float
	oldy# as float
	baddiespeed# as float
	negbaddiespeed# as float
	mybaddiespeed# as float
	oldspeed# as float
	changedir as integer
	tick as integer
	delay as integer
	tilevalue
	tilevalue2
	ammo as integer
	oldammo as integer
	health as integer
	red as integer
	green as integer
	blue as integer
	spawnid as integer
	aitype as integer
	nxp# as float
	nyp# as float
	seeingdistance# as float
	movspd# as float
	movspd2# as float
	moaned as integer
	scared as integer
endtype
type spawns
	spriteID as integer
	oldx# as float
	oldy# as float
	spawnspeed# as float
	negspawnspeed# as float
	myspawnspeed# as float
	oldspeed# as float
	changedir as integer
	tick as integer
	delay as integer
	tilevalue
	tilevalue2
	ammo as integer
	oldammo as integer
	health as integer
	red as integer
	green as integer
	blue as integer
endtype
type platforms
	spriteID as integer
	oldx# as float
	oldy# as float
	platformspeed# as float
endtype
type buttons
	buttonid as integer
	oldx# as float
	oldy# as float
	size# as float
	tilevalue
	tilevalue2
	red as integer
	green as integer
	blue as integer
	readytoselect as integer
	alpha as integer
	role as integer
	set as integer
endtype

type bullets
	bulletid as integer
	deleted as integer
endtype
type players
	id as integer
	x# as float
	y# as float
	jumpspeed as integer
	movespeed# as float
endtype


dim player[3] as players
dim	mysprite[maxsprites] as mysprites
dim	bullet[maxsprites] as bullets
dim baddie[maxsprites] as baddies
dim spawn[maxsprites] as spawns
dim platform[maxsprites] as platforms
dim button[maxbuttons] as buttons
// *********************** Variables for all edit boxes/texts **********************
global jumpspeed=200
global playerpointer=1
global imagebox=1
global repeatbox=2
global gridxbox=3
global gridybox=4
global scalexbox=5
global scaleybox=6
global anglebox=7
global groupbox=9
global redbox=10
global greenbox=11
global bluebox=12
global sizexbox=13
global sizeybox=14
global aibox=15
global scrollbox=16
global seebox=17
global statebox=18
global levelbox=19
global transparencybox=20
global shapebox=21
global phybox=22
global valuebox=23
global delaybox=24
global depthbox=25
global alphabox=26
global frictionbox=27
global canrotbox=28
global restbox=29
global negbox=30
global gametypebox=31
global visibox=32
global value2box=33
global framesbox=34
global speedbox=35
global ammobox=36
global healthbox=37
global gravxbox=38
global gravybox=39
global jumpspeedbox=40
// ********************************************************************************
global 	death				=	0
global 	got					=	0
global 	delay				=	10
global 	spawnpointer			=	0
global 	bulletpointer		=	0
global  targetsprite=0
Global	level				=	1
Global	texturerep			=	1
Global	Quit				=	0
Global	CursorX#			=	0.0
Global	CursorY#			=	0.0
Global	CursorSprite			=	6000
Global	CurrentImage			=	1
Global	SpriteNumber			=	0
global 	spritecounter		=	0
global  bulletindex			=	0
global  grouphit				=	0
global	Sizex#				=	32
global	Sizey#				=	32
global 	speed#				=	-50
global	health				=	0
global	ammo				=	25
global 	negspeed#			=	0
global 	oldspeed#			=	0
global 	olddepth			=	50
global	scalex				=	1
global	scaley				=	1
global	canrotate			=	0
global 	myquit				=	0
global 	v					=	0
global  mypos				=	0
global	red					=	255
global 	green				=	255
global 	blue				=	255
global 	tilevalue			=	0
global  bindex2				=	0
global 	tilevalue2			=	1
global 	tilevalue3			=	0
global 	tilevalue4			=	0
global  dm					=	0
global 	pangle				=	0
global 	tilevalue5			=	0
global 	tilevalue6			=	0
global 	depth				=	50
global 	friction#			=	0.0
global 	host				=	0
global 	client				=	0
global 	spriteselected		=	0
global 	changedir			=	0
global 	restitution#			=	0.0
global 	gridx				=	32
global 	gridy				=	32
global 	angle				=	0
global 	movspd#				=	50
global 	movspd2#			=	50
global 	maxgroups			=	9
global 	max					=	0
global 	max2				=	0
global 	fired				=	0
global 	visibility			=	1
global 	groupnumber			=	0
global 	transparency			=	1
global 	shape				=	2
global 	physicstype			=	1
global	alpha				=	255
global	hide				=	0
global 	scrollx#			=	0
global 	scrolly#			=	0
global	oldx#				=	0
global  vx#					=	0
global  seeingdistance#		=	200
global 	oldy#				=	0
global 	baseboxX#			=	120
global 	baseboxY#			=	1
global boxsizex =38
global boxsizey=20
global 	ygap#				=	27
global 	diff#				=	115
global 	playersprite 		=	0
global 	gametype			=	0
global 	realplayer			=	0
global 	xc#					=	0
global 	spr					=	0
global 	yc#					=	0
global 	hit1				=	0
global 	goingdown			=	0
global 	startx#				=	0
global 	starty#				=	0
global 	group$				=	"Neutral"
global 	playerset			=	0
global 	animframes			=	0
global 	baddiespeed#			=	-50
global 	scrollspeed#			=	1.5
global 	zoom#				=	2.0
global 	score				=	0
global 	m					=	0
global 	isadoor				=	0
global 	aistate				=	0
global 	value2death			=	1
global 	newAngle#			=	0
global 	angle# 				=	0
global 	shipAngle#			=	0
global 	gravx#				=	0
global 	gravy#				=	100
global 	aitype				=	1
global  bindex				=	1
global  bindexd2				=	1
global  scrollspriteright	=	0
global 	scrollspriteleft		=	0
global 	value2key			=	2
global  playergroup			=	1
global 	baddiegroup			=	2
global 	spawngroup			=	7
global 	collectgroup			=	3	
global	teleportergroup		=	6
global  leftdirgroup			=	5
global  rightdirgroup		=	4
global  deathgroup			=	8
global  particlegroup		=	9
global  ppointer				=	0
//**************************************
global  Mouse as TMouse
global  blue_explain$		=	"Changes the Blue component of the sprites colour"
global  green_explain$		=	"Changes the Green component of the sprites colour"
global  player_explain$		=	"Must Have a player group placed in the level!"
global  killjump			=	0
global  pcount=1
global  leftmarkerid=0
global  rightmarkerid=0
global  shipattack=0
global  scrollsprite=0
global  scrolltype=1
global  state=0
global  staticframesprite=9000
global  spritecounter2=0
//
global  walk1framesprite=9001
global  walk2framesprite=9002
global  walk3framesprite=9003
global  walk4framesprite=9004
global  walk5framesprite=9005
global  walk6framesprite=9006
global  walk7framesprite=9007
global  walk8framesprite=9008
//
global  run1framesprite=9009
global  run2framesprite=9010
global  run3framesprite=9011
global  run4framesprite=9012
global  run5framesprite=9013
global  run6framesprite=9014
global  run7framesprite=9015
global  run8framesprite=9016
//
global  swim1framesprite=9017
global  swim2framesprite=9018
global  swim3framesprite=9019
global  swim4framesprite=9020
global  swim5framesprite=9021
global  swim6framesprite=9022
global  swim7framesprite=9023
global  swim8framesprite=9024
//
global  fly1framesprite=9025
global  fly2framesprite=9026
global  fly3framesprite=9027
global  fly4framesprite=9028
global  fly5framesprite=9029
global  fly6framesprite=9030
global  fly7framesprite=9031
global  fly8framesprite=9032
//
global die1framesprite=9033
global die2framesprite=9034
global die3framesprite=9035
global die4framesprite=9036
global die5framesprite=9037
global die6framesprite=9038
global die7framesprite=9039
global die8framesprite=9040
//
global jump1framesprite=9041
global jump2framesprite=9042
global jump3framesprite=9043
global jump4framesprite=9044
global jump5framesprite=9045
global jump6framesprite=9046
global jump7framesprite=9047
global jump8framesprite=9048
global walkpreviewsprite=12
global runpreviewsprite=14
global swimpreviewsprite=15
global flypreviewsprite=16
global diepreviewsprite=17
global jumppreviewsprite=18
global baddiepointer=0
global locatorsprite=11000
global framegap#=32
global framebasex#=90
global framebasey#=10
global doneset=0
global frameanimindex=1
global staticstartframe=1
global walkstartframe=2
global walkendframe=9
global runstartframe=10
global runendframe=17
global swimstartframe=18
global swimendframe=25
global flystartframe=26
global flyendframe=33
global diestartframe=34
global dieendframe=41
global jumpstartframe=42
global jumpendframe=49
global walkanimspeed=25
global runanimspeed=25
global flyanimspeed=25
global dieanimspeed=25
global jumpanimspeed=25
global swimanimspeed=25
global walkanimslot=50
global runanimslot=51
global swimanimslot=52
global flyanimslot=53
global dieanimslot=54
global jumpanimslot=55
global menusprite=8000
load_images()
init()
Repeat
	time$=GetCurrentTime()
	print(""+str(spritecounter2))
	SetTextString(100,time$)
    control()
	if getrawkeyreleased(KEY_Q)
		Quit=1
	endif
	FillMouse(gridx,gridy)
	setspriteposition(CursorSprite,Mouse.x3,Mouse.y3)
	print(str(mouse.x3))
	print(str(mouse.y3))
	settextposition(229,getpointerx()-len(group$),getpointery()-64)
	settextcolor(229,random2(0,255),random2(0,255),random2(0,255),255)
	jx#=GetVirtualJoystickX(2)
	jy#=GetVirtualJoystickY(2)
	if jx#<0
		scrollx#=scrollx#-scrollspeed#
	endif
	if jx#>0
		scrollx#=scrollx#+scrollspeed#
	endif
	if jy#<0
		scrolly#=scrolly#-scrollspeed#
	endif
	if jy#>0
		scrolly#=scrolly#+scrollspeed#
	endif
	setviewoffset(scrollx#,scrolly#)	
	setviewzoom(zoom#)
    Sync()
Until Quit=1
function init()
	setclearcolor(0,0,160)
	clearscreen()

	createsprite(menusprite,55)
	setspritesize(menusprite,800,250)
	
	setspriteposition(menusprite,0,0)
	setspritedepth(menusprite,0)
	FixSpriteToScreen(menusprite,1)
	createsprite(CursorSprite,CurrentImage)
	SetSpriteSize(CursorSprite,Sizex#,Sizey#)
	SetSpriteDepth (cursorsprite,0 )
	createmyeditbox(imagebox,baseboxX#,baseboxY#,2,255,0,0,28,boxsizex,boxsizey,255,""+str(currentimage),1)
	createmyeditbox(repeatbox,baseboxX#,baseboxY#+ygap#,2,255,0,0,30,boxsizex,boxsizey,255,"1",1): // Texturerep
	createmyeditbox(gridxbox,baseboxX#,baseboxY#+ygap#*2,2,255,0,0,30,boxsizex,boxsizey,255,"32",1): // GridX
	createmyeditbox(gridybox,baseboxX#,baseboxY#+ygap#*3,2,255,0,0,30,boxsizex,boxsizey,255,"32",1): // GridY
	createmyeditbox(scalexbox,baseboxX#,baseboxY#+ygap#*4,2,255,0,0,30,boxsizex,boxsizey,255,"1",1): // ScaleX
	createmyeditbox(scaleybox,baseboxX#,baseboxY#+ygap#*5,2,255,0,0,30,boxsizex,boxsizey,255,"1",1): // ScaleY
	//
	createmyeditbox(anglebox,baseboxX#*2.3,baseboxY#,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) : // Angle
	createmyeditbox(value2box,baseboxX#*2.3,baseboxY#+ygap#,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) : // value2

	//createmyeditbox(8,baseboxX#*2.3,baseboxY#+ygap#,2,255,0,0,30,26,16,255,""+str(CurrentImage),1): // CurrentImage  
	createmyeditbox(groupbox,baseboxX#*2.3,baseboxY#+ygap#*2,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) //groupnumber
	createmyeditbox(redbox,baseboxX#*2.3,baseboxY#+ygap#*3,2,255,0,0,24,boxsizex,boxsizey,255,"255",1) // red
	createmyeditbox(greenbox,baseboxX#*2.3,baseboxY#+ygap#*4,2,255,0,0,28,boxsizex,boxsizey,255,"255",1) // green
	createmyeditbox(bluebox,baseboxX#*2.3,baseboxY#+ygap#*5,2,255,0,0,28,boxsizex,boxsizey,255,"255",1) // blue
	//
	createmyeditbox(sizexbox,baseboxX#*3.6,baseboxY#,2,255,0,0,30,boxsizex,boxsizey,255,"32",1) // sizeX#
	createmyeditbox(sizeybox,baseboxX#*3.6,baseboxY#+ygap#,2,255,0,0,30,boxsizex,boxsizey,255,"34",1) // sizeY#
	createmyeditbox(levelbox,baseboxX#*3.6,baseboxY#+ygap#*2,2,255,0,0,30,boxsizex,boxsizey,255,""+str(level),1)
	createmyeditbox(transparencybox,baseboxX#*3.6,baseboxY#+ygap#*3,2,255,0,0,30,boxsizex,boxsizey,255,"1",1) // transparency
	createmyeditbox(shapebox,baseboxX#*3.6,baseboxY#+ygap#*4,2,255,0,0,30,boxsizex,boxsizey,255,"2",1) // shape
	createmyeditbox(phybox,baseboxX#*3.6,baseboxY#+ygap#*5,2,255,0,0,30,boxsizex,boxsizey,255,"1",1) // physicstype
	//
	createmyeditbox(valuebox,baseboxX#*5.1,baseboxY#,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) // tilevalue
	createmyeditbox(depthbox,baseboxX#*5.1,baseboxY#+ygap#,2,255,0,0,30,boxsizex,boxsizey,255,""+str(depth),1) //depth
	createmyeditbox(alphabox,baseboxX#*5.1,baseboxY#+ygap#*2,2,255,0,0,30,boxsizex,boxsizey,255,"255",1) //alpha
	createmyeditbox(frictionbox,baseboxX#*5.1,baseboxY#+ygap#*3,2,255,0,0,28,boxsizex,boxsizey,255,"0.0",1) //friction#
	createmyeditbox(delaybox,baseboxX#*5.1,baseboxY#+ygap#*4,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) //canrotate
	createmyeditbox(restbox,baseboxX#*5.1,baseboxY#+ygap#*5,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) //restitution#
	createmyeditbox(canrotbox,baseboxX#*5.1,baseboxY#+ygap#*4,2,255,0,0,30,boxsizex,boxsizey,255,"1",1) 
	createmyeditbox(negbox,baseboxX#*6.4,baseboxY#,2,255,0,0,30,boxsizex,boxsizey,255,"0",1)
	createmyeditbox(gametypebox,baseboxX#*6.4,baseboxY#+ygap#*3,2,255,0,0,30,boxsizex,boxsizey,255,"0",1)
	createmyeditbox(visibox,baseboxX#*6.4,baseboxY#+ygap#*2,2,255,0,0,30,boxsizex,boxsizey,255,"1",1)
	createmyeditbox(framesbox,baseboxX#*6.4,baseboxY#+ygap#,2,255,0,0,30,boxsizex,boxsizey,255,"0",1)
	
	createmyeditbox(aibox,baseboxX#*5.1,baseboxY#+ygap#*6,2,255,0,0,30,boxsizex,boxsizey,255,""+str(aitype),1) //A.I type
//	createmyeditbox(aibox,baseboxX#*6.4,baseboxY#+ygap#*5,2,255,0,0,30,26,16,255,"0",1) //A.I
	createmyeditbox(scrollbox,baseboxX#*6.4,baseboxY#+ygap#*6,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) //scrolltype
	createmyeditbox(seebox,baseboxX#*6.4,baseboxY#+ygap#*7,2,255,0,0,30,boxsizex,boxsizey,255,"200",1) //seebox
	createmyeditbox(statebox,baseboxX#*6.4,baseboxY#+ygap#*5,2,255,0,0,30,boxsizex,boxsizey,255,"0",1) //statebox
	createmyeditbox(speedbox,baseboxX#*6.4,baseboxY#+ygap#*4,2,255,0,0,30,boxsizex,boxsizey,255,"0",1)
	createmyeditbox(ammobox,baseboxX#,baseboxY#+ygap#*6,2,255,0,0,30,boxsizex,boxsizey,255,str(ammo),1)
	createmyeditbox(healthbox,baseboxX#*2.3,baseboxY#+ygap#*6,2,255,0,0,30,boxsizex,boxsizey,255,""+str(health),1)
	createmyeditbox(jumpspeedbox,baseboxX#*2.3,baseboxY#+ygap#*7,2,255,0,0,30,boxsizex,boxsizey,255,""+str(jumpspeed),1)

	createmyeditbox(delaybox,baseboxX#*3.6,baseboxY#+ygap#*6,2,255,0,0,30,boxsizex,boxsizey,255,str(delay),1)
	createmyeditbox(gravxbox,baseboxX#,baseboxY#+ygap#*7,2,255,0,0,30,boxsizex,boxsizey,255,str(gravx#),1)
	createmyeditbox(gravybox,baseboxX#,baseboxY#+ygap#*8,2,255,0,0,30,boxsizex,boxsizey,255,str(gravy#),1)
	//***************************************************************************************
	createmytext(0,imagebox,baseboxX#-diff#+5,baseboxY#-6,25,255,0,0,"Image",0)
	createmytext(0,repeatbox,baseboxX#-diff#+5,baseboxY#-6+ygap#,25,255,0,0,"Repeat",0)
	createmytext(0,gridxbox,baseboxX#-diff#+5,baseboxY#-6+ygap#*2,25,255,0,0,"GridX",0)
	createmytext(0,gridybox,baseboxX#-diff#+5,baseboxY#-6+ygap#*3,25,255,0,0,"GridY",0)
	createmytext(0,scalexbox,baseboxX#-diff#+5,baseboxY#-6+ygap#*4,25,255,0,0,"ScaleX",0)
	createmytext(0,scaleybox,baseboxX#-diff#+5,baseboxY#-6+ygap#*5,25,255,0,0,"ScaleY",0)
	//
	createmytext(0,anglebox,baseboxX#*2.4-diff#,baseboxy#-6,25,255,0,0,"Angle",0)
	createmytext(0,value2box,baseboxX#*2.4-diff#,baseboxy#-6+ygap#,25,255,0,0,"Value2",0)
	createmytext(0,groupbox,baseboxX#*2.4-diff#,baseboxY#-6+ygap#*2,25,255,0,0,"Group",0)
	createmytext(0,redbox,baseboxX#*2.4-diff#,baseboxY#-6+ygap#*3,25,255,0,0,"Red",0)
	createmytext(0,greenbox,baseboxX#*2.4-diff#,baseboxY#-6+ygap#*4,25,255,0,0,"Green",0)
	createmytext(0,bluebox,baseboxX#*2.4-diff#,baseboxY#-6+ygap#*5,25,255,0,0,"Blue",0)
	//
	createmytext(0,sizexbox,baseboxX#*3.7-diff#,baseboxY#-6,25,255,0,0,"SizeX#",0)
	createmytext(0,sizeybox,baseboxX#*3.7-diff#,baseboxY#-6+ygap#,25,255,0,0,"SizeY#",0)
	createmytext(0,levelbox,baseboxX#*3.7-diff#,baseboxY#-6+ygap#*2,25,255,0,0,"Level",0)
	createmytext(0,transparencybox,baseboxX#*3.7-diff#,baseboxY#-6+ygap#*3,25,255,0,0,"Transp",0)
	createmytext(0,shapebox,baseboxX#*3.7-diff#,baseboxY#-6+ygap#*4,25,255,0,0,"Shape",0)
	createmytext(0,phybox,baseboxX#*3.7-diff#,baseboxY#-6+ygap#*5,25,255,0,0,"Phyics",0)
	createmytext(0,valuebox,baseboxX#*5.0-diff#,baseboxY#-6,25,255,0,0,"Value",0)
	createmytext(0,delaybox,baseboxX#*3.7-diff#,baseboxY#-6+ygap#*6,25,255,0,0,"Delay",0)
	createmytext(0,aibox,baseboxX#*5.0-diff#,baseboxY#-6+ygap#*6,25,255,0,0,"AI-Type",0)
	createmytext(0,depthbox,baseboxX#*5.0-diff#,baseboxY#-6+ygap#,25,255,0,0,"Depth",0)
	createmytext(0,alphabox,baseboxX#*5.0-diff#,baseboxY#-6+ygap#*2,25,255,0,0,"Alpha",0)
	createmytext(0,frictionbox,baseboxX#*5.0-diff#,baseboxY#-6+ygap#*3,25,255,0,0,"Frict#",0)
	createmytext(0,canrotbox,baseboxX#*5.0-diff#,baseboxY#-6+ygap#*4,25,255,0,0,"Canrot",0)
	createmytext(0,restbox,baseboxX#*5.0-diff#,baseboxY#-6+ygap#*5,25,255,0,0,"Rest#",0)
	createmytext(0,negbox,baseboxX#*6.5-diff#-5,baseboxY#-6,25,255,0,0,"NegSpd",0)
	createmytext(0,gametypebox,baseboxX#*6.5-diff#-5,baseboxY#-6+ygap#*3,25,255,0,0,"GameT",0)
	createmytext(0,visibox,baseboxX#*6.5-diff#-5,baseboxY#-6+ygap#*2,25,255,0,0,"Visi",0)
	createmytext(0,framesbox,baseboxX#*6.5-diff#-5,baseboxY#-6+ygap#,25,255,0,0,"Frames",0)
	createmytext(0,speedbox,baseboxX#*6.5-diff#-5,baseboxY#-6+ygap#*4,25,255,0,0,"Speed",0)
	createmytext(0,ammobox,baseboxX#-diff#+5,baseboxY#-6+ygap#*6,25,255,0,0,"Ammo",0)
	createmytext(0,healthbox,baseboxX#*2.4-diff#,baseboxY#-6+ygap#*6,25,255,0,0,"Health",0)
	createmytext(0,jumpspeedbox,baseboxX#*2.4-diff#,baseboxY#-6+ygap#*7,25,255,0,0,"JumpS",0)
	createmytext(0,gravxbox,baseboxX#-diff#+5,baseboxY#-6+ygap#*7,25,255,0,0,"Gravx#",0)
	createmytext(0,gravybox,baseboxX#-diff#+5,baseboxY#-6+ygap#*8,25,255,0,0,"Gravy#",0)
	createmytext(0,scrollbox,baseboxX#*6.5-diff#,baseboxY#-6+ygap#*6,25,255,0,0,"Scroll",0)
	createmytext(0,seebox,baseboxX#*6.2-diff#,baseboxY#-6+ygap#*7,25,255,0,0,"seedist#",0)
	createmytext(0,statebox,baseboxX#*6.5-diff#,baseboxY#-6+ygap#*5,25,255,0,0,"State",0)
	createmytext(0,229,getpointerx(),getpointery(),25,255,0,0,group$+ " Group ",0)	
	createmytext(0,230,baseboxX#-diff#+5,baseboxY#-6+ygap#*22,25,255,0,0,""+str(zoom#),0)
	time$=GetCurrentTime()
	createmytext(0,100,2,500,25,200,255,255,""+time$,0)
	playsound(2)
	AddVirtualJoystick(2,92,470,100)
	addvirtualjoystick (1,400,470,100)
	//SetSpriteShader(
endfunction
function control()
	read_boxes()
	if getrawkeypressed(KEY_D)
			dm=dm+1
			if dm>1
				dm=0
			endif
			select dm
				case 0
					SetPhysicsDebugOff()
				endcase
				case 1
					SetPhysicsDebugOn()
				endcase
			endselect
		endif
	w#= GetRawMouseWheelDelta()
	if w#<0
		zoom#=zoom#+0.1
		settextstring(230,""+str(zoom#))
	endif
	if w#>0
		zoom#=zoom#-0.1
		settextstring(230,""+str(zoom#))
	endif
	if GetRawMouseMiddlepressed()
		
	endif
	m#= GetRawMouseMiddleReleased() 
	if getrawkeypressed(KEY_V) or m#<>0
		SetSpriteDepth (cursorsprite, 2000 )
		sprite2 = GetSpriteHit ( mouse.x2#, mouse.y2#)
		if sprite2<>cursorsprite
			for n=1 to maxsprites
				if sprite2=mysprite[n].spritenumber
					SetSpriteImage(CursorSprite,mysprite[n].imagenumber)
					setspritesize(CursorSprite,mysprite[n].sizex#,mysprite[n].sizey#)
					setspritescale(CursorSprite,mysprite[n].scalex,mysprite[n].scaley)
					angle=mysprite[n].angle
					canrotate=mysprite[n].canrotate
					blue=mysprite[n].blue
					red=mysprite[n].red
					green=mysprite[n].green
					sizex#=mysprite[n].sizex#
					sizey#=mysprite[n].sizey#
					scalex=mysprite[n].scalex
					jumpspeed=mysprite[n].jumpspeed
					scaley=mysprite[n].scaley
					groupnumber=mysprite[n].groupnumber
					pcount=mysprite[n].pcount
					texturerep=mysprite[n].texturerep
					depth=mysprite[n].depth
					friction#=mysprite[n].friction#
					seeingdistance#=mysprite[n].seeingdistance#
					restitution#=mysprite[n].restitution#
					canrotate=mysprite[n].canrotate
					shape=mysprite[n].shape
					physicstype=mysprite[n].physicstype
					visibility=mysprite[n].visibility
					transparency=mysprite[n].transparency
					CurrentImage=mysprite[n].imagenumber
					tilevalue=mysprite[n].tilevalue
					tilevalue2=mysprite[n].tilevalue2
					tilevalue3=mysprite[n].tilevalue3
					tilevalue4=mysprite[n].tilevalue4
					tilevalue5=mysprite[n].tilevalue5
					tilevalue6=mysprite[n].tilevalue6
					alpha=mysprite[n].alpha
					animframes=mysprite[n].animframes
					speed#=mysprite[n].speed#
					negspeed#=mysprite[n].negspeed#
					ammo=mysprite[n].ammo
					health=mysprite[n].health
					delay=mysprite[n].delay
					aitype=mysprite[n].aitype
					state=mysprite[n].state
					pcount=mysprite[n].pcount
					seteditboxtext(anglebox,str(angle))
					seteditboxtext(sizexbox,str(sizex#))
					seteditboxtext(sizeybox,str(sizey#))
					seteditboxtext(scalexbox,str(scalex))
					seteditboxtext(scaleybox,str(scaley))
					seteditboxtext(restbox,str(restitution#))
					seteditboxtext(frictionbox,str(friction#))
					seteditboxtext(speedbox,str(speed#))
					seteditboxtext(negbox,str(negspeed#))
					seteditboxtext(imagebox,str(CurrentImage))
					seteditboxtext(transparencybox,str(transparency))
					seteditboxtext(visibox,str(visibility))
					seteditboxtext(phybox,str(physicstype))
					seteditboxtext(shapebox,str(shape))
					seteditboxtext(anglebox,str(angle))
					seteditboxtext(depthbox,str(depth))
					seteditboxtext(valuebox,str(tilevalue))
					seteditboxtext(value2box,str(tilevalue2))
					seteditboxtext(canrotbox,str(canrotate))
					seteditboxtext(redbox,str(red))
					seteditboxtext(greenbox,str(green))
					seteditboxtext(bluebox,str(blue))
					seteditboxtext(repeatbox,str(texturerep))
					seteditboxtext(alphabox,str(alpha))
					seteditboxtext(framesbox,str(animframes))
					seteditboxtext(ammobox,str(ammo))
					seteditboxtext(healthbox,str(health))
					seteditboxtext(delaybox,str(delay))
					seteditboxtext(aibox,str(aitype))
					seteditboxtext(seebox,str(seeingdistance#))
					seteditboxtext(statebox,str(state))
					seteditboxtext(jumpspeedbox,str(jumpspeed))
					change_group_text()
					setspritecolor(cursorsprite,red,green,blue,255)
					PlaySound(1)
					exit
				endif
			next n
		endif
	endif
	if getpointerpressed()
		SetSpriteDepth (cursorsprite, 2000 )
	endif
	If GetPointerreleased() and spritecounter<maxsprites
		if m=0
			SetSpriteDepth (cursorsprite, 0 )
		endif
		for n=1 to maxsprites
			if mysprite[n].deleted<>0
				found=1
				mysprite[n].deleted=0	
				myfoundspritepos=n
				found=1
				exit
			endif
		next
		newsprite=createsprite(CurrentImage)
		//setspriteoffset(myfoundsprite,0,0)
		setspritecolor(newsprite,red,green,blue,255)
		SetObjectTransparency(newsprite,transparency)
		SetSpriteSize(newsprite,Sizex#,Sizey#)
		SetSpriteScale(newsprite,scalex,scaley)
		select shape
			case 2
				setspriteshape(newsprite,shape)
			endcase
			case 1
				setspriteshape(newsprite,shape)
			endcase
			case 3
				SetSpriteShapecircle(newsprite,getspritex(newsprite),getspritey(newsprite),15)
			endcase
		endselect
		setspriteposition(newsprite,Mouse.x3,Mouse.y3)
		setspritedepth(newsprite,depth)
		SetSpriteAngle(newsprite,angle)
		if found=0
			inc spritecounter2
			inc spritecounter
			setvalues(spritecounter,newsprite)
		endif
		if found=1
			inc spritecounter2
			setvalues(myfoundspritepos,newsprite)
		endif
		checkrepeat(newsprite,texturerep,scalex,scaley)
		if groupnumber=particlegroup
			//Create_P(pcount,Mouse.x3,Mouse.y3,7,5,15,7,3,90,8)
			inc pcount
		endif
		elseif spritecounter2>=maxsprites
			my_system_message(200,10,200,20,255,0,0,255,0,"All Sprites used up!")	
	endif
	if getrawkeypressed(KEY_A) 
		if host>0
		Animation_Editor(currentimage,host)
		else
			my_system_message(200,300,550,30,255,0,0,255,0,"Select one Sprite first!")
		endif
	endif
	if getrawkeypressed(KEY_F1) 
		load_level(level)
		my_system_message(200,300,550,30,255,0,0,255,0,"Level Loaded!")
		//my_system_message(200,10,200,20,255,0,0,255,0,"Level Loaded!")
	endif	
	if getrawkeypressed(KEY_F4)
		save_level(level,1)
		my_system_message(200,300,550,30,255,0,0,255,0,"Level Saved!")
	endif
	m=GetRawMouseRightPressed()
	r=GetRawMouseRightReleased()
	if r
		SetSpriteDepth (cursorsprite, 0 )
	endif
	if m>0
		SetSpriteDepth (cursorsprite, 200 )
		sprite = GetSpriteHit ( mouse.x2#, mouse.y2#)
		if sprite<>cursorsprite and sprite<>menusprite
			for n = 1 to maxsprites
				if sprite=mysprite[n].spritenumber
					if mysprite[n].selected=0
						setspritecolor(sprite,255,0,0,240)
						mysprite[n].selected=1
						inc spriteselected
						if spriteselected=1
							host=Sprite
						endif
						if spriteselected=2
							client=Sprite
						endif
						elseif mysprite[n].selected=1
							setspritecolor(sprite,mysprite[n].red,mysprite[n].blue,mysprite[n].green,255)
							mysprite[n].selected=0
							dec spriteselected
					endif
					if spriteselected=0
						host=0
					endif
					exit
				endif
			next n
		endif
	endif
	if getrawkeypressed(KEY_J) and host>0 and client>0
		choosecolor(random(10,205),random2(10,205),random2(10,205))
		mysprite[host].selected=0
		mysprite[client].selected=0
		mysprite[host].host=host
		mysprite[host].client=client
		mysprite[client].caller=host
		
		spriteselected=0
		host=0
		client=0
	endif	
	if getrawkeypressed(KEY_DELETE)
		for n=1 to maxsprites
			if mysprite[n].selected = 1
				if mysprite[n].pcount>0
					deleteparticles(mysprite[n].pcount)
				endif
				deletesprite(mysprite[n].spritenumber)
				dec spritecounter2
				mysprite[n].selected=0
				mysprite[n].deleted=1
				reset_value(n)
				dec spriteselected
				sprite=0
			endif
		next n
	endif
	if getrawkeypressed(KEY_C)
		clear_level()
		
	endif
	if getrawkeyreleased(KEY_H)
		inc hide
		if hide>1
			hide=0
		endif
		select hide
			case 0
				show_all()
			endcase
			case 1
				hide_all()
			endcase
		endselect
	endif
//change Image number
	if getrawkeypressed(KEY_Z)
		dec CurrentImage
		setspriteimage(cursorsprite,CurrentImage)
		checkrepeat(cursorsprite,texturerep,scalex,scaley)
		seteditboxtext(imagebox,str(currentimage))
	endif
	if getrawkeypressed(KEY_X)
		inc CurrentImage
		setspriteimage(cursorsprite,CurrentImage)
		checkrepeat(cursorsprite,texturerep,scalex,scaley)
		seteditboxtext(imagebox,str(currentimage))
	endif
//*************************
// scaling the sprite using arrow keys
	If getrawkeypressed(KEY_RIGHT)
		scalex=scalex+1
		seteditboxtext(scalexbox,str(scalex))
		setspritescale(cursorsprite,scalex,scaley)
		checkrepeat(cursorsprite,texturerep,scalex,scaley)
	endif
	if GetRawKeyPressed(KEY_LEFT) and scalex>1
		dec scalex
		seteditboxtext(scalexbox,str(scalex))
		setspritescale(cursorsprite,scalex,scaley)
		checkrepeat(cursorsprite,texturerep,scalex,scaley)
	endif
	if GetRawKeyPressed(KEY_DOWN)
		inc scaley
		seteditboxtext(scaleybox,str(scaley))
		SetSpriteScale(cursorsprite,scalex,scaley)
		checkrepeat(cursorsprite,texturerep,scalex,scaley)
	endif
	if GetRawKeyPressed(KEY_UP) and scaley>1
		dec scaley
		seteditboxtext(scaleybox,str(scaley))
		SetSpriteScale(cursorsprite,scalex,scaley)
		checkrepeat(cursorsprite,texturerep,scalex,scaley)
	endif
// *****************************
// Test the level
	if getrawkeypressed(KEY_T)
		if playerset=1 // check if player has been set
		//Test_Level()
		Run_Level()
		else
			createmytext(2,400,baseboxX#*2.7-diff#,530,15,255,0,0,""+player_explain$,0)
			createmytext(1,700,baseboxX#*3.7-diff#,550,15,255,0,0,"Player Not Set!",0)
		endif
	endif
//**********************
// loop through/change group
	if getrawkeypressed(KEY_G)
		inc groupnumber
		if groupnumber>maxgroups
			groupnumber=0
		endif
		change_group_text()
		seteditboxtext(groupbox,str(groupnumber))
	endif
//*****************************	
	
endfunction
function createmyeditbox(number,x#,y#,bordersize#,r,g,b,backcolor,bsizex#,bsizey#,alpha,box$,v)
	createeditbox(number)
	SetEditBoxBorderSize(number,bordersize#)
	SetEditBoxTextColor(number,r,g,b)
	SetEditBoxBorderColor(number,r,g,b,alpha)
	SetEditBoxBackgroundColor( number, 0, 0, 0, alpha )
	seteditboxsize(number,bsizex#,bsizey#)
	SetEditBoxPosition(number,x#,y#)
	FixEditBoxToScreen(number,1)
	seteditboxdepth(number,0)
	SetEditBoxText(number,box$)
	seteditboxvisible(number,v)
endfunction
function createmytext(m,number,x#,y#,size,r,g,b,mystring$,depth)
	select m
		case 0
			createtext(number,mystring$)
			settextsize(number,size)
			settextcolor(number,r,b,g,255)
			SetTextPosition(number,x#,y#)
			FixTextToScreen(number,1)
			settextdepth(number,depth)
		endcase
		case 1
			createtext(number,mystring$)
			settextsize(number,size)
			settextcolor(number,r,b,g,255)
			SetTextPosition(number,x#,y#)
			FixTextToScreen(number,1)
			settextdepth(number,depth)
			createmytext(0,600,baseboxX#*3.0-diff#+5,baseboxY#*16,25,255,0,0,"Press E to exit error!",0)
			repeat
			if getrawkeypressed(KEY_E)
			quit=1
			endif
			settextcolor(number,random2(0,255),random2(0,255),random2(0,255),255)
			if gettextexists(400)
			settextcolor(400,random2(0,255),random2(0,255),random2(0,255),255)
			endif
			sync()
			until quit=1
			deletetext(number)
			deletetext(600)
			deletetext(400)
			quit=0
		endcase
		case 2
			createtext(number,mystring$)
			settextsize(number,size)
			settextcolor(number,r,b,g,255)
			SetTextPosition(number,x#,y#)
			FixTextToScreen(number,1)
			settextdepth(number,depth)
		endcase
	endselect
endfunction
function make_my_button(index,x,y,size,text$,br,bg,bb,al)
	AddVirtualButton( index, x, y, size )
	setvirtualbuttontext(index,text$)
	SetVirtualButtonColor(index,br,bg,bb)
	SetVirtualButtonAlpha(index,al)
	SetVirtualButtonVisible(index,1)
endfunction
function load_images()
	for n=1 to 1000
		f$=str(n) + ".png"
		if getfileexists(f$)
			loadimage (n,f$)
		    SetImageWrapU(n,1)
			SetImageWrapV(n,1)
		endif
	next
endfunction
function hide_all()
	for n=1 to 100
		if GetEditBoxExists(n)
			SetEditBoxVisible(n,0)
		endif
		if gettextexists(n)
			settextvisible(n,0)
		endif
		if GetVirtualButtonExists(n)
			SetVirtualButtonVisible(n,0)
		endif
	next n
	SetSpriteVisible(500,0)
	SetSpriteVisible(menusprite,0)
	setspriteposition(menusprite,-10000000,-1000000)
endfunction
function show_all()
	for n=1 to 100
		if GetEditBoxExists(n)
			SetEditBoxVisible(n,1)
		endif
		if gettextexists(n)
			settextvisible(n,1)
		endif
		if GetVirtualButtonExists(n)
			SetVirtualButtonVisible(n,1)
		endif
	next n
	setspritevisible(500,1)
	setspritevisible(menusprite,1)
	setspriteposition(menusprite,0,0)
endfunction
function read_boxes()
	if getrawkeypressed(KEY_ENTER)
		focus=GetCurrentEditBox()
		select focus
			case aibox
				t$=geteditboxtext(aibox)
				aitype=val(t$)
			endcase
			case jumpspeedbox
				t$=geteditboxtext(jumpspeedbox)
				jumpspeed=val(t$)
			endcase
			case imagebox
				t$=geteditboxtext(imagebox)
				t=val(t$)
				currentimage=t
				setspriteimage(cursorsprite,t)
			endcase
			case repeatbox
				t$=GetEditBoxText(repeatbox)
				t=val(t$)
				if t<0 or t>1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 or 1 Only!",0)
					temp$=str(texturerep)
					corr$=left(temp$,1)
					seteditboxtext(repeatbox,""+str(texturerep))
					else
					texturerep=t
					checkrepeat(cursorsprite,texturerep,scalex,scaley)
				endif
			endcase
			case gridxbox
				t$=GetEditBoxText(gridxbox)
				t=val(t$)
				if t<0
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 or greater Only!",0)
					temp$=str(gridx)
					corr$=left(temp$,2)		
					seteditboxtext(gridxbox,""+str(gridx))
					else
					gridx=t
				endif
			endcase
			case gridybox
				t$=GetEditBoxText(gridybox)
				t=val(t$)
				if t<0 
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 or greater Only!",0)
					temp$=str(gridy)
					corr$=left(temp$,2)
					seteditboxtext(gridybox,""+str(gridy))
					else
					gridy=t
				endif
			endcase
			case scalexbox
				t$=GetEditBoxText(scalexbox)
				t=val(t$)
				if t<1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 1 or greater Only!",0)
					temp$=str(scalex)
					corr$=left(temp$,2)
					seteditboxtext(scalexbox,""+str(scalex))
					else
					scalex=t
					SetSpriteScale(CursorSprite,scalex,scaley)
					checkrepeat(cursorsprite,texturerep,scalex,scaley)
				endif
			endcase
			case scaleybox
				t$=GetEditBoxText(scaleybox)
				t=val(t$)
				if t<1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 1 or greater Only!",0)
					temp$=str(scaley)
					corr$=left(temp$,2)
					seteditboxtext(scaleybox,""+str(scaley))
					else
					scaley=t
					SetSpriteScale(CursorSprite,scalex,scaley)
					checkrepeat(cursorsprite,texturerep,scalex,scaley)
				endif
			endcase
			case anglebox
				t$=GetEditBoxText(anglebox)
				t=val(t$)
				if t>360
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values up to 360 Only!",0)
					seteditboxtext(anglebox,""+str(angle))
					else
					angle=t
					setspriteangle(cursorsprite,angle)
				endif
			endcase
			case imagebox
				t$=GetEditBoxText(imagebox)
				t=val(t$)
				CurrentImage=t
				setspriteimage(cursorsprite,CurrentImage)				
			endcase
			case groupbox
				t$=GetEditBoxText(groupbox)
				t=val(t$)
				oldt=t
				if t<0 or t>MAXGROUPS
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 - "+str(maxgroups)+" Only!",0)
					seteditboxtext(groupbox,""+str(groupnumber))
				else
				groupnumber=t
				change_group_text()
				endif
			endcase	
			case redbox
				t$=GetEditBoxText(redbox)
				t=val(t$)
				if t<0 or t>255
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 - 255 Only!",0)
					seteditboxtext(redbox,""+str(red))
				else
				red=t
				setspritecolor(cursorsprite,red,green,blue,255)
				endif
			endcase
			case greenbox
				t$=GetEditBoxText(greenbox)
				t=val(t$)
				if t<0 or t>255
					createmytext(2,400,baseboxX#*3.7-diff#,530,15,255,0,0,""+green_explain$,0)
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 - 255 Only!",0)
					seteditboxtext(greenbox,""+str(green))
				else
				green=t
				setspritecolor(cursorsprite,red,green,blue,255)
				endif
			endcase
			case bluebox
				t$=GetEditBoxText(bluebox)
				t=val(t$)
				if t<0 or t>255
					createmytext(2,400,baseboxX#*3.7-diff#,530,15,255,0,0,""+blue_explain$,0)
					createmytext(1,301,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 - 255 Only!",0)
					seteditboxtext(bluebox,""+str(blue))
				else
				blue=t
				setspritecolor(cursorsprite,red,green,blue,255)
				endif
			endcase
			case sizexbox
				t$=GetEditBoxText(sizexbox)
				t#=valfloat(t$)
				if t#<1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 1 or greater Only!",0)
					temp$=str(sizex#)
					corr$=left(temp$,2)
					seteditboxtext(sizexbox,""+corr$)
				else
				sizex#=t#
				setspritesize(cursorsprite,sizex#,sizey#)
				SetSpriteScale(CursorSprite,scalex,scaley)
				endif
			endcase
			case sizeybox
				t$=GetEditBoxText(sizeybox)
				t#=valfloat(t$)
				if t#<1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 1 or greater Only!",0)
					temp$=str(sizey#)
					corr$=left(temp$,2)
					seteditboxtext(sizeybox,""+corr$)
				else
				sizey#=t#
				setspritesize(cursorsprite,sizex#,sizey#)
				SetSpriteScale(CursorSprite,scalex,scaley)
				endif
			endcase	
			case levelbox
				t$=GetEditBoxText(Levelbox)
				t=val(t$)
				if t<1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 1 or greater Only!",0)
					seteditboxtext(levelbox,""+str(level))
				else
				level=t
				endif	
			endcase
			case transparencybox
				t$=GetEditBoxText(transparencybox)
				t=val(t$)
				if t<0 or t>1
					createmytext(1,300,baseboxX#-diff#,550,15,255,0,0,"Values 0(no Transparency) - 1(Alpha Transparency) - 2(Additive Blending) Only!",0)
					seteditboxtext(transparencybox,""+str(transparency))
					else
					transparency=t
					SetSpriteTransparency(cursorsprite,transparency)
				endif
			endcase	
			case shapebox
				t$=GetEditBoxText(shapebox)
				t=val(t$)
				if t<0 or t>3
					createmytext(1,300,baseboxX#,550,15,255,0,0,"Values 0 (non) - 1 (circle) - 2(square) - 3(polygon) Only!",0)
					seteditboxtext(shapebox,""+str(shape))
					exit
				else
				shape=t
				update2D(0)
				endif
			endcase	
			case phybox
				t$=GetEditBoxText(phybox)
				t=val(t$)
				if t<0 or t>3
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 - 3 Only!",0)
					seteditboxtext(phybox,""+str(physicstype))	
				else
				physicstype=t
				endif
			endcase	
			case valuebox
				t$=GetEditBoxText(valuebox)
				t=val(t$)
				tilevalue=t
			endcase	
			case depthbox
				t$=GetEditBoxText(depthbox)
				t=val(t$)
				depth=t
			endcase
			case alphabox
				t$=geteditboxtext(alphabox)
				t=val(t$)
				if t<0 or t>255
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 to 255 Only!",0)
					temp$=str(alpha)
					corr$=left(temp$,3)
					seteditboxtext(alphabox,""+str(alpha))
					else
					alpha=t
				endif
			endcase	
			case frictionbox
				t$=geteditboxtext(frictionbox)
				t#=valfloat(t$)
				if t#<0
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 or greater Only!",0)
					temp$=str(friction#)
					corr$=left(temp$,2)
					seteditboxtext(frictionbox,""+corr$)	
				else
				friction#=t#
				endif
			endcase
			case canrotbox
				t$=geteditboxtext(canrotbox)
				t=val(t$)
				if t<0 or t>1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 or 1 Only!",0)
					temp$=str(canrotate)
					corr$=left(temp$,1)
					seteditboxtext(canrotbox,""+str(canrotate))
				else
				canrotate=t
				endif
			endcase
			case restbox
				t$=geteditboxtext(restbox)
				t#=valfloat(t$)
				restitution#=t#	
			endcase
			case value2box
				t$=geteditboxtext(26)
				t=val(t$)
				tilevalue2=t
			endcase	
			case gametypebox
				t$=geteditboxtext(gametypebox)
				t=val(t$)
				gametype=t
			endcase
			case visibox
				t$=geteditboxtext(visibox)
				t=val(t$)
				if t<0 or t>1
					createmytext(1,300,baseboxX#*3.7-diff#,550,15,255,0,0,"Values 0 or 1 Only!",0)
					temp$=str(visibility)
					corr$=left(temp$,1)
					//seteditboxtext(visiblebox,""+str(visibility))
					else
					visibility=t
				endif
			endcase	
			case speedbox
				t$=geteditboxtext(speedbox)
				speed#=valfloat(t$)
			endcase	
			case negbox
				t$=geteditboxtext(negbox)
				negspeed#=valfloat(t$)
			endcase	
			case ammobox
				t$=geteditboxtext(ammobox)
				ammo=val(t$)
			endcase	
			case healthbox
				t$=geteditboxtext(healthbox)
				health=val(t$)
			endcase	
			case delaybox
				t$=geteditboxtext(delaybox)
				delay=val(t$)
			endcase	
			case gravxbox
				t$=geteditboxtext(gravxbox)
				gravx#=valfloat(t$)			
			endcase
			case gravybox
				t$=geteditboxtext(gravybox)
				gravy#=valfloat(t$)		
			endcase	
			case aibox
				t$=geteditboxtext(aibox)
				aitype=val(t$)
				for n=1 to maxsprites
					mysprite[n].selected=0
					mysprite[n].aitype=aitype
					setspritecolor(mysprite[n].spritenumber,mysprite[n].red,mysprite[n].green,mysprite[n].blue,255)
				next n
			endcase	
			case scrollbox
				t$=geteditboxtext(scrollbox)
				scrolltype=val(t$)
			endcase	
			case seebox
				t$=GetEditBoxText(seebox)
				seeingdistance#=valfloat(t$)
				for n=1 to maxsprites
					mysprite[n].selected=0
					mysprite[n].seeingdistance#=seeingdistance#
					setspritecolor(mysprite[n].spritenumber,mysprite[n].red,mysprite[n].green,mysprite[n].blue,255)
				next n
			endcase
			case statebox
				t$=geteditboxtext(statebox)
				state=val(t$)
				for n=1 to maxsprites
					if mysprite[n].selected=1
						mysprite[n].selected=0
						mysprite[n].state=state
						setspritecolor(mysprite[n].spritenumber,mysprite[n].red,mysprite[n].green,mysprite[n].blue,255)
						if mysprite[n].hasanim=1
							select mysprite[n].state
								case staticstate
									PlaySprite(mysprite[n].spritenumber,25,1,1,1)
								endcase
								case walkingstate
									PlaySprite(mysprite[n].spritenumber,25,1,walkstartframe,walkendframe)
								endcase
								case runningstate
									PlaySprite(mysprite[n].spritenumber,25,1,runstartframe,runendframe)
								endcase	
								case swimmingstate
									PlaySprite(mysprite[n].spritenumber,25,1,swimstartframe,swimendframe)
								endcase
								case flyingstate
									PlaySprite(mysprite[n].spritenumber,25,1,flystartframe,flyendframe)
								endcase
								case dyingstate
									PlaySprite(mysprite[n].spritenumber,25,1,diestartframe,dieendframe)
								endcase
								case jumpingstate
									PlaySprite(mysprite[n].spritenumber,25,1,jumpstartframe,jumpendframe)
								endcase
							endselect				 
						endif					
					endif	
				next n
			endcase
		endselect
	endif
endfunction
function FillMouse(gridx,gridy)
     Mouse.x1#=getpointerx()
     Mouse.y1#=getpointery()
     Mouse.x2#=screentoworldx(Mouse.x1#)
     Mouse.y2#=screentoworldy(Mouse.y1#)
     Mouse.x3=floor(Mouse.x2#/gridx)*gridx
     Mouse.y3=floor(Mouse.y2#/gridy)*gridy
 endfunction
function setvalues(spr,ns)
	mysprite[spr].spritenumber=ns
	mysprite[spr].angle=angle
	mysprite[spr].canrotate=canrotate
	mysprite[spr].blue=blue
	mysprite[spr].red=red
	mysprite[spr].green=green
	mysprite[spr].sizex#=sizex#
	mysprite[spr].sizey#=sizey#
	mysprite[spr].scalex=scalex
	mysprite[spr].jumpspeed=jumpspeed
	mysprite[spr].scaley=scaley
	mysprite[spr].groupnumber=groupnumber
	mysprite[spr].pcount=pcount
	mysprite[spr].xp#=Mouse.x3
	mysprite[spr].yp#=Mouse.y3
	mysprite[spr].texturerep=texturerep
	mysprite[spr].depth=depth
	mysprite[spr].friction#=friction#
	mysprite[spr].seeingdistance#=seeingdistance#
	mysprite[spr].restitution#=restitution#
	mysprite[spr].canrotate=canrotate
	mysprite[spr].shape=shape
	mysprite[spr].physicstype=physicstype
	mysprite[spr].visibility=visibility
	mysprite[spr].transparency=transparency
	mysprite[spr].imagenumber=CurrentImage
	mysprite[spr].tilevalue=tilevalue
	mysprite[spr].tilevalue2=tilevalue2
	mysprite[spr].tilevalue3=tilevalue3
	mysprite[spr].tilevalue4=tilevalue4
	mysprite[spr].tilevalue5=tilevalue5
	mysprite[spr].tilevalue6=tilevalue6
	mysprite[spr].alpha=alpha
	mysprite[spr].animframes=animframes
	mysprite[spr].speed#=speed#
	mysprite[spr].negspeed#=negspeed#
	mysprite[spr].ammo=ammo
	mysprite[spr].health=health
	mysprite[spr].delay=delay
	mysprite[spr].aitype=aitype
	mysprite[spr].state=state
	mysprite[spr].pcount=pcount
	if groupnumber=1
		playerset=1
	endif
endfunction
function my_system_message(textnumber,tx#,ty#,textsize#,r,g,b,alpha,depth,message$)
	createtext(textnumber,message$)
	settextsize(textnumber,textsize#)
	settextcolor(textnumber,r,g,b,alpha)
	settextposition(textnumber,tx#,ty#)
	settextdepth(textnumber,depth)
	settextvisible(textnumber,1)
	FixTextToScreen(textnumber,1)
	sync()
	sleep(1500)
	deletetext(textnumber)
endfunction
function reset_value(spr)
	mysprite[spr].xp#=0
	mysprite[spr].yp# =0
	mysprite[spr].sizex# =0
	mysprite[spr].sizey# =0
	mysprite[spr].scalex =0
	mysprite[spr].scaley =0
	mysprite[spr].restitution# =0
	mysprite[spr].friction# =0
	mysprite[spr].spritenumber =0
	mysprite[spr].imagenumber =0
	mysprite[spr].transparency =1
	mysprite[spr].visibility =0
	mysprite[spr].groupnumber =0
	mysprite[spr].physicstype=0
	mysprite[spr].pcount=0
	mysprite[spr].shape =0
	mysprite[spr].angle =0
	mysprite[spr].depth=0
	mysprite[spr].host =0
	mysprite[spr].client =0
	mysprite[spr].tilevalue=0
	mysprite[spr].tilevalue2=0
	mysprite[spr].tilevalue3=0
	mysprite[spr].tilevalue4=0
	mysprite[spr].tilevalue5=0
	mysprite[spr].tilevalue6=0
	mysprite[spr].canrotate =0
	mysprite[spr].red =0
	mysprite[spr].green =0
	mysprite[spr].blue =0
	mysprite[spr].selected =0
	mysprite[spr].framestart =0
	mysprite[spr].frameamount =0
	mysprite[spr].frameend =0
	mysprite[spr].loopframe   =0
	mysprite[spr].texturerep=0
	mysprite[spr].alpha=255
	mysprite[spr].animframes=0
	mysprite[spr].speed#=0
	mysprite[spr].negspeed#=0
	mysprite[spr].ammo=0
	mysprite[spr].health=0
	mysprite[spr].delay=0
	mysprite[spr].aitype=0
	mysprite[spr].state=0
	mysprite[spr].hasanim=0
	mysprite[spr].seeingdistance#=0
	mysprite[spr].pcount=0
endfunction
function save_level(level,showmessage)
	f$=""
	select gametype
		case 0
			f$="levelplatform"
		endcase
		case 1
			f$="leveltopdown"
		endcase
		case 2
			f$="Levelshooter"
		endcase
		case 4
			f$="Levelgolf"
		endcase
		case 5
			f$="batnball"
		endcase
	endselect
	f$=f$+str(level)
	f$=f$+".lev"
	myfile=opentowrite(f$,0)
	writeinteger(myfile,spritecounter)
	writeinteger(myfile,gametype)
	writeinteger(myfile,scrolltype)
	writefloat(myfile,gravx#)
	writefloat(myfile,gravy#)
	for n=1 to maxsprites
		writeinteger(myfile,mysprite[n].jumpspeed)
		writefloat(myfile,mysprite[n].xp#)
		writefloat(myfile,mysprite[n].yp#)
		writefloat(myfile,mysprite[n].sizex#)
		writefloat(myfile,mysprite[n].sizey#)
		writeinteger(myfile,mysprite[n].scalex)
		writeinteger(myfile,mysprite[n].scaley)
		writefloat(myfile,mysprite[n].restitution#)
		writefloat(myfile,mysprite[n].friction#)
		writefloat(myfile,mysprite[n].speed#)
		writefloat(myfile,mysprite[n].negspeed#)
		writeinteger(myfile,mysprite[n].spritenumber)
		writeinteger(myfile,mysprite[n].imagenumber)
		writeinteger(myfile,mysprite[n].transparency)
		writeinteger(myfile,mysprite[n].visibility)
		writeinteger(myfile,mysprite[n].groupnumber)
		writeinteger(myfile,mysprite[n].physicstype)
		writeinteger(myfile,mysprite[n].shape)
		writeinteger(myfile,mysprite[n].angle)
		writeinteger(myfile,mysprite[n].depth)
		writeinteger(myfile,mysprite[n].host)
		writeinteger(myfile,mysprite[n].client)
		writeinteger(myfile,mysprite[n].tilevalue)
		writeinteger(myfile,mysprite[n].tilevalue2)
		writeinteger(myfile,mysprite[n].tilevalue3)
		writeinteger(myfile,mysprite[n].tilevalue4)
		writeinteger(myfile,mysprite[n].tilevalue5)
		writeinteger(myfile,mysprite[n].tilevalue6)
		writeinteger(myfile,mysprite[n].canrotate)
		writeinteger(myfile,mysprite[n].red)
		writeinteger(myfile,mysprite[n].green)
		writeinteger(myfile,mysprite[n].blue)
		writeinteger(myfile,mysprite[n].framestart)
		writeinteger(myfile,mysprite[n].frameamount)
		writeinteger(myfile,mysprite[n].frameend)
		writeinteger(myfile,mysprite[n].loopframe)
		writeinteger(myfile,mysprite[n].texturerep)
		writeinteger(myfile,mysprite[n].alpha)
		writeinteger(myfile,mysprite[n].animframes)
		writeinteger(myfile,mysprite[n].health)
		writeinteger(myfile,mysprite[n].ammo)
		writeinteger(myfile,mysprite[n].delay)
		writeinteger(myfile,mysprite[n].aitype)
		writeinteger(myfile,mysprite[n].deleted)
		writeinteger(myfile,mysprite[n].aitype)
		writefloat(myfile,mysprite[n].seeingdistance#)
		writeinteger(myfile,mysprite[n].state)
		writeinteger(myfile,mysprite[n].hasanim)
		for a=0 to 14
			writeinteger(myfile,mysprite[n].spriteanimframes[a])
		next a
	next n
	closefile(myfile)
endfunction
function load_level(level)
	f$=""
	select gametype
		case 0
			f$="levelplatform"
		endcase
		case 1
			f$="leveltopdown"
		endcase
		case 2
			f$="Levelshooter"
		endcase
		case 4
			f$="Levelgolf"
		endcase
		case 5
			f$="batnball"
		endcase
	endselect
	f$=f$+str(level)
	f$=f$+".lev"
	myfile=opentoread(f$)
	if getfileexists(f$)
		clear_level()
		spritecounter=readinteger(myfile)
		gametype=readinteger(myfile)
		scrolltype=readinteger(myfile)
		gravx#=readfloat(myfile)
		gravy#=readfloat(myfile)
		for n=1 to maxsprites
			mysprite[n].jumpspeed=readinteger(myfile)
			mysprite[n].xp#=readfloat(myfile)
			mysprite[n].yp#=readfloat(myfile)
			mysprite[n].sizex#=readfloat(myfile)
			mysprite[n].sizey#=readfloat(myfile)
			mysprite[n].scalex=readinteger(myfile)
			mysprite[n].scaley=readinteger(myfile)
			mysprite[n].restitution#=readfloat(myfile)
			mysprite[n].friction#=readfloat(myfile)
			mysprite[n].speed#=readfloat(myfile)
			mysprite[n].negspeed#=readfloat(myfile)
			mysprite[n].spritenumber=readinteger(myfile)
			mysprite[n].imagenumber=readinteger(myfile)
			mysprite[n].transparency=readinteger(myfile)
			mysprite[n].visibility=readinteger(myfile)
			mysprite[n].groupnumber=readinteger(myfile)
			mysprite[n].physicstype=readinteger(myfile)
			mysprite[n].shape=readinteger(myfile)
			mysprite[n].angle=readinteger(myfile)
			mysprite[n].depth=readinteger(myfile)
			mysprite[n].host=readinteger(myfile)
			mysprite[n].client=readinteger(myfile)
			mysprite[n].tilevalue=readinteger(myfile)
			mysprite[n].tilevalue2=readinteger(myfile)
			mysprite[n].tilevalue3=readinteger(myfile)
			mysprite[n].tilevalue4=readinteger(myfile)
			mysprite[n].tilevalue5=readinteger(myfile)
			mysprite[n].tilevalue6=readinteger(myfile)
			mysprite[n].canrotate=readinteger(myfile)
			mysprite[n].red=readinteger(myfile)
			mysprite[n].green=readinteger(myfile)
			mysprite[n].blue=readinteger(myfile)
			mysprite[n].framestart=readinteger(myfile)
			mysprite[n].frameamount=readinteger(myfile)
			mysprite[n].frameend=readinteger(myfile)
			mysprite[n].loopframe=readinteger(myfile)
			mysprite[n].texturerep=readinteger(myfile)
			mysprite[n].alpha=readinteger(myfile)
			mysprite[n].animframes=readinteger(myfile)			
			mysprite[n].health=readinteger(myfile)
			mysprite[n].ammo=readinteger(myfile)
			mysprite[n].delay=readinteger(myfile)
			mysprite[n].aitype=readinteger(myfile)
			mysprite[n].deleted=readinteger(myfile)
			mysprite[n].aitype=readinteger(myfile)
			mysprite[n].seeingdistance#=readfloat(myfile)
			mysprite[n].state=readinteger(myfile)
			mysprite[n].hasanim=readinteger(myfile)
			for a=0 to 14
				mysprite[n].spriteanimframes[a]=readinteger(myfile)
			next a
			if mysprite[n].spritenumber<>0
				if getspriteexists(mysprite[n].spritenumber)=0
					createsprite(mysprite[n].spritenumber,mysprite[n].imagenumber)
					//setspriteoffset(mysprite[n].spritenumber,0,0)
					mysprite[n].negspeed#=-mysprite[n].speed#
					setspritesize(mysprite[n].spritenumber,mysprite[n].sizex#,mysprite[n].sizey#)
					setspriteshape(mysprite[n].spritenumber,mysprite[n].shape)
					SetSpriteScale(mysprite[n].spritenumber,mysprite[n].scalex,mysprite[n].scaley)
					SetSpriteAngle(mysprite[n].spritenumber,mysprite[n].angle)
					setspritecolor(mysprite[n].spritenumber,mysprite[n].red,mysprite[n].green,mysprite[n].blue,255)
					SetSpriteTransparency(mysprite[n].spritenumber,mysprite[n].transparency)
					//SetSpriteTransparency(mysprite[n].spritenumber,0)
					SetSpritePosition(mysprite[n].spritenumber,mysprite[n].xp#,mysprite[n].yp#)
					setspritedepth(mysprite[n].spritenumber,mysprite[n].depth)
					setspritegroup(mysprite[n].spritenumber,mysprite[n].groupnumber)
					checkrepeat(mysprite[n].spritenumber,mysprite[n].texturerep,mysprite[n].scalex,mysprite[n].scaley)			
// if sprite has animations xxxxxxxxxxxxxxxxxxxxxx
					if mysprite[n].hasanim=1
						for f=1 to maxanimframes
							AddSpriteAnimationFrame(mysprite[n].spritenumber,mysprite[n].spriteanimframes[f])
						next f
						select mysprite[n].state
							case staticstate
								PlaySprite(mysprite[n].spritenumber,25,1,1,1)
							endcase
							case walkingstate
								PlaySprite(mysprite[n].spritenumber,25,1,2,5)
							endcase
						endselect									 
					endif
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx				
				endif
			endif
		next n
		closefile(myfile)
		for n=1 to maxsprites
			if mysprite[n].spritenumber<>0	
				if mysprite[n].groupnumber=1
					scrollx#=mysprite[n].xp#-400
					scrolly#=mysprite[n].yp#-getdeviceheight()/2
					cursorx#=scrollx#
					cursory#=scrolly#
					playerset=1
				endif
			endif
		next n
		playsound(3)
		else
			createmytext(0,300,baseboxX#*3.7-diff#,550,15,255,0,0,"File does not exist!",0)
	endif
endfunction
function clear_level()
	for n=1 to pcount
		if GetParticlesExists(n)
			deleteparticles(n)
		endif
	next n
	for n=1 to maxsprites
		if getspriteexists(mysprite[n].spritenumber)
			deletesprite(mysprite[n].spritenumber)
		endif
		mysprite[n].xp#=0
		mysprite[n].delay=0
		mysprite[n].yp#=0
		mysprite[n].sizex#=0
		mysprite[n].sizey#=0
		mysprite[n].scalex=0
		mysprite[n].scaley=0
		mysprite[n].restitution#=0
		mysprite[n].friction#=0
		mysprite[n].spritenumber=0
		mysprite[n].imagenumber=0
		mysprite[n].transparency=0
		mysprite[n].visibility=0
		mysprite[n].groupnumber=0
		mysprite[n].physicstype=0
		mysprite[n].shape=0
		mysprite[n].angle=0
		mysprite[n].depth=0
		mysprite[n].host=0
		mysprite[n].client=0
		mysprite[n].tilevalue=0
		mysprite[n].tilevalue2=0
		mysprite[n].tilevalue3=0
		mysprite[n].tilevalue4=0
		mysprite[n].tilevalue5=0
		mysprite[n].tilevalue6=0
		mysprite[n].canrotate=0
		mysprite[n].red=0
		mysprite[n].green=0
		mysprite[n].blue=0
		mysprite[n].selected=0
		mysprite[n].framestart=0
		mysprite[n].frameamount=0
		mysprite[n].frameend=0
		mysprite[n].loopframe=0
		mysprite[n].texturerep=0
		mysprite[n].alpha=255
		mysprite[n].animframes=0
		mysprite[n].speed#=0
		mysprite[n].negspeed#=0
		mysprite[n].ammo=0
		mysprite[n].health=0
		mysprite[n].aitype=0
		mysprite[n].deleted=0
		spawn[n].ammo=0
		spawn[n].blue=0
		spawn[n].changedir=0
		spawn[n].delay=0
		spawn[n].green=0
		spawn[n].health=0
		spawn[n].myspawnspeed#=0
		spawn[n].negspawnspeed#=0
		spawn[n].oldammo=0
		spawn[n].oldspeed#=0
		spawn[n].oldx#=0
		spawn[n].oldy#=0
		spawn[n].red=0
		spawn[n].spawnspeed#=0
		spawn[n].spriteID=0
		spawn[n].tick=0
		spawn[n].tilevalue=0
		spawn[n].tilevalue2=0
	next n
	for n=1 to baddiepointer
		baddie[n].ammo=0
		baddie[n].baddiespeed#=0
		baddie[n].blue=0
		baddie[n].changedir=0
		baddie[n].delay=0
		baddie[n].green=0
		baddie[n].health=0
		baddie[n].mybaddiespeed#=0
		baddie[n].negbaddiespeed#=0
		baddie[n].oldammo=0
		baddie[n].oldspeed#=0
		baddie[n].oldx#=0
		baddie[n].oldy#=0
		baddie[n].red=0
		baddie[n].spawnid=0
		baddie[n].tick=0
		baddie[n].tilevalue=0
		baddie[n].tilevalue2=0	
	next n
	spritenumber=0
	spritecounter2=0
	spriteselected=0
	playerset=0
	baddiepointer=0
	bulletindex=0
	spawnpointer=0
	spritecounter=0
	pcount=1
	frameanimindex=1
endfunction
function checkrepeat(Spr,mytexturerep,scx,scy)
	select mytexturerep
		case 1
			setimagewrapu(GetSpriteImageID(Spr),1)
			SetImageWrapV(GetSpriteImageID(Spr),1)
			SetSpriteUVScale(Spr,1.0/scx,1.0/scy)
		endcase
		case 0
			setimagewrapu(GetSpriteImageID(Spr),0)
			SetImageWrapV(GetSpriteImageID(Spr),0)
			SetSpriteUVScale(Spr,1.0,1.0)
			//SetSpriteUVScale(Spr,1.0/scx,1.0/scy)
		endcase
	endselect
endfunction
function Run_Level()
	for n=1 to maxsprites
		if mysprite[n].spritenumber>0
			setspritecolor(mysprite[n].spritenumber,mysprite[n].red,mysprite[n].blue,mysprite[n].green,255)
			mysprite[n].selected=0
		endif
	next n
	oldx#=scrollx#
	oldy#=scrolly#
	setspritevisible(cursorsprite,0)
	SetTextVisible(229,0)
	save_level(level,0)
	hide_all()
	for n=1001 to 1004
		SetTextVisible(n,0)
	next n
	setphysicsgravity(gravx#,gravy#)
	setclearcolor(0,0,0)
	ClearScreen()
	createmytext(0,2000,0,0,25,255,0,0,"SCORE : "+str(score),0)
	if gametype=5
		setviewoffset(scrollx#+getdeviceheight()/2+zoom#*30,scrolly#)
	endif
	//make_my_button(4,700,450,60,"JUMP",255,0,0,255)
// load/prep Object	
	prep_objects()
	repeat
		//print("shipattack "+str(shipattack))
		if getrawkeypressed(KEY_D)
			dm=dm+1
			if dm>1
				dm=0
			endif
			select dm
				case 0
					SetPhysicsDebugOff()
				endcase
				case 1
					SetPhysicsDebugOn()
				endcase
			endselect
		endif
		if getrawkeypressed(KEY_S)
			inc aistate
			if aistate>1
				aistate=0
			endif
		endif
		myoldx#=getspritex(playersprite)
		myoldy#=getspritey(playersprite)
		if GetRawKeyPressed(KEY_E) 
			myquit=1
		endif
		collision(player[playerpointer].id,0,0)
		if getspriteexists(bullet[bulletindex].bulletid)
			collision(bullet[bulletindex].bulletid,1,0)
		endif
		select gametype
			case 0
				select scrolltype
					case 0
						setviewoffset(getspritex(player[playerpointer].id)-200,getspritey(player[playerpointer].id)+getdeviceheight()-200)
					endcase
					case 1
					setviewoffset(getspritex(player[playerpointer].id)-200,getspritey(player[playerpointer].id)-200)

						//setviewoffset(getspritex(scrollsprite)-GetDeviceWidth()/2,getspritey(scrollsprite))
						//SetSpritePhysicsVelocity(scrollsprite,scrollspeed#,0)
					endcase
				//setviewoffset(getspritex(scrollspriteleft)-200+zoom#*30,getspritey(scrollspriteleft)-200)
				endselect
				for n=0 to baddiepointer
					if GetSpriteExists(baddie[n].spriteID)
					move_baddies(gametype,baddie[n].aitype,n,getspritex(baddie[n].spriteid),getspritey(baddie[n].spriteid))
					endif
				next n
			endcase	
			// shootemup		
			case 1
				select scrolltype
					case 0
						setviewoffset(getspritex(player[playerpointer].id)-getdevicewidth()/8,getspritey(player[playerpointer].id)-GetDeviceHeight()/4.5)
					endcase
					case 1
						setviewoffset(getspritex(player[playerpointer].id)-getdevicewidth()/8,getspritey(player[playerpointer].id)-GetDeviceHeight()/4.5)

					endcase
				endselect
				for n=0 to baddiepointer
					move_baddies(gametype,baddie[n].aitype,n,getspritex(baddie[n].spriteid),getspritey(baddie[n].spriteid))
				next n
			endcase
			//
			case 2
				setviewoffset(scrollx#+getdeviceheight()/2+zoom#*30,scrolly#)
			endcase
			//
			case 4
				setviewoffset(getspritex(player[playerpointer].id)-200+zoom#*30,getspritey(player[playerpointer].id)-200)
			endcase
			//
			case 5
				setviewoffset(getspritex(player[playerpointer].id)-200+zoom#*30,getspritey(player[playerpointer].id)-200)
			endcase
		endselect
		control_player()
		control_spawnpoints()
		sync()	
	until myquit=1
	after_run_cleanup()
endfunction
Function control_player()
	select gametype
		// Platformer controls *******************************
		case 0
			rem setSpritePhysicsVelocity(playersprite,GetVirtualJoystickX(1)*8*18,GetSpritePhysicsVelocityY(playersprite))
			jx#=GetVirtualJoystickX(1)
			jy#=GetVirtualJoysticky(1)
			if getrawkeystate(KEY_Z)
				SetSpritePhysicsvelocity(player[playerpointer].id,-player[playerpointer].movespeed#,GetSpritePhysicsVelocityY(player[playerpointer].id))
			endif
			if getrawkeystate(KEY_x)
				SetSpritePhysicsvelocity(player[playerpointer].id,player[playerpointer].movespeed#,GetSpritePhysicsVelocityY(player[playerpointer].id))
			endif
			//v=floor(abs( GetSpritePhysicsVelocityY( playersprite )))
			id2=checkplayerstat(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,0,16)
			id3=checkplayerstat(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,8,16)
			id4=checkplayerstat(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,16,16)
			id5=checkplayerstat(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,24,16)
			if getrawkeypressed(KEY_SPACE) and (id2>0 or id3>0 or id4>0 or id5>0)
				SetSpritePhysicsImpulse(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,-player[playerpointer].jumpspeed)
			endif
			if getrawkeyreleased(KEY_X) and getrawkeypressed(KEY_Z)=0
				SetSpritePhysicsvelocity(player[playerpointer].id,0,GetSpritePhysicsVelocityY(player[playerpointer].id))
			endif
			if getrawkeyreleased(KEY_Z) and getrawkeypressed(KEY_X)=0
				SetSpritePhysicsvelocity(player[playerpointer].id,0,GetSpritePhysicsVelocityY(player[playerpointer].id))
			endif
			if getvirtualjoystickx(1)<0
				//setspriteflip(playersprite,1,0)
				elseif getvirtualjoystickx(1)>0
					//setspriteflip(playersprite,0,0)
			endif
		endcase
		// gauntlet controls ***************************************
		case 1
			setSpritePhysicsVelocity(player[playerpointer].id,GetVirtualJoystickX(2)*4*18,GetVirtualJoystickY(2)*4*18)
			v=( GetSpritePhysicsVelocityY( player[playerpointer].id ))
			if getrawkeypressed(KEY_SPACE)
				//If v<0.1 
					//jump=1
					//print("Jumped!")
				//Endif
			endif
			if killjump=1
				killjump=0
				print("kill jump!!")
				setSpritePhysicsimpulse(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,160000)
			endif
			if jump>0
				setSpritePhysicsimpulse(player[playerpointer].id,getspritex(player[playerpointer].id),getspritey(player[playerpointer].id),0,80000)
				//SetSpritePhysicsAngularImpulse(playersprite,10)
			endif
			jx# = GetVirtualJoystickX( 1)
			jy# = GetVirtualJoystickY( 1 )
			if jx#<0
				newangle#=newangle#-1
				travdirx=-1
			endif
			if jx#>0
				newangle#=newangle#+1
				//travdirx=1+getspritewidth(playersprite)/2
				travdirx=1
			endif
			if jy#<0
				//travdiry=-1-getspriteheight(playersprite)/2
				travdiry=1
			endif
			if jy#>0
				travdiry=-1
			endif
			                                                                                                         
			SetSpriteAngle( player[playerpointer].id, newAngle# )
			//print(str(newangle#))
			if GetRawKeyPressed(KEY_Z) 
				playsound(4)
				fired=1
				make_bullet(player[playerpointer].id,getspritexbyoffset(player[playerpointer].id),getspriteybyoffset(player[playerpointer].id),180,newangle#)
			endif
		endcase
		//golf
		case 4
			x#=WorldToScreenX(getspritex(player[playerpointer].id)+(GetSpriteWidth(player[playerpointer].id)/2))
			y#=WorldToScreenY(getspritey(player[playerpointer].id)+8)
			mx#=getpointerx()
			my#=getpointery()
			DrawLine(x#,y#,mx#,my#,0,255,255)
			if GetRawMouseLeftstate()
				//pangle = CalculateSpriteAngle(GetSpriteX(playersprite),GetSpriteY(playersprite), GetPointerX(),GetPointerY())
				//SetSpriteAngle(playersprite,pangle)
			endif
		endcase
		//space invaders
		case 5
			setSpritePhysicsVelocity(player[playerpointer].id,GetVirtualJoystickX(1)*8*18,GetSpritePhysicsVelocityY(player[playerpointer].id))
			v=abs( GetSpritePhysicsVelocityY( player[playerpointer].id))
			if getrawkeypressed(KEY_SPACE) and v=0
				jump=1
			endif
			if getvirtualjoystickx(1)<0
				setspriteflip(player[playerpointer].id,1,0)
				elseif getvirtualjoystickx(1)>0
					setspriteflip(player[playerpointer].id,0,0)
			endif
			if jump>0
				//setSpritePhysicsimpulse(playersprite,getspritex(playersprite),getspritey(playersprite),0,-3600)
				//SetSpritePhysicsvelocity(playersprite,0,-180)
			endif
			if GetRawKeyPressed(KEY_Z) and fired=0
				playsound(4)
				fired=1
				//SetSpriteAngle(playersprite,pangle)
				make_bullet(player[playerpointer].id,getspritexbyoffset(player[playerpointer].id),getspriteybyoffset(player[playerpointer].id),180,newangle#)
			endif
		endcase
	endselect
endfunction


function move_baddies(m,ai,pos,xp#,yp#)
	
	if getspriteexists(baddie[pos].spriteid)
		baddyID=baddie[pos].spriteID
		select m
			case 0
			//******************************************	
				select ai
					case 0
						// Platformer A.I
						baddie[pos].nxp#=getspritex(baddie[pos].spriteid)
						baddie[pos].nyp#=getspritey(baddie[pos].spriteid)
						//setspritephysicsimpulse(baddie[n].spriteid,baddie[n].xp#,baddie[n].yp#,baddie[n].baddiespeed#,0)
						
						//Only Move if player is within range ***********************
						//if getspritedistance(baddie[pos].spriteid,playersprite)<baddie[pos].seeingdistance#
						SetSpritePhysicsVelocity(baddie[pos].spriteid,baddie[pos].movspd#,0)
						//else //Stop Moving if player not within range!
						//SetSpritePhysicsVelocity(baddie[pos].spriteid,0,0)
						//endif
						// left raycast check
						c=spriteraycast(xp#,yp#+getspriteheight(baddie[pos].spriteid)+1,baddie[pos].nxp#,baddie[pos].nyp#)
						if c=1
							spr=getraycastspriteid()
							if getspritegroup(spr)=leftdirgroup
								baddie[pos].movspd#=50
							endif
				
							if c=0
							
							endif
						endif
						// right raycast check
						c2=spriteraycast(xp#+getspritewidth(baddie[pos].spriteid),yp#+getspriteheight(baddie[pos].spriteid)/2,baddie[pos].nxp#,baddie[pos].nyp#)
						if c2=1
							spr2=getraycastspriteid()
							if getspritegroup(spr2)=rightdirgroup
								//setspriteposition(baddie[pos].spriteid,xp#,yp#)
								baddie[pos].movspd#=-50
								//setspriteposition(baddie[pos].spriteid,xp#,yp#)
								//print ("left dir hit!!")
							endif
						endif
						if c2=0
							baddie[pos].baddiespeed#=0
						endif					
					endcase
				endselect
			endcase
			rem flight or flee
			case 1
				if getspriteexists(baddie[pos].spriteid)
					if getspritedistance(baddie[pos].spriteid,player[playerpointer].id)<80
						
						oldx#=getspritex(baddie[pos].spriteid)
						oldy#=getspritey(baddie[pos].spriteid)
						rotate_sprite_by_pointer(baddie[pos].spriteid, 180, 0, 360)
				
						select baddie[pos].scared
							case 0
								if getspritex(baddie[pos].spriteid)<getspritex(player[playerpointer].id)
									SetSpritePhysicsvelocity(baddie[pos].spriteid,movspd#,getspritephysicsvelocityy(baddie[pos].spriteid))	
								endif
								if getspritex(baddie[pos].spriteid)>getspritex(player[playerpointer].id)
									SetSpritePhysicsvelocity(baddie[pos].spriteid,-movspd#,getspritephysicsvelocityy(baddie[pos].spriteid))
								endif
								if getspritey(baddie[pos].spriteid)>getspritey(player[playerpointer].id)
									SetSpritePhysicsvelocity(baddie[pos].spriteid,getspritephysicsvelocityx(baddie[pos].spriteid),-movspd#)
								endif
								if getspritey(baddie[pos].spriteid)<getspritey(player[playerpointer].id)
									SetSpritePhysicsvelocity(baddie[pos].spriteid,getspritephysicsvelocityx(baddie[pos].spriteid),movspd#)
								endif
							endcase
						endselect
						
					endif
				endif
				
			endcase
		endselect
	endif
endfunction
function collision(sprid,m,p)
    c=GetSpriteFirstContact(sprid)
    do
        if c=0 then exit
        spr=GetSpriteContactSpriteID2() //komisch knn 0 zurück geben^^
        if spr<>0
	        select m
				// check against player
				case 0
					if getspritegroup(spr)=baddiegroup
						//if GetSpritePhysicsVelocityY(spr)>0
							shipattack=0
							print("fuck me, I hit Bill Gates!!!")
						//endif
						//deletesprite(spr)
						//deletesprite(ball)
						exit
					endif
					if getspritegroup(spr)=collectgroup
						//if GetSpritePhysicsVelocityY(spr)>0
							setspriteposition(spr,-1000000,-1000000)
							print("Yummy!!")
						//endif
						//deletesprite(spr)
						//deletesprite(ball)
						exit
					endif
						exit
					//	print ("fuck")
								
				endcase
				//check against bullet
				case 1
					if getspritegroup(spr)=0
						deletesprite(sprid)
						bulletpointer=0
						bulletindex=0
						exit
					//	print ("fuck")
					endif	
					if getspritegroup(spr)=baddiegroup
						//if GetSpritePhysicsVelocityY(spr)>0
							shipattack=0
							print("baddy killed!!!")
						//endif
						setspritephysicsvelocity(spr,0,0)
						setspriteposition(spr,-100000000,-100000000)
						setspritevisible(spr,0)
						deletesprite(sprid)
						bulletpointer=0
						bulletindex=0
						//deletesprite(ball)
						exit
					endif
				endcase
			endselect
		endif
        c=GetSpriteNextContact()
    loop
endfunction
function change_group_text()
	select groupnumber
		case 0
			set_group_stuff(depth,"Neutral Group",sizex#,sizey#,currentimage,physicstype,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		Case 1
			set_group_stuff(depth,"Player Group",sizex#,sizey#,currentimage,2,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case 2
			set_group_stuff(depth,"Baddy Group",sizex#,sizey#,currentimage,physicstype,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case 3
			set_group_stuff(depth,"collectable Group",sizex#,sizey#,currentimage,1,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case rightdirgroup
			set_group_stuff(depth,"DirR Group",8,sizey#,currentimage,1,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case leftdirgroup
			set_group_stuff(depth,"DirL Group",8,sizey#,currentimage,1,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case 6
			set_group_stuff(depth,"Transporter Group",32,sizey#,currentimage,1,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case 7
			set_group_stuff(depth,"Spawn Group",sizex#,sizey#,currentimage,1,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case deathgroup
			set_group_stuff(depth,"Death Group",sizex#,sizey#,currentimage,physicstype,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
		case particlegroup	
			set_group_stuff(depth,"ParticleGroup Group",sizex#,sizey#,currentimage,physicstype,visibility,health,ammo,tilevalue2,transparency,delay)
		endcase
	endselect
	settextstring(229,group$)
endfunction
function rotate_sprite_by_pointer(sprite_id, angle_modifier#, angle_min#, angle_max#)
    angle# = ATanFull(GetSpriteX(sprite_id) - getspriteX(playersprite), GetSpriteY(sprite_id) - getspritey(playersprite))
    angle# = angle# + angle_modifier#
    select aistate
		case 0
		    if angle_min# <> 0.0
		        angle_min# = angle_min# + angle_modifier#   
		        if angle# < angle_min# then exitfunction 0.0
		    endif
	    endcase
	    case 1
			if angle_min# <> 0.0
		        angle_min# = angle_min# - angle_modifier#   
		        if angle# < angle_min# then exitfunction 0.0
		    endif
		endcase
	endselect
    if angle_max# <> 0.0
        angle_max# = angle_max# + angle_modifier#
        if angle# > angle_max# then exitfunction 0.0
    endif
 	select aistate
		case 0
	    	SetSpriteAngle(sprite_id, angle#)
	    endcase
	    case 1
			 SetSpriteAngle(sprite_id, angle#)
	    endcase
    endselect
endfunction angle#
function choosecolor(cr,cg,cb)
	setspritecolor(host,cr,cg,cb,255)
	setspritecolor(client,cr,cg,cb,255)
	mysprite[host].red=cr
	mysprite[host].green=cg
	mysprite[host].blue=cb
	mysprite[client].red=cr
	mysprite[client].green=cg
	mysprite[client].blue=cb			
endfunction
function set_group_stuff(d,g$,sxx#,syy#,iim,ptt,v,hl,am,val2,tr,de)	
	group$=g$
endfunction
function Animation_Editor(i,spriteid)
	for n=1 to spritecounter
		if mysprite[n].spritenumber=spriteid
			mypos=n
			exit
		endif
	next n
	ClearSpriteAnimationFrames( spriteid )
	hide_all()
	scrollx#=0
	scrolly#=0
	SetSpriteVisible(500,1)
	setviewoffset(scrollx#,scrolly#)
	//setspritevisible(cursorsprite,0)
	if getspriteexists(staticframesprite)=0
		createsprite(staticframesprite,i)
		setspritesize(staticframesprite,24,24)
		setspriteposition(staticframesprite,framebasex#,framebasey#)
	endif	
	if getspriteexists(walk1framesprite)=0
		createsprite(walk1framesprite,i)
		setspritesize(walk1framesprite,24,24)
		setspriteposition(walk1framesprite,framebasex#,framebasey#+framegap#)
	endif
	if getspriteexists(walk2framesprite)=0
		createsprite(walk2framesprite,i)
		setspritesize(walk2framesprite,24,24)
		setspriteposition(walk2framesprite,framebasex#+framegap#,framebasey#+framegap#)
	endif
	if getspriteexists(walk3framesprite)=0
		createsprite(walk3framesprite,i)
		setspritesize(walk3framesprite,24,24)
		setspriteposition(walk3framesprite,framebasex#+framegap#*2,framebasey#+framegap#)
	endif
	if getspriteexists(walk4framesprite)=0
		createsprite(walk4framesprite,i)
		setspritesize(walk4framesprite,24,24)
		setspriteposition(walk4framesprite,framebasex#+framegap#*3,framebasey#+framegap#)
	endif
	if getspriteexists(walk5framesprite)=0
		createsprite(walk5framesprite,i)
		setspritesize(walk5framesprite,24,24)
		setspriteposition(walk5framesprite,framebasex#+framegap#*4,framebasey#+framegap#)
	endif
	if getspriteexists(walk6framesprite)=0
		createsprite(walk6framesprite,i)
		setspritesize(walk6framesprite,24,24)
		setspriteposition(walk6framesprite,framebasex#+framegap#*5,framebasey#+framegap#)
	endif
	if getspriteexists(walk7framesprite)=0
		createsprite(walk7framesprite,i)
		setspritesize(walk7framesprite,24,24)
		setspriteposition(walk7framesprite,framebasex#+framegap#*6,framebasey#+framegap#)
	endif
	if getspriteexists(walk8framesprite)=0
		createsprite(walk8framesprite,i)
		setspritesize(walk8framesprite,24,24)
		setspriteposition(walk8framesprite,framebasex#+framegap#*7,framebasey#+framegap#)
	endif
	

	if getspriteexists(run1framesprite)=0
		createsprite(run1framesprite,i)
		setspritesize(run1framesprite,24,24)
		setspriteposition(run1framesprite,framebasex#,framebasey#+framegap#*2)
	endif
	if getspriteexists(run2framesprite)=0
		createsprite(run2framesprite,i)
		setspritesize(run2framesprite,24,24)
		setspriteposition(run2framesprite,framebasex#+framegap#,framebasey#+framegap#*2)
	endif
	if getspriteexists(run3framesprite)=0
		createsprite(run3framesprite,i)
		setspritesize(run3framesprite,24,24)
		setspriteposition(run3framesprite,framebasex#+framegap#*2,framebasey#+framegap#*2)
	endif
	if getspriteexists(run4framesprite)=0
		createsprite(run4framesprite,i)
		setspritesize(run4framesprite,24,24)
		setspriteposition(run4framesprite,framebasex#+framegap#*3,framebasey#+framegap#*2)
	endif
	if getspriteexists(run5framesprite)=0
		createsprite(run5framesprite,i)
		setspritesize(run5framesprite,24,24)
		setspriteposition(run5framesprite,framebasex#+framegap#*4,framebasey#+framegap#*2)
	endif
	if getspriteexists(run6framesprite)=0
		createsprite(run6framesprite,i)
		setspritesize(run6framesprite,24,24)
		setspriteposition(run6framesprite,framebasex#+framegap#*5,framebasey#+framegap#*2)
	endif
	if getspriteexists(run7framesprite)=0
		createsprite(run7framesprite,i)
		setspritesize(run7framesprite,24,24)
		setspriteposition(run7framesprite,framebasex#+framegap#*6,framebasey#+framegap#*2)
	endif
	if getspriteexists(run8framesprite)=0
		createsprite(run8framesprite,i)
		setspritesize(run8framesprite,24,24)
		setspriteposition(run8framesprite,framebasex#+framegap#*7,framebasey#+framegap#*2)
	endif
	if getspriteexists(swim1framesprite)=0
		createsprite(swim1framesprite,i)
		setspritesize(swim1framesprite,24,24)
		setspriteposition(swim1framesprite,framebasex#,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim2framesprite)=0
		createsprite(swim2framesprite,i)
		setspritesize(swim2framesprite,24,24)
		setspriteposition(swim2framesprite,framebasex#+framegap#,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim3framesprite)=0
		createsprite(swim3framesprite,i)
		setspritesize(swim3framesprite,24,24)
		setspriteposition(swim3framesprite,framebasex#+framegap#*2,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim4framesprite)=0
		createsprite(swim4framesprite,i)
		setspritesize(swim4framesprite,24,24)
		setspriteposition(swim4framesprite,framebasex#+framegap#*3,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim5framesprite)=0
		createsprite(swim5framesprite,i)
		setspritesize(swim5framesprite,24,24)
		setspriteposition(swim5framesprite,framebasex#+framegap#*4,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim6framesprite)=0
		createsprite(swim6framesprite,i)
		setspritesize(swim6framesprite,24,24)
		setspriteposition(swim6framesprite,framebasex#+framegap#*5,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim7framesprite)=0
		createsprite(swim7framesprite,i)
		setspritesize(swim7framesprite,24,24)
		setspriteposition(swim7framesprite,framebasex#+framegap#*6,framebasey#+framegap#*3)
	endif
	if getspriteexists(swim8framesprite)=0
		createsprite(swim8framesprite,i)
		setspritesize(swim8framesprite,24,24)
		setspriteposition(swim8framesprite,framebasex#+framegap#*7,framebasey#+framegap#*3)
	endif
	if getspriteexists(fly1framesprite)=0
		createsprite(fly1framesprite,i)
		setspritesize(fly1framesprite,24,24)
		setspriteposition(fly1framesprite,framebasex#,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly2framesprite)=0
		createsprite(fly2framesprite,i)
		setspritesize(fly2framesprite,24,24)
		setspriteposition(fly2framesprite,framebasex#+framegap#,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly3framesprite)=0
		createsprite(fly3framesprite,i)
		setspritesize(fly3framesprite,24,24)
		setspriteposition(fly3framesprite,framebasex#+framegap#*2,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly4framesprite)=0
		createsprite(fly4framesprite,i)
		setspritesize(fly4framesprite,24,24)
		setspriteposition(fly4framesprite,framebasex#+framegap#*3,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly5framesprite)=0
		createsprite(fly5framesprite,i)
		setspritesize(fly5framesprite,24,24)
		setspriteposition(fly5framesprite,framebasex#+framegap#*4,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly6framesprite)=0
		createsprite(fly6framesprite,i)
		setspritesize(fly6framesprite,24,24)
		setspriteposition(fly6framesprite,framebasex#+framegap#*5,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly7framesprite)=0
		createsprite(fly7framesprite,i)
		setspritesize(fly7framesprite,24,24)
		setspriteposition(fly7framesprite,framebasex#+framegap#*6,framebasey#+framegap#*4)
	endif
	if getspriteexists(fly8framesprite)=0
		createsprite(fly8framesprite,i)
		setspritesize(fly8framesprite,24,24)
		setspriteposition(fly8framesprite,framebasex#+framegap#*7,framebasey#+framegap#*4)
	endif
	if getspriteexists(die1framesprite)=0
		createsprite(die1framesprite,i)
		setspritesize(die1framesprite,24,24)
		setspriteposition(die1framesprite,framebasex#,framebasey#+framegap#*5)
	endif
	if getspriteexists(die2framesprite)=0
		createsprite(die2framesprite,i)
		setspritesize(die2framesprite,24,24)
		setspriteposition(die2framesprite,framebasex#+framegap#,framebasey#+framegap#*5)
	endif
	if getspriteexists(die3framesprite)=0
		createsprite(die3framesprite,i)
		setspritesize(die3framesprite,24,24)
		setspriteposition(die3framesprite,framebasex#+framegap#*2,framebasey#+framegap#*5)
	endif
	if getspriteexists(die4framesprite)=0
		createsprite(die4framesprite,i)
		setspritesize(die4framesprite,24,24)
		setspriteposition(die4framesprite,framebasex#+framegap#*3,framebasey#+framegap#*5)
	endif
	if getspriteexists(die5framesprite)=0
		createsprite(die5framesprite,i)
		setspritesize(die5framesprite,24,24)
		setspriteposition(die5framesprite,framebasex#+framegap#*4,framebasey#+framegap#*5)
	endif
	if getspriteexists(die6framesprite)=0
		createsprite(die6framesprite,i)
		setspritesize(die6framesprite,24,24)
		setspriteposition(die6framesprite,framebasex#+framegap#*5,framebasey#+framegap#*5)
	endif
	if getspriteexists(die7framesprite)=0
		createsprite(die7framesprite,i)
		setspritesize(die7framesprite,24,24)
		setspriteposition(die7framesprite,framebasex#+framegap#*6,framebasey#+framegap#*5)
	endif
	if getspriteexists(die8framesprite)=0
		createsprite(die8framesprite,i)
		setspritesize(die8framesprite,24,24)
		setspriteposition(die8framesprite,framebasex#+framegap#*7,framebasey#+framegap#*5)
	endif
	if getspriteexists(jump1framesprite)=0
		createsprite(jump1framesprite,i)
		setspritesize(jump1framesprite,24,24)
		setspriteposition(jump1framesprite,framebasex#,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump2framesprite)=0
		createsprite(jump2framesprite,i)
		setspritesize(jump2framesprite,24,24)
		setspriteposition(jump2framesprite,framebasex#+framegap#,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump3framesprite)=0
		createsprite(jump3framesprite,i)
		setspritesize(jump3framesprite,24,24)
		setspriteposition(jump3framesprite,framebasex#+framegap#*2,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump4framesprite)=0
		createsprite(jump4framesprite,i)
		setspritesize(jump4framesprite,24,24)
		setspriteposition(jump4framesprite,framebasex#+framegap#*3,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump5framesprite)=0
		createsprite(jump5framesprite,i)
		setspritesize(jump5framesprite,24,24)
		setspriteposition(jump5framesprite,framebasex#+framegap#*4,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump6framesprite)=0
		createsprite(jump6framesprite,i)
		setspritesize(jump6framesprite,24,24)
		setspriteposition(jump6framesprite,framebasex#+framegap#*5,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump7framesprite)=0
		createsprite(jump7framesprite,i)
		setspritesize(jump7framesprite,24,24)
		setspriteposition(jump7framesprite,framebasex#+framegap#*6,framebasey#+framegap#*6)
	endif
	if getspriteexists(jump8framesprite)=0
		createsprite(jump8framesprite,i)
		setspritesize(jump8framesprite,24,24)
		setspriteposition(jump8framesprite,framebasex#+framegap#*7,framebasey#+framegap#*6)
	endif
	targetsprite=staticframesprite
	createsprite(locatorsprite,55)
	setspritecolor(locatorsprite,255,255,255,100)
	setspritetransparency(locatorsprite,1)
	setspritesize(locatorsprite,24,24)
	setspriteposition(locatorsprite,getspritex(targetsprite),getspritey(targetsprite))
	setspritedepth(locatorsprite,0)
	if gettextexists(1000)=0
		createmytext(0,1000,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#),25,255,0,0,"Static",0)
	endif	
	if gettextexists(1001)=0
		createmytext(0,1001,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#+framegap#),25,255,0,0,"Walking",0)
	endif
	if gettextexists(1002)=0
		createmytext(0,1002,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#+framegap#*2),25,255,0,0,"Running",0)
	endif
	if gettextexists(1003)=0
		createmytext(0,1003,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#+framegap#*3),25,255,0,0,"Swimming",0)
	endif
	if gettextexists(1004)=0
		createmytext(0,1004,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#+framegap#*4),25,255,0,0,"Flying",0)
	endif
	if gettextexists(1005)=0
		createmytext(0,1005,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#+framegap#*5 ),25,255,0,0,"Dying",0)
	endif
	if gettextexists(1006)=0
		createmytext(0,1006,worldtoscreenx(framebasex#)-140,worldtoscreeny(framebasey#+framegap#*6 ),25,255,0,0,"Jumping",0)
	endif
	setvirtualjoystickvisible(1,0)
	if getvirtualbuttonexists(2)=0
		 make_my_button(2,100,400,48,"Reset",255,0,0,255)
	endif
	mysprite[mypos].spriteanimframes[walkanimslot]=walkanimspeed
	mysprite[mypos].spriteanimframes[runanimslot]=runanimspeed
	mysprite[mypos].spriteanimframes[swimanimslot]=swimanimspeed
	mysprite[mypos].spriteanimframes[flyanimslot]=flyanimspeed
	mysprite[mypos].spriteanimframes[dieanimslot]=dieanimspeed
	mysprite[mypos].spriteanimframes[jumpanimslot]=jumpanimspeed
	repeat
		FillMouse(gridx,gridy)
		drawbox(1,1,790,599,255,0,0,0,0)
		print("               Animation Editor V1.0")
		if getrawkeypressed(KEY_p)
			quit=1
		endif
		if getrawkeypressed(KEY_Z)
			dec CurrentImage
			setspriteimage(cursorsprite,CurrentImage)
			checkrepeat(cursorsprite,texturerep,scalex,scaley)
		endif
		if getrawkeypressed(KEY_X)
			inc CurrentImage
			setspriteimage(cursorsprite,CurrentImage)
			checkrepeat(cursorsprite,texturerep,scalex,scaley)
		endif
		if doneset=0
			if getspritecollision(cursorsprite,targetsprite) and GetPointerReleased()
				print("ouch!!")
				setspriteimage(targetsprite,currentimage)
				mysprite[mypos].spriteanimframes[frameanimindex]=currentimage
				AddSpriteAnimationFrame( spriteid,currentimage)
				inc frameanimindex	
				inc targetsprite
				setspriteposition(locatorsprite,getspritex(targetsprite),getspritey(targetsprite))
				if targetsprite=run1framesprite and getspriteexists(walkpreviewsprite)=0
					createsprite(walkpreviewsprite,1)
					setspritesize(walkpreviewsprite,24,24)
					setspriteposition(walkpreviewsprite,framebasex#+framegap#*9,framebasey#+framegap#)
					for n=walkstartframe to walkendframe
						AddSpriteAnimationFrame(walkpreviewsprite,mysprite[mypos].spriteanimframes[n])
					next n
					PlaySprite(walkpreviewsprite,mysprite[mypos].spriteanimframes[walkanimslot],1,1,8)
				endif
				if targetsprite=swim1framesprite and getspriteexists(runpreviewsprite)=0
					createsprite(runpreviewsprite,1)
					setspritesize(runpreviewsprite,24,24)
					setspriteposition(runpreviewsprite,framebasex#+framegap#*9,framebasey#+framegap#*2)
					for n=runstartframe to runendframe
						AddSpriteAnimationFrame(runpreviewsprite,mysprite[mypos].spriteanimframes[n])
					next n
					PlaySprite(runpreviewsprite,mysprite[mypos].spriteanimframes[runanimslot],1,1,8)
				endif
				if targetsprite=fly1framesprite and getspriteexists(swimpreviewsprite)=0
					createsprite(swimpreviewsprite,1)
					setspritesize(swimpreviewsprite,24,24)
					setspriteposition(swimpreviewsprite,framebasex#+framegap#*9,framebasey#+framegap#*3)
					for n=swimstartframe to swimendframe
						AddSpriteAnimationFrame(swimpreviewsprite,mysprite[mypos].spriteanimframes[n])
					next n
					PlaySprite(swimpreviewsprite,mysprite[mypos].spriteanimframes[swimanimslot],1,1,8)
				endif
				if targetsprite=die1framesprite and getspriteexists(flypreviewsprite)=0
					createsprite(flypreviewsprite,1)
					setspritesize(flypreviewsprite,24,24)
					setspriteposition(flypreviewsprite,framebasex#+framegap#*9,framebasey#+framegap#*4)
					for n=flystartframe to flyendframe
						AddSpriteAnimationFrame(flypreviewsprite,mysprite[mypos].spriteanimframes[n])
					next n
					PlaySprite(flypreviewsprite,mysprite[mypos].spriteanimframes[dieanimslot],1,1,8)
				endif
				if targetsprite=jump1framesprite and getspriteexists(diepreviewsprite)=0
					createsprite(diepreviewsprite,1)
					setspritesize(diepreviewsprite,24,24)
					setspriteposition(diepreviewsprite,framebasex#+framegap#*9,framebasey#+framegap#*5)
					for n=diestartframe to dieendframe
						AddSpriteAnimationFrame(diepreviewsprite,mysprite[mypos].spriteanimframes[n])
					next n
					PlaySprite(diepreviewsprite,mysprite[mypos].spriteanimframes[jumpanimslot],1,1,8)
				endif
				if targetsprite>staticframesprite+48 and doneset=0
					if getspriteexists(jumppreviewsprite)=0
						createsprite(jumppreviewsprite,1)
						setspritesize(jumppreviewsprite,24,24)
						setspriteposition(jumppreviewsprite,framebasex#+framegap#*9,framebasey#+framegap#*6)
						for n=jumpstartframe to jumpendframe
							AddSpriteAnimationFrame(jumppreviewsprite,mysprite[mypos].spriteanimframes[n])
						next n
						PlaySprite(jumppreviewsprite,25,1,1,8)
					endif
					doneset=1
				endif			
			endif
		endif
		if GetVirtualButtonReleased(2)
			doneset=0
			targetsprite=staticframesprite
			setspriteposition(locatorsprite,getspritex(targetsprite),getspritey(targetsprite))
			for n=0 to maxanimframes
				mysprite[mypos].spriteanimframes[n]=0
			next n
			frameanimindex=1
			deletevirtualbutton(1)
			mysprite[mypos].hasanim=0
			if getspriteexists(walkpreviewsprite)=1
				deletesprite(walkpreviewsprite)
			endif
			if getspriteexists(runpreviewsprite)=1
				deletesprite(runpreviewsprite)
			endif
			if getspriteexists(swimpreviewsprite)=1
				deletesprite(swimpreviewsprite)
			endif
			if getspriteexists(flypreviewsprite)=1
				deletesprite(flypreviewsprite)
			endif
			if getspriteexists(diepreviewsprite)=1
				deletesprite(diepreviewsprite)
			endif
			if getspriteexists(jumppreviewsprite)=1
				deletesprite(jumppreviewsprite)
			endif
		endif
		if doneset=1
			if getvirtualbuttonexists(1)=0
				make_my_button(1,100,100,48,"Save",255,0,0,255)
			endif
		endif
		if getvirtualbuttonpressed(1)
			mysprite[mypos].hasanim=1
		endif
		setviewoffset(scrollx#,scrolly#)	
		print(str(targetsprite))
		setspriteposition(CursorSprite,Mouse.x3,Mouse.y3)
		sync()
	until quit=1
	if mysprite[mypos].hasanim=0
		for n=1 to 15
			mysprite[mypos].spriteanimframes[n]=0
		next n
	endif
	if mysprite[mypos].hasanim=1
		select mysprite[mypos].state
			case staticstate
				PlaySprite(spriteid,25,1,1,1)
			endcase
			case walkingstate
				PlaySprite(spriteid,25,1,walkstartframe,walkendframe)
			endcase
			case runningstate
				PlaySprite(spriteid,25,1,runstartframe,runendframe)
			endcase
			case swimmingstate
				PlaySprite(spriteid,25,1,swimstartframe,swimendframe)
			endcase
			case flyingstate
				PlaySprite(spriteid,25,1,flystartframe,flyendframe)
			endcase
			case dyingstate
				PlaySprite(spriteid,25,1,diestartframe,dieendframe)
			endcase
			case jumpingstate
				PlaySprite(spriteid,25,1,jumpstartframe,jumpendframe)
			endcase
		endselect				 
	endif
	setspritecolor(mysprite[mypos].spritenumber,mysprite[mypos].red,mysprite[mypos].blue,mysprite[mypos].green,255)
	mysprite[mypos].selected=0
	spriteselected=0
	//host=0
	frameanimindex=1
	doneset=0
	setspritevisible(cursorsprite,1)
	DeleteVirtualButton(1)
	DeleteVirtualButton(2)
	if getspriteexists(staticframesprite)=1
		deletesprite(staticframesprite)
	endif	
	if getspriteexists(walk1framesprite)=1
	deletesprite(walk1framesprite)
	endif
	if getspriteexists(walk2framesprite)=1
		deletesprite(walk2framesprite)
	endif
	if getspriteexists(walk3framesprite)=1
		deletesprite(walk3framesprite)
	endif
	if getspriteexists(walk4framesprite)=1
		deletesprite(walk4framesprite)
	endif
	if getspriteexists(walk5framesprite)=1
		deletesprite(walk5framesprite)
	endif
	if getspriteexists(walk6framesprite)=1
		deletesprite(walk6framesprite)
	endif
	if getspriteexists(walk7framesprite)=1
		deletesprite(walk7framesprite)
	endif
	if getspriteexists(walk8framesprite)=1
		deletesprite(walk8framesprite)
	endif
	if getspriteexists(run1framesprite)=1
	deletesprite(run1framesprite)
	endif
	if getspriteexists(run2framesprite)=1
		deletesprite(run2framesprite)
	endif
	if getspriteexists(run3framesprite)=1
		deletesprite(run3framesprite)
	endif
	if getspriteexists(run4framesprite)=1
		deletesprite(run4framesprite)
	endif
	if getspriteexists(run5framesprite)=1
		deletesprite(run5framesprite)
	endif
	if getspriteexists(run6framesprite)=1
		deletesprite(run6framesprite)
	endif
	if getspriteexists(run7framesprite)=1
		deletesprite(run7framesprite)
	endif
	if getspriteexists(run8framesprite)=1
		deletesprite(run8framesprite)
	endif
	if getspriteexists(swim1framesprite)=1
	deletesprite(swim1framesprite)
	endif
	if getspriteexists(swim2framesprite)=1
		deletesprite(swim2framesprite)
	endif
	if getspriteexists(swim3framesprite)=1
		deletesprite(swim3framesprite)
	endif
	if getspriteexists(swim4framesprite)=1
		deletesprite(swim4framesprite)
	endif
	if getspriteexists(swim5framesprite)=1
		deletesprite(swim5framesprite)
	endif
	if getspriteexists(swim6framesprite)=1
		deletesprite(swim6framesprite)
	endif
	if getspriteexists(swim7framesprite)=1
		deletesprite(swim7framesprite)
	endif
	if getspriteexists(swim8framesprite)=1
		deletesprite(swim8framesprite)
	endif
	if getspriteexists(fly1framesprite)=1
	deletesprite(fly1framesprite)
	endif
	if getspriteexists(fly2framesprite)=1
		deletesprite(fly2framesprite)
	endif
	if getspriteexists(fly3framesprite)=1
		deletesprite(fly3framesprite)
	endif
	if getspriteexists(fly4framesprite)=1
		deletesprite(fly4framesprite)
	endif
	if getspriteexists(fly5framesprite)=1
		deletesprite(fly5framesprite)
	endif
	if getspriteexists(fly6framesprite)=1
		deletesprite(fly6framesprite)
	endif
	if getspriteexists(fly7framesprite)=1
		deletesprite(fly7framesprite)
	endif
	if getspriteexists(fly8framesprite)=1
		deletesprite(fly8framesprite)
	endif
	if getspriteexists(die1framesprite)=1
	deletesprite(die1framesprite)
	endif
	if getspriteexists(die2framesprite)=1
		deletesprite(die2framesprite)
	endif
	if getspriteexists(die3framesprite)=1
		deletesprite(die3framesprite)
	endif
	if getspriteexists(die4framesprite)=1
		deletesprite(die4framesprite)
	endif
	if getspriteexists(die5framesprite)=1
		deletesprite(die5framesprite)
	endif
	if getspriteexists(die6framesprite)=1
		deletesprite(die6framesprite)
	endif
	if getspriteexists(die7framesprite)=1
		deletesprite(die7framesprite)
	endif
	if getspriteexists(die8framesprite)=1
		deletesprite(die8framesprite)
	endif
	if getspriteexists(jump1framesprite)=1
	deletesprite(jump1framesprite)
	endif
	if getspriteexists(jump2framesprite)=1
		deletesprite(jump2framesprite)
	endif
	if getspriteexists(jump3framesprite)=1
		deletesprite(jump3framesprite)
	endif
	if getspriteexists(jump4framesprite)=1
		deletesprite(jump4framesprite)
	endif
	if getspriteexists(jump5framesprite)=1
		deletesprite(jump5framesprite)
	endif
	if getspriteexists(jump6framesprite)=1
		deletesprite(jump6framesprite)
	endif
	if getspriteexists(jump7framesprite)=1
		deletesprite(jump7framesprite)
	endif
	if getspriteexists(jump8framesprite)=1
		deletesprite(jump8framesprite)
	endif
	if getspriteexists(locatorsprite)=1
		deletesprite(locatorsprite)
	endif
	if getspriteexists(walkpreviewsprite)=1
		deletesprite(walkpreviewsprite)
	endif
	if getspriteexists(runpreviewsprite)=1
		deletesprite(runpreviewsprite)
	endif
	if getspriteexists(swimpreviewsprite)=1
		deletesprite(swimpreviewsprite)
	endif
	if getspriteexists(flypreviewsprite)=1
		deletesprite(flypreviewsprite)
	endif
	if getspriteexists(diepreviewsprite)=1
		deletesprite(diepreviewsprite)
	endif
	if getspriteexists(jumppreviewsprite)=1
		deletesprite(jumppreviewsprite)
	endif
	deletetext(1000)
	deletetext(1001)
	deletetext(1002)
	deletetext(1003)
	deletetext(1004)
	deletetext(1005)
	deletetext(1006)
	setvirtualjoystickvisible(1,1)
	quit=0
	show_all()
	//setviewoffset(,getspriteybyoffset(mysprite[mypos].spritenumber))
	sync()
	mypos=0
	//load_level(level)
endfunction
function control_spawnpoints()
	for n=1 to spawnpointer
		//print(str(spawn[n].count))
		spawnID=spawn[n].spriteID
		if getspriteexists(spawnID)
			inc spawn[n].tick
			if spawn[n].tick>spawn[n].delay and spawn[n].ammo>0
				spawn[n].tick=0
				dec spawn[n].ammo
				make_baddie(1,n,1,getspritex(spawnID),getspritey(spawnID),spawnID)
			endif
		endif
	next n
endfunction
function make_baddie(c,n,shoot,xc#,yc#,spwid)	
	id4=createsprite(10)
	SetSpriteColor(id4,255,255,255,255)
	setspritesize(id4,32,32)
	setspritescale(id4,0.9,0.9)
	setspriteshape(id4,3)
	setspriteposition(id4,xc#,yc#)
	setspritegroup(id4,baddiegroup)
	setspritephysicson(id4,2)
	baddie[baddiepointer].spriteID=id4
	baddie[baddiepointer].spawnid=n
	baddie[baddiepointer].tilevalue2=1
	baddie[baddiepointer].aitype=2
	baddie[baddiepointer].baddiespeed#=80
	baddie[baddiepointer].movspd#=50
	baddie[baddiepointer].movspd2#=50
	baddie[baddiepointer].seeingdistance#=250
	inc baddiepointer
endfunction
function make_bullet(sprid,px#,py#,thrust,angle#)
	if bulletpointer<maxbullets
		idbullet=createsprite(10)
		inc bulletpointer
	endif
endfunction 
function wrap180( v as float )
    while v>180
        v = v-360
    endwhile
    while v<-180
        v = v+360
    endwhile
endfunction v
Function prep_objects()
	AddVirtualJoystick(2,400,400,50)
	oldx#=scrollx#
	oldy#=scrolly#
	select gametype
		case 0
			//zoom#=1.7
		endcase
	endselect
	for n=1 to maxsprites
		if mysprite[n].spritenumber>0 
			setspritevisible(mysprite[n].spritenumber,mysprite[n].visibility)
			setspritegroup(mysprite[n].spritenumber,mysprite[n].groupnumber)			
			//setspitephysicsmass(mysprite[n].spritenumber,10)
			setspritecolor(mysprite[n].spritenumber,mysprite[n].red,mysprite[n].green,mysprite[n].blue,255)
//* Turn on the physics
			if mysprite[n].physicstype>0
				if mysprite[n].groupnumber=1
					playersprite=mysprite[n].spritenumber
					//setspriteoffset(playersprite,0+getspritewidth(playersprite)/2,0+getspriteheight(playersprite))
				endif
				SetSpritePhysicsOn ( mysprite[n].spritenumber, mysprite[n].physicstype )
				SetSpritePhysicsFriction(mysprite[n].spritenumber,mysprite[n].friction#)
				SetSpritePhysicsRestitution(mysprite[n].spritenumber,mysprite[n].restitution#)
				setspriteshape(mysprite[n].spritenumber,mysprite[n].shape)
				SetSpritePhysicsCanRotate(mysprite[n].spritenumber,mysprite[n].canrotate)
				//setspritephysicsmass(mysprite[n].spritenumber,8)
			endif
//* if teleporter set to physics sensor
			if mysprite[n].tilevalue =69
				scrollsprite=mysprite[n].spritenumber
				scrollspeed#=mysprite[n].speed#
			endif
			if mysprite[n].groupnumber=teleportergroup
				SetSpritePhysicsIsSensor(mysprite[n].spritenumber,1)
			endif
			if mysprite[n].groupnumber=0
				if mysprite[n].tilevalue=1
					//scrollspriteleft=mysprite[n].spritenumber
					//SetSpritePhysicsIsSensor(mysprite[n].spritenumber,1)
				endif
			endif
			if mysprite[n].groupnumber=5
				leftmarkerid=mysprite[n].spritenumber
				SetSpritePhysicsIsSensor(mysprite[n].spritenumber,1)
			endif
			if mysprite[n].groupnumber=4
				rightmarkerid=mysprite[n].spritenumber
				SetSpritePhysicsIsSensor(mysprite[n].spritenumber,1)
			endif
//* this is the player so set up			
			if mysprite[n].groupnumber=1
				setspriteshape(playersprite,mysprite[n].shape)
				setspritedepth(playersprite,0)
				//setspritescale(playersprite,0.7,0.7)
				//setspriteoffset(playersprite,0+getspritewidth(playersprite)/2,0+getspriteheight(playersprite))
				//SetSpritePhysicsDamping(playersprite,0.3)	
				//SetSpritePhysicsmass(playersprite,100)
				setspritevisible(playersprite,1)
				setspritescale(playersprite,0.8,0.8)
				//SetSpritePhysicsIsSensor(playersprite,1)
				player[playerpointer].id=mysprite[n].spritenumber
				player[playerpointer].movespeed#=mysprite[n].speed#
				player[playerpointer].jumpspeed=mysprite[n].jumpspeed
				startx#=mysprite[n].xp#
				starty#=mysprite[n].yp#	
			endif
//* Baddies get stored
			if mysprite[n].groupnumber=baddiegroup
				baddie[baddiepointer].spriteID=mysprite[n].spritenumber
				baddie[baddiepointer].tilevalue=mysprite[n].tilevalue
				baddie[baddiepointer].tilevalue2=mysprite[n].tilevalue2
				baddie[baddiepointer].baddiespeed#=mysprite[n].speed#
				baddie[baddiepointer].seeingdistance#=mysprite[n].seeingdistance#
				baddie[baddiepointer].negbaddiespeed#=mysprite[n].tilevalue2
				baddie[baddiepointer].red=mysprite[n].red
				baddie[baddiepointer].green=mysprite[n].green
				baddie[baddiepointer].blue=mysprite[n].blue
				baddie[baddiepointer].oldx#=mysprite[n].xp#
				baddie[baddiepointer].oldy#=mysprite[n].yp#
				baddie[baddiepointer].ammo=mysprite[n].ammo
				baddie[baddiepointer].delay=mysprite[n].delay
				baddie[baddiepointer].aitype=mysprite[n].aitype
				baddie[baddiepointer].movspd#=50
				baddie[baddiepointer].movspd2#=50
				baddie[baddiepointer].health=mysprite[n].health
				inc baddiepointer
			endif
//* if collect set to physics sensor				
			if mysprite[n].groupnumber=collectgroup
				SetSpritePhysicsIsSensor(mysprite[n].spritenumber,1)
			endif
//* spawners setup
			if mysprite[n].groupnumber=spawngroup
				inc spawnpointer
				spawn[spawnpointer].spriteID=mysprite[n].spritenumber
				spawn[spawnpointer].tilevalue=mysprite[n].tilevalue
				spawn[spawnpointer].tilevalue2=mysprite[n].tilevalue2
				spawn[spawnpointer].spawnspeed#=mysprite[n].speed#
				spawn[spawnpointer].negspawnspeed#=mysprite[n].negspeed#
				spawn[spawnpointer].red=mysprite[n].red
				spawn[spawnpointer].green=mysprite[n].green
				spawn[spawnpointer].blue=mysprite[n].blue
				spawn[spawnpointer].oldx#=mysprite[n].xp#
				spawn[spawnpointer].oldy#=mysprite[n].yp#
				spawn[spawnpointer].ammo=mysprite[n].ammo
				spawn[spawnpointer].delay=mysprite[n].delay
				//baddie[baddiepointer].oldspeed#=baddie[baddiepointer].baddiespeed#
				//SetSpritePhysicsRestitution(baddie[baddiepointer].spriteID,0.9)
				setspritephysicscanrotate(spawn[spawnpointer].spriteID,0)
				SetSpritePhysicsmass(spawn[spawnpointer].spriteID,0)
				//SetSpritePhysicsIsSensor(spawn[spawnpointer].spriteID,1)	
			endif
			if mysprite[n].tilevalue=2
				scrollspriteright=mysprite[n].spritenumber
				SetSpritePhysicsIsSensor(mysprite[n].spritenumber,1)
			endif
		endif
	next n	
	bindex2=baddiepointer
	setviewoffset(getspritex(scrollsprite)-200+zoom#*30,getspritey(scrollsprite)-200)
endfunction
//*** Returns the angle of rotation required to ***
//*** have a sprite point in the direction of ***
//*** (x_new, y_new) when currently positioned ***
//*** at (x_old, y_old). Result -180 to +180. ***
function CalculateSpriteAngle(x_old as float, y_old as float,x_new as float, y_new as float)
	x_move as float
	y_move as float
	aspect as float
	//*** Calculate move required in x and y directions ***
	x_move = x_new - x_old
	y_move = y_new - y_old
	//*** Calculate the screen’s aspect ratio ***
	aspect = 800/600*1.0
	//*** Calculate the angle of rotation needed ***
	angle = ATan2(y_move/aspect, x_move)
	//*** Return angle ***
endfunction angle
function checkplayerstat(SPRID,xp#,yp#,MODE,xoff#,yoff#)
	select mode
		case 1	
			newxp#=GetSpriteX(SPRID)
			newyp#=GetSpritey(SPRID)
			contact= getspritehit(xp#,yp#)
		endcase
		case 0
			newxp#=GetSpriteX(playersprite)
			newyp#=GetSpritey(playersprite)
			contact= spriteraycast(xp#+xoff#,yp#+yoff#,newxp#+xoff#,newyp#+yoff#*2)
		endcase
	endselect	
	//*** Display result of raycast *** 
	print(Str(contact))
	if contact = 1 
		//*** Get ID of sprite
		select mode
			case 1 
				id = Getspritecontactspriteid2()
			endcase
			case 0
				id=getraycastspriteid()
				if getspritegroup(id)=8
					print("DEAD!!")
				endif
			endcase
		endselect
	endif	
endfunction id
function after_run_cleanup()
	for n=1 to maxsprites
		SetSpritePhysicsOff(mysprite[n].spritenumber)
		SetSpritePosition(mysprite[n].spritenumber,mysprite[n].xp#,mysprite[n].yp#)
		setspriteangle(mysprite[n].spritenumber,mysprite[n].angle)
	next n
	for n=0 to baddiepointer
		if getspriteexists(baddie[n].spriteid)
			//deletesprite(baddie[n].spriteid)
		endif
	next n
	//Setviewzoom(2.0)
	//setviewoffset(scrollx#+getdeviceheight()/2+zoom#*30,scrolly#)
	//DeleteVirtualButton(3)
	falltime=0
	baddiepointer=1
	score=0
	myquit=0
	fired=0
	show_all()
	for n=1001 to 1004
		SetTextVisible(n,1)
	next n
	for n =1 to maxsprites
		SetSpriteVisible(mysprite[n].spritenumber,1)
		SetSpritePhysicsIsSensor(mysprite[n].spritenumber,0)
	next
	//setviewoffset(oldx#,oldy#)
	deletesprite(realplayer)
	deletetext(2000)
	setspritevisible(cursorsprite,1)
	setspritevisible(playersprite,1)
	SetTextVisible(229,1)
	setspritescale(playersprite,1.0,1.0)
	bindex2=0
	bulletindex=0
	bulletpointer=0
	dm=0
	sync()
endfunction
