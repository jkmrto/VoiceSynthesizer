clear all

cadena=input('Ingrese una cadena: ','s');
pitchs=[];
%Leemos todos los fonemas y palabras almacenadas en la base de datos
ordenamiento_fonemas;

%Analizamos la acentuación con objeto de usarla
%posteriormente
[prosodia_acentuacion,cadena]=analisis_acentuacion(cadena);

%Dividimos los fonemas para encontrar la mejor aproximacion posible
[difonemas,d_indice,trifonemas,t_indice,palabras,p_indice]=dividir_frase(cadena);

%Trabajaremos siempre sobre los fonemas 
%(aunque ya se ha realizado previamente)
fonemas=Transcripcion_Fonetica(cadena);

%En primer lugar realizamos la busqueda de las palabras,
%ya que en principio son los elementos de mayor tamaño
%para ello haremos uso de vector 'palabras' donde
%se encuentran las diferentes palabras de la frase introducida
%separadas en diferentes filas

%indice_global:Indica la cantidad de elementos encontrados
indice_global=1;

%asignaciones: matriz donde se ven los difonemas que aun 
%no se han encontrado, los que se han encontrado tiene
% un [0,0] en su posicion
asignaciones=d_indice;

%Iniciamos la matriz donde guardaremos los elementos encontrados
encontradas=[];
encontrada='                    ';

%vector_orden: vector utilizado para darle a cada palabra un valor numerico
%lo cual es necesario a la hora de realzar busquedas de palabras
vector_orden=[' ';'a';'b';'c';'d';'e';'f';'g';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'r';'R';'s';'t';'u';'x';'y';'z';'_'];
vector_indices=[];

%tipo: Tipo de elemento encontrado,
tipo=[];

%Determinaos el numero de palabras encontradas
[m n]=size(palabras);
%Ejecutamos un bucle en el cual buscamos que palabras
%estan contenidas en la base de datos y realizando
%los cambis oportumos para asi evitar que los elementos
%ya encontrados sean sobreescritos por otros elementos menores
for i=1:m
    palabra=palabras(i,:);
    palabra_valor=hallar_valor(palabra,vector_orden);
    asignar=find(datos_valor_palabras==palabra_valor);
    if (length(asignar)~=0)
       encontradas=[encontradas;encontrada];
       tipo=[tipo 'p'];
       encontradas(indice_global,:)=palabra;
       indices=p_indice(i,:);
       vector_indices=[vector_indices;indices];
       asignaciones=eliminar_indices_tabla(asignaciones,indices);
       indice_global=indice_global+1;
    end
end
% imprimir(asignaciones)

%Realizamos el mismo proceso que el realizado para las palabras
 [m n]=size(trifonemas);
 for i=1:length(trifonemas)
     trifonema=trifonemas(i,:);
     valor_trifonema=hallar_valor(trifonema,vector_orden);
     asignar=find(datos_valor_trifonemas==valor_trifonema);
     if((~isempty(asignar))&&(comprobar_indices(t_indice(i,:),asignaciones)))
     encontradas=[encontradas;encontrada];
     tipo=[tipo 't'];
     encontradas(indice_global,length(encontrada)-length(trifonema)+1:length(encontrada))=trifonema;    
     indices=t_indice(i,:); 
     vector_indices=[vector_indices;indices];
     asignaciones=eliminar_indices_tabla(asignaciones,indices);
     indice_global=indice_global+1;
     end
 end
% imprimir(asignaciones)
 
 %Repetimos el proceso para los difonemas
 [m n]=size(difonemas);
 for i=1:m
    difonema=difonemas(i,:);
    valor_difonema=hallar_valor(difonema,vector_orden);
    asignar=find(datos_valor_difonemas==valor_difonema);
    if(~isempty(asignar)&&(comprobar_indices(d_indice(i,:),asignaciones)))
        encontradas=[encontradas;encontrada];
        tipo=[tipo 'd'];
        encontradas(indice_global,length(encontrada)-length(difonema)+1:length(encontrada))=difonema; 
        indices=d_indice(i,:); 
        vector_indices=[vector_indices;indices];
        asignaciones=eliminar_indices_tabla(asignaciones,indices);
         indice_global=indice_global+1;
    end
 end
% imprimir(asignaciones)
 
%  Debido a que hay algunos difonemas que no estan presentes
%  alguno de ellos son los que tienen el sonido R, pues 
%  cambiamos este sonido con el objetivo de tomar el sonido r
% y asi poder realizar la concatenacion aún perdiendo parte de
% la precision

 for i=1:length(asignaciones)
     if(asignaciones(i,1)~=0)
         if(difonemas(i,1)=='R')
            difonemas(i,1)='r';
         elseif   (difonemas(i,2)=='R')
             difonemas(i,2)='r';
         end
     end
 end
 
% De nuevo realizamos una reasignacion de fonemas
% con objeto de ubicar aquellos que no hayan 
% podido ser ubicado previamente
 for i=1:m
    difonema=difonemas(i,:);
    valor_difonema=hallar_valor(difonema,vector_orden);
    asignar=find(datos_valor_difonemas==valor_difonema);
    if(~isempty(asignar)&&(comprobar_indices(d_indice(i,:),asignaciones)))
        encontradas=[encontradas;encontrada];
        tipo=[tipo 'd'];
        encontradas(indice_global,length(encontrada)-length(difonema)+1:length(encontrada))=difonema; 
        indices=d_indice(i,:); 
        vector_indices=[vector_indices;indices];
        asignaciones=eliminar_indices_tabla(asignaciones,indices);
         indice_global=indice_global+1;
    end 
 end
 
 
 %%Bucle principal para la concatenacion de unidades
 clear indice;
 
 %Imprimimos los difonemas no presentes en la base de datos  
 imprimir_elementos_no_presentes(difonemas,asignaciones);
 
 %Creamos los strings necesarios para acceder a la
 %base de datos
tr='trifonemas/';
di='difonemas/';
pa='palabras/';

 %Variables creados para navegar por la matriz que contiene
 %los diferentes elementos
 indice=1;
 pos=0;
 loop=1;
 sonido=[];%vector donde guardaremos el resultado 
 while(loop)
     pos=find(vector_indices(:,1)==indice);
     
         elemento=eliminar_espacios(encontradas(pos,:));
  
%    Concatenamos el directorio teniendo en cuenta 
%  cual es el tipo de elemento fonetico que se va
% a concatenar
   if(tipo(pos)=='t')
      elemento=strcat(tr,elemento);
      elemento=readaptar_erre_fonemas(elemento);
  elseif(tipo(pos)=='d')
      elemento=strcat(di,elemento);
      elemento=readaptar_erre_fonemas(elemento);
  elseif(tipo(pos)=='p')
        elemento=strcat(pa,elemento);
        elemento=readaptar_erre_palabras(elemento);
  end
  indice_prosodia=1; %indice del vector acentos
%  Concantenamos el final del nombre para asi bucarlo
  elemento=strcat(elemento,'.wav');
% Cargamos el elemento fonetico
  cargado=wavread(elemento);
 %Calculamos los parametros
 [a,g, pitch,pitchbueno]=parametros(cargado);
%  pitch=reajustar(pitchbueno) 
 pitch=pitchbueno;
 fs=8000;
% Concatenamos los parametros encontrados
 matriz=floor(pitch);
 matriz=[matriz; a'];
 matriz=[matriz;(g)];
%  Aumentamos la ganancia para para los fonemas
% acentuados y aumentamos las tramas para dichos
% fonemas
 if(~isempty(prosodia_acentuacion))
     if(prosodia_acentuacion(indice_prosodia)==indice)
        [m2 n2]=size(matriz);
        for i=1:1
        matriz=[matriz(:,1) matriz ];
        matriz(m2,1)=(sqrt(matriz(m2,i)));
        end
     end
 end
%  Realizamos la sintesis
 x=Sintesis(matriz,fs);
%  Obtenemos el punto de union para el enventanado,
% Se utiliza una ventana hamming aplicandole 
% una raiz cuadrada para asi hacer que el conjunto
% de elemento solapados sea algo menor que para una
% ventana hamming normal 
 intermedio=find(sqrt(hamming(length(x)))>0.5);
 intermedio=intermedio(1);
%  adaptar_sonido()
%  Detectamos si es la primera unidad fonetica
    if (isempty(sonido))
% Si es la primera unidad fonética aplicamos la 
% ventana hamming pero respetamos los primeros 
% elementos ya que estos no serán solapados
% por ninguna otra trama
    sonido=[sonido x'.*hamming(length(x))]; 
    sonido(1:length(x)/2)=x(1:length(x)/2);
    else
%En caso de no ser la primera trama realizamos el enventanado hamming
% a la trama, desplazando la trama enventanada un numero de muestras
%  que vendra dado por el putno intermedio antes obtenido
% y por el numero de elementos que ya hay concatenado
% Hecho esto solapamos la trama y el resto de concatenaciones
    trama_hamming=x'.*hamming(length(x));
    q=zeros(1,(length(sonido)+length(x)-intermedio));
    e=q;
    q(length(sonido)-intermedio+1:length(q))=trama_hamming;
    e(1:length(sonido))=sonido;
    sonido=sum([q;e]);
    end
         
  %Actualizamos el indice para la proxima iteraccion
 indice=vector_indices(pos,2);
%  Acabmos el bucle al encontrar  que el indice
% es superior al numeor de fonemas
 if(indice==length(difonemas)+1)
    loop=0;
 end
 end
 soundsc(sonido);
 
 