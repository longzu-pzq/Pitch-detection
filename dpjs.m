function [sal] = dpjs(frame)
%���׼��㺯��
[s,fs,nbit]=audioread('beijing.wav');   %����һ������
b=s';                                 %��sת��
x=b(5000:5399);                       %ȡ400������
N=length(x);                          %���������ĳ���
S=fft(x);                             %��x���и���Ҷ�任
Sa=log(abs(S));                       %logΪ��eΪ�׵Ķ���
sa=ifft(Sa);                          %��Sa���и���Ҷ��任
ylen=length(sa);                      
for i=1:ylen/2
    sal(i)=sa(ylen/2+1-i);
end
for i=(ylen/2+1):ylen
    sal(i)=sa(i+1-ylen/2);
end
%��ͼ
figure(1);
subplot(2,1,1);
plot(x);
%axis([0,400,-0.5,0.5])
title('��ȡ��������');
xlabel('������');
ylabel('����');
subplot(2,1,2);
time2=[-199:1:-1,0:1:200];
plot(time2,sa1);
%axis([-200,200,-0.5,0.5])
title('��ȡ�����ĵ���');
xlabel('������');
ylabel('����');
end
