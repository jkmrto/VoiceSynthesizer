function [ salida] = Difonemas( Fonemas)
%UNTITLED2 Summary of this function goes here

for i=1:length(Fonemas)
    salida(i,2)=Fonemas(i);
    salida(i+1,1)=Fonemas(i);
end

salida(length(Fonemas)+1,2)='_';
salida(1,1)='_';
