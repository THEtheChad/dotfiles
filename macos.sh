#!/usr/bin/env bash
# Sensible macOS defaults, trimmed to keys that still exist on modern macOS.
# Review before running — these are opinions. Run with: ./macos.sh

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Quit the printer app once print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

###############################################################################
# Input                                                                       #
###############################################################################

# Trackpad: tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Fast keyboard repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

###############################################################################
# Screenshots                                                                 #
###############################################################################

defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Show hidden files, all extensions, status bar, and path bar
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# No warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Don't write .DS_Store to network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# List view by default (icnv, clmv, Flwv for the others)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# Dock                                                                        #
###############################################################################

# Indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# No auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

###############################################################################
# TextEdit                                                                    #
###############################################################################

# Plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0

###############################################################################
# Apply                                                                       #
###############################################################################

for app in "Dock" "Finder" "SystemUIServer"; do
  killall "$app" > /dev/null 2>&1
done
echo "Done. Some changes require a logout/restart to take effect."
