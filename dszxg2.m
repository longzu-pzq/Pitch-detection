function dszxg2(filename)
%短时自相关法计算基音频率
global SUCC;
[x,fs]=audioread(filename);%读取声音文件
data = x(:,1);
n=fs/50;   %取20ms的声音片段，即160个样点
for m=1:length(data)/n;           %对每一帧求短时自相关函数
    	for k=1:n;
        	Rm(k)=0;
        	for i=(k+1):n;
            	Rm(k)=Rm(k)+data(i+(m-1)*n)*data(i-k+(m-1)*n);
        	end
    	end
    	p=Rm(10:n);                %防止误判，去掉前边10个数值较大的点        
    	[~,N(m)]=max(p);        %读取自相关函数的最大点
end          
N=N+10;
T=N/8;                         %计算基音周期
T1= medfilt1(T,5);              %去除野点
F=1000/mean(T1,2);
%=========自相关波形图========
figure(1);              %图1：时域波形图
plot(1:n,Rm);             %作图
title('自相关波形图')      %标题
xlabel('样本点');          %标注横坐标
ylabel('自相关函数值');         %标注纵坐标
grid on;                %打开网格线
filename1 = strcat('自相关波形图\',filename(6:length(filename)),'.jpg');
saveas(gcf,filename1);
%=======基音周期图======           
figure(2);stem(T1,'.');
axis([0 length(T1) 0 10]);
xlabel('帧数(n)');
ylabel('周期(ms)');
title('各帧基音周期');
filename2 = strcat('自相关基音周期图\',filename(6:length(filename)),'.jpg');
saveas(gcf,filename2);

disp([filename,'基音频率为 ',num2str(F), ' Hz'])
%======通过基音频率判断男女声======
if (F<200)
    disp([filename,' 是男声文件']);
    if (filename(6)=='m')
        SUCC = SUCC+1;
        fprintf('判断结果：正确\n\n' );
    else
        fprintf('判断结果：错误\n\n' );
    end
else
    disp([filename,' 是女声文件']);
    if (filename(6)=='w')
        SUCC = SUCC+1;
        fprintf('判断结果：正确\n\n' );
    else
        fprintf('判断结果：错误\n\n' );
    end
end

