function[posiciones_acentos,cadena2]=analisis_acentuacion(cadena)
% Funcion que analiza la frase dada y determina los lugares en los
% que hay tilde, lo cual será utilizado posteriorme para aumentar
% la fuerza de estos fonemas (ganancia y duracion)


% Realizamso la Transcripcion ya que trabajaremos de aqui en adelante
% unicamente sobre la version fonetica de la frase
cadena2=Transcripcion_Fonetica(cadena);
posicion_inicial=1;%Posicion de la primera letra de la palabra
 posiciones_acentos=[];
 
%  Analizamos que elementos tienen tilde, le sumamos uno a la posicion
%  ya que en la transcripcion dada todavía no se ha tenido en cuenta
%  el espacio inicial
    for i=1:length(cadena2)   
         if(cadena2(i)=='á')
               posiciones_acentos=[posiciones_acentos i+1];
               cadena2(i)='a';
        elseif(cadena2(i)=='é')
               posiciones_acentos=[posiciones_acentos i+1];
               cadena2(i)='e';
        elseif(cadena2(i)=='í')
               posiciones_acentos=[posiciones_acentos i+1];
               cadena2(i)='i';
        elseif(cadena2(i)=='ó')
               posiciones_acentos=[posiciones_acentos i+1];
               cadena2(i)='o';
        elseif(cadena2(i)=='ú')
               posiciones_acentos=[posiciones_acentos i+1]; 
               cadena2(i)='u';
 
        end 
        end 
    end
    
    

    

