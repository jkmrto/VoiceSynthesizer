function[valores_matriz]=hallar_valor(matriz,v)
% Esta función se encarga de dada una matriz en la
% que cada fila es un elemento fonetico así como 
% un vector en la que cada fonema tiene asignado 
% un valor, de asignar un valor a cada uno de los 
% elementos foneticos de dicha matriz

suma_posiciones=0;

%utilizamos barra 26 para indexar la busqueda ya que la lengua
%castellana cuenta con 24 fonemas, más el fonema silencio
%mas el fonema 0, necesario en toda las representaciones. 


   
  [tamano n]=size(matriz);
  valores_matriz=zeros(tamano,1);
  
%   Recorremos las diferentes filas de la matriz
for k=1:tamano
     d=matriz(k,:);
    %Modificacion para los fonemas dobles, para evitar el analisis del dos
       if (d(length(d))=='2')
        d2=d(1:2);
        d=d2;
        n=2;
       end
% Tomamos los fonemas del elemento fonetico y vamos sumando los
% los valores dados
       suma_posiciones=0;
    for j=1:n
          i=1;
         elemento_no_encontrado=1;
            while(elemento_no_encontrado)      
                 if(d(j)==v(i))
                     %Asignamos el valor en funcion de la posicion en 
%                    el vector dada por i y por la posicion en el elemento
%                     fonetico dada por j
                    suma_posiciones=(i-1)*26^(n-j)+suma_posiciones;
                    elemento_no_encontrado=0;
                 end
             i=i+1;
            end
      
    end
      valores_matriz(k,1)=suma_posiciones;
        
    end
end