
# 使用cat_standalone.sh进行流程化

cwd=/data/zhiyu/data/software/cat12_latest_R2017b_MCR_Linux/CAT12.8.2_R2017b_MCR_Linux
cat12_dir=$cwd/spm12_mcr/home/gaser/gaser/spm/spm12/toolbox/cat12

input_files="/data/fansih/20210814_MRI_train/sampledata/ADgroup/T1/subject*/*dcm"
##Converted nifti

#${cwd}/standalone/cat_standalone.sh -s $cwd -m $cwd/v93    -b ${cwd}/standalone/cat_standalone_dicom2nii.m  $input_files  -a1 " 'patid' " -a2 "{'converted'}" -e

##Segmentation

t=0;
for i in `ls converted/*nii`
do
echo $i;
Samplename=$(basename $i);
echo $Samplename;
((t++))
echo $t
echo "  
cwd=$cwd
cat12_dir=$cat12_dir

\${cwd}/standalone/cat_standalone.sh  -s \$cwd -m \$cwd/v93 -b \${cwd}/standalone/cat_standalone_segment.m   -a1 \" '${cat12_dir}/templates_MNI152NLin2009cAsym/TPM_Age11.5.nii' \"   -a2 \" '${cat12_dir}/templates_MNI152NLin2009cAsym/Template_0_GS.nii' \"  ${i}    " >sh$Samplename.sh;
done

ls sh* |parallel -j 130 bash -x 


#${cwd}/standalone/cat_standalone.sh  -s $cwd -m $cwd/v93 -b ${cwd}/standalone/cat_standalone_segment.m   -a1 " '${cat12_dir}/templates_MNI152NLin2009cAsym/TPM_Age11.5.nii' "   -a2 " '${cat12_dir}/templates_MNI152NLin2009cAsym/Template_0_GS.nii' "  converted/*/*/*nii 

##Smooth

mkdir mwp1
cp converted/mri/mwp1* mwp1
${cwd}/standalone/cat_standalone.sh -m $cwd/v93 -b ${cwd}/standalone/cat_standalone_smooth.m  mwp1/*mwp1* -a1 "[6 6 6]" -a2 " 's6' "
