function[trifonemas,tindice]=Trifonemas(cadena)
%Funcion usada para delimitar los  
% trifonemas y obtener sus indices

% Añadimos los espacios inicial y final
t1=['_' cadena '_'];

tindice=zeros(length(t1)-2,2);

% Obtenemos los indices y los trifonemas
for i=1:length(t1)-2
    tindice(i,1)=i;
    tindice(i,2)=i+2;
    trifonemas(i,:)=t1(i:i+2);
end