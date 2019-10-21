function dszxg2(filename)
%��ʱ����ط��������Ƶ��
global SUCC;
[x,fs]=audioread(filename);%��ȡ�����ļ�
data = x(:,1);
n=fs/50;   %ȡ20ms������Ƭ�Σ���160������
for m=1:length(data)/n;           %��ÿһ֡���ʱ����غ���
    	for k=1:n;
        	Rm(k)=0;
        	for i=(k+1):n;
            	Rm(k)=Rm(k)+data(i+(m-1)*n)*data(i-k+(m-1)*n);
        	end
    	end
    	p=Rm(10:n);                %��ֹ���У�ȥ��ǰ��10����ֵ�ϴ�ĵ�        
    	[~,N(m)]=max(p);        %��ȡ����غ���������
end          
N=N+10;
T=N/8;                         %�����������
T1= medfilt1(T,5);              %ȥ��Ұ��
F=1000/mean(T1,2);
%=========����ز���ͼ========
figure(1);              %ͼ1��ʱ����ͼ
plot(1:n,Rm);             %��ͼ
title('����ز���ͼ')      %����
xlabel('������');          %��ע������
ylabel('����غ���ֵ');         %��ע������
grid on;                %��������
filename1 = strcat('����ز���ͼ\',filename(6:length(filename)),'.jpg');
saveas(gcf,filename1);
%=======��������ͼ======           
figure(2);stem(T1,'.');
axis([0 length(T1) 0 10]);
xlabel('֡��(n)');
ylabel('����(ms)');
title('��֡��������');
filename2 = strcat('����ػ�������ͼ\',filename(6:length(filename)),'.jpg');
saveas(gcf,filename2);

disp([filename,'����Ƶ��Ϊ ',num2str(F), ' Hz'])
%======ͨ������Ƶ���ж���Ů��======
if (F<200)
    disp([filename,' �������ļ�']);
    if (filename(6)=='m')
        SUCC = SUCC+1;
        fprintf('�жϽ������ȷ\n\n' );
    else
        fprintf('�жϽ��������\n\n' );
    end
else
    disp([filename,' ��Ů���ļ�']);
    if (filename(6)=='w')
        SUCC = SUCC+1;
        fprintf('�жϽ������ȷ\n\n' );
    else
        fprintf('�жϽ��������\n\n' );
    end
end

