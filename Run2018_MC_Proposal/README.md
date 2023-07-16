# Samples for Ivan's proposal

Close to NanoAODv7

* CMSSW: CMSSW_10_2_22
* GlobalTag: 102X_upgrade2018_realistic_v15 

## AOD To MiniAOD

procModifier unclear

```bash
cmsDriver.py PAT \
    --step PAT \
    --mc \
    --eventcontent MINIAODSIM \
    --datatier MINIAODSIM \
    --conditions "102X_upgrade2018_realistic_v15" \
    --era "Run2_2018" \
    --number -1 \
    --no_exec \
    --runUnscheduled \
    --python_filename Proposal_AOD_To_MiniAOD.py
```

## MiniAOD to NanoAOD

```bash
cmsDriver.py NANO \
    --step NANO \
    --mc \
    --eventcontent MINIAODSIM \
    --datatier MINIAODSIM \
    --conditions "102X_upgrade2018_realistic_v15" \
    --era "Run2_2018,run2_nanoAOD_102Xv1" \
    --customise_commands="process.add_(cms.Service('InitRootHandlers', EnableIMT = cms.untracked.bool(False)));process.MessageLogger.cerr.FwkReport.reportEvery=1000" \
    --number -1 \
    --no_exec \
    --python_filename Proposal_MiniAOD_To_NanoAOD.py
```

### Customisation
```python
process.genParticleTable.variables = cms.PSet(process.genParticleTable.variables, 
        vx = Var("vx", float,precision=10), 
        vy = Var("vy", float,precision=10),
        vz = Var("vz", float,precision=10),
)
```


