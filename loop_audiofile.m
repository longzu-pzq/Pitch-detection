function  loop_audiofile(filelist)
%对文件列表中的文件循环执行基音检测
global SUCC;
SUCC=0;
for i=1:length(filelist)
    filename = strcat('音频文件\',filelist(i));
    filename = char(filename);
    dszxg2(filename);

end
