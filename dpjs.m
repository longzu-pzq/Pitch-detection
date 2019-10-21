function [sal] = dpjs(frame)
%倒谱计算函数
[s,fs,nbit]=audioread('beijing.wav');   %读入一段语音
b=s';                                 %将s转置
x=b(5000:5399);                       %取400点语音
N=length(x);                          %读入语音的长度
S=fft(x);                             %对x进行傅里叶变换
Sa=log(abs(S));                       %log为以e为底的对数
sa=ifft(Sa);                          %对Sa进行傅里叶逆变换
ylen=length(sa);                      
for i=1:ylen/2
    sal(i)=sa(ylen/2+1-i);
end
for i=(ylen/2+1):ylen
    sal(i)=sa(i+1-ylen/2);
end
%绘图
figure(1);
subplot(2,1,1);
plot(x);
%axis([0,400,-0.5,0.5])
title('截取的语音段');
xlabel('样点数');
ylabel('幅度');
subplot(2,1,2);
time2=[-199:1:-1,0:1:200];
plot(time2,sa1);
%axis([-200,200,-0.5,0.5])
title('截取语音的倒谱');
xlabel('样点数');
ylabel('幅度');
end
