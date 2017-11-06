load('session1.mat');
res1 = res; 
load('session2.mat');
res2 = res; 
load('session3.mat'); 
res3 = res; 
delta = 50;
all1 = zeros(11, 2);
all2 = zeros(11, 2);
all3 = zeros(11, 2);
for n = 1:size(res1,1)
    s1 = 0 ;
    s2 = 0 ;
    for x = 1:(n-1)
        s1 = s1 + res1(x,1);
        s2 = s2 + res1(x,2);
    end
    
    all1(n, 1) = (delta - s1) / delta;
    all1(n,2 ) = (delta - s2) / delta;
end

all1(11, 1) = 0 ;
all1(11 , 2) = 0 ;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = 1:size(res2,1)
    s1 = 0 ;
    s2 = 0 ;
    for x = 1:(n-1)
        s1 = s1 + res2(x,1);
        s2 = s2 + res2(x,2);
    end
    
    all2(n, 1) = (delta - s1) / delta;
    all2(n,2 ) = (delta - s2) / delta;
end

all2(11, 1) = 0 ;
all2(11 , 2) = 0 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n = 1:size(res3,1)
    s1 = 0 ;
    s2 = 0 ;
    for x = 1:(n-1)
        s1 = s1 + res3(x,1);
        s2 = s2 + res3(x,2);
    end
    
    all3(n, 1) = (delta - s1) / delta;
    all3(n,2 ) = (delta - s2) / delta;
end

all3(11, 1) = 0 ;
all3(11 , 2) = 0 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










figure;
hold on ;
plot(all1(:,1), all1(:,2));


plot(all2(:,1), all2(:,2));


plot(all3(:,1), all3(:,2));


values = linspace(0, 1, 50);
% plot(all(:,1), all(:,1), '.');
plot(values, values , '.black');

legend('ROC Curve for human faces' , 'ROC Curve for spiders', 'ROC Curve for cars', 'Location', 'southeast'); 
title('Comparison of ROC Curves');
xlabel('False Alarm Rate');
ylabel('Hit Rate');