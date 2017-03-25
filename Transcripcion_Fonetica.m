function [ fonemas ] = Transcripcion_Fonetica( frase )
% Esta función se encarga de relizar la transcripcion
% fonetica de una frase dada, colocando '_' en los espacios
% intermedios y respetando los espacios iniciales.


%actualizar:Indica que es necesario aumentar la variable
%desplazamiento al final del bucle de analisis
actualizar=0; 

%desplazamiento:Indica que se ha desplazado el indice que
%recorre en el vector frase, debido a algun sonido
%represntado por dos caracteres, o un caracter (como la h)
%no representado por ningun sonido
desplazamiento=0;

%aparicion_x: indica que ha aparecido el caracter x
%por lo que se desplaza el indice para los fonemas
%ya que la 'x' implica dos fonemas por caracter
aparicion_x=0;


% Este codigo tiene como objetivo dejar sin alterar
% el conjunto de espacios encontrados al principio
% de el fonema o frase ya que estos son usados
% para poder tener palabras de una dimension constante
seguir=1;
indice=0;
while(seguir)
    indice=indice+1;
    if(frase(indice)~=' ')
        seguir=0;
    end
end

%frase es un vector con los valores de forma primitiva
% Analizamos las diferentes posibilidades en la lengua española
for i=indice:length(frase)
     if((desplazamiento+i)<=length(frase))
         if((frase(desplazamiento+i)=='h'))
        desplazamiento=desplazamiento+1;
         end
    if ((frase(i+desplazamiento)=='b')||(frase(i+desplazamiento)=='v')||(frase(i+desplazamiento)=='w'))
        fonemas(i+aparicion_x)='b';
    elseif(frase(i+desplazamiento)=='z')
        fonemas(i+aparicion_x)='z';
    elseif(frase(i+desplazamiento)=='c')
        if((frase(i+1+desplazamiento)=='a')||(frase(i+1+desplazamiento)=='o')||(frase(i+1+desplazamiento)=='u'))
            fonemas(i+aparicion_x)='k';
        elseif (frase(i+1+desplazamiento)=='h')
            fonemas(i+aparicion_x)='c';
        elseif ((frase(i+1+desplazamiento)=='n')||(frase(i+1+desplazamiento)=='t')||(frase(i+1+desplazamiento)=='r')||(frase(i+1+desplazamiento)=='l'))
            fonemas(i+aparicion_x)='k';
        else
            fonemas(i+aparicion_x)='z';
        end
    elseif(frase(i+desplazamiento)=='q')
        fonemas(i+aparicion_x)='k';
        actualizar=1;
    elseif (frase(i+desplazamiento)=='l')
        if(length(frase)>i+desplazamiento)
            if(frase(i+1+desplazamiento)=='l')
                fonemas(i+aparicion_x)='y';
                actualizar=1;
            else
                fonemas(i+aparicion_x)='l';
            end
        else
        fonemas(i+aparicion_x)='l';
        end
    elseif (frase(i+desplazamiento)=='g')
        if((frase(i+1+desplazamiento)=='a')||(frase(i+1+desplazamiento)=='o')||(frase(i+1+desplazamiento)=='u'))
            fonemas(i+aparicion_x)='g';
            if((frase(i+1+desplazamiento)=='u')&&((frase(i+2+desplazamiento)=='e')||(frase(i+2+desplazamiento)=='i')))
                fonemas(i+aparicion_x)='g';
              actualizar=1;
            end
        else
            fonemas(i+aparicion_x)='j';
        end
    elseif (frase(i+desplazamiento)=='r')
        if(length(frase)==(i+desplazamiento))
            fonemas(i+aparicion_x)='R';
        else
        if(i>1)
            if ((frase(i-1+desplazamiento)==' ')||(frase(i-1+desplazamiento)=='n')||(frase(i+1+desplazamiento)=='r'))
                if(frase(i+1+desplazamiento)=='r')
                   actualizar=1;               
                end
            fonemas(i+aparicion_x)='R';
            else
            fonemas(i+aparicion_x)='r'; 
            end
        else
        fonemas(i+aparicion_x)= 'R';
        
        end
        end
    elseif (frase(i+desplazamiento)==' ')
        fonemas(i+aparicion_x)='_';
    elseif(frase(i+desplazamiento)=='x')
        fonemas(i+aparicion_x)='k';
        fonemas(i+aparicion_x+1)='s';
        aparicion_x=aparicion_x+1;
    else
        fonemas(i+aparicion_x)=frase(i+desplazamiento);
    end
     if(actualizar)
         actualizar=0;
       desplazamiento=desplazamiento+1;   
     end
     end
  end
end

