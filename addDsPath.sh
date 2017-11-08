#!/bin/bash

rm hlt92X_Ds.py

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
    Src = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
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
    TrackTag = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt8\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
process.hltPreHIDsPPTrackingGlobalDpt8 = cms.EDFilter( \"HLTPrescaler\",\\
    L1GtReadoutRecordTag = cms.InputTag( \"hltGtStage2Digis\" ),\\
    offset = cms.uint32( 0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt15 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
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
    TrackTag = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt15\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
process.hltPreHIDsPPTrackingGlobalDpt15 = cms.EDFilter( \"HLTPrescaler\",\\
    L1GtReadoutRecordTag = cms.InputTag( \"hltGtStage2Digis\" ),\\
    offset = cms.uint32( 0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt30 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
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
    TrackTag = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt30\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
process.hltPreHIDsPPTrackingGlobalDpt30 = cms.EDFilter( \"HLTPrescaler\",\\
    L1GtReadoutRecordTag = cms.InputTag( \"hltGtStage2Digis\" ),\\
    offset = cms.uint32( 0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt40 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
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
    MinPtTri = cms.double( 40.0 ),\\
    MinInvMass = cms.double( ${MinInvMass} ),\\
    MaxInvMass = cms.double( ${MaxInvMass} ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt40 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( ${MinVtxProbability} ),\\
    MaxLxySignificance = cms.double( ${MaxLxySignificance} ),\\
    TrackTag = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt40\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
process.hltPreHIDsPPTrackingGlobalDpt40 = cms.EDFilter( \"HLTPrescaler\",\\
    L1GtReadoutRecordTag = cms.InputTag( \"hltGtStage2Digis\" ),\\
    offset = cms.uint32( 0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt50 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
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
    TrackTag = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt50\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
process.hltPreHIDsPPTrackingGlobalDpt50 = cms.EDFilter( \"HLTPrescaler\",\\
    L1GtReadoutRecordTag = cms.InputTag( \"hltGtStage2Digis\" ),\\
    offset = cms.uint32( 0 )\\
)\\
\\
process.hlttktktkVtxForDsDpt60 = cms.EDProducer( \"HLTDisplacedtktktkVtxProducer\",\\
    Src = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
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
    MinPtTri = cms.double( 60.0 ),\\
    MinInvMass = cms.double( ${MinInvMass} ),\\
    MaxInvMass = cms.double( ${MaxInvMass} ),\\
    triggerTypeDaughters = cms.int32( 91 )\\
)\\
process.hlttktktkFilterForDsDpt60 = cms.EDFilter( \"HLTDisplacedtktktkFilter\",\\
    saveTags = cms.bool( True ),\\
    BeamSpotTag = cms.InputTag( \"hltOnlineBeamSpot\" ),\\
    MinVtxProbability = cms.double( ${MinVtxProbability} ),\\
    MaxLxySignificance = cms.double( ${MaxLxySignificance} ),\\
    TrackTag = cms.InputTag( \"hltFullCandsForRefPP\" ),\\
    DisplacedVertexTag = cms.InputTag( \"hlttktktkVtxForDsDpt60\" ),\\
    MaxNormalisedChi2 = cms.double( ${MaxNormalisedChi2} ),\\
    FastAccept = cms.bool( False ),\\
    MinCosinePointingAngle = cms.double( ${MinCosinePointingAngle} ),\\
    triggerTypeDaughters = cms.int32( 91 ),\\
    MinLxySignificance = cms.double( ${MinLxySignificance} )\\
)\\
process.hltPreHIDsPPTrackingGlobalDpt60 = cms.EDFilter( \"HLTPrescaler\",\\
    L1GtReadoutRecordTag = cms.InputTag( \"hltGtStage2Digis\" ),\\
    offset = cms.uint32( 0 )\\
)\\
\\
process.HLT_HIDsPPTrackingGlobal_Dpt8_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sSingleJet8BptxAND + process.hltPreHIDsPPTrackingGlobalDpt8 + process.HLTPixelClusterSplittingForRefPP + process.HLTFullIterativeTrackingForRefPP + process.hltFullOnlinePrimaryVerticesForRefPP + process.hltFullCandsForRefPP + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt8 + process.hlttktktkFilterForDsDpt8 + process.HLTEndSequence )\\
process.HLT_HIDsPPTrackingGlobal_Dpt15_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sSingleJet16 + process.hltPreHIDsPPTrackingGlobalDpt15 + process.HLTPixelClusterSplittingForRefPP + process.HLTFullIterativeTrackingForRefPP + process.hltFullOnlinePrimaryVerticesForRefPP + process.hltFullCandsForRefPP + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt15 + process.hlttktktkFilterForDsDpt15 + process.HLTEndSequence )\\
process.HLT_HIDsPPTrackingGlobal_Dpt30_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sSingleJet24 + process.hltPreHIDsPPTrackingGlobalDpt30 + process.HLTPixelClusterSplittingForRefPP + process.HLTFullIterativeTrackingForRefPP + process.hltFullOnlinePrimaryVerticesForRefPP + process.hltFullCandsForRefPP + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt30 + process.hlttktktkFilterForDsDpt30 + process.HLTEndSequence )\\
process.HLT_HIDsPPTrackingGlobal_Dpt40_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sSingleJet32 + process.hltPreHIDsPPTrackingGlobalDpt40 + process.HLTPixelClusterSplittingForRefPP + process.HLTFullIterativeTrackingForRefPP + process.hltFullOnlinePrimaryVerticesForRefPP + process.hltFullCandsForRefPP + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt40 + process.hlttktktkFilterForDsDpt40 + process.HLTEndSequence )\\
process.HLT_HIDsPPTrackingGlobal_Dpt50_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sSingleJet44 + process.hltPreHIDsPPTrackingGlobalDpt50 + process.HLTPixelClusterSplittingForRefPP + process.HLTFullIterativeTrackingForRefPP + process.hltFullOnlinePrimaryVerticesForRefPP + process.hltFullCandsForRefPP + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt50 + process.hlttktktkFilterForDsDpt50 + process.HLTEndSequence )\\
process.HLT_HIDsPPTrackingGlobal_Dpt60_v1 = cms.Path( process.HLTBeginSequence + process.hltL1sSingleJet60 + process.hltPreHIDsPPTrackingGlobalDpt60 + process.HLTPixelClusterSplittingForRefPP + process.HLTFullIterativeTrackingForRefPP + process.hltFullOnlinePrimaryVerticesForRefPP + process.hltFullCandsForRefPP + process.hltFullTrackFilterForDmeson + process.hlttktktkVtxForDsDpt60 + process.hlttktktkFilterForDsDpt60 + process.HLTEndSequence )\\
" hlt92X.py > hlt92X_Ds.py


sed -i 's/process\.HLT_HIDmesonPPTrackingGlobal_Dpt8_v1, process\.HLT_HIDmesonPPTrackingGlobal_Dpt15_v1, process\.HLT_HIDmesonPPTrackingGlobal_Dpt30_v1, process\.HLT_HIDmesonPPTrackingGlobal_Dpt40_v1, process\.HLT_HIDmesonPPTrackingGlobal_Dpt50_v1, process\.HLT_HIDmesonPPTrackingGlobal_Dpt60_v1/process.HLT_HIDmesonPPTrackingGlobal_Dpt8_v1, process.HLT_HIDmesonPPTrackingGlobal_Dpt15_v1, process.HLT_HIDmesonPPTrackingGlobal_Dpt30_v1, process.HLT_HIDmesonPPTrackingGlobal_Dpt40_v1, process.HLT_HIDmesonPPTrackingGlobal_Dpt50_v1, process.HLT_HIDmesonPPTrackingGlobal_Dpt60_v1, process.HLT_HIDsPPTrackingGlobal_Dpt8_v1, process.HLT_HIDsPPTrackingGlobal_Dpt15_v1, process.HLT_HIDsPPTrackingGlobal_Dpt30_v1, process.HLT_HIDsPPTrackingGlobal_Dpt40_v1, process.HLT_HIDsPPTrackingGlobal_Dpt50_v1, process.HLT_HIDsPPTrackingGlobal_Dpt60_v1/g' hlt92X_Ds.py