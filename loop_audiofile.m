function  loop_audiofile(filelist)
%���ļ��б��е��ļ�ѭ��ִ�л������
global SUCC;
SUCC=0;
for i=1:length(filelist)
    filename = strcat('��Ƶ�ļ�\',filelist(i));
    filename = char(filename);
    dszxg2(filename);

end
