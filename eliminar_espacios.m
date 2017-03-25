function[salida]=eliminar_espacios(entrada)
%Esta funcion se encarga de eliminar los espacios
%Creados para conseguier que todas las palabras
%`puedan ser ubicadas en una misma matriz

loop=1;
indice=0; 
while(loop)
    indice=indice+1;
    if(entrada(indice)~=' ')
    loop=0;
    end   
end
salida=entrada(indice:length(entrada));
end