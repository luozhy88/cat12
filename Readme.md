# install in Ubuntu
1 打开 https://neuro-jena.github.io/cat/index.html#DOWNLOAD 下载 CAT12 Standalone for Linux 版本\
2 打开此文件夹中的MCR_v93.webloc链接，下载MATLAB Runtime R2017b版本。\
3 安装MATLAB Runtime，最好将“v93”文件夹安装在此文件夹中。\
4 使用run_spm12.sh调用GUI版本，或使用standalone/cat_standalone.sh通过shell脚本调用。\

# Usage

## 使用dcm2niix转换DICOM文件为NIfTI格式
sudo apt-get install dcm2niix\
dcm2niix -f Sample1 -o test_output /data/*/RESEARCH_HEAD_20201031_120243_104000/T1_MPRAGE_SAG_P2_ISO_TR_3_0_8MM_0004  \
  -f 参数是输出文件名的名称\
  -o test_output 是结果输出位置\
  /data/*/RESEARCH_HEAD_20201031_120243_104000/T1_MPRAGE_SAG_P2_ISO_TR_3_0_8MM_0004 里面文件都是*RESEARCH_HEAD*66299859.IMA \

## 方法1 图形界面

### 此方法为图形界面，不推荐使用  
1  cd /data/zhiyu/data/software/cat12_latest_R2017b_MCR_Linux/CAT12.8.2_R2017b_MCR_Linux \  
2  bash -x run_spm12.sh /data/zhiyu/data/software/cat12_latest_R2017b_MCR_Linux/CAT12.8.2_R2017b_MCR_Linux/v93 ##v93是matlab所在的位置\     
3  出现图形界面后，点击fMRI按钮  
4  点击下拉菜单Toolbox,选中cat12,在新出现的cat12显示框中选中Segment\  



参考：https://blog.csdn.net/Sophia2023/article/details/109076293?ydreferer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8%3D

## 方法2 终端使用
### 使用cat_standalone.sh进行流程化

cwd=/data/zhiyu/data/software/cat12_latest_R2017b_MCR_Linux/CAT12.8.2_R2017b_MCR_Linux  

cat12_dir=$cwd/spm12_mcr/home/gaser/gaser/spm/spm12/toolbox/cat12  

#### Converted nifti

${cwd}/standalone/cat_standalone.sh -s $cwd -m $cwd/v93    -b ${cwd}/standalone/cat_standalone_dicom2nii.m  /data/fansih/20210814_MRI_train/sampledata/ADgroup/T1/subject*/*dcm   -a1 " 'patid' " -a2 "{'converted'}" -e  

#### Segmentation

${cwd}/standalone/cat_standalone.sh  -s $cwd -m $cwd/v93 -b ${cwd}/standalone/cat_standalone_segment.m  converted/*/*/*nii  -a1 " '${cat12_dir}/templates_MNI152NLin2009cAsym/TPM_Age11.5.nii' "   -a2 " '${cat12_dir}/templates_MNI152NLin2009cAsym/Template_0_GS.nii' "  #Template_0_GS1mm  

#### Smooth
mkdir mwp1  
cp converted/*/*/mri/mwp1* mwp1  

${cwd}/standalone/cat_standalone.sh -m $cwd/v93 -b ${cwd}/standalone/cat_standalone_smooth.m  mwp1/*mwp1* -a1 "[6 6 6]" -a2 " 's6' "  

#### 合并脚本
https://github.com/luozhy88/cat12/blob/main/run_bash.sh
## 统计分析
1 打开Statistics Analysis 中的Basic Models  
2 在Batch Editor中选择SPM菜单栏中的Stats  
参考：https://blog.csdn.net/Sophia2023/article/details/109076293?ydreferer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8%3D  
