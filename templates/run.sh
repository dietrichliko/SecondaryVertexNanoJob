#!/bin/bash +xe
#SBATCH --job-name nanoaod
#SBATCH --time 06:00:00
#SBATCH --output {{output_dir}}/nanoaod_%A_%a.log
#SBATCH --array 0-{{nr_jobs}}
#SBATCH --export NONE

{% if voms_proxy %}
# check voms proxy
export X509_USER_PROXY={{voms_proxy}}
voms-proxy-info --all
{% endif %}

# setup CMSSW
. /cvmfs/cms.cern.ch/cmsset_default.sh
cd "{{config_dir}}/{{cmssw}}/src"
eval $(scramv1 runtime -sh)

mkdir "{{output_dir}}/${SLURM_ARRAY_JOB_ID}-${SLURM_ARRAY_TASK_ID}"
cd "{{output_dir}}/${SLURM_ARRAY_JOB_ID}-${SLURM_ARRAY_TASK_ID}"

{% for name in config_files %}
cmsRun "{{input_dir}}/{{name}}"
{%- endfor %}

mv "{{output_file}}" "{{output_dir}}"
