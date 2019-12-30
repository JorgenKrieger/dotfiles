<h1 align="center">dotfiles</h1>
<h4 align="center">💻 Automated configuration, preferences and software installer for macOS</h4>
<p align="center"><img src="https://img.shields.io/badge/macOS-Catalina-999999?style=flat-square">

<p align="center">Complete overhaul of my dotfiles. </p>

## Installation

Open terminal, paste the code and kaboom!

```
git clone --recurse-submodules https://github.com/jorgenkrieger/dotfiles ~/dotfiles;
 ~/dotfiles/install/install.sh
```

## Software Installation
Most required apps (cli & gui) are installed via Homebrew (using casks & [mas](https://github.com/mas-cli/mas))

<details>
<summary><b>CLI</b></summary>

- [mas](https://github.com/mas-cli/mas) - Mac App Store extension for Homebrew
- [git](https://git-scm.com/) - Latest Git version
- [zsh](https://www.zsh.org/) - Latest ZSH version
- [bat](https://github.com/sharkdp/bat) - Improved version of cat
- [tree](https://formulae.brew.sh/formula/tree#default) - Tree view of directories
- [wget](https://www.gnu.org/software/wget/) - Alternative to curl
- [dockutil](https://github.com/kcrawford/dockutil) - macOS Dock Utility
- [node](https://nodejs.org/en/) - NodeJS
- [python](https://www.python.org/) - Python version 3
</details>

<details>
<summary><b>Development</b></summary>

- [Visual Studio Code](https://github.com/microsoft/vscode) - Main editor
- [iTerm2](https://iterm2.com/) - Terminal
- [Docker](https://www.docker.com/) - Development environment
- [Sequel Pro](https://sequelpro.com/) - Database manager
- [Transmit](https://www.panic.com/transmit/) - FTP, SFTP, S3 and more
- [Postman](https://www.getpostman.com/) - API Exploration 
- [Dash](https://kapeli.com/dash) - Offline code docs
- [Hammerspoon](https://www.hammerspoon.org/) - macOS programming via Lua
- [Arduino](https://www.arduino.cc/) - 
</details>


<details>
<summary><b>Design</b></summary>

- [Sketch](https://www.sketch.com/) - Main web design tool
- [Craft Manager](https://www.invisionapp.com/craft) - Plugin for Sketch
- [Adobe Creative Cloud](https://www.adobe.com/creativecloud.html) - Photoshop, Illustrator, InDesign, After Effects, Premiere, Lightroom
- [ImageOptim](https://imageoptim.com/mac) - Image filesize compression
</details>

<details>
<summary><b>Browsers</b></summary>

- [Microsoft Edge (developer channel)](https://www.microsoftedgeinsider.com/en-us/) - Daily driver
- [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) - Development focused browser
- [Google Chrome](https://www.google.nl/chrome/) - Backup
</details>

<details>
<summary><b>Communication</b></summary>

- [Spark](https://sparkmailapp.com/) - Email & calendar
- [Slack](https://slack.com/) - Team communication
- [Skype](https://www.skype.com/) - (Video)calling
- [WhatsApp](https://www.whatsapp.com/) - Instant messaging
- [LINE](https://line.me/en/) - Instant messaging
- [KakaoTalk](https://www.kakaocorp.com/service/KakaoTalk?lang=en) - Instant messsaging
</details>

<details>
<summary><b>Project Management & Productivity</b></summary>

- [1Password](https://1password.com/) - Password manager
- [Alfred](https://www.alfredapp.com/) - Improved mac spotlight
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12) - Prevent standby
- [Bartender](https://www.macbartender.com/) - Icon cleaner
- [Endel](https://endel.io/) - Audio soundscapes
- [Harvest](https://www.getharvest.com/) - Time tracking
- [Notion](https://www.notion.so/) - To-do lists, internal wiki
</details>

<details>
<summary><b>Miscellaneous</b></summary>

- Keynote
- Pages
- Numbers
</details>

## Settings
This project changes many settings in macOS and tools.

<details>
<summary><b>General UI/UX</b></summary>

- Disable the sound effects on boot
- Increase window resize speed for Cocoa apps
- Expand save panel by default
- Expand print panel by default
- Save to disk (not to iCloud) by default
- Automatically quit printer app once the print jobs complete
- Disable the "Are you sure you want to open this application?" dialog
- Remove duplicates in the "Open With" menu
- Disable automatic termination of inactive apps
- Restart automatically if the computer freezes
- Disable smart dashes as they're annoying when typing codes
- Disable smart quote replacement
- Disable auto-correct
</details>

<details>
<summary><b>Devices</b></summary>

- Trackpad
  - Enable tap to click for this user and login screen
  - Map bottom right corner to rightclick
- Keyboard
  - Set a blazingly fast keyboard repeat rate
  - Set language and text formats
- Audio
  - Increase sound quality for Bluetooth headphones
- Set timezone
</details>

<details>
<summary><b>Screen</b></summary>

- Require password immediately after sleep
- Save screenshots to the desktop
- Save screenshots in PNG format
- Enable subpixel font rendering on non-Apple LCDs
</details>

<details>
<summary><b>Finder</b></summary>

- Finder: allowing quitting via ⌘ + Q; doing so will also hide desktop icons 
- Finder: disable window animations and Get Info Animations
- Set desktop as the default location for new Finder windows
- Show icons for hard drives, servers and removable drives
- Finder: show all filename extensions
- Finder: show status bar
- Finder: show path bar
- Display full POSIX path as Finder window title
- Keep folders on top when sorting by name
- When performing a search, search the current folder by default
- Disable the warning when changing a file extension
- Enable spring loading for directories
- Remove spring loading delay for directories
- Avoid creating .DS_Store files on network or USB
- Automatically open a new Finder window when a volume is mounted
- Use list view in all Finder windows by default
- Show the ~/Library folder
- Show the /Volumes folder
- Expand the File Info panes
</details>

<details>
  <summary><b>Dock, Dashboard and hot corners</b></summary>

  - Show indicator lights for open applications in the Dock
  - Don't animate opening applications from the Dock
  - Speed up Mission Control animations
  - Don't group windows by application in Mission Control
  - Disable Dashboard
  - Don't show Dashboard as a space
  - Don't automatically rearrange Spaces based on most recent use
  - Remove the auto-hiding Dock delay
  - Remove the animation when hiding/showing the Dock
</details>

<details>
<summary><b>Safari</b></summary>

- Privacy: don't send search queries to Apple
- Press Tab to highlight each item on a web page
- Show the full URL in the address bar (note: this still hides the scheme)
- Prevent Safari from opening 'safe' files automatically after downloading
- Allowing hitting the Backspace key to go to the previous page in history
- Hide Safari's bookmarks bar by default
- Hide Safari's sidebar in Top Sites
- Enable Safari's debug menu
- Make Safari's search banners default to Contains instead of Starts With
- Enable the Develop menu and the Web Inspector in Safari
- Add a context menu item for showing the Web Inspector in web views
- Enable continuous spellchecking
- Disable auto-correct
- Disable AutoFill
- Warn about fraudulent websites
- Disable Java
- Block pop-up windows
- Enable "Do Not Track"
- Update extensions automatically
</details>

<details>
  <summary><b>Activity Monitor</b></summary>

  - Show the main window when launching Activity Monitor
  - Visualize CPU usage in the Activity Monitor Dock icon
  - Show all processes in Activity Monitor
  - Sort Activity Monitor results by CPU usage
</details>

<details>
  <summary><b>macOS Standard apps</b></summary>

  - Enable the debug menu in Address Book
  - Enable Dashboard dev mode - allow keeping widgets on the desktop
  - Use plain text mode for the new TextEdit documents
  - Open and save files as UTF-8 in TextEdit
  - Enable the debug menu in Disk Utility
</details>

<details>
  <summary><b>App Store</b></summary>

  - Enable the automatic update check
  - Check for software updates daily, not just once per week
  - Download newly available updates in background
  - Install System data files & security updates
  - Turn on app auto-update
</details>

<details>
  <summary><b>Google Chrome</b></summary>

  - Disable the all too sensitive backswipe on trackpads
  - Disable the all too sensitive backswipe on Magic Mouse
  - Use the system-native print preview dialog
  - Expand the print dialog by default
</details>

<details>
  <summary><b>Visual Studio Code</b></summary>

  - Disable Apple press and hold for VS Code
</details>


## 🖤 References

This setup and configuration has been inspired by a lot of awesome developers and their dotfiles.

- [Tom de Bruijn](https://github.com/tombruijn/dotfiles)
- [Martijn Bleeker](https://github.com/martijnbleeker/dotfiles)
- [Adam Eivy](https://github.com/atomantic/dotfiles)
- And others over at [Github does dotfiles](https://dotfiles.github.io/)


### Submodules

- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Spaceship prompt](https://github.com/denysdovhan/spaceship-prompt)
- [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)



<p align="center"><sup>Made with 🧡 in The Netherlands</sup></p>