function main_thread()
%������ڣ���ʼ�������б�
%   �������̣߳���Ŀ�Ӵ˺�����ʼִ��
global audiofile_extension;
audiofile_extension = ['*.mp3';'*.m4a';'*.wav'];
global filelist;
global path;
global TOTAL;
path = 'D:\MATLAB R2018a Win\workspace\MATLAB���������Ŀdemo - V1.1\��Ƶ�ļ�';
filelist = find_audiofile(path,audiofile_extension);
loop_audiofile(filelist);
TOTAL = length(filelist);
global SUCC;
fprintf('ʶ��ɹ��ʣ�%2.2f%%\n',SUCC/TOTAL*100);
end

