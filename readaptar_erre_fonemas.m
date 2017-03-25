function[salida]=readaptar_erre_fonemas(elemento)
% % Dado un difonema o trifonema se buscan los fonemas 'R'
% %  y se sustituyen por 'rr' tal y como esta en la base de datos
pos=find(elemento=='R');

for i=1:length(pos)
        s=strcat(elemento(1:pos(i)-1),'rr');
        elemento=strcat(s,elemento(pos(i)+1:length(elemento)));
end
salida=elemento;
end