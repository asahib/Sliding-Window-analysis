spmdir='/p/ashish/Multiband_prisma/HCP';
subjects={'100307','103414','110411','111312','113619','115320','117122','123117','124422','125525','129028','133928','135932','136833','139637'};
% List of open inputs
% Make Directory: Parent Directory - cfg_files
% Make Directory: New Directory Name - cfg_entry
% Move/Delete Files: Files to move/copy/delete - cfg_files
% Move/Delete Files: Copy to - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'/p/ashish/MultiBandEPI/EPILEPSY_STUDY/makenmove_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(4, nrun);
for subj=1:15
%     for sub=1
        for crun = 1:nrun
            inputs{1, crun} =cellstr(fullfile(spmdir,subjects{subj})); % Make Directory: Parent Directory - cfg_files
            inputs{2, crun} = 'DY_bc_st/subj01'; % Make Directory: New Directory Name - cfg_entry
            inputs{3, crun} = cellstr(spm_select('FPList',fullfile(spmdir,subjects{subj},'Rest_LR'),'^wrfMRI.*\.nii')); % Move/Delete Files: Files to move/copy/delete - cfg_files
            inputs{4, crun} =cellstr(fullfile(spmdir,subjects{subj},'DY_bc_st/subj01')); % Move/Delete Files: Copy to - cfg_files
        end
        spm('defaults', 'FMRI');
        spm_jobman('serial', jobs, '', inputs{:});


end
