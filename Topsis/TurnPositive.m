function [ret] = TurnPositive(data, type, i)
    if type == 1
        %极小型
        ret = max(data) - data;
    elseif type == 2
        %中间型
        Xbest = input(['请输入第', num2str(i), '列的最佳中间值: ']);
        M = max(abs(data - Xbest));
        ret = 1 - (abs(data - Xbest)) / M;
    elseif type == 3
        %区间型
        Xup = input(['请输入第', num2str(i), '列的最佳区间的最大值: ']);
        Xdown = input(['请输入第', num2str(i), '列的最佳区间的最小值: ']);
        M = max(Xdown - min(data), max(data) - Xup);
        mid = zeros(size(data, 1), 1);
        for j = 1:size(data, 1)
            if data(j) < Xdown
                mid(j) = 1 - (Xdown - data(j)) / M;
            elseif data(j) > Xup
                mid(j) = 1 - (data(j) - Xup) / M;
            else
                mid(j) = 1;
            end
        end
        ret = mid;
    else
        disp('你输入的类型有误, 无法正确计算!');
    end
end
