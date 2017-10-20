#!/bin/bash

sed -e "/HLTSchedule/i \\
process.hlttktktkVtxForDsDpt8 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\", \\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( 1 ),\\
    massParticleRes1 = cms.double( 0.4937 ),\\
    massParticleRes2 = cms.double( 0.4937 ),\\
    massParticle3 = cms.double( 0.1396 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MinPtResTk1 = cms.double( 0.0 ),\\
    MinPtResTk2 = cms.double( 0.0 ),\\
    MinPtThirdTk = cms.double( 0.0 ),\\
    MaxEtaTk = cms.double( 2.5 ),\\
    MinInvMassRes = cms.double( 0.80 ),\\
    MaxInvMassRes = cms.double( 1.20 ),\\
    MinPtRes = cms.double( 0.0 ),\\
    MinPtTri = cms.double( 8.0 ),\\
    MinInvMass = cms.double( 1.57 ),\\
    MaxInvMass = cms.double( 2.37 ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt8 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt8\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt15 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( 1 ),\\
    massParticleRes1 = cms.double( 0.4937 ),\\
    massParticleRes2 = cms.double( 0.4937 ),\\
    massParticle3 = cms.double( 0.1396 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MinPtResTk1 = cms.double( 0.0 ),\\
    MinPtResTk2 = cms.double( 0.0 ),\\
    MinPtThirdTk = cms.double( 0.0 ),\\
    MaxEtaTk = cms.double( 2.5 ),\\
    MinInvMassRes = cms.double( 0.80 ),\\
    MaxInvMassRes = cms.double( 1.20 ),\\
    MinPtRes = cms.double( 0.0 ),\\
    MinPtTri = cms.double( 15.0 ),\\
    MinInvMass = cms.double( 1.57 ),\\
    MaxInvMass = cms.double( 2.37 ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt15 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt15\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt30 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( 1 ),\\
    massParticleRes1 = cms.double( 0.4937 ),\\
    massParticleRes2 = cms.double( 0.4937 ),\\
    massParticle3 = cms.double( 0.1396 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MinPtResTk1 = cms.double( 0.0 ),\\
    MinPtResTk2 = cms.double( 0.0 ),\\
    MinPtThirdTk = cms.double( 0.0 ),\\
    MaxEtaTk = cms.double( 2.5 ),\\
    MinInvMassRes = cms.double( 0.80 ),\\
    MaxInvMassRes = cms.double( 1.20 ),\\
    MinPtRes = cms.double( 0.0 ),\\
    MinPtTri = cms.double( 30.0 ),\\
    MinInvMass = cms.double( 1.57 ),\\
    MaxInvMass = cms.double( 2.37 ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt30 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt30\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt50 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( 1 ),\\
    massParticleRes1 = cms.double( 0.4937 ),\\
    massParticleRes2 = cms.double( 0.4937 ),\\
    massParticle3 = cms.double( 0.1396 ),\\
    ChargeOpt = cms.int32( -1 ),\\
    MinPtResTk1 = cms.double( 0.0 ),\\
    MinPtResTk2 = cms.double( 0.0 ),\\
    MinPtThirdTk = cms.double( 0.0 ),\\
    MaxEtaTk = cms.double( 2.5 ),\\
    MinInvMassRes = cms.double( 0.80 ),\\
    MaxInvMassRes = cms.double( 1.20 ),\\
    MinPtRes = cms.double( 0.0 ),\\
    MinPtTri = cms.double( 50.0 ),\\
    MinInvMass = cms.double( 1.57 ),\\
    MaxInvMass = cms.double( 2.37 ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt50 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( 0.0 ),\\
    MaxLxySignificance = cms.double( 0.0 ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt50\" ),\\
    MaxNormalisedChi2 = cms.double( 999.0 ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( 0.8 ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( 1.0 )\\
)\\
\\
process.HLT_DsPPTrackingGlobal_Dpt8_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt8 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt8 + process.hlttktktkFilterForDsDpt8 + process.HLTEndSequence )\\
process.HLT_DsPPTrackingGlobal_Dpt15_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt15 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt15 + process.hlttktktkFilterForDsDpt15 + process.HLTEndSequence )\\
process.HLT_DsPPTrackingGlobal_Dpt30_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt30 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt30 + process.hlttktktkFilterForDsDpt30 + process.HLTEndSequence )\\
process.HLT_DsPPTrackingGlobal_Dpt50_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt50 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt50 + process.hlttktktkFilterForDsDpt50 + process.HLTEndSequence )\\
" hlt92X.py > hlt92X_Ds.py


sed -i 's/process\.HLT_DmesonPPTrackingGlobal_Dpt8_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt15_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt30_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt50_v1/process.HLT_DmesonPPTrackingGlobal_Dpt8_v1, process.HLT_DmesonPPTrackingGlobal_Dpt15_v1, process.HLT_DmesonPPTrackingGlobal_Dpt30_v1, process.HLT_DmesonPPTrackingGlobal_Dpt50_v1, process.HLT_DsPPTrackingGlobal_Dpt8_v1, process.HLT_DsPPTrackingGlobal_Dpt15_v1, process.HLT_DsPPTrackingGlobal_Dpt30_v1, process.HLT_DsPPTrackingGlobal_Dpt50_v1/g' hlt92X_Ds.py