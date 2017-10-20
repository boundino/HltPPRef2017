#!/bin/bash

sed -e "/HLTSchedule/i \\
process.hlttktkVtxForDmesonDpt8Fast = cms.EDProducer( \"HLTDisplacedtktkVtxProducerFast\", \\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    massParticle1 = cms.double( 0.1396 ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    massParticle2 = cms.double( 0.4937 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MaxEta = cms.double( 2.5 ),\\
    MaxInvMass = cms.double( 2.27 ),\\
    MinPtPair = cms.double( 8.0 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinInvMass = cms.double( 1.47 ),\\
    MinPt = cms.double( 0.0 )\\
)\\
process.hlttktkFilterForDmesonDpt8Fast = cms.EDFilter( \"HLTDisplacedtktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktkVtxForDmesonDpt8Fast\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
process.hlttktkVtxForDmesonDpt15Fast = cms.EDProducer( \"HLTDisplacedtktkVtxProducerFast\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    massParticle1 = cms.double( 0.1396 ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    massParticle2 = cms.double( 0.4937 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MaxEta = cms.double( 2.5 ),\\
    MaxInvMass = cms.double( 2.27 ),\\
    MinPtPair = cms.double( 15.0 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinInvMass = cms.double( 1.47 ),\\
    MinPt = cms.double( 0.0 )\\
)\\
process.hlttktkFilterForDmesonDpt15Fast = cms.EDFilter( \"HLTDisplacedtktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktkVtxForDmesonDpt15Fast\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
process.hlttktkVtxForDmesonDpt30Fast = cms.EDProducer( \"HLTDisplacedtktkVtxProducerFast\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    massParticle1 = cms.double( 0.1396 ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    massParticle2 = cms.double( 0.4937 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MaxEta = cms.double( 2.5 ),\\
    MaxInvMass = cms.double( 2.27 ),\\
    MinPtPair = cms.double( 30.0 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinInvMass = cms.double( 1.47 ),\\
    MinPt = cms.double( 0.0 )\\
)\\
process.hlttktkFilterForDmesonDpt30Fast = cms.EDFilter( \"HLTDisplacedtktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktkVtxForDmesonDpt30Fast\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
process.hlttktkVtxForDmesonDpt50Fast = cms.EDProducer( \"HLTDisplacedtktkVtxProducerFast\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    massParticle1 = cms.double( 0.1396 ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    massParticle2 = cms.double( 0.4937 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MaxEta = cms.double( 2.5 ),\\
    MaxInvMass = cms.double( 2.27 ),\\
    MinPtPair = cms.double( 50.0 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinInvMass = cms.double( 1.47 ),\\
    MinPt = cms.double( 0.0 )\\
)\\
process.hlttktkFilterForDmesonDpt50Fast = cms.EDFilter( \"HLTDisplacedtktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktkVtxForDmesonDpt50Fast\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
process.HLT_DmesonPPTrackingGlobal_Dpt8Fast_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt8 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktkVtxForDmesonDpt8Fast + process.hlttktkFilterForDmesonDpt8Fast + process.HLTEndSequence )\\
process.HLT_DmesonPPTrackingGlobal_Dpt15Fast_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt15 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktkVtxForDmesonDpt15Fast + process.hlttktkFilterForDmesonDpt15Fast + process.HLTEndSequence )\\
process.HLT_DmesonPPTrackingGlobal_Dpt30Fast_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt30 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktkVtxForDmesonDpt30Fast + process.hlttktkFilterForDmesonDpt30Fast + process.HLTEndSequence )\\
process.HLT_DmesonPPTrackingGlobal_Dpt50Fast_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt50 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktkVtxForDmesonDpt50Fast + process.hlttktkFilterForDmesonDpt50Fast + process.HLTEndSequence )\\
" hlt92X.py > hlt92X_Fast.py

sed -i 's/process\.HLT_DmesonPPTrackingGlobal_Dpt8_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt15_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt30_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt50_v1/process.HLT_DmesonPPTrackingGlobal_Dpt8_v1, process.HLT_DmesonPPTrackingGlobal_Dpt8Fast_v1, process.HLT_DmesonPPTrackingGlobal_Dpt15_v1, process.HLT_DmesonPPTrackingGlobal_Dpt15Fast_v1, process.HLT_DmesonPPTrackingGlobal_Dpt30_v1, process.HLT_DmesonPPTrackingGlobal_Dpt30Fast_v1, process.HLT_DmesonPPTrackingGlobal_Dpt50_v1, process.HLT_DmesonPPTrackingGlobal_Dpt50Fast_v1/g' hlt92X_Fast.py

