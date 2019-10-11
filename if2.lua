print("informe as três notas")
n1=io.read("*number")
n2=io.read("*number")
n3=io.read("*number")

media=(n1+n2+n3)/3
menor=0

if n1<=n2 and n1<=n3 then
	menor=n1
elseif n2<=n1 and n2<=n3 then
	menor=n2
elseif n3<=n2 and n3<=n1 then
	menor=n3
end

if media>=7 then
	print("Aprovado por media")
elseif media<7 then
	print("informe a reposição:")
	rep=io.read("*number")
	media=(media-menor)+rep
end
if media>=7 then
	print("Aprovado na reposição")
elseif media<7 then
	print("informe a nota final:")
	final=io.read("*number")
	media=media+final
end
if media>=12 then
	print("Aprovado na final")
else
	print("Reprovado")
end
