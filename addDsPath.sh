#!/bin/bash

# Producer
ResOpt=1
massParticleRes1=0.4937
massParticleRes2=0.4937
massParticle3=0.1396
ChargeOpt=-1
MinPtResTk1=0.0
MinPtResTk2=0.0
MinPtThirdTk=0.0
MaxEtaTk=2.5
MinInvMassRes=0.80
MaxInvMassRes=1.20
MinPtRes=0.0
MinInvMass=1.57
MaxInvMass=2.37
# Filter
MinVtxProbability=0.0
MinLxySignificance=1.0
MaxLxySignificance=0.0
MaxNormalisedChi2=999.0
MinCosinePointingAngle=0.8

sed -e "/HLTSchedule/i \\
process.hlttktktkVtxForDsDpt8 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\", \\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( ${ResOpt} ),\\
    massParticleRes1 = cms.double( ${massParticleRes1} ),\\
    massParticleRes2 = cms.double( ${massParticleRes2} ),\\
    massParticle3 = cms.double( ${massParticle3} ),\\
    ChargeOpt = cms.int32( ${ChargeOpt} ),\\
    MinPtResTk1 = cms.double( ${MinPtResTk1} ),\\
    MinPtResTk2 = cms.double( ${MinPtResTk2} ),\\
    MinPtThirdTk = cms.double( ${MinPtThirdTk} ),\\
    MaxEtaTk = cms.double( ${MaxEtaTk} ),\\
    MinInvMassRes = cms.double( ${MinInvMassRes} ),\\
    MaxInvMassRes = cms.double( ${MaxInvMassRes} ),\\
    MinPtRes = cms.double( ${MinPtRes} ),\\
    MinPtTri = cms.double( 8.0 ),\\
    MinInvMass = cms.double( ${MinInvMass} ),\\
    MaxInvMass = cms.double( ${MaxInvMass} ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt8 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( ${MinVtxProbability} ),\\
    MaxLxySignificance = cms.double( ${MaxLxySignificance} ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt8\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
\\
process.hlttktktkVtxForDsDpt15 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( ${ResOpt} ),\\
    massParticleRes1 = cms.double( ${massParticleRes1} ),\\
    massParticleRes2 = cms.double( ${massParticleRes2} ),\\
    massParticle3 = cms.double( ${massParticle3} ),\\
    ChargeOpt = cms.int32( ${ChargeOpt} ),\\
    MinPtResTk1 = cms.double( ${MinPtResTk1} ),\\
    MinPtResTk2 = cms.double( ${MinPtResTk2} ),\\
    MinPtThirdTk = cms.double( ${MinPtThirdTk} ),\\
    MaxEtaTk = cms.double( ${MaxEtaTk} ),\\
    MinInvMassRes = cms.double( ${MinInvMassRes} ),\\
    MaxInvMassRes = cms.double( ${MaxInvMassRes} ),\\
    MinPtRes = cms.double( ${MinPtRes} ),\\
    MinPtTri = cms.double( 15.0 ),\\
    MinInvMass = cms.double( ${MinInvMass} ),\\
    MaxInvMass = cms.double( ${MaxInvMass} ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt15 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( ${MinVtxProbability} ),\\
    MaxLxySignificance = cms.double( ${MaxLxySignificance} ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt15\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
\\
process.hlttktktkVtxForDsDpt30 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( ${ResOpt} ),\\
    massParticleRes1 = cms.double( ${massParticleRes1} ),\\
    massParticleRes2 = cms.double( ${massParticleRes2} ),\\
    massParticle3 = cms.double( ${massParticle3} ),\\
    ChargeOpt = cms.int32( ${ChargeOpt} ),\\
    MinPtResTk1 = cms.double( ${MinPtResTk1} ),\\
    MinPtResTk2 = cms.double( ${MinPtResTk2} ),\\
    MinPtThirdTk = cms.double( ${MinPtThirdTk} ),\\
    MaxEtaTk = cms.double( ${MaxEtaTk} ),\\
    MinInvMassRes = cms.double( ${MinInvMassRes} ),\\
    MaxInvMassRes = cms.double( ${MaxInvMassRes} ),\\
    MinPtRes = cms.double( ${MinPtRes} ),\\
    MinPtTri = cms.double( 30.0 ),\\
    MinInvMass = cms.double( ${MinInvMass} ),\\
    MaxInvMass = cms.double( ${MaxInvMass} ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt30 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( ${MinVtxProbability} ),\\
    MaxLxySignificance = cms.double( ${MaxLxySignificance} ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt30\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
\\
process.hlttktktkVtxForDsDpt50 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCands\" ),\\
    PreviousCandTag = cms.InputTag( \"hltFullTrackFilterForDmeson\" ),\\
    ResOpt = cms.int32( ${ResOpt} ),\\
    massParticleRes1 = cms.double( ${massParticleRes1} ),\\
    massParticleRes2 = cms.double( ${massParticleRes2} ),\\
    massParticle3 = cms.double( ${massParticle3} ),\\
    ChargeOpt = cms.int32( ${ChargeOpt} ),\\
    MinPtResTk1 = cms.double( ${MinPtResTk1} ),\\
    MinPtResTk2 = cms.double( ${MinPtResTk2} ),\\
    MinPtThirdTk = cms.double( ${MinPtThirdTk} ),\\
    MaxEtaTk = cms.double( ${MaxEtaTk} ),\\
    MinInvMassRes = cms.double( ${MinInvMassRes} ),\\
    MaxInvMassRes = cms.double( ${MaxInvMassRes} ),\\
    MinPtRes = cms.double( ${MinPtRes} ),\\
    MinPtTri = cms.double( 50.0 ),\\
    MinInvMass = cms.double( ${MinInvMass} ),\\
    MaxInvMass = cms.double( ${MaxInvMass} ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt50 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( ${MinVtxProbability} ),\\
    MaxLxySignificance = cms.double( ${MaxLxySignificance} ),\\
    TrackTag = cms.InputTag( \"hltFullCands\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt50\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
\\
process.HLT_DsPPTrackingGlobal_Dpt8_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt8 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt8 + process.hlttktktkFilterForDsDpt8 + process.HLTEndSequence )\\
process.HLT_DsPPTrackingGlobal_Dpt15_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt15 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt15 + process.hlttktktkFilterForDsDpt15 + process.HLTEndSequence )\\
process.HLT_DsPPTrackingGlobal_Dpt30_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt30 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt30 + process.hlttktktkFilterForDsDpt30 + process.HLTEndSequence )\\
process.HLT_DsPPTrackingGlobal_Dpt50_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sZeroBias + process.hltPreDmesonPPTrackingGlobalDpt50 + process.HLTDoLocalPixelSequence + process.HLTDoLocalStripSequenceFull + process.HLTFullIterativeTracking + process.hltFullOnlinePrimaryVertices + process.hltFullCands + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt50 + process.hlttktktkFilterForDsDpt50 + process.HLTEndSequence )\\
" hlt92X.py > hlt92X_Ds.py


sed -i 's/process\.HLT_DmesonPPTrackingGlobal_Dpt8_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt15_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt30_v1, process\.HLT_DmesonPPTrackingGlobal_Dpt50_v1/process.HLT_DmesonPPTrackingGlobal_Dpt8_v1, process.HLT_DmesonPPTrackingGlobal_Dpt15_v1, process.HLT_DmesonPPTrackingGlobal_Dpt30_v1, process.HLT_DmesonPPTrackingGlobal_Dpt50_v1, process.HLT_DsPPTrackingGlobal_Dpt8_v1, process.HLT_DsPPTrackingGlobal_Dpt15_v1, process.HLT_DsPPTrackingGlobal_Dpt30_v1, process.HLT_DsPPTrackingGlobal_Dpt50_v1/g' hlt92X_Ds.py