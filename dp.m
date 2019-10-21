function dp(filename)
%倒谱法计算基音频率
global SUCC;
[x,fs]=audioread(filename);%读取声音文件
data = x(:,1);
data=data';
n=fs/50;   %取20ms的声音片段，即160个样点
for m=1:length(data)/n           %对每一帧求短时自相关函数
    offset = (m-1)*n;
    frame = data(offset+1:offset+n);
    frame2=frame.*hamming(length(frame));           % 加汉明窗
    rwy=dpjs(frame2);                              %求倒谱
    ylen=length(rwy);
    cepstrum=rwy(1:ylen/2);
    for i=1:ylen/2
        cepstrum1(i)=rwy(ylen/2+1-i);
    end
    for i=(ylen/2+1):ylen
        cepstrum1(i)=rwy(i+1-ylen/2);
    end

    %=============基音检测============
    LF=floor(fs/500);%设置基音搜索的范围70Hz—500Hz
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

