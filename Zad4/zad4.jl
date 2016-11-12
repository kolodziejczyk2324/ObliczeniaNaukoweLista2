#Przemyslaw Kolodziejczyk
#
#Zad4

#Funkcja wypisujaca wartosci wszystkich elementow tablicy 'a'
function wypiszTablice(a::Array)
	for i=1:length(a)
		@printf("%d.\t",i)
		println(a[i])
	end
end

#Funkcja tworzaca tablice elementow p[i+1]=p[i]+r*p[i]*(1-p[i])
function stworzTablice(typ, pdp::AbstractString)
	@printf("Doswiadczenie do pdp %s dla %s\n",pdp, typ)
	r = typ(3)
	p = Array(typ, 41)
	p[1] = 0.01
	for i=2:41
		p[i] = p[i-1]+r*p[i-1]*(typ(1)-p[i-1])
		if isequal(pdp, "B") && isequal(i, 11) #gdy podano w parametrze "B" zamien skroc 11 element do 3 znakow po przecinku
                        p[i] = floor(p[i], 3)
                end
	end
	return p
end	


wypiszTablice(stworzTablice(Float32, "A"))
wypiszTablice(stworzTablice(Float32, "B"))

wypiszTablice(stworzTablice(Float64, "A"))
