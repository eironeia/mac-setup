function cdl {
    builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

function cleandd {
	set +feo pipefail  
        set -o nullglob
        set -o globdots

	echo 'Cleanup XCode Derived Data and Archives...'
        noglob rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null
        noglob rm -rf ~/Library/Developer/Xcode/Archives/* 2>/dev/null
}

function cleanAll {
	set +feo pipefail
	set -o nullglob
	set -o globdots

	echo 'Empty the Trash on all mounted volumes and the main HDD...'
	sudo rm -rf /Volumes/*/.Trashes 2>/dev/null
	sudo rm -rf ~/.Trash 2>/dev/null

	echo 'Clear System Log Files...'
	sudo rm -rf /private/var/log/asl/*.asl 2>/dev/null
	sudo rm -rf /Library/Logs/DiagnosticReports/* 2>/dev/null
	sudo rm -rf /Library/Logs/Adobe/* 2>/dev/null
	noglob rm -rf ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* 2>/dev/null
	noglob rm -rf ~/Library/Logs/CoreSimulator/* 2>/dev/null

	echo 'Clear Adobe Cache Files...'
	sudo rm -rf ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* 2>/dev/null

	echo 'Cleanup iOS Applications...'
	noglob rm -rf ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* 2>/dev/null

	echo 'Remove iOS Device Backups...'
	noglob rm -rf ~/Library/Application\ Support/MobileSync/Backup/* 2>/dev/null

	echo 'Cleanup XCode Derived Data and Archives...'
	noglob rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null
	noglob rm -rf ~/Library/Developer/Xcode/Archives/* 2>/dev/null

	echo 'Cleanup Homebrew Cache...'
	brew cleanup 
	brew cask cleanup
	noglob rm -rf /Library/Caches/Homebrew/* 2>/dev/null
	brew tap --repair

	echo 'Purge inactive memory...'
	sudo purge
	echo 'Success!'
}