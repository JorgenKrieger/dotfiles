#!/bin/bash

installer "Setting up macOS preferences"
osascript -e 'tell application "System Preferences" to quit'

# ###############################################################################
# General UI/UX
# ###############################################################################

action "General UI/UX"

running "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

running "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

running "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

running "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

running "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

running "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

running "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

running 'Remove duplicates in the “Open With” menu (also see `lscleanup` alias)'
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

running "Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

running "Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

running "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

running "Disable smart quote replacement"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

running "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false



# ###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories and input                   
# ###############################################################################

action "Trackpad, mouse, keyboard, Bluetooth accessories and input"

running "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

running "Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

running "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

running "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

running "Set language and text formats"
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

running "Show language menu in the top right corner of the boot screen"
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

running "Set the timezone;"
# See `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Amsterdam" > /dev/null



# ###############################################################################
# Screen
# ###############################################################################

action "Screen"

running "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

running "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

running "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

running "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true



# ###############################################################################
# Finder
# ###############################################################################

action "Finder"

running "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

running "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

running "Set Desktop as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

running "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

running "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

running "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

running "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

running "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

running "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

running "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

running "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

running "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

running "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

running "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

running "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

running "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

running "Show the ~/Library folder"
chflags nohidden ~/Library

running "Show the /Volumes folder"
sudo chflags nohidden /Volumes

running "Expand the File Info panes:"
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true



# ###############################################################################
# Dock, Dashboard, and hot corners
# ###############################################################################

action "Dock, Dashboard, and hot corners"

running "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

running "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

running "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

running "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

running "Don’t group windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

running "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

running "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

running "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

running "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0
running "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

running "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

running "Add a spacer to the left side of the Dock (where the applications are)"
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
running "Add a spacer to the right side of the Dock (where the Trash is)"
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'



# ##############################################################################
# Safari & WebKit
# ##############################################################################

action "Safari & WebKit"

running "Privacy: don’t send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

running "Press Tab to highlight each item on a web page"
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

running "Show the full URL in the address bar (note: this still hides the scheme)"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

running "Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

running "Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

running "Hide Safari’s bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

running "Hide Safari’s sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

running "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

running "Make Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

running "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

running "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

running "Enable continuous spellchecking"
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
running "Disable auto-correct"
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

running "Disable AutoFill"
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

running "Warn about fraudulent websites"
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

running "Disable Java"
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

running "Block pop-up windows"
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

running "Enable “Do Not Track”"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

running "Update extensions automatically"
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true



# ##############################################################################
# Activity Monitor
# ##############################################################################

action "Activity Monitor"

running "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

running "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

running "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

running "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0



# ##############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility
# ##############################################################################

action "Address Book, Dashboard, iCal, TextEdit, and Disk Utility"

running "Enable the debug menu in Address Book"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

running "Enable Dashboard dev mode - allows keeping widgets on the desktop"
defaults write com.apple.dashboard devmode -bool true

running "Enable the debug menu in iCal - pre-10.8"
defaults write com.apple.iCal IncludeDebugMenu -bool true

running "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0
running "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

running "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true



# ##############################################################################
# Mac App Store
# ##############################################################################

action "Mac App Store"

running "Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

running "Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

running "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

running "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

running "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

running "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

running "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true



# ##############################################################################
# Google Chrome & Google Chrome Canary
# ##############################################################################

action "Google Chrome & Google Chrome Canary"

running "Disable the all too sensitive backswipe on trackpads"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

running "Disable the all too sensitive backswipe on Magic Mouse"
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

running "Use the system-native print preview dialog"
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

running "Expand the print dialog by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true



# ##############################################################################
# Visual Studio Code
# ##############################################################################

action "Visual Studio Code"
running "Disable Apple press and hold for VS Code"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false



# ##############################################################################
# Kill affected applications
# ##############################################################################

action "Killing affected applications"
for APP in "Activity Monitor" \
  "Address Book" \
  "Calendar" \
  "cfprefsd" \
  "Contacts" \
  "Dock" \
  "Finder" \
  "Google Chrome" \
  "Mail" \
  "Messages" \
  "Photos" \
  "Safari" \
  "SizeUp" \
  "SystemUIServer" \
  "iCal"; do
  killall $APP &> /dev/null
done

ok
