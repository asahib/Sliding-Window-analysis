#!/bin/bash
## qsub parameters:
###$ -o /p/ashish/Multiband_prisma/HCP/$HOSTNAME_$JOB_ID.out
###$ -e /p/ashish/Multiband_prisma/HCP/$HOSTNAME_$JOB_ID.err
#$ -o /p/ashish/Multiband_prisma/HCP/$JOB_ID.out
#$ -e /p/ashish/Multiband_prisma/HCP/$JOB_ID.err
#$ -cwd
#$ -r y 
#$ -q matlab.q"
#$ -j n

echo "Starting job: $JOB_ID@$HOSTNAME"
echo JOB_ID=$JOB_ID
echo TASK_ID=$TASK_ID
echo SGE_TASK_ID=$SGE_TASK_ID
echo HOSTNAME=$HOSTNAME
echo ARGUMENT=$*

#matlab8.3 -nodisplay -r "rest_preproc_MB $1; exit" 
#matlab8.3 -nodisplay -r "fmristat_ar_Tvalues_newmiss_no_physio $1; exit"
#matlab8.3 -nodisplay -r "fmristat_ar_Tvalues_newmiss_no_motion $1; exit"
matlab8.4 -nodisplay -r "DynamicBC_run_check $1; exit" 

echo "Done with job: $JOB_ID@$HOSTNAME"
