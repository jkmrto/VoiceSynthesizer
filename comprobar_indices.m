function[resultado]=comprobar_indices(indices,tabla_indices)
% Esta función tiene como objetivo ver
% si un difonema o trifonema ha sido ya seleccionado
% y se encuentra en el conjunto de elementos encontrados,
% para ello necesitamos los indices de dicho elemento fonetico
% asi como la lista con los indices de difonemas aun no asignados

resultado=1;

for i=indices(1):indices(2)-1
    if(tabla_indices(i)==0)
    resultado=0;
    end
end

end