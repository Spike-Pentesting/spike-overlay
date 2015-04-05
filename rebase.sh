### This is set-up for making a public layman for testing by non spike-  general Gentoo use Abuse and Etc..
### you can always edit this to keep your own fork In sync, 
##git remote set-url --push origin https://github.com/Sabayon-Labs/spike-overlay.git
git remote add origin https://github.com/Sabayon-Labs/spike-overlay.git
git remote add upstream https://github.com/Spike-Pentesting/spike-overlay.git
git fetch upstream
git rebase upstream/master
git add *
git commit -m "robot script syncing files..."
#git commit --amend
git push -f
git push origin master
