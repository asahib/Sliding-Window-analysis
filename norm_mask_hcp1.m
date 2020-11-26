spmdir='/p/ashish/Multiband_prisma/HCP';
subjects={'100307','103414','110411','111312','113619','115320','117122','123117','124422','125525','129028','133928','135932','136833','139637'};
% List of open inputs% List of open inputs
% Normalise: Write: Parameter File - cfg_files
% Normalise: Write: Images to Write - cfg_files
% Image Calculator: Output Directory - cfg_files
% Image Calculator: Input Images - cfg_files
% Image Calculator: Output Directory - cfg_files
nrun = 1; % enter the number of runs here
% jobfile = {'/p/ashish/Multiband_prisma/HCP/norm_mask_hcp_job.m'};
jobfile = {'/p/ashish/Multiband_prisma/HCP/norm_mask_hcp_job_3mm_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(3, nrun);
for subj=12:15
    for crun = 1:nrun
        inputs{1, crun} = {spm_select('FPList', fullfile(spmdir,subjects{subj}, 'T1'),'.*_seg_sn\.mat')}; % Normalise: Write: Parameter File - cfg_files
        inputs{2, crun} = cellstr(spm_select('FPList', fullfile(spmdir,subjects{subj}, 'T1'),'^c.*\.nii')); % Normalise: Write: Images to Write - cfg_files
        inputs{3, crun} = cellstr(fullfile(spmdir,subjects{subj}, 'T1')); % Image Calculator: Output Directory - cfg_files
        %     inputs{4, crun} = cellstr(spm_select('FPList', fullfile(spmdir,subjects{subj}, 'T1'),'^Wc1.*\.nii')); % Image Calculator: Input Images - cfg_files
        %     inputs{5, crun} = cellstr(fullfile(spmdir,subjects{subj}, 'T1')); % Image Calculator: Output Directory - cfg_files
    end
    spm('defaults', 'FMRI');
    spm_jobman('serial', jobs, '', inputs{:});
end
