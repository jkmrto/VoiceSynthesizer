function[v]=Asignar_espacios(cadena,t)

for i=1:t-length(cadena)
   cadena=['m' cadena];
end

v=cadena;