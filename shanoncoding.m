clc;
clear all;
close all;
m=input('Enter the no of message ensemble: ');
z=[];
h=0;l=0;
disp('Enter the probabilities in descending order: ');
for i=1:m
    fprintf('Ensemble %d\n', i);
    p(i)=input('');
end
a(1)=0;
for j=2:m
    a(j)=a(j-1)+p(j-1);
end
fprintf('\n Alpha Matrix');
disp(a);
for i=1:m
    n(i)=ceil(-1*(log2(p(i))));
end
fprintf('\n code length matrix');
disp(n);
for i=1:m
    int=a(i);
    for j=1:n(i)
        frac=int*2;
        c=floor(frac);
        frac=frac-c;
        z=[z c];
    end
    fprintf('codeword %d', i);
    disp(z);
    z=[];
end
fprintf('Avg code length');
for i=1:m
    x=p(i)*n(i);
    l=l+x;
    x=p(i)*log2(1/p(i));
    h=h+x;
end
disp(l);
fprintf('Entropy');
disp(h);
fprintf('Efficiency');
disp(100*h/l);
fprintf('Redundancy');
disp(100-(100*h/l));
 