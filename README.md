
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

<h2> Set up Dfinder </h2>
Ref: <a href="https://github.com/taweiXcms/Bfinder/tree/Dfinder_9XX">https://github.com/taweiXcms/Bfinder/tree/Dfinder_9XX</a>
<pre>
  git clone -b Dfinder_9XX https://github.com/taweiXcms/Bfinder.git
  scram build -j4
</pre>

<h2> Use this repository (HltPPRef2017) </h2>
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
