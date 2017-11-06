#!/bin/bash

HLTCONFIG="/users/wangj/PPRef2017/DmesonHIHighPtRefPP5TeV2017_V3/V28"
GLOBTAG="92X_upgrade2017_realistic_v11"
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/gsfs/Pythia8_MinBias_pp_CUETP8M1_5020GeV/RAW_20171002/171003_010838/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_191.root" # MB RAW
SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_D0pt0p0_Pthat100_TuneCUETP8M1_5020GeV/crab_DIGI_20171005/171009_201637/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_103.root" # prompt D RAW
L1MENU="L1Menu_pp502Collisions2017_v4.xml"

hltIntegrationTests ${HLTCONFIG} -s /dev/CMSSW_9_2_0/GRun -i ${SAMPLE}  --mc -x "--globaltag ${GLOBTAG}" -x "--l1Xml ${L1MENU}"