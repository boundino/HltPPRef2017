#

from CRABClient.UserUtilities import config
config = config()
config.General.transferOutputs = True
config.General.requestName = 'HLT_pp_20171008_MinBias_TuneCUETP8M1_5020GeV_pythia8_201711004'
config.General.workArea = 'crab_projects_HLT'
config.JobType.psetName = 'hlt92X.py'
config.JobType.pluginName = 'Analysis'
# config.JobType.inputFiles = ['rssLimit']
config.JobType.pyCfgParams = ['noprint']
config.JobType.outputFiles = ['openHLT.root']
# config.JobType.numCores = 4

config.Data.useParent = True
config.Data.inputDataset = '/Pythia8_MinBias_pp_CUETP8M1_5020GeV/gsfs-RECO__201711004-b3ceaa6c7c762fab18b245ad1faf35c4/USER'
config.Data.inputDBS = 'phys03'
# config.Data.lumiMask = '/afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions15/5TeV/Cert_262081-262328_5TeV_PromptReco_Collisions15_25ns_JSON.txt'
config.Data.totalUnits = -1
config.Data.unitsPerJob = 2000
config.Data.splitting = 'EventAwareLumiBased'
# config.Data.splitting = 'LumiBased'

config.Site.storageSite = 'T2_US_MIT'
# config.Site.storageSite = 'T2_CH_CERN'
# config.Data.outLFNDirBase = '/store/group/phys_heavyions/wangj/HltHFPPRef2017'
config.Site.whitelist = ['T2_US_MIT']
config.Site.blacklist = ['T2_US_Nebraska','T2_US_Purdue','T2_US_UCSD','T2_US_Wisconsin','T2_FR_GRIF_IRFU','T3_US_UCR','T3_US_Rutgers','T3_BG_UNI_SOFIA','T3_IT_Perugia']
# config.Site.ignoreGlobalBlacklist = True
