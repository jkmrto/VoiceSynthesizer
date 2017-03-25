function[d]=modificar_erre(d)
% Esta función busca elemntos fonéticos que tengan una
% doble r y la sustituyen por una R

no_final=1;
indice=1;
while(no_final)
%     buscamos 'rr'
        if((d(indice))==d(indice+1)&&(d(indice)=='r')) 
         d1=zeros(1,length(d)-1);
         d1=d(1:indice);
         d2=d(indice+2:length(d));
         d=strcat(d1,d2);
% Lo sustituimos por 'R'
         d(indice)='R';
        end
% Acabamos el bucle cuanod se llega al ultimo elemento
      if((length(d)-1)<=indice)   
      no_final=0;
      end
      indice=indice+1;
end