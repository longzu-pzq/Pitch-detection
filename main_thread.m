function main_thread()
%程序入口，初始化参数列表
%   程序主线程，项目从此函数开始执行
global audiofile_extension;
audiofile_extension = ['*.mp3';'*.m4a';'*.wav'];
global filelist;
global path;
global TOTAL;
path = 'D:\MATLAB R2018a Win\workspace\MATLAB基音检测项目demo - V1.1\音频文件';
filelist = find_audiofile(path,audiofile_extension);
loop_audiofile(filelist);
TOTAL = length(filelist);
global SUCC;
fprintf('识别成功率：%2.2f%%\n',SUCC/TOTAL*100);
end

