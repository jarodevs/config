export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CURRENT_DESKTOP=sway
export PATH="$HOME/.local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This lo
export WLR_NO_HARDWARE_CURSORS=1

# JDK
export JDK_HOME=/etc/java11-openjdk
# Android Studio opening issue on sway
export _JAVA_AWT_WM_NONREPARENTING=1
# Android Studio general 
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# GIT
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1

# Import secret un-commited exports
# EIMY
# #	NPM_TOKEN
# # CI_JOB_TOKEN
# # GL_TOKEN
source ~/.secret-exports.zsh
