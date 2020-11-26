%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.normalise.write.subj.matname = '<UNDEFINED>';
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = '<UNDEFINED>';
matlabbatch{1}.spm.spatial.normalise.write.roptions.preserve = 0;
matlabbatch{1}.spm.spatial.normalise.write.roptions.bb = [-78 -112 -50
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.roptions.vox = [3 3 3];
matlabbatch{1}.spm.spatial.normalise.write.roptions.interp = 1;
matlabbatch{1}.spm.spatial.normalise.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.normalise.write.roptions.prefix = 'w';
matlabbatch{2}.spm.util.imcalc.input(1) = cfg_dep;
matlabbatch{2}.spm.util.imcalc.input(1).tname = 'Input Images';
matlabbatch{2}.spm.util.imcalc.input(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{2}.spm.util.imcalc.input(1).tgt_spec{1}(1).value = 'image';
matlabbatch{2}.spm.util.imcalc.input(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.util.imcalc.input(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.util.imcalc.input(1).sname = 'Normalise: Write: Normalised Images (Subj 1)';
matlabbatch{2}.spm.util.imcalc.input(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.util.imcalc.input(1).src_output = substruct('()',{1}, '.','files');
matlabbatch{2}.spm.util.imcalc.output = 'WHOLE_BRAIN_MASK.img';
matlabbatch{2}.spm.util.imcalc.outdir = '<UNDEFINED>';
matlabbatch{2}.spm.util.imcalc.expression = 'i1+i2+i3';
matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{2}.spm.util.imcalc.options.mask = 0;
matlabbatch{2}.spm.util.imcalc.options.interp = 1;
matlabbatch{2}.spm.util.imcalc.options.dtype = 4;
