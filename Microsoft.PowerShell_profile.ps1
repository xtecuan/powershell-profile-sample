function Color-Console {
  $Host.ui.rawui.backgroundcolor = "black"
  $Host.ui.rawui.foregroundcolor = "green"
  $hosttime = (Get-ChildItem -Path $PSHOME\pwsh.exe).CreationTime
  $hostversion="$($Host.Version.Major)`.$($Host.Version.Minor)"
  $Host.UI.RawUI.WindowTitle = "PowerShell $hostversion ($hosttime)"
  Clear-Host
}


$work1="D:\Work"
$work2="D:\WorkColectoresWeb"
$javaHome="D:\WorkColectoresWeb\Java\jdk"
$mavenHome="D:\Work\Java\apache-maven-3.8.5-bin"
$wgetBin="D:\WorkColectoresWeb\Native\wget\bin"
$smartGit="D:\Work\Java\SmartGit"
$gitHome="D:\Work\Native\Git"
$gitbashCommand="$gitHome\git-bash.exe --cd-to-home"
$editor="notepad++"
$editarProfileCmd="$editor C:\Users\jurivera\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$notepadPlusplusHome="D:\Work\Native\Notepad++"
$notepadPlusplusCmd="$notepadPlusplusHome\notepad++.exe"

$netbeansScript="D:\WorkColectoresWeb\Java\netbeans-col-web.ps1"

function setVariables {
	Set-Content -Path Env:\JAVA_HOME -Value "$javaHome"
	Set-Content -Path Env:\MAVEN_HOME -Value "$mavenHome"
	Set-Content -Path Env:\SMARTGIT_HOME -Value "$smartGit"
	Set-Content -Path Env:\PATH -Value "$notepadPlusplusHome;$gitHome;$gitHome\bin;$smartGit\bin;$mavenHome\bin;$javaHome\bin;$wgetBin;$Env:PATH"
}


function goWork ($folder) {
	cd $folder
}

function netbeans {
	powershell -file $netbeansScript
}

function openGit {
	powershell -command $gitbashCommand
}


function notepadPlusplus {
	powershell -command $notepadPlusplusCmd
}

function editProfile {
	powershell -command $editarProfileCmd
}

setVariables
Color-Console
goWork $work2