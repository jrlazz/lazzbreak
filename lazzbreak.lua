local FORM_NAME = "jrlazzbreakform";

alterna=0;
figura="fer";
dica=0;
dicatxt="";
dicacor="";
local texture_name="pin42.jpg";
vazimage="ok1.png"



local function showForm(player)

	if alterna==0 then

		certo=0;
		errado=0;
		imaclick=0;
		pedaclick=0;

		imagina={} -- new array
		imaginb={} -- new array
		scra={} -- new array

		if figura=="fer" then pre="fer";lim=42;dicaw=21.1;dicah=18.0;end
		if figura=="pin" then pre="pin";lim=42;dicaw=21.1;dicah=18.0;end
		if figura=="cor" then pre="cor";lim=35;dicaw=21.1;dicah=15.0;end
		if figura=="sha" then pre="sha";lim=35;dicaw=21.1;dicah=15.0;end
		if figura=="wal" then pre="wal";lim=42;dicaw=21.1;dicah=18.0;end

		dicaimg=pre..".jpg";
		--dicafra=pre.."x.jpg";

		for i=1,lim,1 do
			if string.len(tostring(lim+1-i))==1 then
				imagina[i]=pre.."0"..tostring(lim+1-i)..".jpg";
			else
				imagina[i]=pre..tostring(lim+1-i)..".jpg";
			end
			scra[i]=i;
		end
		--imaginb=imagina;
		for i=1,lim,1 do
			imaginb[i]="quadric2.png";
		end

		function shuffle(a)
			local n = #a
			local t
			local k
			while(n > 0) do
				t = a[n]
				k = math.random(n)
				a[n] = a[k]
				a[k] = t
				n = n - 1
			end
			return a
		end
		local list=scra;
		local shuffledList=shuffle(list);

		vala="00";
		valb="00";
		colore="mod zfield";
		ar = {}    -- new array

		for j=1,3,1 do
			i=scra[j];
			imaginb[i]=imagina[i];imagina[i]=vazimage;
		end

	end



	local playerName=player:get_player_name();
	if not playerName or playerName=="" then return; end

	local fs="size[40,22]";

	--fs=fs.."label[21,0.6;Quebra]";
	fs=fs.."image_button[0,0;2,2;zbreak.png;s:;]";
	fs=fs.."image_button[2.5,0.8;35.5,.3;gradient.jpg;s:;]";
	fs=fs.."image_button[38,0;2,2;puzzle.png;s:;]";

--handle=minetest.sound_play("creative4_c",{loop=true,gain=1,});

	local imag2=minetest.formspec_escape("Vivi.png");
	local imag6=minetest.formspec_escape("cartoon_clockb.png");

-- *******************************************************************

	fs=fs.."image_button[25.2,18;13.3,.3;gray_color.png;name;"..minetest.colorize("#666","").."]";

	if vala~=valb and vala~="00" and valb~="00" then
		errado=errado+1;
		fs=fs.."image_button[25.2,18;13.3,.3;red_color.png;name;"..minetest.colorize("#666","").."]";
		vala="00";valb="00";
	end

	if vala=="" then vala="00";imaclick=0;pedaclick=0;end;
	if valb=="" then valb="00";imaclick=0;pedaclick=0;end;
	if vala==valb and vala~="00" and valb~="00" then
		fs=fs.."image_button[25.2,18;13.3,.3;limao_color.png;name;"..minetest.colorize("#000","").."]";
		for j=1,lim,1 do
			if string.sub(imagina[j],4,5)==vala then imaginb[j]=imagina[j];imagina[j]=vazimage;end;
		end
		vala="00";valb="00";
		certo=certo+1;
		imaclick=0;pedaclick=0;
		minetest.sound_play("hahaha",{loop=false,gain=1,});
	end

if dica==1 then
	fs=fs.."background[2.1,2.1;"..dicaw..","..dicah..";"..dicaimg.."]";
else

-- Principal

	local col=1;
	local dcol=0;
	local lin=2;
	local nome="no";
	for i=1,lim,1 do
		cuka=i;
		cuka="";
		local nome=imagina[i].."no";
		--local imagem=string.sub(imagina[i],3);
		local imagem=imaginb[i];
		col=dcol+(i*3)-1;
		fs=fs.."image_button["..col..","..lin..";3.255,3.165;"..imagem..";r:"..nome..";"..cuka.."]";
		if (lim+1-i)==tonumber(vala) then imaclick=1;imagem="amarelo_color.png";local cuka=" ";fs=fs.."image_button["..col..","..lin..";0.5,0.5;"..imagem..";w:"..nome..";"..cuka.."]";end
		if i== 7 then lin= 5; dcol= -21; end
		if i==14 then lin= 8; dcol= -42; end
		if i==21 then lin=11; dcol= -63; end
		if i==28 then lin=14; dcol= -84; end
		if i==35 then lin=17; dcol=-105; end
	end

end

-- Pedaços

	local dref=24;
	local col=dref;
	local dcol=dref;
	local nome="ko";
	local lref=2;
	local lin=lref;
	local tam=2.2;

	for i=1,lim,1 do
		local m=scra[i];
		--cuka=m;
		cuka="";
		local nome=imagina[m].."ko";
		--local imagem=string.sub(imagina[m],3);
		local imagem=imagina[m];
		col=dcol+(i*tam)-1;
		if imagem~="" then
			fs=fs.."image_button["..col..","..lin..";2.3,2.3;"..imagem..";s:"..nome..";"..cuka.."]";
			if (lim+1-m)==tonumber(valb) then imagem="limao_color.png";local cuka=" ";fs=fs.."image_button["..col..","..lin..";0.5,0.5;"..imagem..";w:"..nome..";"..cuka.."]";pedaclick=1;end
		end
		if i== 6 then lin=lref+(1*tam); dcol=dref-(tam*6); end
		if i==12 then lin=lref+(2*tam); dcol=dref-(tam*12); end
		if i==18 then lin=lref+(3*tam); dcol=dref-(tam*18); end
		if i==24 then lin=lref+(4*tam); dcol=dref-(tam*24); end
		if i==30 then lin=lref+(5*tam); dcol=dref-(tam*30); end
		if i==36 then lin=lref+(6*tam); dcol=dref-(tam*36); end
	end


--Mostrando as respostas
	--fs=fs.."label[0,15;vala "..vala.."]";
	--fs=fs.."label[0,16;valb "..valb.."]";
	local segundos=tonumber(os.date("%S"))
	if segundos>10 then vazimage="ok2.png";end;
	if segundos>20 then vazimage="ok3.png";end;
	if segundos>30 then vazimage="ok4.png";end;
	if segundos>40 then vazimage="ok5.png";end;
	if segundos>50 then vazimage="ok6.png";end;
	-- fs=fs.."label[0,16;segundos "..segundos.."]";
--reset
	fs=fs.."image_button[2,21.1;2,0.7;vinho_color.png;u:Reset;Reset]";
--dica
	dicatxt="Com dica";
	dicacor="azul_color.png";
	if dica==1 then dicatxt="Sem dica";dicacor="vermelho_color.png";end;
	fs=fs.."image_button[25.2,19.3;3,1.3;"..dicacor..";d:dica;"..dicatxt.."]";
--sair
	fs=fs.."image_button[36.3,19.3;2.4,1.3;red_color.png;name;"..minetest.colorize("#666","").."]";
	fs=fs.."button_exit[36.5,19.5;2,1;o:k;Sair]";
--certos e errados
	fs=fs.."image_button[30.5,19;3,1;vazia512.png;name;"..minetest.colorize("#0f0",certo).."]";
	fs=fs.."image_button[30.5,20;3,1;vazia512.png;name;"..minetest.colorize("#fc0",errado).."]";
	--fs=fs.."image_button[20,19;3,1;vazia512.png;name;"..minetest.colorize("#0f0",imaclick).."]";
	--fs=fs.."image_button[20,20;3,1;vazia512.png;name;"..minetest.colorize("#f00",pedaclick).."]";
--relógio
	--local kame="sha";
	--fs=fs.."image_button[33.2,18;2.3,2.3;"..imag6..";z:k;"..kame.."]";
--escolha de imagem
	local distx=6;local pulox=3.5;
	fs=fs.."button["..distx..",21;3.5,1;c:cor;Cores]";distx=distx+pulox;
	fs=fs.."button["..distx..",21;3.5,1;c:fer;Ferrari]";distx=distx+pulox;
	fs=fs.."button["..distx..",21;3.5,1;c:pin;Pinacoteca]";distx=distx+pulox;
	fs=fs.."button["..distx..",21;3.5,1;c:sha;Shazam]";distx=distx+pulox;
	fs=fs.."button["..distx..",21;3.5,1;c:wal;Walmart]";distx=distx+pulox;

--Não alterar aqui
	minetest.show_formspec(playerName, FORM_NAME, fs);
end


minetest.register_on_player_receive_fields(
  function(player, formName, fields)
	if formName ~= FORM_NAME then return; end
	local playerName = player:get_player_name();
	if not playerName or playerName == "" then return; end

	for fieldName in pairs(fields) do
--				minetest.sound_stop(handle);
		if #fieldName > 2 then
		local action=string.sub(fieldName, 1, 1);
		local value=string.sub(fieldName, 3);

		if action=="c" then
			--minetest.sound_stop(handle);
			local value=string.sub(value,1);
			figura=value;
			dica=0;
			alterna=0;
			showForm(player);
			return;
		elseif action=="d" then
			dica=1-dica;
			alterna=1;
			showForm(player);
			return;
		elseif action=="o" then
			--sair
			--minetest.sound_stop(handle);
			return;
		elseif action=="r" then
			local value=string.sub(value,4,5);
			vala=value;
			alterna=1;
			showForm(player);
			return;
		elseif action=="s" then
			local value=string.sub(value,4,5);
			valb=value;
			alterna=1;
			showForm(player);
			return;
		elseif action=="u" then
			--reset
			--minetest.sound_stop(handle);
			alterna=0;
			showForm(player);
			return;
		end
	end
  end
end
);


-- sounds
local green_sounds = {
	damage = "twoofus",
	--death = "aaai",
	jump = "twoofus",
	--attack = "aaai",
}


minetest.register_node("lazzbreak:lazzbreak",{description="lazzbreak",paramtype2="facedir",
	drawtype = "glasslike",
tiles = {{

name="verde1_anim.png",

animation={

	type="vertical_frames",

	aspect_w=16,

	aspect_h=16,

	length=2.0
,
	},},},
inventory_image="verde1_anim.png",groups={choppy=3,oddly_breakable_by_hand=2,flammable=3},
--})
	on_rightclick = function(pos, node, player, itemstack, pointedThing)
		local handle=0
		handle=minetest.sound_play("one")
		showForm(player);
	end
})
	minetest.register_on_punchnode(function(pos, node, puncher)
		local handle=0
		handle = minetest.sound_play("aaai")
	end)

