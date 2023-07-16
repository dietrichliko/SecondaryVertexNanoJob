# . setup.sh

echo "Setup CMSSW_10_6_27 ..." >&2
cd Run2018_MC_UL/CMSSW_10_6_27/src > /dev/null
eval $(scramv1 runtime -sh)
cd - > /dev/null
