function[]=imprimir_elementos_no_presentes(difonemas,asignaciones);
% Función que imprime aquellos difonemas no presentes en la base de datos
% y que son necesarios para la sintesis de la frase
correcto=0;
[m n]=size(difonemas);
for i=1:m
%     Se busque aquellos elementos en la tabla de indices (asignaciones)
%     que aun tiene su valor, lo que significa que no se ha tomado dicho
%     difonema
    if(asignaciones(i,1)~=0)
        fprintf('El difonema %s no esta presente \n' ,difonemas(i,:))
    end
    if(correcto)
         fprintf('Todos los elementos foneticos estan presentes');
    end
end