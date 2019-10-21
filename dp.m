function dp(filename)
%���׷��������Ƶ��
global SUCC;
[x,fs]=audioread(filename);%��ȡ�����ļ�
data = x(:,1);
data=data';
n=fs/50;   %ȡ20ms������Ƭ�Σ���160������
for m=1:length(data)/n           %��ÿһ֡���ʱ����غ���
    offset = (m-1)*n;
    frame = data(offset+1:offset+n);
    frame2=frame.*hamming(length(frame));           % �Ӻ�����
    rwy=dpjs(frame2);                              %����
    ylen=length(rwy);
    cepstrum=rwy(1:ylen/2);
    for i=1:ylen/2
        cepstrum1(i)=rwy(ylen/2+1-i);
    end
    for i=(ylen/2+1):ylen
        cepstrum1(i)=rwy(i+1-ylen/2);
    end

    %=============�������============
    LF=floor(fs/500);%���û��������ķ�Χ70Hz��500Hz
    HF=floor(fs/70);
    cn=cepstrum1(LF:HF);
    [mx_cep ind]=max(cn);
    if mx_cep>0.08&ind>LF
        F(m) = LF+ind;
        T(m)=fs/F(m);
    else
        T(m)=0;
    end
end  
%f =mean(F);
pitch=mean(T);
end

