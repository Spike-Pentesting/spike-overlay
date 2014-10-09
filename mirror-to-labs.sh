### This is set-up for making a public layman for testing by non spike-  general Gentoo use Abuse and Etc..
### you can always edit this to keep your own fork In sync, 
##git remote set-url --push origin https://github.com/Sabayon-Labs/spike-overlay/.git  git@github.com:Spike-Pentesting/App-witchcraft.git
git remote add origin https://github.com/Sabayon-Labs/App-witchcraft.git
git remote add upstream https://github.com/Spike-Pentesting/App-witchcraft.git
git checkout master
git fetch upstream
git merge upstream/master
git rebase upstream/master
git push origin