function[palabras]=redistribuir_espacios(nuevas,original,n);
% Función creada para adaptar palabras de n caracteres
% a una matriz de 12 caracteres rellenando el resto
% de la matriz con espacios
% Cada palabra sera una fila
tamano=12;
nueva_adaptada=['            '];
indice=length(original);

palabras=original;

        for i=1:n:length(nuevas)
            nueva=Transcripcion_Fonetica(nuevas(i:i+(n-1)));
            nueva_adaptada(tamano-(length(nueva))+1:tamano)=nueva; 
            palabras=[palabras;nueva_adaptada];
        end

end