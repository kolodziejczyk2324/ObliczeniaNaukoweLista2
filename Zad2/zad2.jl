#Przemyslaw Kolodziejczyk
#
#Zad2

include("hilb.jl")
include("matcond.jl")

#Funkcja wypisujaca wynik eliminacji Gaussa dla macierzy podanych w parametrach
function GaussianElimination(A::Array,b::Array)
	return A\b
end

#Funkcja wypisujaca wynik dzialania A^(-1)*b gdzie A i b sa macierzami
function InvAlg(A,b)
	return inv(A)*b
end

#Funkcja zwracajaca blad wzgledny dla macierzy x i x_f
function BladWzglednyMacierzy(x::Array, x_f::Array)
	return norm(x-x_f)/norm(x)
end

#Funkcja wypisujaca blad wzgledny macierzy x i x_f na ekran.
#Jako parametr nalezy podac rowniez informacje w postaci stringu o wykonanym algorytmie
function WypiszBladWzgledny(x::Array, x_f::Array, czego::AbstractString)
	@printf("Blad wzgledny dla %s: %.15g\n", czego, BladWzglednyMacierzy(x, x_f))
end

#Funkcja wypisujaca wskaznik uwarunkowania oraz rzad dla macierzy A
function Wypisz_wskUwar_rzad(A::Array)
	@printf("Wskaznik uwarunkowania: %.15g\n",cond(A))
	@printf("Rzad: %.15g\n",rank(A))
end

#funkcja wykonujaca test dla macierzy A oraz typu zmiennoprzecinkowego typ
#Funkcja wykonuje nastepujace czynnosci:
#oblicza b=A*x, gdzie A jest macierza podana w parametrze a x jest macierza (1,1,1..,1)^T
#Wypisuje wskaznik uwarunkowania oraz rzad macierzy A
#Wypisuje blad wzgledny dla obliczonego x dla algorytmow:
#	-Eliminacji Gaussa
#	-odwrotnosc macierzy (x=A^(-1)*b
function zrobTest(typ, A::Array)
	n, n2 = size(A) #odbieramy rozmiar macierzy A 
	x = Array(typ,n,1) #macierz (1,1...,1,1)^T
	for j=1:n
		x[j]=1
	end
	b = A*x
	Wypisz_wskUwar_rzad(A)
	WypiszBladWzgledny(x, GaussianElimination(A,b), "Eliminacji Gaussa")
	WypiszBladWzgledny(x, InvAlg(A,b), "odwrotnosci macierzy")
end

#Funkcja wykonujaca doswiadczenie dla macierzy hilberta
#W parametrach nalezy podac typ zmiennoprzecinkowy oraz ilosc iteracji
function DoswiadczenieHilb(typ, n::Int)
	@printf("MACIERZ HILBERTA\n");
	for i = 1:n
		@printf("Iteracja: %d\n",i)
		zrobTest(typ, hilb(i))
	end
end

#Funkcja wykonujaca doswiadczenie dla macierzy losowej
#W parametrze nalezy podac typ zmiennopozycyjny
function DoswiadczenieRand(typ)
	@printf("MACIERZ LOSOWA\n")
	s = Array(typ, 3) #tablica przechowujaca rozmiary macierzy jakie maja byc testowane
	s = [5,10,20]
	c = Array(typ, 6) #tablica przechowujaca wskazniki uwarrunkowania jakie maja byc testowane 
	c = [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]
	for j=1:length(s)
		@printf("Poczatek testu dla macierzy losowej rozmiaru: %d\n", s[j])
		for i = 1:length(c)
			@printf("Iteracja: %d\n",i)
			zrobTest(typ, matcond(s[j],c[i]))
		end
	end		
end

DoswiadczenieHilb(Float64, 5) 
DoswiadczenieRand(Float64)
