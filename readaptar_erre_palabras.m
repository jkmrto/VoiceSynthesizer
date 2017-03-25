function[salida]=readaptar_erre_palabras(elemento)
%Dado un fonema 'R' sera sustituido por 'r' si es 
%encontrado al principio de la fras o por 'rr' si no es asi
% Sirve para readaptar las palabras ya que en la base de datos
% % % no esta presente el fonema 'R'

pos=find(elemento=='R');

for i=1:length(pos)
    if(pos(i)~=1)
        s=strcat(elemento(1:pos(i)-1),'rr');
        elemento=strcat(s,elemento(pos(i)+1:length(elemento)));
    else
     elemento=strcat('R',elemento(2:length(elemenrto)));
    end
end
salida=elemento;
end