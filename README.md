
<h1> HltPPRef2017 </h1>

<h2> Set up CMSSW </h2>
<pre>
  cmsrel CMSSW_9_2_12_patch1
  cd CMSSW_9_2_12_patch1/src
  cmsenv
</pre>

<h2> Set up L1 and HLT </h2>
Ref: <a href="https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideGlobalHLT#Running_the_HLT_with_CMSSW_9_2_0">https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideGlobalHLT#Running_the_HLT_with_CMSSW_9_2_0</a>
<pre>
  git cms-init
  git remote add cms-l1t-offline https://github.com/cms-l1t-offline/cmssw.git
  git fetch cms-l1t-offline
  git cms-merge-topic -u cms-l1t-offline:l1t-integration-v96.35-CMSSW_9_2_12
  git cms-addpkg L1Trigger/L1TCommon
  git cms-addpkg L1Trigger/L1TMuon
  git clone https://github.com/cms-l1t-offline/L1Trigger-L1TMuon.git L1Trigger/L1TMuon/data
  git cms-addpkg L1Trigger/L1TGlobal
  git clone https://github.com/cms-l1-dpg/2017-pp-menu-dev -b 2017-07-24 ../2017-pp-menu-dev
  mkdir -p L1Trigger/L1TGlobal/data/Luminosity/startup
  cp ../2017-pp-menu-dev/Apr12/*.xml L1Trigger/L1TGlobal/data/Luminosity/startup/
  git cms-addpkg HLTrigger/Configuration
  git cms-checkdeps -A -a
  scram b -j 6
  rehash
</pre>

<h2> Add HighpT SingleJet L1 menu XML (update on 2017.10.13) </h2>
Ref: <a href="https://twiki.cern.ch/twiki/bin/viewauth/CMS/HiHighPtTrigger2017#L1_Menu">https://twiki.cern.ch/twiki/bin/viewauth/CMS/HiHighPtTrigger2017#L1_Menu</a>
Download the <a href="https://twiki.cern.ch/twiki/pub/CMS/HiHighPtTrigger2017/L1Menu_Collisions2017_dev_r9_HIppRefMOD.xml">L1Menu_Collisions2017_dev_r9_HIppRefMOD.xml</a>, and put it in <code>L1Trigger/L1TGlobal/data/Luminosity/startup/</code>.

<h2> Set up Dfinder </h2>
Ref: <a href="https://github.com/taweiXcms/Bfinder/tree/Dfinder_9XX">https://github.com/taweiXcms/Bfinder/tree/Dfinder_9XX</a>
<pre>
  git clone -b Dfinder_9XX https://github.com/taweiXcms/Bfinder.git
  scram build -j4
</pre>

<h2> HLTanalyzers (update on 2017.10.13) </h2>
Ref: <a href="https://twiki.cern.ch/twiki/bin/view/CMS/HeavyIonsHLT2017#Make_hlt_BitAnalyzer_great_again">https://twiki.cern.ch/twiki/bin/view/CMS/HeavyIonsHLT2017#Make_hlt_BitAnalyzer_great_again</a>
<pre>
  git cms-addpkg HLTrigger/HLTanalyzers
  git remote add CMS-HIN-dilepton https://github.com/CMS-HIN-dilepton/cmssw.git
  git fetch CMS-HIN-dilepton
  git checkout CMS-HIN-dilepton/Trigger_PPRef_9_2_X HLTrigger/HLTanalyzers
  scram b
</pre>

<h2> Use this repository (HltPPRef2017) </h2>
Note: <code>hltGetConfiguration</code> doesn't work on svmithi02, which is not able to read menus.
<h3> Download the repository </h3>
<pre>
  git clone https://github.com/boundino/HltPPRef2017.git
  cd HltPPRef2017/
</pre>
<h3> Produce hlt config </h3>
<ol>
  <li> Modify whether to run Dfinder, HLT menu, global tag, sample and event number in <code>rungetconfig.sh</code> <a href="https://github.com/boundino/HltPPRef2017/blob/master/rungetconfig.sh#L3-L11">L3-L11</a>. </li>
  <li> Run the macro <br />
    <pre>
      ./rungetconfig.sh
    </pre>
    <p> and you will get the config <code>hlt92X.py</code>. </p>
  </li>
</ol>

<h2> Test HLT emulators and Dfinder locally </h2>
Ref: <a href="https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuidePoolInputSources#Example_5_Merging_files_with_dif">https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuidePoolInputSources#Example_5_Merging_files_with_dif</a>
<p> Add </p>
<pre>
  secondaryFileNames = cms.untracked.vstring(
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/048E99EE-8508-E711-A50C-02163E01A3B7.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/06E1030D-8508-E711-A7C6-02163E0122AA.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/0C49E624-8608-E711-A62A-02163E019CBC.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/0EC99D28-8508-E711-A8C4-02163E0141FA.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/38F41420-8508-E711-B0EB-02163E01A541.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/464AD5E7-8408-E711-B590-02163E011B3F.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/646500F9-7D08-E711-9113-02163E013809.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/6EFD9DCA-8508-E711-9D42-02163E01A751.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/84AAFB08-8608-E711-9A06-02163E019C9F.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/8ED0E822-8608-E711-B772-02163E01381F.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/A22CD3EB-8508-E711-9B54-02163E019D39.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/A6E52D74-8108-E711-9CCA-02163E019D1A.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/ACC57B0E-8608-E711-A058-02163E011A13.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/AE2460DC-8108-E711-8329-02163E013483.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/B25C556A-8608-E711-B4B3-02163E019CE2.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/BADC984E-8608-E711-A78F-02163E0142E8.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/BE824A70-8108-E711-B18C-02163E014594.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/C06C8DE5-7D08-E711-9740-02163E01A32C.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/C8C0CB65-8608-E711-B1C8-02163E0142BF.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/CE737D00-8608-E711-9E35-02163E01A3B5.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/D052A164-8608-E711-9ADD-02163E014248.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/D0EB9C16-8608-E711-BD59-02163E0126EA.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/D2F162D5-8508-E711-886C-02163E01A45D.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/D41FC313-8508-E711-A706-02163E011A89.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/DA071672-8108-E711-85D3-02163E01A308.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/DE096C5C-8108-E711-9AA6-02163E0119D3.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/E0BF5D71-8108-E711-A203-02163E01A2BE.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/E2112B29-8508-E711-9FAE-02163E0136EC.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/F0991971-8108-E711-A5D6-02163E01A253.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/FA278163-8508-E711-A854-02163E011E9B.root',
  'file:/data/wangj/HLT2017/Parents_MinBias_TuneCUETP8M1_13TeV_pythia8_0AEFBB63_6C0A_E711_8737_02163E01A74F/FE381960-8108-E711-9C07-02163E011CA2.root',
  ),
</pre>
in <code>hlt92X.py</code> after
<pre>
  fileNames = cms.untracked.vstring(
  'root://cms-xrd-global.cern.ch//store/mc/PhaseIFall16DR/MinBias_TuneCUETP8M1_13TeV-pythia8/AODSIM/NoPUNZS_90X_upgrade2017_realistic_v6_C1_ext1-v1/120000/0AEFBB63-6C0A-E711-8737-02163E01A74F.root',
  ),
</pre>

<h2> Use CRAB </h2>
<code>crabConfigPrivatePP.py</code> is a template of crab submission config. If using <code>config.Data.useParent = True</code>, maybe you need to change
<pre>
  process.options = cms.untracked.PSet(
  wantSummary = cms.untracked.bool( True ),
  numberOfThreads = cms.untracked.uint32( 4 ),
  numberOfStreams = cms.untracked.uint32( 0 ),
  sizeOfStackForThreadsInKB = cms.untracked.uint32( 10*1024 )
  )
</pre>
in <code>hlt92X.py</code> to
<pre>
  process.options = cms.untracked.PSet(
  wantSummary = cms.untracked.bool( True ),
  numberOfThreads = cms.untracked.uint32( 1 ),
  numberOfStreams = cms.untracked.uint32( 0 ),
  sizeOfStackForThreadsInKB = cms.untracked.uint32( 10*1024 )
  )
</pre>
