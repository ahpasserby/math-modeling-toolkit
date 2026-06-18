clc; clear;
a = input("输入数据来帮你计算归一化矩阵?(y/n): ", 's');
if strcmp(a, 'y')
    data = input("输入你的数据: ");
    nor = data ./ repmat(sum(data), size(data, 1), 1);
elseif strcmp(a, 'n')
    nor = input("你选择了否, 请你自己输入归一化矩阵: ");
else
    disp("请按照提示输入, 脚本结束");
    return;
end

A = input("输入你的判断矩阵: ");

max_eig = max(eig(A)); % 计算最大特征值
[~, n] = size(A); % 得到 A 的行数 n

CI = (max_eig - n) / (n - 1);
RI_sample = [0, 0, 0.58, 0.90, 1.12, 1.24, 1.32, 1.41, 1.45];
RI = RI_sample(n);
CR = CI / RI;

if CR == 0
    disp("一致性检验通过: 该矩阵为一致性矩阵");
    disp(['CR为: ', num2str(CR)]);
elseif CR < 0.1
    disp("一致性检验通过");
    disp(['CR为: ', num2str(CR)]);
elseif CR > 0.1
    disp("一致性检验不通过: CR > 0.1 需要修改你的判断矩阵再运行脚本");
    disp(['CR为: ', num2str(CR)]);
    return;
end

[V, D] = eig(A);
[~, max_eigCol] = max(diag(D)); % 返回 max_eig(最大特征值的坐标), 这里我们只需要max_eigCol 就行
pow = V(:, max_eigCol) ./ sum(V(:, max_eigCol)); % 得到准则权重 pow

score = nor * pow;
disp('各方案得分:');
disp(score);
