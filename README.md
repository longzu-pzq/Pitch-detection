# Pitch-detection
基音检测项目

demo运行：

1.安装、配置MATLAB运行环境;

2.切换工作路径到该demo目录下;

3.只需要执行一条命令：main_thread;


demo说明：

1.音频文件需放在项目目录下的【音频文件】夹下，会自动检索；

2.demo执行期间可在控制台观测程序执行过程；

3.demo执行结束会计算识别成功率（显示在控制台最后一行）；

4.demo执行结束，每个音频文件的自相关波形图和自相关基音周期图会分别存储在项目目录下的【自相关波形图】文件夹和【自相关基音周期图】文件夹下

5.可配置项：main_thread.m文件中的audiofile_extension参数（指定需要检索的音频文件类型）

  audiofile_extension = ['*.mp3';'*.m4a';'*.wav'];
