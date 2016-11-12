#Przemyslaw Kolodziejczyk
#
#Zad3

using Polynomials;

#wielomian bez modyfikacji
P=[1, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

#wielomian z modyfikacja
P2=[1, -210.0-2.0^(-23), 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

#zera wielomianu
p=[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0]

#odwrocenie tablic
P = P[end:-1:1]
P2 = P2[end:-1:1]

#Funkcja wypisujaca pierwiaski 'z' na ekran
function wypiszPierwiastki(z)
	println("Pierwiastki")
	for i=1:20
		@printf("z[%d].\t",i);
		println(z[i])
	end
	println()
end

#Funkcja wypisujaca wartosci wielomianu 'po', z argumentami 'z'
function wypiszWartosc(po::Polynomials.Poly, z::Array, czego::AbstractString)
	println("Wartosc funkcji dla obliczonych miejsc zerowych:")
	for i=1:20
		@printf("%s(z[%d])\t", czego, i) 
		println(abs(polyval(po, z[i])))
	end
	println()
end

#Funkcja wypisujaca roznice |z[i]-i|, gdzie z[i] sa miejscami zerowymi
function wypiszRoznice(z::Array)
	println("Roznica pomiedzy obliczonymi miejscami zerowymi a prawdziwymi:")
	for i=1:20
		@printf("z[%d]-%d.\t",i,i)
		println(abs(z[i]-i))
	end
	println()
end

#Funkcja wykonujaca doswiadczenie dla wielomianu 'wiel', wypisujaca 'czego' jako informacje
#o aktualnie testowanym wielomianie
function zrobDoswiadczenie(wiel::Polynomials.Poly, czego::AbstractString)
	@printf("START DOSWIADCZENIA DLA: %s\n", czego)
	z = roots(wiel)
	wypiszPierwiastki(z)
	wypiszWartosc(wiel, z, czego)
	wypiszWartosc(poly(p), z, "p")
	wypiszRoznice(z)
	println()
end

zrobDoswiadczenie(Poly(P), "P")
zrobDoswiadczenie(Poly(P2), "P2")
