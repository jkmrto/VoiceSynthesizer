function[salientes]=eliminar_indices_tabla(restantes,indices)
% Funcion que elmina los indices de los difonemas que ya ha sido
% encontrados, asignandoles 0,0


for i=indices(1):indices(2)-1
    restantes(i,:)=[0 0];
end
salientes=restantes;
end