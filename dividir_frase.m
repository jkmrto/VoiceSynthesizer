function[difonemas,d_indice,trifonemas,t_indice,palabras,p_indice]=dividir_frase(cadena)
% Funcion utilizada para dividir la frase en sus diferentes elemento
% foneticos, devolviendo matrices para cada tipo de elemento así como un
% conjunto de indices que delimitan al elemento fonetico en la frase

% Obtenemos los difonemas
difonemas=Difonemas(cadena);
[m  n]=size(difonemas);
% Obtenemos los indices para los difonemas
d_indice=zeros(m,2);
for i=1:m
    d_indice(i,:)=[i i+1];
end

% Obtenemoslos trifonemas y los indices para los trifonemas 
[trifonemas t_indice]=Trifonemas(cadena);

% Obtenemos las palabras haciento uso de los espacios que las separan
espacios_encontrados=find(cadena=='_')+1;
palabra='                    ';
palabras=[];
ultimo_indice=1;
p_indice=zeros(length(espacios_encontrados)+1,2);
i=0;
indicador=0;
cadena=['_' cadena '_'];
display(cadena);
for i=1:length(espacios_encontrados)
    palabras=[palabras;palabra];
    intervalo_palabras=espacios_encontrados(i)-1-(ultimo_indice+1); 
    palabras(i,(length(palabras)-intervalo_palabras):length(palabras))=cadena(ultimo_indice+1:espacios_encontrados(i)-1);
    %Indices desde el primer fonema de la palabras hasta el ultimo, es
    %decir, si va de uno a 3 indicara que contine dos difonemas, del 1-2
    %y del 2-3
    p_indice(i,:)=[ultimo_indice,espacios_encontrados(i)];
    ultimo_indice=espacios_encontrados(i);
    indicador=1;
end 

%Esta indicacion es necesaria ya que el indice i carecerá 
%de valor si la frase dada no tiene ningun espacio
if (indicador==0)
i=0;    
end

palabras=[palabras;palabra];

%Cogemos los indices para el primer formante del fonema
%Que nos sera de utilidad para poder borrarlo de una 
%lista en la cual tendremos los difonemos necesarios 
%para crear la audicion
p_indice(i+1,:)=[ultimo_indice (length(cadena))];

intervalo_palabras=length(cadena)-(ultimo_indice+1); %puto lio para explicarlo4
palabras(i+1,(length(palabras)-intervalo_palabras+1):20)=cadena(ultimo_indice+1:length(cadena)-1);
end