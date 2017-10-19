
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

<h2> Add HighpT SingleJet L1 menu XML (update on 2017.10.18) </h2>
Ref: <a href="https://twiki.cern.ch/twiki/bin/viewauth/CMS/HiHighPtTrigger2017#L1_Menu">https://twiki.cern.ch/twiki/bin/viewauth/CMS/HiHighPtTrigger2017#L1_Menu</a>

Download the L1 menu <code>L1Menu_Collisions2017_dev_r9_HIppRefMODv2_20171018.xml</code> from <a href="https://twiki.cern.ch/twiki/pub/CMS/HiHighPtTrigger2017">HiHighPtTrigger2017 twiki</a> attachments, and put it in <code>L1Trigger/L1TGlobal/data/Luminosity/startup/</code>.

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
        'root://cms-xrd-global.cern.ch//store/user/twang/Pythia8_prompt_D0pt0p0_Pthat20_TuneCUETP8M1_5020GeV/crab_DIGI_20171005/171009_201555/0000/step2_pp_DIGI_L1_DIGI2RAW_HLT_109.root',
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
