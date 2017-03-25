function[]=imprimir_fonemas(valor)
[m n]=size(valor);
% for i=1:m
% fprintf(' %s         %d  %d\n',fonemas(i,:),valor(i,1),valor(i,2));
% end

for i=1:m
fprintf('         %d  %d\n',valor(i,1),valor(i,2));
end
fprintf('\n');
end