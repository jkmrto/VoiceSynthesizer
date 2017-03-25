
function [a,g, pitch,pitchbueno] = parametros(difonema_entrada)

  %Función que realiza la segmentación en tramas del difonema, calcula los 
  %coeficientes LPC, la ganancia y el pitch de cada trama (si no es
  %periódica devuelve 0 como pitch). 
  Fs=8000;
  %tramas de 240ms ya que daban mejores resultados   
  tamano_trama=floor(Fs*10*10^-3*3);
  fs=8000;
  
   trama=zeros(1,tamano_trama);
   %Calculamos el numero de tramas (Truncamos para descartar las 
   %muestras sobrantes)
   n_tramas=floor(length(difonema_entrada)/tamano_trama) ;
  
   orden=20;
   pitchbueno=[];
   %Dividimos en tramas y descartamos las muestras sobrantes
   for i=1:n_tramas
       trama=difonema_entrada(((i-1)*tamano_trama+1):((i-1)*tamano_trama+tamano_trama));   
       
       %Cálculo de los coef. LPC y de la ganancia de una trama con la 
       %función de Matlab LPC
       [a1,g1]=lpc(trama',orden);
       
       %Estimación de pitch mediante el método de la autocorrelación
       %Calculamos la autocorrelación de la trama
       rs = xcorr(trama);
       %Comprobamos si en un rango razonable de valores de pitch hay un máximo
       %que supere un umbral adecuado.
       rs_norm=rs/max(rs);
     
       %Le damos de rango para buscar el 2º maximo 12 muestras después del
       %máximo principal
%        rango=rs_norm(tamano_trama+12:end);
%        [maximo,pos]=max(rango);
%        posicion_pico=pos+12;
%        %Ponemos este valor de umbral
%        umbral=0.35;
%        pitchbueno=1/(posicion_pico/Fs); %pitch en Hz
%        %Estimación de la periodicidad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       AMDF=zeros(1,length(trama));
       for j=1:length(trama)
           aux=zeros(1,8000);
           aux(j:(length(trama)+j-1))=trama';
           diferencia=abs(trama'-aux(1:length(trama)));
           AMDF(j)=sum(diferencia);
       end



       AMDF=AMDF/max(AMDF);
       inter_AMDF=AMDF(20:80);
       [minimo_AMDF,posicion_AMDF]=min(inter_AMDF);
       posicion_AMDF=posicion_AMDF+10;

       f_pitch2=1/(posicion_AMDF/fs);
       pitchbueno1 = 1/(posicion_AMDF/Fs); %pitch en Hz
      
       %Generamos la matriz con coeficientes LPC (a),el vector de 
       %ganancias (g) y el vector de pitch
       if(i==1)
           a=a1;
           g=g1;
           pitch=120;
           pitchbueno=pitchbueno1;
       else
           a=[a;a1];
           g=[g g1];
           pitch=pitch;
           pitchbueno=[pitchbueno pitchbueno1];
       end    
   end
end


