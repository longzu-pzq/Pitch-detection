function [filelist] = find_audiofile(path,audiofile_extension)
%获取指定路径下指定后缀的文件
%   遍历path路径下file_extension所有后缀类型的文件，加入filelist中返回
global filelist;
filelist=[];            %重置filelist%
fileFolder=fullfile(path);        % 需要遍历的路径保存在fileFolder中，需要绝对路径  % 
temp = cellstr(audiofile_extension);
for i = 1:length(temp)
    dirOutput=dir(fullfile(fileFolder,char(temp(i))));    % 获取对应后缀的文件% 
    filenames={dirOutput.name};
     %filenames = filenames(3:length(filenames));         清除前两个系统默认的隐藏文件%
    filelist = [filelist,filenames];
end

