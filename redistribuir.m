function[palabras]=redistribuir(vector,n)
% Función creada para transformar un vector de caracteres
% en una matriz de n columnas y de tantas filas como elementos
% de n caracteres haya

palabras=[];

for i=1:n:length(vector)
    palabras=[palabras;vector(i:(i+n-1))];
end