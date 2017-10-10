#!/bin/bash

DODFINDER=1

#
HLTCONFIG="/users/wangj/PPRef2017/DmesonHIHighPtRefPP5TeV2017_V3/V6"
GLOBTAG="92X_upgrade2017_TSG_For90XSamples_V2"
# SAMPLE="root://cms-xrd-global.cern.ch//store/mc/PhaseIFall16DR/MinBias_TuneCUETP8M1_13TeV-pythia8/GEN-SIM-RAW/NoPUNZS_90X_upgrade2017_realistic_v6_C1_ext1-v1/120000/02C12851-7708-E711-8347-02163E01A579.root"
SAMPLE="root://cms-xrd-global.cern.ch//store/mc/PhaseIFall16DR/MinBias_TuneCUETP8M1_13TeV-pythia8/AODSIM/NoPUNZS_90X_upgrade2017_realistic_v6_C1_ext1-v1/120000/0AEFBB63-6C0A-E711-8737-02163E01A74F.root"
OUTPUTCONFIG="hlt92X.py"
NEVENT=100

##

rm $OUTPUTCONFIG
hltGetConfiguration $HLTCONFIG \
    --globaltag $GLOBTAG \
    --input $SAMPLE \
    --mc --process MYHLT --full --offline \
    --l1-emulator FullMC --l1 L1Menu_Collisions2017_v3_m6_xml \
    --unprescale --max-events $NEVENT --output none > $OUTPUTCONFIG

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
process.Dfinder.dCutSeparating_PtVal = cms.vdouble(8., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8., 8.)
process.Dfinder.tktkRes_svpvDistanceCut_lowptD = cms.vdouble(0., 0., 0., 0., 0., 0., 0., 0., 3.0, 3.0, 3.0, 3.0, 3.0, 3.0)
process.Dfinder.tktkRes_svpvDistanceCut_highptD = cms.vdouble(0., 0., 0., 0., 0., 0., 0., 0., 1.5, 1.5, 1.5, 1.5, 1.5, 1.5)
process.Dfinder.svpvDistanceCut_lowptD = cms.vdouble(2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 0., 0., 0., 0., 0., 0.)
process.Dfinder.svpvDistanceCut_highptD = cms.vdouble(2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 0., 0., 0., 0., 0., 0.)
process.Dfinder.Dchannel = cms.vint32(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
process.Dfinder.readDedx = cms.bool(False)
process.p = cms.Path(process.DfinderSequence)
' >> $OUTPUTCONFIG
fi