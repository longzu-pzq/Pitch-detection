function dszxg(filename)
%短时自相关法计算基音频率
%   取20ms加窗，每秒50帧
[x,fs]=audioread(filename); % 读入声音文件
data=x(:,1);    %取单声道数据
n = fs/50;      %每帧样本点数
len = fix(length(data)/n);      %取整帧数
%data=data(1:fix(length(data)/n)*n);
for i = 1:len %对每一帧求短时自相关函数
    offset = (i-1)*n;
    for k=1:n             %计算帧内每一样本点的函数值
        Rn(k)=0;         %初始化该样本点处的函数值
        for m=1:(n-k)           %计算样本点的自相关函数值
            Rn(k)=Rn(k)+data(offset+m)*data(offset+m+k);
        end
    end
    Rn(offset+n)=0;
    [m(i),index(i)]=max(Rn);
end
t = index/8
for i = 1:len
    fprintf('%f   %d\n',m(i),index(i));
end

figure(1);              %图1：时域波形图
plot(1:len,t);        %作图
title('自相关波形图')  %标题
xlabel('样本点');       %标注横坐标
ylabel('自相关函数值');         %标注纵坐标
grid on;                %打开网格线

