#Przemyslaw Kolodziejczyk
#
#Zad5

#Funkcja wypisujaca wartosci tablicy 'a'
function wypiszTablice(a::Array)
        for i=1:length(a)
                @printf("%d.\t%.15g\n",i,a[i])
        end
end

#Funkcja tworzaca tablice elementow dla rownania x[i+1]=x[i]^2 + c
#gdzie c i x[0] podane jest w parametrze
function rownanie(c::Float64, x0::Float64)
	@printf("Eksperyment dla c=%g i x0=%.20g\n",c,x0)
	x = Array(Float64,41)
	x[1] = x0
	for i=2:41
		x[i] = x[i-1]^2 + c
	end
	return x
end

wypiszTablice(rownanie(-2.0, 1.0))
wypiszTablice(rownanie(-2.0, 2.0))
wypiszTablice(rownanie(-2.0, 1.99999999999999))
wypiszTablice(rownanie(-1.0, 1.0))
wypiszTablice(rownanie(-1.0, -1.0))
wypiszTablice(rownanie(-1.0, 0.75))
wypiszTablice(rownanie(-1.0, 0.25))


