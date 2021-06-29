clc; clear all; close all;
epsilon = 0.01; lambda = 1.4;
N = 1000;
x(1) = 1.4 ; y(1) = 0;
q = 8;
k1 = 2; k2 = 5;

figure('Name','Карта динамическич режимов отображения',...
    'Position', [200 300 1200 400]) 

plot(lambda, epsilon, 'r.', 'MarkerSize', 5);
set(gca, 'FontName', 'Arial Cyr', 'FontSize',12);
title('Карта динамических режимов отображения','Color','k');
xlabel('набор значений lambda','Color','k'); 
ylabel('Набор значений epsilon','Color','k')  
axis([-1.5 1.5 -1.1 1.1])
grid on
hold on

T=9;
for j=-1.1:0.01:1.1
    for k = -1.5:0.01:1.5
        epsilon=j; lambda=k;
        for i = 2:N
            x(i) = (lambda + epsilon*(x(i-1) - y(i-1)))*(1-x(i-1)^2);
            y(i) = x(i-1);
        end

        d=(x(N-q:N)+k1).^2+(y(N-q:N)+k2).^2;

        for jj=1:8
            if d(q+1-jj) == d(q+1)
               T=jj;
               break
            end
        end

        color = ['ymcrgbkwk'];
        plot(lambda, epsilon, [num2str(color(T)),'.'], 'MarkerSize', 4); 
        drawnow
    end
end