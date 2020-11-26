#!/bin/bash

WDIR="/p/ashish/Multiband_prisma/HCP"
#WDIR=`pwd`

cd $WDIR

if [ $? -eq 1 ]; then
    echo s.th. is wrong with \"$WDIR\"
    exit 1
fi

###################################
# dynamically create a shell script
###################################
cat > gridjob.sh << EOI
#!/bin/bash
## qsub parameters:
###$ -o $WDIR/\$HOSTNAME_\$JOB_ID.out
###$ -e $WDIR/\$HOSTNAME_\$JOB_ID.err
#$ -o $WDIR/\$JOB_ID.out
#$ -e $WDIR/\$JOB_ID.err
#$ -cwd
#$ -r y 
#$ -q matlab.q"
#$ -j n

echo "Starting job: \$JOB_ID@\$HOSTNAME"
echo JOB_ID=\$JOB_ID
echo TASK_ID=\$TASK_ID
echo SGE_TASK_ID=\$SGE_TASK_ID
echo HOSTNAME=\$HOSTNAME
echo ARGUMENT=\$*

#matlab8.3 -nodisplay -r "rest_preproc_MB \$1; exit" 
#matlab8.3 -nodisplay -r "fmristat_ar_Tvalues_newmiss_no_physio \$1; exit"
#matlab8.3 -nodisplay -r "fmristat_ar_Tvalues_newmiss_no_motion \$1; exit"
matlab8.4 -nodisplay -r "DynamicBC_run_check \$1; exit" 

echo "Done with job: \$JOB_ID@\$HOSTNAME"
EOI
#######################

for a in `seq 15`; do
    qsub gridjob.sh $a
done

