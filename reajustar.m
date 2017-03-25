function[p]=reajustar(pq); 

p=pq;
for i=1:length(pq)
    if(pq(i)>200 && pq(i)<300)
    p(i)=pq(i)/32;
    elseif(pq(i)>300 && pq(i)<500)
     p(i)=pq(i)/3;
    elseif(pq(i)>200 && pq(i)<300)
    elseif(pq(i)>200 && pq(i)<300)
    p(i)=0;
    end
end
p=medfilt2(p,[1,3]);


end