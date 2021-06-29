clc; clear all; close all;
epsilon = 0.5; lambda = 0.5;
N = 100;

for i = 0:50
    for j = 0:50
        x0(1+i*50+j) = 0.04*i - 1;
        y0(1+j*50+i) = 0.04*i - 1;
    end
end

subplot(1,4,1)
plot(x0, y0, 'r.', 'MarkerSize', 5);
set(gca, 'FontName', 'Arial Cyr', 'FontSize',12);
title('Исходное состояние','Color','k');
xlabel('набор значений х','Color','k'); 
ylabel('Набор значений у','Color','k')  
axis([-1.1 1.1 -1.1 1.1])
grid on
hold on

for k = 1:2551
    x1(k) = (lambda + epsilon*(x0(k) - y0(k)))*(1 - x0(k)^2);
    y1(k) = x0(k);
end

subplot(1,4,2)
plot(x1, y1, 'r.', 'MarkerSize', 5);
set(gca, 'FontName', 'Arial Cyr', 'FontSize',12);
title('Первая итерация','Color','k');
xlabel('набор значений х','Color','k'); 
ylabel('Набор значений у','Color','k')  
grid on
hold on

for l = 1:2551
    x2(l) = (lambda + epsilon*(x1(l) - y1(l)))*(1 - x1(l)^2);
    y2(l) = x1(l);
end

subplot(1,4,3)
plot(x2, y2, 'r.', 'MarkerSize', 5);
set(gca, 'FontName', 'Arial Cyr', 'FontSize',12);
title('Вторая итерация','Color','k');
xlabel('набор значений х','Color','k'); 
ylabel('Набор значений у','Color','k')  
grid on
hold on

for m = 1:2551
    x3(m) = (lambda + epsilon*(x2(m) - y2(m)))*(1 - x2(m)^2);
    y3(m) = x2(m);
end

subplot(1,4,4)
plot(x2, y2, 'r.', 'MarkerSize', 5);
set(gca, 'FontName', 'Arial Cyr', 'FontSize',12);
title('Третья итерация','Color','k');
xlabel('набор значений х','Color','k'); 
ylabel('Набор значений у','Color','k')  
grid on
hold on