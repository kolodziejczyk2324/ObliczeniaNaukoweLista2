#Przemyslaw Kolodziejczyk
#
#Zad1


############################################
####### FUNKCJE OBLICZAJACE ################
############################################

#funkcja wykonujaca iloczyn skalarny dla tablicy 'x' oraz 'y'
#zaczynajac od pierwszych elementach, konczac na ostatnim
function suma_w_przod(x, y)
	s = typeof(x[1])(0) #zmienna w ktorej bedzie przechowywana wartosc iloczynu skalarnego
	for i = 1:length(x)
		s+=x[i]*y[i]
	end
	@printf("Suma w przod: %.17g\n",s)
end

#funkcja wykonujaca iloczyn skalarny dla tablicy 'x' oraz 'y'
#zaczynajac od ostatnich elementow, konczac na pierwszym
function suma_w_tyl(x, y)
	s = typeof(x[1])(0) #zmienna w ktorej bedzie przechowywana wartosc iloczynu skalarnego
	for i = 0:length(x)-1
		s+=x[length(x)-i]*y[length(y) - i]
	end
	@printf("Suma w tyl: %.17g\n",s)
end

#funkcja wykonujaca iloczyn skalarny dla tablicy 'x' oraz 'y'
#zaczynajac od najwiekszych liczb w tablicach, konczac na najmniejszych
function od_najw_do_najm(x, y)
	wyn_czesciowe = Array{typeof(x[0])}(5)  #tablica z wynikami czesciowymi
	s = typeof(x[0])(0) #zmienna w ktorej bedzie przechowywana wartosc iloczynu skalarnego
	#petla obliczajaca wyniki czesciowe
	for i = 1:5
		wyn_czesciowe[i]=x[i]*y[i]
	end
	sort!(wyn_czesciowe, rev=true) #sortowanie tablisy malejaco
	#petla sumujaca wyniki czesciowe
	for i = 1:5
		s+=wyn_czesciowe[i]
	end
	@printf("Suma od najwiekszego do najmniejszego: %.17g\n",s)
end

#funkcja wykonujaca iloczyn skalarny dla tablicy 'x' oraz 'y'
#zaczynajac od najmniejszych liczb w tablicach, konczac na najwiekszych
function od_najm_do_najw(x, y)
	wyn_czesciowe = Array{typeof(x[0])}(5) #tablica z wynikami czesciowymi
	s = typeof(x[0])(0)
	#petla obliczajaca wyniki czesciowe
	for i = 1:5
		wyn_czesciowe[i]=x[i]*y[i]
	end
	sort!(wyn_czesciowe) #sortowanie tablicy rosnaco
	#petla sumujaca wyniki czesciowe
	for i = 1:5
		s+=wyn_czesciowe[i]
	end
	@printf("Suma od najmniejszego do najwiekszego: %.17g\n",s)
end

############################################
####### FUNKCJE WYKONUJACE DOSWIADCZENIE ###########
############################################

function wypisz_tablice(x::Array, str::AbstractString)
        @printf("Tablica %s:\n", str)
	@printf("[ %.10g", x[1])
        for i=2:length(x)
		@printf(", %.10g", x[i])
	end
	@printf(" ]\n")
end

function wykonaj_wszystkie_sumowania(x,y)
	wypisz_tablice(x, "X")
	wypisz_tablice(y, "Y")
        suma_w_przod(x, y)
        suma_w_tyl(x, y)
        od_najw_do_najm(x, y)
        od_najm_do_najw(x, y)
end

#funkcja wykonujaca doswiadczenie
#jako parametr nalezy podac testowany typ
function zrob_doswiadczenie(typ)
	@printf("Doswiadczenie dla %s\n", typ)
	x1 = typ[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y1 = typ[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	wykonaj_wszystkie_sumowania(x1,y1)
        x2 = typ[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
        y2 = typ[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	wykonaj_wszystkie_sumowania(x2,y2)
	print("\n\n")
end

zrob_doswiadczenie(Float32)
zrob_doswiadczenie(Float64)
