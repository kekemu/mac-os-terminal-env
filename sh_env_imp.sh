#!/bin/bash

echo "Start to improve your shell environment."
echo "Current Shell is : "$SHELL
echo "===================================================================="

ls ~/.oh-my-zsh > /dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "oh-my-zsh is already installed"
	ZSH_ACTIVATION_CHECK=$(echo $SHELL | grep -c "zsh$")
	if [ $ZSH_ACTIVATION_CHECK -le 0 ]
	then
		echo "Try to change your login shell..."
		echo "Please enter password."
		ZSH_PATH=$(cat /etc/shells | grep "zsh$")
		chsh -s $ZSH_PATH
	fi
else
	echo "Install zsh + oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -E 's/exec zsh -l//g')"
	echo "zsh & oh-my-zsh installation Done.!! "
fi

if [ $? -e 1 ]
then
	echo "iTerm is not installed."
	brew --version > /dev/null 2>&1
	if [ $? -e 1 ] 
	then
		echo "Install Homebrew."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	echo "Install iTerm."
	brew cask install iTerm2
	osascript -e 'tell application "iTerm" to activate'
fi

# Add iTerm2 scripts
cp -rp ./python_scripts./* ~/Library/ApplicationSupport/iTerm2/Scripts/
osascript -e 'tell application "iTerm" to activate'

echo ""
echo "Install 'Powerlevel9k' theme..."
rm -rf ~/.oh-my-zsh/themes/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k
cat ~/.zshrc | sed -E 's/^ZSH_THEME=.+/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/' > ~/.zshrc.upcomming
rm -f ~/.zshrc && mv ~/.zshrc.upcomming ~/.zshrc
echo "Install 'Powerlevel9k' theme... Done."

echo ""
echo "Download fonts for 'Powerlevel9k' theme..."
git clone https://github.com/powerline/fonts.git /tmp/powerlevel9k-fonts && cd $_
sh ./install.sh
cd .. && rm -rf /tmp/powerlevel9k-fonts

echo ""
echo "Download color preset 'Brogrammer'..."
mkdir -p ~/.iterm && curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Brogrammer.itermcolors > ~/.iterm/Brogrammer.itermcolors
open ~/.iterm/Brogrammer.itermcolors
sleep 3

osascript tell application "iTerm2" <<EOF
	launch API script named "change_font_for_powerlevel9k"
end tell
EOF

echo "Done."
exec zsh -l

