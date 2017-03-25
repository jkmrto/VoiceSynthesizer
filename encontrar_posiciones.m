function[suma_posiciones]=hallar_valor(d,v)
suma_posiciones=0;
d=d
%utilizamos barra 26 para indexar la busqueda ya que la lengua
%castellana cuenta con 24 fonemas, más el fonema silencio
%mas el fonema 0, necesario en toda las representaciones.  
%  if (length(d)>2)
%      for i=1:(length(d)-1)
%          if((d(i)=='r')&&(d(i)==d(i+1)))
%          d1=zeros(1,length(d)-1);
%          d1(1:i)=d(1:i);
%          d1(i+1:length(d1))=d(i+2:length(d));
%          d=d1;
%          end
%      end
%  end

   if (d(length(d))=='2')
      d2=d(1:2);
      d=d2;
   end
    
for j=1:length(d)
    i=1;
    elemento_no_encontrado=1;
    while(elemento_no_encontrado)      
     if(d(j)==v(i))
       d(j)=d(j)
      suma_posiciones=(i-1)*26^(length(d)-j)+suma_posiciones;
     elemento_no_encontrado=0;
     end
     i=i+1;
     end
    
    end
end