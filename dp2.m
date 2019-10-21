function dp2(filename)
[y,fs]=audioread(filename);
time1=1:length(y);
time=(1:length(y))/fs;
frameSize=floor(50*fs/1000);                   % ֡��
startIndex=round(5000);                        % ��ʼ���
endIndex=startIndex+frameSize-1;               % �������
frame=y(startIndex:endIndex);                  % ȡ����֡
frameSize=length(frame);
frame2=frame.*hamming(length(frame));           % �Ӻ�����
rwy=rceps(frame2);                             % ����
ylen=length(rwy);
cepstrum=rwy(1:ylen/2);
for i=1:ylen/2;
    cepstrum1(i)=rwy(ylen/2+1-i);
end
for i=(ylen/2+1):ylen;
    cepstrum1(i)=rwy(i+1-ylen/2);
end
%������
LF=floor(fs/500);                               %�������ڵķ�Χ��70~500Hz
HF=floor(fs/70);
cn=cepstrum(LF:HF);
[mx_cep ind]=max(cn);
if mx_cep>0.08&ind>LF;
    a=fs/(LF+ind);
else
    a=0;
end
pitch=a
%��ͼ
figure(1);
subplot(3,1,1);
plot(time1,y);
title('��������');
%axis tight
ylim=get(gca,'ylim');
line([time1(startIndex),time1(startIndex)],ylim,'color','r');
line([time1(endIndex),time1(endIndex)],ylim,'color','r');
xlabel('������');
ylabel('����');
subplot(3,1,2);
plot(frame);
%axis([0,400,-0.5,0.5])
title('һ֡����');
xlabel('������');
ylabel('����')

subplot(3,1,3);
time2=[-199:1:-1,0:1:200];
plot(time2,cepstrum1);
%axis([-200,200,-0.5,0.5])
title('һ֡�����ĵ���');
xlabel('������');
ylabel('����');
end



