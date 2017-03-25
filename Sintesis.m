function [x,pitch_muestra] = Sintesis( matriz,fs)
%Esta funcion se encarga de hacer la sintesis de cada difonema
%dados sus coeficientes lpc en una matriz asi como su pitch y su ganancia.

Dwin=0.030*fs;
[m n]=size(matriz);
limites=Dwin:Dwin:Dwin*n;
x=zeros(1,Dwin*n);
pitch_muestra=floor(fs./(matriz(1,:)));
x(m-2)=1;
ultimo_pulso=m-2; %Variable que guarda el ultimo pulso dado
continuar=1;
indice=1;
while(continuar)
if(pitch_muestra(indice)==Inf)
    for i=1:Dwin
     x(i+(indice-1)*Dwin)=2*(rand-0.5); 
    end
    ultimo_pulso=limites(indice)-50;
    indice=indice+1;
else
    if(ultimo_pulso+pitch_muestra(indice)<limites(indice))
       x(ultimo_pulso+pitch_muestra(indice))=1;
       ultimo_pulso=ultimo_pulso+pitch_muestra(indice);
    else
        indice=indice+1;
    end  
end
 if (indice>n)
        continuar=0;
    end
end

indice=1;
v_coef=matriz(3:m-1,1);
g=matriz(m,1);

for i=m-2:limites(n)
     if (i>limites(indice))
         indice=indice+1;
         v_coef=matriz(3:m-1,indice);
         g=matriz(m,indice);
     end
      x(i)=x(i)*sqrt(g*160);
    for j=1:m-3
    x(i)= x(i)-v_coef(j)*x(i-j);
    end
   
end

end