#!/bin/zsh


osascript -e 'tell application "System Preferences" to quit'

# ###############################################################################
# General UI/UX
# ###############################################################################

echo "General UI/UX"

# "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

# "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# 'Remove duplicates in the “Open With” menu (also see `lscleanup` alias)'
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# "Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# "Disable smart quote replacement"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false



# ###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories and input                   
# ###############################################################################

echo "Trackpad, mouse, keyboard, Bluetooth accessories and input"

# "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# "Trackpad: map bottom right corner to right-click"
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 0

# "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# "Set language and text formats"
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# "Show language menu in the top right corner of the boot screen"
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true



# ###############################################################################
# Screen
# ###############################################################################

echo "Screen"

# "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

# "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

# "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true



# ###############################################################################
# Finder
# ###############################################################################

echo "Finder"

# "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

# "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

# "Set Desktop as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

# "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# "Show the ~/Library folder"
chflags nohidden ~/Library

# "Show the /Volumes folder"
sudo chflags nohidden /Volumes

# "Expand the File Info panes:"
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

# "Hide desktop icons"
defaults write com.apple.finder CreateDesktop -bool false



# ###############################################################################
# Dock, Dashboard, and hot corners
# ###############################################################################

echo "Dock, Dashboard, and hot corners"

# "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

# "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

# "Hide recent active apps"
defaults write com.apple.dock show-recents -bool false

# "Only show active apps"
defaults write com.apple.dock static-only -bool true

# "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

# "Don’t group windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

# "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

# "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

# "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0
# "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

# "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true



# ##############################################################################
# Safari & WebKit
# ##############################################################################

echo "Safari & WebKit"

# "Privacy: don’t send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# "Press Tab to highlight each item on a web page"
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# "Show the full URL in the address bar (note: this still hides the scheme)"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# "Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# "Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# "Hide Safari’s bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

# "Hide Safari’s sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# "Make Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# "Enable continuous spellchecking"
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# "Disable auto-correct"
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# "Disable AutoFill"
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# "Warn about fraudulent websites"
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# "Disable Java"
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# "Block pop-up windows"
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# "Enable “Do Not Track”"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# "Update extensions automatically"
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true



# ##############################################################################
# Activity Monitor
# ##############################################################################

echo "Activity Monitor"

# "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

# "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0



# ##############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility
# ##############################################################################

echo "Address Book, Dashboard, iCal, TextEdit, and Disk Utility"

# "Enable the debug menu in Address Book"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0

# "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true



# ##############################################################################
# Mac App Store
# ##############################################################################

echo "Mac App Store"

# "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true



# ##############################################################################
# Visual Studio Code
# ##############################################################################

echo "Visual Studio Code"
# "Disable Apple press and hold for VS Code"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false



# ##############################################################################
# Kill affected applications
# ##############################################################################

echo "Killing affected applications"
for APP in "Activity Monitor" \
  "Address Book" \
  "Calendar" \
  "cfprefsd" \
  "Contacts" \
  "Dock" \
  "Finder" \
  "Mail" \
  "Messages" \
  "Photos" \
  "Safari" \
  "SizeUp" \
  "SystemUIServer" \
  "iCal"; do
  killall $APP &> /dev/null
done