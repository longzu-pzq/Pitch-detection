function dszxg(filename)
%��ʱ����ط��������Ƶ��
%   ȡ20ms�Ӵ���ÿ��50֡
[x,fs]=audioread(filename); % ���������ļ�
data=x(:,1);    %ȡ����������
n = fs/50;      %ÿ֡��������
len = fix(length(data)/n);      %ȡ��֡��
%data=data(1:fix(length(data)/n)*n);
for i = 1:len %��ÿһ֡���ʱ����غ���
    offset = (i-1)*n;
    for k=1:n             %����֡��ÿһ������ĺ���ֵ
        Rn(k)=0;         %��ʼ���������㴦�ĺ���ֵ
        for m=1:(n-k)           %���������������غ���ֵ
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

figure(1);              %ͼ1��ʱ����ͼ
plot(1:len,t);        %��ͼ
title('����ز���ͼ')  %����
xlabel('������');       %��ע������
ylabel('����غ���ֵ');         %��ע������
grid on;                %��������

