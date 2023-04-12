# install in Ubuntu
1 打开 https://neuro-jena.github.io/cat/index.html#DOWNLOAD 下载 CAT12 Standalone for Linux 版本\
2 打开此文件夹中的MCR_v93.webloc链接，下载MATLAB Runtime R2017b版本。\
3 安装MATLAB Runtime，最好将“v93”文件夹安装在此文件夹中。\
4 使用run_spm12.sh调用GUI版本，或使用standalone/cat_standalone.sh通过shell脚本调用。\

# Usage
1  cd /data/zhiyu/data/software/cat12_latest_R2017b_MCR_Linux/CAT12.8.2_R2017b_MCR_Linux \
2  bash -x run_spm12.sh /data/zhiyu/data/software/cat12_latest_R2017b_MCR_Linux/CAT12.8.2_R2017b_MCR_Linux/v93 ##v93是matlab所在的位置\   
3  出现图形界面后，点击fMRI按钮
4  点击下拉菜单Toolbox,选中cat12,在新出现的cat12显示框中选中Segment\



参考：https://blog.csdn.net/Sophia2023/article/details/109076293?ydreferer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8%3D
