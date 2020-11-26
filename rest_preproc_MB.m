spmdir='/p/ashish/Multiband_prisma/HCP';
subjects={'100307','103414','110411','111312','113619','115320','117122','123117','124422','125525','129028','133928','135932','136833','139637'};
% function rest_preproc_MB(subj_no_str)

% subj_no=str2num(subj_no_str);
% logdir='/p/ashish/MultiBandEPI/onsets_mb_40/sub5-17_hitsnmiss';
% physiodir='/p/ashish/Multiband_prisma/EPILEPSY_STUDY/Focal';
% spmdir='/p/ashish/Multiband_prisma/EPILEPSY_STUDY/Focal';
% subjects={'PAT_01','PAT_02','PAT_03','PAT_04','PAT_05','PAT_06','PAT_07','PAT_08','PAT_09','PAT_10','PAT_11','PAT_12','PAT_13','PAT_14','PAT_15','SUB_22_MB_40','SUB_23_MB_40'};
% subdirs={'40_4' '40_blk' '40_8_With_LB' '40_8_WO_LB' '40_10_With_LB' '40_10_WO_LB'};
% subdirs={'40_1'};
for subj=1:15
    for subss=1
 spm8final 'pathonly';
 addpath '/nic/sw/spm/toolbox/rest';
restdir_sw=fullfile(spmdir,subjects{subj},'DY_bc_st','subj01'); %%% directory with raw data
restdir_ROI=fullfile(spmdir,subjects{subj},'DY_bc_st');  %%% output directory after regression

% MaskFilename='/p/ashish/MultiBandEPI/EPILEPSY_STUDY/PAT_01/gray_mask_0.2.img';

ROIDef_wm={(spm_select('FPList', fullfile(spmdir,subjects{subj}, 'T1'),'^wc2.*\.nii'))}; %%% White matter

ROIDef_csf={(spm_select('FPList', fullfile(spmdir,subjects{subj}, 'T1'),'^wc3.*\.nii'))}; %%%% CSF
ROIDef_GSR={(spm_select('FPList', fullfile(spmdir,subjects{subj}, 'T1'),'^WHOLE_BRAIN_MASK.*\.img'))}; %%% GSR
% datadir=fullfile(spmdir,subjects{subj},'topup','40_4');  %% do when physio not present
% rp=load(spm_select('FPList', datadir,'^rp_acT.*txt$'));
% rp_dt=detrend(rp,'constant');



[theROITimeCourses_wm] = rest_ExtractROITC(restdir_sw, ROIDef_wm,restdir_ROI);

[theROITimeCourses_csf] = rest_ExtractROITC(restdir_sw, ROIDef_csf,restdir_ROI);

[theROITimeCourses_GSR] = rest_ExtractROITC(restdir_sw, ROIDef_GSR,restdir_ROI);

% phy_file=load(fullfile(physiodir,sprintf('physio_rp_new_%d_%d_reg.mat',subj,subss)));%motion+physio


% SCovar=[theROITimeCourses_wm-mean(theROITimeCourses_wm) theROITimeCourses_GSR-mean(theROITimeCourses_GSR) theROITimeCourses_csf-mean(theROITimeCourses_csf) phy_file.R(1:end,:)];
 SCovar=[theROITimeCourses_wm-mean(theROITimeCourses_wm) theROITimeCourses_GSR-mean(theROITimeCourses_GSR) theROITimeCourses_csf-mean(theROITimeCourses_csf)]; %% combine all

Subject_Covariables.ort_file=fullfile(restdir_ROI, 'wcT_WM_csf_Signals.txt');

DirPostfix=['wm_csf_gsr' '_removed'];
Subject_Covariables.polort=-1;
save(Subject_Covariables.ort_file,'SCovar', '-ASCII', '-DOUBLE','-TABS');
rest_RegressOutCovariates(restdir_sw,Subject_Covariables,DirPostfix);  %%% regress out operation

clear SCovar phy_file ROIDef_wm ROIDef_csf ROIDef_GSR
    end
end
% disp(datestr(datenum(0,0,0,0,0,f),'HH:MM:SS'))
