#!/bin/bash
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_D0pt0p0_Pthat20_TuneCUETP8M1_5020GeV/crab_RECO_20171005/171010_063810/0000/step3_pp_RAW2DIGI_L1Reco_RECO_106.root" # prompt D RECO
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_D0pt0p0_Pthat20_TuneCUETP8M1_5020GeV/crab_DIGI_20171005/171009_201555/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_109.root" # prompt D RAW
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/gsfs/Pythia8_MinBias_pp_CUETP8M1_5020GeV/RECO__201711004/171004_122654/0000/step3_pp_RAW2DIGI_L1Reco_RECO_103.root" # MB RECO
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/gsfs/Pythia8_MinBias_pp_CUETP8M1_5020GeV/RAW_20171002/171003_010838/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_191.root" # MB RAW
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_Dspt0p0_Pthat50_TuneCUETP8M1_5020GeV/crab_RECO_20171005/171010_160206/0000/step3_pp_RAW2DIGI_L1Reco_RECO_104.root" # Ds RECO
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_Dspt0p0_Pthat50_TuneCUETP8M1_5020GeV/crab_DIGI_20171005/171009_201622/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_118.root" # Ds RAW

isDs=0 # 1: Ds, 0: D0
DODFINDER=1
DOEVTANALYZER=0

##

HLTCONFIG="/users/wangj/PPRef2017/DmesonHIHighPtRefPP5TeV2017_V3/V14"
GLOBTAG="92X_upgrade2017_realistic_v11"

SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_D0pt0p0_Pthat20_TuneCUETP8M1_5020GeV/crab_RECO_20171005/171010_063810/0000/step3_pp_RAW2DIGI_L1Reco_RECO_106.root" # prompt D RECO
SECONDARYSAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_D0pt0p0_Pthat20_TuneCUETP8M1_5020GeV/crab_DIGI_20171005/171009_201555/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_109.root" # prompt D RAW
# SAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_Dspt0p0_Pthat50_TuneCUETP8M1_5020GeV/crab_RECO_20171005/171010_160206/0000/step3_pp_RAW2DIGI_L1Reco_RECO_104.root" # Ds RECO
# SECONDARYSAMPLE="root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_Dspt0p0_Pthat50_TuneCUETP8M1_5020GeV/crab_DIGI_20171005/171009_201622/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_118.root" # Ds RAW

L1MENU="L1Menu_Collisions2017_dev_r9_HIppRefMODv2_20171018.xml"
OUTPUTCONFIG="hlt92X.py"
NEVENT=1000

##

# MC emulator
rm $OUTPUTCONFIG
hltGetConfiguration $HLTCONFIG \
    --globaltag $GLOBTAG \
    --input $SAMPLE \
    --mc --process MYHLT --full --offline \
    --l1-emulator FullMC --l1Xml=$L1MENU \
    --unprescale --max-events $NEVENT --output none > $OUTPUTCONFIG

# HLT bit analyzer
echo '
# hltbitanalysis
process.load("HLTrigger.HLTanalyzers.HLTBitAnalyser_cfi")
process.hltbitanalysis.HLTProcessName = cms.string("MYHLT")
process.hltbitanalysis.hltresults = cms.InputTag( "TriggerResults","","MYHLT" )
process.hltbitanalysis.l1GtReadoutRecord = cms.InputTag("simGtDigis","","MYHLT")
process.hltbitanalysis.l1GctHFBitCounts = cms.InputTag("gctDigis","","MYHLT")
process.hltbitanalysis.l1GctHFRingSums = cms.InputTag("gctDigis","","MYHLT")
process.hltbitanalysis.UseTFileService = cms.untracked.bool(True)
process.hltBitAnalysis = cms.EndPath(process.hltbitanalysis)
process.TFileService = cms.Service("TFileService",
                                   fileName=cms.string("openHLT.root"))' >> $OUTPUTCONFIG

# Event analyzer
if [[ $DOEVTANALYZER -eq 1 ]]
then
    echo '
process.load('"'"'HeavyIonsAnalysis.EventAnalysis.hltanalysis_cff'"'"')
process.load('"'"'HeavyIonsAnalysis.EventAnalysis.hievtanalyzer_data_cfi'"'"') #use data version to avoid PbPb MC
process.hiEvtAnalyzer.Vertex = cms.InputTag("offlinePrimaryVertices")
process.hiEvtAnalyzer.doCentrality = cms.bool(False)
process.hiEvtAnalyzer.doEvtPlane = cms.bool(False)
process.hiEvtAnalyzer.doMC = cms.bool(True) #general MC info
process.hiEvtAnalyzer.doHiMC = cms.bool(False) #HI specific MC info
process.ana_step = cms.Path(process.hiEvtAnalyzer)' >> $OUTPUTCONFIG
fi

# Dfinder
if [[ $DODFINDER -eq 1 ]]
then
    echo '
# Dfinder
AddCaloMuon = False
runOnMC = True
HIFormat = False
UseGenPlusSim = False
VtxLabel = "offlinePrimaryVerticesWithBS"
TrkLabel = "generalTracks"
from Bfinder.finderMaker.finderMaker_75X_cff import finderMaker_75X
finderMaker_75X(process, AddCaloMuon, runOnMC, HIFormat, UseGenPlusSim, VtxLabel, TrkLabel)
# finderMaker_75X(process, AddCaloMuon, runOnMC, HIFormat, UseGenPlusSim)
process.Dfinder.tkPtCut = cms.double(1.0) #before fit
process.Dfinder.dPtCut = cms.vdouble(4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0) #before fit
process.Dfinder.dCutSeparating_PtVal = cms.vdouble(4., 4., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8.)
process.Dfinder.tktkRes_svpvDistanceCut_lowptD = cms.vdouble(0., 0., 0., 0., 0., 0., 0., 0., 3.0, 3.0, 3.0, 3.0, 3.0, 3.0)
process.Dfinder.tktkRes_svpvDistanceCut_highptD = cms.vdouble(0., 0., 0., 0., 0., 0., 0., 0., 1.5, 1.5, 1.5, 1.5, 1.5, 1.5)
process.Dfinder.svpvDistanceCut_lowptD = cms.vdouble(2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 0., 0., 0., 0., 0., 0.)
process.Dfinder.svpvDistanceCut_highptD = cms.vdouble(0., 0., 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 0., 0., 0., 0., 0., 0.)
process.Dfinder.readDedx = cms.bool(False)
process.Dfinder.MVAMapLabel = cms.InputTag(TrkLabel,"MVAValues")' >> $OUTPUTCONFIG

    if [[ $isDs -eq 0 ]]
    then
        echo 'process.Dfinder.Dchannel = cms.vint32(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)' >> $OUTPUTCONFIG
    fi
    if [[ $isDs -eq 1 ]]
    then
        echo 'process.Dfinder.Dchannel = cms.vint32(0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0)' >> $OUTPUTCONFIG
    fi
    echo 'process.p = cms.Path(process.DfinderSequence)
' >> $OUTPUTCONFIG
fi

# Set number of threads to 1
sed -i 's/numberOfThreads = cms.untracked\.uint32( 4 )/numberOfThreads = cms.untracked.uint32( 1 )/g' hlt92X.py
sed -i 's/process\.DQMStore\.enableMultiThread = True/process.DQMStore.enableMultiThread = False/g' hlt92X.py

# Add secondary file
sed -i "/inputCommands/i \\
    secondaryFileNames = cms.untracked.vstring(\\
        '${SECONDARYSAMPLE}',\\
   )," hlt92X.py