%例题, 原始矩阵:Z = [90  4.0  35  15; 85  3.0  50  21; 92  4.5  40  19; 88, 3.5  38  17]
%[2, 3, 4]
%[1, 2, 3]
clc, clear;
disp('开始Topsis法程序');
x = input('请输入原始矩阵: ');
flag1 = input('是否开始原始矩阵正向化?(1开始, 0跳过): ');
if flag1 == 1
    disp('开始正向化');
    pos_row = input('哪些列要正向化?([2, 3, 4] 表示第 2 3 4列要正向化): ');
    pos_way = input('分别是什么类型(1极小型指标 2中间型指标 3区间型指标): ');
    for i = 1 : size(pos_row, 2)
        x(:, pos_row(i)) = TurnPositive(x(:, pos_row(i)), pos_way(i), pos_row(i));
    end
end

%标准化
Z = x ./ repmat(sqrt(sum(x .^ 2, 1)), size(x, 1), 1);

Zplus = max(Z);
Zneg = min(Z);

%权重

flag2 = input('是否指定权重, 默认权重相等(1指定 0不指定,使用默认):');
w = (zeros(1, size(x, 2)) + 1) .* (1 / size(x, 2));
if flag2 == 1
    w = input('请输入权重: ');
end

%计算距离和得分
score = zeros(size(x, 1), 1);
for i = 1:size(Z, 1)
    Dplus = sum(((Zplus - Z(i, :)) .^ 2) .* w) ^ 0.5;
    Dneg = sum(((Zneg - Z(i, :)) .^ 2) .* w) ^ 0.5;
    score(i) = Dneg / (Dplus + Dneg);
end

disp(score);
