function [filelist] = find_audiofile(path,audiofile_extension)
%��ȡָ��·����ָ����׺���ļ�
%   ����path·����file_extension���к�׺���͵��ļ�������filelist�з���
global filelist;
filelist=[];            %����filelist%
fileFolder=fullfile(path);        % ��Ҫ������·��������fileFolder�У���Ҫ����·��  % 
temp = cellstr(audiofile_extension);
for i = 1:length(temp)
    dirOutput=dir(fullfile(fileFolder,char(temp(i))));    % ��ȡ��Ӧ��׺���ļ�% 
    filenames={dirOutput.name};
     %filenames = filenames(3:length(filenames));         ���ǰ����ϵͳĬ�ϵ������ļ�%
    filelist = [filelist,filenames];
end

