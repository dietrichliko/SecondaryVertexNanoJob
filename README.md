# Jobs for NanoAOD production

Tool to run NanoAOD production for Secondary Vertex Studies on SLURM at CLIP

Each production has its own subdirectory:

* CMSSW_XX_XX_XX   ... the CMSSW release
* nanojob.yaml     ... job configurations including processing steps and datasets
* Proposal_AOD_To_MiniAOD.py ... configurations for the different steps
* Proposal_MiniAOD_to_NanoAOD.py

Each production has is own CMSSW directory according the required version

## Installations

The submission has to use python3.6, which requires at least CMSSW_10_6_27

