
function man_or_woman(file)
global SUCC;
[x,fs]=audioread(file); % 读入声音文件
%======时域图像======  随着时间声音赋值震荡图
data=x(:,1);            %取单声道
n=0:length(x)-1;        %建立一个信号等长的序列
time=n/fs;              %建立时间序列，作为横坐标
figure(1);              %图1：时域波形图
plot(time,data);        %作图
title('音频信号时域图')  %标题
xlabel('时间/s');       %标注横坐标
ylabel('幅值');         %标注纵坐标
grid on;                %打开网格线
filename = strcat('时域图\',file(6:length(file)),'.jpg');
saveas(gcf,filename);
 
%=======频域图======
N=length(data);         %取信号矩阵的长度
Y1=fft(data,N);         %N点傅里叶变换
mag=abs(Y1);            %取模
f=n*fs/N;               %频率序列
figure(2);              %图2：频谱图
plot(f(1:fix(N/2)),mag(1:fix(N/2)));
title('音频信号fft频谱图');%标题
xlabel('频率/Hz');       %标注横坐标
ylabel('幅度');          %标注纵坐标
grid on;                 %打开网格线
filename = strcat('频谱图\',file(6:length(file)),'.jpg');
saveas(gcf,filename);

%======基音频率提取======
[~,index]=max(data);          % 返回最大值 最大值索引
timewin=floor(0.015*fs);
xwin=data(index-timewin:index+timewin);
[y,~]=xcov(xwin);
ylen=length(y);
halflen=(ylen+1)/2 +30;
yy=y(halflen: ylen);
[~,maxindex] = max(yy);
fmax=fs/(maxindex+30);
disp([file,'基音频率为 ', num2str(fmax), ' Hz'])
%======通过基音频率判断男女声======
if (fmax<200)
    disp([file,' 是男声文件']);
    if (file(6)=='m')
        SUCC = SUCC+1;
        fprintf('判断结果：正确\n\n' );
    else
        fprintf('判断结果：错误\n\n' );
    end
else
    disp([file,' 是女声文件']);
    if (file(6)=='w')
        SUCC = SUCC+1;
        fprintf('判断结果：正确\n\n' );
    else
        fprintf('判断结果：错误\n\n' );
    end
end

