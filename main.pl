:- [pokemon,region,color,figura,tipo,pokedex_gui,clasificacion,
	transformacion,peso,botones,preguntas,sprites,evolucion].
:- style_check(-singleton).
:- use_module(library(pce)).
:- pce_image_directory('./imagenes/').

resource(fondo_inicio, image, image('fondo_inicio.jpg')).
resource(logo, image, image('pokemon.jpg')).
resource(fondo_pokedex, image, image('fondo_pokedex.jpg')).
resource(fondo_resultado, image, image('fondo_resultado.jpg')).

jugar:-
	new(Ventana_Jugar,dialog('Pokemon')),
	send(Ventana_Jugar,size,size(960,540)),
	inicio(Ventana_Jugar).

inicio(Ventana_Jugar):-	
	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_inicio),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Logo, figure),
	new(Bitmap_Logo, bitmap(resource(logo),@on)),
	send(Bitmap_Logo, name, 1),
	send(Logo, display, Bitmap_Logo),
	send(Logo, status, 1),

	new(Bitmap_Jugar, bitmap(resource(jugar),@on)),
	send(Bitmap_Jugar, name, 1),

	new(Button_Jugar,button(button1)),
	send(Button_Jugar,label,Bitmap_Jugar),
	send(Button_Jugar,message,message(@prolog,pregunta_pokedex,Ventana_Jugar)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Logo,point(160,10)),
	send(Ventana_Jugar,display,Button_Jugar,point(350,400)),
	send(Ventana_Jugar,open).

pregunta_pokedex(Ventana_Jugar):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(pokedex_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Busca, bitmap(resource(busca),@on)),
	send(Bitmap_Busca, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(TI_Pokedex,int_item('Pokedex No.',0)),
	send(TI_Pokedex,length,5),

	new(Button_Busca,button(button1)),
	send(Button_Busca,label,Bitmap_Busca),
	send(Button_Busca,message,message(@prolog,pregunta_trans_dex,
		Ventana_Jugar,TI_Pokedex)),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_class,
		Ventana_Jugar)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(25,100)),
	send(Ventana_Jugar,display,TI_Pokedex,point(400,300)),
	send(Ventana_Jugar,display,Button_Busca,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_class(Ventana_Jugar):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(class_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Button_Lege,button('Legendario')),
	send(Button_Lege,message,message(@prolog,pregunta_trans_class,
		Ventana_Jugar,'Lege')),
	send(Button_Lege,font,font(screen, bold, 20)),

	new(Button_Sing,button('Singular')),
	send(Button_Sing,message,message(@prolog,pregunta_trans_class,
		Ventana_Jugar,'Sing')),
	send(Button_Sing,font,font(screen, bold, 20)),

	new(Button_Ultra,button('Ultraente')),
	send(Button_Ultra,message,message(@prolog,pregunta_trans_class,
		Ventana_Jugar,'Ultra')),
	send(Button_Ultra,font,font(screen, bold, 20)),

	new(Button_Regu,button('Regular')),
	send(Button_Regu,message,message(@prolog,pregunta_trans_class,
		Ventana_Jugar,'Regu')),
	send(Button_Regu,font,font(screen, bold, 20)),

	new(Button_Nose,button('No se')),
	send(Button_Nose,message,message(@prolog,pregunta_trans_class,
		Ventana_Jugar,'No se')),
	send(Button_Nose,font,font(screen, bold, 20)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(150,100)),
	send(Ventana_Jugar,display,Button_Lege,point(350,350)),
	send(Ventana_Jugar,display,Button_Sing,point(550,350)),
	send(Ventana_Jugar,display,Button_Ultra,point(250,400)),
	send(Ventana_Jugar,display,Button_Regu,point(465,400)),
	send(Ventana_Jugar,display,Button_Nose,point(650,400)).

pregunta_trans_dex(Ventana_Jugar,TI_Old):-
	get(TI_Old,value,Pokedex),

	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(trans_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,search,
		Ventana_Jugar,Pokedex,'No se','Si','No se','No se',
		'No se','No se','No se','No se','No se',
		'Nada','Nada','Nada','Nada')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,search,
		Ventana_Jugar,Pokedex,'No se','No','No se','No se',
		'No se','No se','No se','No se','No se',
		'Nada','Nada','Nada','Nada')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(200,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_trans_class(Ventana_Jugar,Cl):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(trans_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_region,
		Ventana_Jugar,Cl,'Si')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_region,
		Ventana_Jugar,Cl,'No')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(200,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_region(Ventana_Jugar,Cl,Tr):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(region_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Button_Kanto,button('Kanto')),
	send(Button_Kanto,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Kanto')),
	send(Button_Kanto,font,font(screen, bold, 20)),

	new(Button_Johto,button('Johto')),
	send(Button_Johto,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Johto')),
	send(Button_Johto,font,font(screen, bold, 20)),

	new(Button_Hoenn,button('Hoenn')),
	send(Button_Hoenn,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Hoenn')),
	send(Button_Hoenn,font,font(screen, bold, 20)),

	new(Button_Sinnoh,button('Sinnoh')),
	send(Button_Sinnoh,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Sinnoh')),
	send(Button_Sinnoh,font,font(screen, bold, 20)),

	new(Button_Unova,button('Unova')),
	send(Button_Unova,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Unova')),
	send(Button_Unova,font,font(screen, bold, 20)),

	new(Button_Kalos,button('Kalos')),
	send(Button_Kalos,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Kalos')),
	send(Button_Kalos,font,font(screen, bold, 20)),

	new(Button_Alola,button('Alola')),
	send(Button_Alola,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'Alola')),
	send(Button_Alola,font,font(screen, bold, 20)),

	new(Button_Nose,button('No se')),
	send(Button_Nose,message,message(@prolog,pregunta_color,
		Ventana_Jugar,Cl,Tr,'No se')),
	send(Button_Nose,font,font(screen, bold, 20)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(100,100)),
	send(Ventana_Jugar,display,Button_Kanto,point(150,350)),
	send(Ventana_Jugar,display,Button_Johto,point(350,350)),
	send(Ventana_Jugar,display,Button_Hoenn,point(550,350)),
	send(Ventana_Jugar,display,Button_Sinnoh,point(750,350)),
	send(Ventana_Jugar,display,Button_Unova,point(150,400)),
	send(Ventana_Jugar,display,Button_Kalos,point(350,400)),
	send(Ventana_Jugar,display,Button_Alola,point(550,400)),
	send(Ventana_Jugar,display,Button_Nose,point(750,400)).

pregunta_color(Ventana_Jugar,Cl,Tr,R):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(color_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Rojo, bitmap(resource(rojo),@on)),
	send(Bitmap_Rojo, name, 1),

	new(Bitmap_Azul, bitmap(resource(azul),@on)),
	send(Bitmap_Azul, name, 1),

	new(Bitmap_Amarillo, bitmap(resource(amarillo),@on)),
	send(Bitmap_Amarillo, name, 1),

	new(Bitmap_Verde, bitmap(resource(verde),@on)),
	send(Bitmap_Verde, name, 1),

	new(Bitmap_Negro, bitmap(resource(negro),@on)),
	send(Bitmap_Negro, name, 1),

	new(Bitmap_Cafe, bitmap(resource(cafe),@on)),
	send(Bitmap_Cafe, name, 1),

	new(Bitmap_Morado, bitmap(resource(morado),@on)),
	send(Bitmap_Morado, name, 1),

	new(Bitmap_Gris, bitmap(resource(gris),@on)),
	send(Bitmap_Gris, name, 1),

	new(Bitmap_Blanco, bitmap(resource(blanco),@on)),
	send(Bitmap_Blanco, name, 1),

	new(Bitmap_Rosa, bitmap(resource(rosa),@on)),
	send(Bitmap_Rosa, name, 1),

	new(Bitmap_Nose, bitmap(resource(idk),@on)),
	send(Bitmap_Nose, name, 1),

	new(Bitmap_Naranja, bitmap(resource(naranja),@on)),
	send(Bitmap_Naranja, name, 1),

	new(Bitmap_Beige, bitmap(resource(beige),@on)),
	send(Bitmap_Beige, name, 1),

	new(Button_Rojo,button(button1)),
	send(Button_Rojo,label,Bitmap_Rojo),
	send(Button_Rojo,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Rojo')),

	new(Button_Azul,button(button1)),
	send(Button_Azul,label,Bitmap_Azul),
	send(Button_Azul,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Azul')),

	new(Button_Amarillo,button(button1)),
	send(Button_Amarillo,label,Bitmap_Amarillo),
	send(Button_Amarillo,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Amarillo')),

	new(Button_Verde,button(button1)),
	send(Button_Verde,label,Bitmap_Verde),
	send(Button_Verde,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Verde')),

	new(Button_Negro,button(button1)),
	send(Button_Negro,label,Bitmap_Negro),
	send(Button_Negro,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Negro')),

	new(Button_Cafe,button(button1)),
	send(Button_Cafe,label,Bitmap_Cafe),
	send(Button_Cafe,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Cafe')),

	new(Button_Morado,button(button1)),
	send(Button_Morado,label,Bitmap_Morado),
	send(Button_Morado,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Morado')),

	new(Button_Gris,button(button1)),
	send(Button_Gris,label,Bitmap_Gris),
	send(Button_Gris,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Gris')),

	new(Button_Blanco,button(button1)),
	send(Button_Blanco,label,Bitmap_Blanco),
	send(Button_Blanco,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Blanco')),

	new(Button_Rosa,button(button1)),
	send(Button_Rosa,label,Bitmap_Rosa),
	send(Button_Rosa,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Rosa')),

	new(Button_Naranja,button(button1)),
	send(Button_Naranja,label,Bitmap_Naranja),
	send(Button_Naranja,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Naranja')),

	new(Button_Beige,button(button1)),
	send(Button_Beige,label,Bitmap_Beige),
	send(Button_Beige,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'Beige')),

	new(Button_Nose,button(button1)),
	send(Button_Nose,label,Bitmap_Nose),
	send(Button_Nose,message,message(@prolog,pregunta_tipo1,
		Ventana_Jugar,Cl,Tr,R,'No se')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(100,100)),
	send(Ventana_Jugar,display,Button_Rojo,point(150,350)),
	send(Ventana_Jugar,display,Button_Azul,point(300,350)),
	send(Ventana_Jugar,display,Button_Amarillo,point(450,350)),
	send(Ventana_Jugar,display,Button_Verde,point(600,350)),
	send(Ventana_Jugar,display,Button_Negro,point(750,350)),
	send(Ventana_Jugar,display,Button_Cafe,point(150,400)),
	send(Ventana_Jugar,display,Button_Morado,point(300,400)),
	send(Ventana_Jugar,display,Button_Gris,point(450,400)),
	send(Ventana_Jugar,display,Button_Blanco,point(600,400)),
	send(Ventana_Jugar,display,Button_Rosa,point(750,400)),
	send(Ventana_Jugar,display,Button_Naranja,point(300,450)),
	send(Ventana_Jugar,display,Button_Beige,point(450,450)),
	send(Ventana_Jugar,display,Button_Nose,point(600,450)).

pregunta_tipo1(Ventana_Jugar,Cl,Tr,R,C):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(tipo1_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Acero, bitmap(resource(acero),@on)),
	send(Bitmap_Acero, name, 1),

	new(Button_Acero,button(button1)),
	send(Button_Acero,label,Bitmap_Acero),
	send(Button_Acero,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Acero')),

	new(Bitmap_Agua, bitmap(resource(agua),@on)),
	send(Bitmap_Agua, name, 1),

	new(Button_Agua,button(button1)),
	send(Button_Agua,label,Bitmap_Agua),
	send(Button_Agua,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Agua')),

	new(Bitmap_Bicho, bitmap(resource(bicho),@on)),
	send(Bitmap_Bicho, name, 1),

	new(Button_Bicho,button(button1)),
	send(Button_Bicho,label,Bitmap_Bicho),
	send(Button_Bicho,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Bicho')),

	new(Bitmap_Dragon, bitmap(resource(dragon),@on)),
	send(Bitmap_Dragon, name, 1),

	new(Button_Dragon,button(button1)),
	send(Button_Dragon,label,Bitmap_Dragon),
	send(Button_Dragon,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Dragon')),

	new(Bitmap_Electrico, bitmap(resource(electrico),@on)),
	send(Bitmap_Electrico, name, 1),

	new(Button_Electrico,button(button1)),
	send(Button_Electrico,label,Bitmap_Electrico),
	send(Button_Electrico,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Electrico')),

	new(Bitmap_Fantasma, bitmap(resource(fantasma),@on)),
	send(Bitmap_Fantasma, name, 1),

	new(Button_Fantasma,button(button1)),
	send(Button_Fantasma,label,Bitmap_Fantasma),
	send(Button_Fantasma,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Fantasma')),

	new(Bitmap_Fuego, bitmap(resource(fuego),@on)),
	send(Bitmap_Fuego, name, 1),

	new(Button_Fuego,button(button1)),
	send(Button_Fuego,label,Bitmap_Fuego),
	send(Button_Fuego,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Fuego')),

	new(Bitmap_Hada, bitmap(resource(hada),@on)),
	send(Bitmap_Hada, name, 1),

	new(Button_Hada,button(button1)),
	send(Button_Hada,label,Bitmap_Hada),
	send(Button_Hada,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Hada')),

	new(Bitmap_Hielo, bitmap(resource(hielo),@on)),
	send(Bitmap_Hielo, name, 1),

	new(Button_Hielo,button(button1)),
	send(Button_Hielo,label,Bitmap_Hielo),
	send(Button_Hielo,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Hielo')),

	new(Bitmap_Lucha, bitmap(resource(lucha),@on)),
	send(Bitmap_Lucha, name, 1),

	new(Button_Lucha,button(button1)),
	send(Button_Lucha,label,Bitmap_Lucha),
	send(Button_Lucha,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Lucha')),

	new(Bitmap_Normal, bitmap(resource(normal),@on)),
	send(Bitmap_Normal, name, 1),

	new(Button_Normal,button(button1)),
	send(Button_Normal,label,Bitmap_Normal),
	send(Button_Normal,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Normal')),

	new(Bitmap_Planta, bitmap(resource(planta),@on)),
	send(Bitmap_Planta, name, 1),

	new(Button_Planta,button(button1)),
	send(Button_Planta,label,Bitmap_Planta),
	send(Button_Planta,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Planta')),

	new(Bitmap_Psiquico, bitmap(resource(psiquico),@on)),
	send(Bitmap_Psiquico, name, 1),

	new(Button_Psiquico,button(button1)),
	send(Button_Psiquico,label,Bitmap_Psiquico),
	send(Button_Psiquico,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Psiquico')),

	new(Bitmap_Roca, bitmap(resource(roca),@on)),
	send(Bitmap_Roca, name, 1),

	new(Button_Roca,button(button1)),
	send(Button_Roca,label,Bitmap_Roca),
	send(Button_Roca,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Roca')),

	new(Bitmap_Siniestro, bitmap(resource(siniestro),@on)),
	send(Bitmap_Siniestro, name, 1),

	new(Button_Siniestro,button(button1)),
	send(Button_Siniestro,label,Bitmap_Siniestro),
	send(Button_Siniestro,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Siniestro')),

	new(Bitmap_Tierra, bitmap(resource(tierra),@on)),
	send(Bitmap_Tierra, name, 1),

	new(Button_Tierra,button(button1)),
	send(Button_Tierra,label,Bitmap_Tierra),
	send(Button_Tierra,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Tierra')),

	new(Bitmap_Veneno, bitmap(resource(veneno),@on)),
	send(Bitmap_Veneno, name, 1),

	new(Button_Veneno,button(button1)),
	send(Button_Veneno,label,Bitmap_Veneno),
	send(Button_Veneno,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Veneno')),

	new(Bitmap_Volador, bitmap(resource(volador),@on)),
	send(Bitmap_Volador, name, 1),

	new(Button_Volador,button(button1)),
	send(Button_Volador,label,Bitmap_Volador),
	send(Button_Volador,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'Volador')),

	new(Bitmap_Nose, bitmap(resource(idk),@on)),
	send(Bitmap_Nose, name, 1),

	new(Button_Nose,button(button1)),
	send(Button_Nose,label,Bitmap_Nose),
	send(Button_Nose,message,message(@prolog,pregunta_tipo2,
		Ventana_Jugar,Cl,Tr,R,C,'No se')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(125,100)),
	send(Ventana_Jugar,display,Button_Acero,point(125,300)),
	send(Ventana_Jugar,display,Button_Agua,point(250,300)),
	send(Ventana_Jugar,display,Button_Bicho,point(375,300)),
	send(Ventana_Jugar,display,Button_Dragon,point(500,300)),
	send(Ventana_Jugar,display,Button_Electrico,point(625,300)),
	send(Ventana_Jugar,display,Button_Fantasma,point(125,350)),
	send(Ventana_Jugar,display,Button_Fuego,point(250,350)),
	send(Ventana_Jugar,display,Button_Hada,point(375,350)),
	send(Ventana_Jugar,display,Button_Hielo,point(500,350)),
	send(Ventana_Jugar,display,Button_Lucha,point(625,350)),
	send(Ventana_Jugar,display,Button_Normal,point(750,350)),
	send(Ventana_Jugar,display,Button_Planta,point(125,400)),
	send(Ventana_Jugar,display,Button_Psiquico,point(250,400)),
	send(Ventana_Jugar,display,Button_Roca,point(375,400)),
	send(Ventana_Jugar,display,Button_Siniestro,point(500,400)),
	send(Ventana_Jugar,display,Button_Tierra,point(625,400)),
	send(Ventana_Jugar,display,Button_Veneno,point(750,400)),
	send(Ventana_Jugar,display,Button_Volador,point(375,450)),
	send(Ventana_Jugar,display,Button_Nose,point(500,450)).

pregunta_tipo2(Ventana_Jugar,Cl,Tr,R,C,T1):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(tipo2_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Acero, bitmap(resource(acero),@on)),
	send(Bitmap_Acero, name, 1),

	new(Button_Acero,button(button1)),
	send(Button_Acero,label,Bitmap_Acero),
	send(Button_Acero,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Acero')),

	new(Bitmap_Agua, bitmap(resource(agua),@on)),
	send(Bitmap_Agua, name, 1),

	new(Button_Agua,button(button1)),
	send(Button_Agua,label,Bitmap_Agua),
	send(Button_Agua,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Agua')),

	new(Bitmap_Bicho, bitmap(resource(bicho),@on)),
	send(Bitmap_Bicho, name, 1),

	new(Button_Bicho,button(button1)),
	send(Button_Bicho,label,Bitmap_Bicho),
	send(Button_Bicho,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Bicho')),

	new(Bitmap_Dragon, bitmap(resource(dragon),@on)),
	send(Bitmap_Dragon, name, 1),

	new(Button_Dragon,button(button1)),
	send(Button_Dragon,label,Bitmap_Dragon),
	send(Button_Dragon,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Dragon')),

	new(Bitmap_Electrico, bitmap(resource(electrico),@on)),
	send(Bitmap_Electrico, name, 1),

	new(Button_Electrico,button(button1)),
	send(Button_Electrico,label,Bitmap_Electrico),
	send(Button_Electrico,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Electrico')),

	new(Bitmap_Fantasma, bitmap(resource(fantasma),@on)),
	send(Bitmap_Fantasma, name, 1),

	new(Button_Fantasma,button(button1)),
	send(Button_Fantasma,label,Bitmap_Fantasma),
	send(Button_Fantasma,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Fantasma')),

	new(Bitmap_Fuego, bitmap(resource(fuego),@on)),
	send(Bitmap_Fuego, name, 1),

	new(Button_Fuego,button(button1)),
	send(Button_Fuego,label,Bitmap_Fuego),
	send(Button_Fuego,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Fuego')),

	new(Bitmap_Hada, bitmap(resource(hada),@on)),
	send(Bitmap_Hada, name, 1),

	new(Button_Hada,button(button1)),
	send(Button_Hada,label,Bitmap_Hada),
	send(Button_Hada,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Hada')),

	new(Bitmap_Hielo, bitmap(resource(hielo),@on)),
	send(Bitmap_Hielo, name, 1),

	new(Button_Hielo,button(button1)),
	send(Button_Hielo,label,Bitmap_Hielo),
	send(Button_Hielo,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Hielo')),

	new(Bitmap_Lucha, bitmap(resource(lucha),@on)),
	send(Bitmap_Lucha, name, 1),

	new(Button_Lucha,button(button1)),
	send(Button_Lucha,label,Bitmap_Lucha),
	send(Button_Lucha,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Lucha')),

	new(Bitmap_Normal, bitmap(resource(normal),@on)),
	send(Bitmap_Normal, name, 1),

	new(Button_Normal,button(button1)),
	send(Button_Normal,label,Bitmap_Normal),
	send(Button_Normal,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Normal')),

	new(Bitmap_Planta, bitmap(resource(planta),@on)),
	send(Bitmap_Planta, name, 1),

	new(Button_Planta,button(button1)),
	send(Button_Planta,label,Bitmap_Planta),
	send(Button_Planta,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Planta')),

	new(Bitmap_Psiquico, bitmap(resource(psiquico),@on)),
	send(Bitmap_Psiquico, name, 1),

	new(Button_Psiquico,button(button1)),
	send(Button_Psiquico,label,Bitmap_Psiquico),
	send(Button_Psiquico,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Psiquico')),

	new(Bitmap_Roca, bitmap(resource(roca),@on)),
	send(Bitmap_Roca, name, 1),

	new(Button_Roca,button(button1)),
	send(Button_Roca,label,Bitmap_Roca),
	send(Button_Roca,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Roca')),

	new(Bitmap_Siniestro, bitmap(resource(siniestro),@on)),
	send(Bitmap_Siniestro, name, 1),

	new(Button_Siniestro,button(button1)),
	send(Button_Siniestro,label,Bitmap_Siniestro),
	send(Button_Siniestro,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Siniestro')),

	new(Bitmap_Tierra, bitmap(resource(tierra),@on)),
	send(Bitmap_Tierra, name, 1),

	new(Button_Tierra,button(button1)),
	send(Button_Tierra,label,Bitmap_Tierra),
	send(Button_Tierra,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Tierra')),

	new(Bitmap_Veneno, bitmap(resource(veneno),@on)),
	send(Bitmap_Veneno, name, 1),

	new(Button_Veneno,button(button1)),
	send(Button_Veneno,label,Bitmap_Veneno),
	send(Button_Veneno,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Veneno')),

	new(Bitmap_Volador, bitmap(resource(volador),@on)),
	send(Bitmap_Volador, name, 1),

	new(Button_Volador,button(button1)),
	send(Button_Volador,label,Bitmap_Volador),
	send(Button_Volador,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Volador')),

	new(Bitmap_Nose, bitmap(resource(idk),@on)),
	send(Bitmap_Nose, name, 1),

	new(Button_Nose,button(button1)),
	send(Button_Nose,label,Bitmap_Nose),
	send(Button_Nose,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'No se')),

	new(Bitmap_No2, bitmap(resource(no2),@on)),
	send(Bitmap_No2, name, 1),

	new(Button_No2,button(button1)),
	send(Button_No2,label,Bitmap_No2),
	send(Button_No2,message,message(@prolog,pregunta_combo,
		Ventana_Jugar,Cl,Tr,R,C,T1,'Ninguno')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(125,100)),
	send(Ventana_Jugar,display,Button_Acero,point(125,300)),
	send(Ventana_Jugar,display,Button_Agua,point(250,300)),
	send(Ventana_Jugar,display,Button_Bicho,point(375,300)),
	send(Ventana_Jugar,display,Button_Dragon,point(500,300)),
	send(Ventana_Jugar,display,Button_Electrico,point(625,300)),
	send(Ventana_Jugar,display,Button_Fantasma,point(125,350)),
	send(Ventana_Jugar,display,Button_Fuego,point(250,350)),
	send(Ventana_Jugar,display,Button_Hada,point(375,350)),
	send(Ventana_Jugar,display,Button_Hielo,point(500,350)),
	send(Ventana_Jugar,display,Button_Lucha,point(625,350)),
	send(Ventana_Jugar,display,Button_Normal,point(750,350)),
	send(Ventana_Jugar,display,Button_Planta,point(125,400)),
	send(Ventana_Jugar,display,Button_Psiquico,point(250,400)),
	send(Ventana_Jugar,display,Button_Roca,point(375,400)),
	send(Ventana_Jugar,display,Button_Siniestro,point(500,400)),
	send(Ventana_Jugar,display,Button_Tierra,point(625,400)),
	send(Ventana_Jugar,display,Button_Veneno,point(750,400)),
	send(Ventana_Jugar,display,Button_Volador,point(285,450)),
	send(Ventana_Jugar,display,Button_Nose,point(435,450)),
	send(Ventana_Jugar,display,Button_No2,point(585,450)).

pregunta_combo(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(combo_text1),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Pregunta2, figure),
	new(Bitmap_Pregunta2, bitmap(resource(combo_text2),@on)),
	send(Bitmap_Pregunta2, name, 1),
	send(Pregunta2, display, Bitmap_Pregunta2),
	send(Pregunta2, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Combinacion')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_pez,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(10,75)),
	send(Ventana_Jugar,display,Pregunta2,point(200,125)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_pez(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(pez_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Pez')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_serp,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(0,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_serp(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(serp_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Serpiente')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_extrem,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(100,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_extrem(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(extrem_text1),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Pregunta2, figure),
	new(Bitmap_Pregunta2, bitmap(resource(extrem_text2),@on)),
	send(Bitmap_Pregunta2, name, 1),
	send(Pregunta2, display, Bitmap_Pregunta2),
	send(Pregunta2, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Extremidades')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_insect,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(100,75)),
	send(Ventana_Jugar,display,Pregunta2,point(300,125)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_insect(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(insect_text1),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Pregunta2, figure),
	new(Bitmap_Pregunta2, bitmap(resource(insect_text2),@on)),
	send(Bitmap_Pregunta2, name, 1),
	send(Pregunta2, display, Bitmap_Pregunta2),
	send(Pregunta2, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Insecto')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_alas,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(50,75)),
	send(Ventana_Jugar,display,Pregunta2,point(350,125)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_alas(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(alas_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_numalas,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_pies,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(300,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_numalas(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(numalas_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_2, bitmap(resource(dos),@on)),
	send(Bitmap_2, name, 1),

	new(Bitmap_4, bitmap(resource(cuatro),@on)),
	send(Bitmap_4, name, 1),

	new(Button_2,button(button1)),
	send(Button_2,label,Bitmap_2),
	send(Button_2,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'2-Alas')),

	new(Button_4,button(button1)),
	send(Button_4,label,Bitmap_4),
	send(Button_4,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'+4-Alas')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(200,100)),
	send(Ventana_Jugar,display,Button_2,point(325,350)),
	send(Ventana_Jugar,display,Button_4,point(525,350)).

pregunta_pies(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(pies_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_bipedo,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_brazos,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Sin-Pies')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(290,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_bipedo(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(bipedo_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_brazos,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Con-Pies')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Cuadrupedo')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(200,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_brazos(Ventana_Jugar,Cl,Tr,R,C,T1,T2,Pies):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(brazos_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	(Pies=='Con-Pies' ->
		new(Button_Si,button(button1)),
		send(Button_Si,label,Bitmap_Si),
		send(Button_Si,message,message(@prolog,pregunta_cola,
			Ventana_Jugar,Cl,Tr,R,C,T1,T2)),

		new(Button_No,button(button1)),
		send(Button_No,label,Bitmap_No),
		send(Button_No,message,message(@prolog,pregunta_peso,
			Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Cabeza-Pies'))
	;	
		new(Button_Si,button(button1)),
		send(Button_Si,label,Bitmap_Si),
		send(Button_Si,message,message(@prolog,pregunta_peso,
			Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Cabeza-Brazos')),

		new(Button_No,button(button1)),
		send(Button_No,label,Bitmap_No),
		send(Button_No,message,message(@prolog,pregunta_cabeza,
			Ventana_Jugar,Cl,Tr,R,C,T1,T2))
	),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(275,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_cola(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(cola_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Bipedo-Cola')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Bipedo')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(300,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_cabeza(Ventana_Jugar,Cl,Tr,R,C,T1,T2):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(cabeza_text1),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Pregunta2, figure),
	new(Bitmap_Pregunta2, bitmap(resource(cabeza_text2),@on)),
	send(Bitmap_Pregunta2, name, 1),
	send(Pregunta2, display, Bitmap_Pregunta2),
	send(Pregunta2, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Cabeza')),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,pregunta_peso,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,'Cabeza-Base')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(125,75)),
	send(Ventana_Jugar,display,Pregunta2,point(325,125)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

pregunta_peso(Ventana_Jugar,Cl,Tr,R,C,T1,T2,Fig):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(peso_text1),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Pregunta2, figure),
	new(Bitmap_Pregunta2, bitmap(resource(peso_text2),@on)),
	send(Bitmap_Pregunta2, name, 1),
	send(Pregunta2, display, Bitmap_Pregunta2),
	send(Pregunta2, status, 1),

	new(Button_Poco,button('Ligero')),
	send(Button_Poco,font,font(screen, bold, 20)),
	send(Button_Poco,message,message(@prolog,pregunta_evo,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,Fig,'poco')),

	new(Button_Inter,button('Medio')),
	send(Button_Inter,font,font(screen, bold, 20)),
	send(Button_Inter,message,message(@prolog,pregunta_evo,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,Fig,'intermedio')),

	new(Button_Pesado,button('Pesado')),
	send(Button_Pesado,font,font(screen, bold, 20)),
	send(Button_Pesado,message,message(@prolog,pregunta_evo,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,Fig,'pesados')),

	new(Button_Nose,button('No se')),
	send(Button_Nose,font,font(screen, bold, 20)),
	send(Button_Nose,message,message(@prolog,pregunta_evo,
		Ventana_Jugar,Cl,Tr,R,C,T1,T2,Fig,'No se')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(100,75)),
	send(Ventana_Jugar,display,Pregunta2,point(150,125)),
	send(Ventana_Jugar,display,Button_Poco,point(200,350)),
	send(Ventana_Jugar,display,Button_Inter,point(410,350)),
	send(Ventana_Jugar,display,Button_Pesado,point(600,350)),
	send(Ventana_Jugar,display,Button_Nose,point(410,425)).

pregunta_evo(Ventana_Jugar,Cl,Tr,R,C,T1,T2,Fig,Peso):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(evo_text1),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Pregunta2, figure),
	new(Bitmap_Pregunta2, bitmap(resource(evo_text2),@on)),
	send(Bitmap_Pregunta2, name, 1),
	send(Pregunta2, display, Bitmap_Pregunta2),
	send(Pregunta2, status, 1),

	new(Button_Primera,button('Primera')),
	send(Button_Primera,font,font(screen, bold, 20)),
	send(Button_Primera,message,message(@prolog,search,
		Ventana_Jugar,'No se',Cl,Tr,R,C,T1,T2,Fig,Peso,'Primera',
		'Nada','Nada','Nada','Nada')),

	new(Button_Segunda,button('Segunda')),
	send(Button_Segunda,font,font(screen, bold, 20)),
	send(Button_Segunda,message,message(@prolog,search,
		Ventana_Jugar,'No se',Cl,Tr,R,C,T1,T2,Fig,Peso,'Segunda',
		'Nada','Nada','Nada','Nada')),

	new(Button_Tercera,button('Tercera')),
	send(Button_Tercera,font,font(screen, bold, 20)),
	send(Button_Tercera,message,message(@prolog,search,
		Ventana_Jugar,'No se',Cl,Tr,R,C,T1,T2,Fig,Peso,'Tercera',
		'Nada','Nada','Nada','Nada')),

	new(Button_Unica,button('Unica')),
	send(Button_Unica,font,font(screen, bold, 20)),
	send(Button_Unica,message,message(@prolog,search,
		Ventana_Jugar,'No se',Cl,Tr,R,C,T1,T2,Fig,Peso,'Unica',
		'Nada','Nada','Nada','Nada')),

	new(Button_Otra,button('Mega/Otra')),
	send(Button_Otra,font,font(screen, bold, 20)),
	send(Button_Otra,message,message(@prolog,search,
		Ventana_Jugar,'No se',Cl,Tr,R,C,T1,T2,Fig,Peso,'Mega/Otra',
		'Nada','Nada','Nada','Nada')),

	new(Button_Nose,button('No se')),
	send(Button_Nose,font,font(screen, bold, 20)),
	send(Button_Nose,message,message(@prolog,search,
		Ventana_Jugar,'No se',Cl,Tr,R,C,T1,T2,Fig,Peso,'No se',
		'Nada','Nada','Nada','Nada')),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(100,75)),
	send(Ventana_Jugar,display,Pregunta2,point(150,125)),
	send(Ventana_Jugar,display,Button_Primera,point(200,350)),
	send(Ventana_Jugar,display,Button_Segunda,point(410,350)),
	send(Ventana_Jugar,display,Button_Tercera,point(600,350)),
	send(Ventana_Jugar,display,Button_Unica,point(200,400)),
	send(Ventana_Jugar,display,Button_Otra,point(410,400)),
	send(Ventana_Jugar,display,Button_Nose,point(600,400)).

search(Ventana_Jugar,Dex,Cla,Tra,Reg,Col,Tip1,Tip2,Fig,Peso,Evo,Mon1,Mon2,Mon3,Mon4):-
	(	
		(Dex=='No se' ->
			pokedex(_,X)
		;	pokedex(Dex,X)
		),	
		(Cla=='Lege' ->
			legendario(X)
		;	(Cla=='Sing' ->
				singular(X)
			;	(Cla=='Ultra' ->
					ultra_ente(X)
				;	(Cla=='Regu' ->
						regular(X)
					;	pokemon(X)
					)
				)
			)
		),
		(Tra=='Si' ->
			(	
				mega(Z,X);
				alola(Z,X);
				therian(Z,X);
				primigenio(Z,X);
				pirueta(Z,X);
				resolete(Z,X);
				rotom(Z,X)
			)
		;	Z = X
		),
		(Reg=='No se' ->
			region(_,Z)
		;	region(Reg,Z)
		),
		(Col=='No se' ->
			color(_,Z)
		;	color(Col,Z)
		),
		search_tipo(Z,Tip1,Tip2),
		(Fig=='No se' ->
			figura(_,Z)
		;	figura(Fig,Z)
		),
		(Peso=='No se' ->
			peso(_,Z)
		;	peso(Peso,Z)
		),
		(Evo=='No se' ->
			evolucion(_,Z)
		;	evolucion(Evo,Z)
		),
		Z\=Mon1,
		Z\=Mon2,
		Z\=Mon3,
		Z\=Mon4,

		send(Ventana_Jugar,clear),

		new(Fondo, figure),
		new(Bitmap_Fondo, bitmap(resource(fondo_resultado),@on)),
		send(Bitmap_Fondo, name, 1),
		send(Fondo, display, Bitmap_Fondo),
		send(Fondo, status, 1),

		new(Pregunta, figure),
		new(Bitmap_Pregunta, bitmap(resource(search_textw),@on)),
		send(Bitmap_Pregunta, name, 1),
		send(Pregunta, display, Bitmap_Pregunta),
		send(Pregunta, status, 1),

		new(Pregunta2, figure),
		new(Bitmap_Pregunta2, bitmap(resource(search_text2),@on)),
		send(Bitmap_Pregunta2, name, 1),
		send(Pregunta2, display, Bitmap_Pregunta2),
		send(Pregunta2, status, 1),

		new(Box1, figure),
		new(Bitmap_Box1, bitmap(resource(box1),@on)),
		send(Bitmap_Box1, name, 1),
		send(Box1, display, Bitmap_Box1),
		send(Box1, status, 1),

		new(Box2, figure),
		new(Bitmap_Box2, bitmap(resource(box2),@on)),
		send(Bitmap_Box2, name, 1),
		send(Box2, display, Bitmap_Box2),
		send(Box2, status, 1),

		new(B,box(450,50)),
		new(T, text(Z)),
		new(Respuesta, constraint(B, T, identity(center))),
        send(T, font, font(screen, bold, 40)),
		
		new(Bitmap_Si, bitmap(resource(si),@on)),
		send(Bitmap_Si, name, 1),

		new(Bitmap_No, bitmap(resource(no),@on)),
		send(Bitmap_No, name, 1),

		new(Button_Si,button(button1)),
		send(Button_Si,label,Bitmap_Si),

		new(Button_No,button(button1)),
		send(Button_No,label,Bitmap_No),

		send(Ventana_Jugar, display, Fondo, point(0,0)),
		send(Ventana_Jugar,display,Pregunta,point(110,30)),
		send(Ventana_Jugar,display,B,point(500,135)),
		send(Ventana_Jugar,display,Box1,point(500,135)),
		send(Ventana_Jugar,display,T),
		send(Ventana_Jugar,display,Pregunta2,point(550,250)),			
		send(Ventana_Jugar,display,Button_Si,point(575,350)),
		send(Ventana_Jugar,display,Button_No,point(775,350)),

		(sprite(Z) ->			
			new(Sprite, figure),
			new(Bitmap_Sprite, bitmap(resource(Z),@on)),
			send(Bitmap_Sprite, name, 1),
			send(Sprite, display, Bitmap_Sprite),
			send(Sprite, status, 1),
			
			new(B2,box(450,450)),
			new(Respuesta_Im, constraint(B2, Sprite, identity(center))),

			send(Ventana_Jugar,display,B2,point(25,75)),
			send(Ventana_Jugar,display,Box2,point(25,75)),
			send(Ventana_Jugar,display,Sprite)
		;
			writeln('Imagen no disponible')
		),

		(Mon1=='Nada' ->									
			send(Button_Si,message,message(@prolog,volver,Ventana_Jugar)),
			send(Button_No,message,message(@prolog,search,
				Ventana_Jugar,Dex,Cla,Tra,Reg,Col,Tip1,Tip2,Fig,Peso,Evo,Z,'Nada','Nada','Nada'))
		;	
			(Mon2=='Nada' ->
				send(Button_Si,message,message(@prolog,volver,Ventana_Jugar)),
				send(Button_No,message,message(@prolog,search,
					Ventana_Jugar,Dex,Cla,Tra,Reg,Col,Tip1,Tip2,Fig,Peso,Evo,Mon1,Z,'Nada','Nada'))
			;	
				(Mon3=='Nada' ->
					send(Button_Si,message,message(@prolog,volver,Ventana_Jugar)),
					send(Button_No,message,message(@prolog,search,
						Ventana_Jugar,Dex,Cla,Tra,Reg,Col,Tip1,Tip2,Fig,Peso,Evo,Mon1,Mon2,Z,'Nada'))
				;
					(Mon4=='Nada' ->
						send(Button_Si,message,message(@prolog,volver,Ventana_Jugar)),
						send(Button_No,message,message(@prolog,search,
							Ventana_Jugar,Dex,Cla,Tra,Reg,Col,Tip1,Tip2,Fig,Peso,Evo,Mon1,Mon2,Mon3,Z))
					;
						send(Button_Si,message,message(@prolog,volver,Ventana_Jugar)),
						send(Button_No,message,message(@prolog,fracaso,Ventana_Jugar))
					)
				)
			)			
		)
	;	fracaso(Ventana_Jugar)
	).

search_tipo(Z,Tipo1,Tipo2):-
	(Tipo1=='No se' ->
		(Tipo2=='No se' ->
			tipo(Z,_,_)
		;	(tipo(Z,_,Tipo2);tipo(Z,Tipo2,_))
		)
	;	(Tipo2=='No se' ->
			(tipo(Z,Tipo1,_);tipo(Z,_,Tipo1))
		;	(tipo(Z,Tipo1,Tipo2);tipo(Z,Tipo2,Tipo1))
		)
	).

volver(Ventana_Jugar):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(volver_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Si, bitmap(resource(si),@on)),
	send(Bitmap_Si, name, 1),

	new(Bitmap_No, bitmap(resource(no),@on)),
	send(Bitmap_No, name, 1),

	new(Button_Si,button(button1)),
	send(Button_Si,label,Bitmap_Si),
	send(Button_Si,message,message(@prolog,inicio,Ventana_Jugar)),

	new(Button_No,button(button1)),
	send(Button_No,label,Bitmap_No),
	send(Button_No,message,message(@prolog,cerrar,Ventana_Jugar)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(125,100)),
	send(Ventana_Jugar,display,Button_Si,point(325,350)),
	send(Ventana_Jugar,display,Button_No,point(525,350)).

cerrar(Ventana_Jugar):-
	send(Ventana_Jugar,destroy).

fracaso(Ventana_Jugar):-
	send(Ventana_Jugar,clear),

	new(Fondo, figure),
	new(Bitmap_Fondo, bitmap(resource(fondo_pokedex),@on)),
	send(Bitmap_Fondo, name, 1),
	send(Fondo, display, Bitmap_Fondo),
	send(Fondo, status, 1),

	new(Pregunta, figure),
	new(Bitmap_Pregunta, bitmap(resource(fracaso_text),@on)),
	send(Bitmap_Pregunta, name, 1),
	send(Pregunta, display, Bitmap_Pregunta),
	send(Pregunta, status, 1),

	new(Bitmap_Sad, bitmap(resource(sad),@on)),
	send(Bitmap_Sad, name, 1),

	new(Button_Sad,button(button1)),
	send(Button_Sad,label,Bitmap_Sad),
	send(Button_Sad,message,message(@prolog,volver,Ventana_Jugar)),

	send(Ventana_Jugar, display, Fondo, point(0,0)),
	send(Ventana_Jugar,display,Pregunta,point(60,100)),
	send(Ventana_Jugar,display,Button_Sad,point(400,350)).