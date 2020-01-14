## Mac OS terminal env setup script
- Based on [@KennethanCeyer](https://github.com/KennethanCeyer)'s guide
  - https://blog.pigno.se/post/184576332493/완벽한-mac-작업환경-세팅하기-vim-zsh-iterm
- Install sort of things
  - `iTerm2`
  - `oh-my-zsh`
  - `Powerlevel9k` Theme
  - `Melso LG M DZ for Powerline` Font
  - `Brogrammer` Color preset

### Notice
- It needs iTerm2 version at least v3.3.x above.
- The whole process takes about three of four minutes.
  - At the end of setup process, it'll tries to execute `Python3` script that works on iTerm2 to change font and color preset.
  - It needs `Python3 runtime environment for iTerm2`, and iTerm will starts to download it.
  - After downloading, the python script will starts automatically. 
  
### Usage
- After git-cloning or download as a ZIP file
  ```
  cd ${mac-os-terminal-env-dir} && ./sh_env_imp.sh
  ```
- Or Just C&P down below
  ```
  PREV_WD=$(pwd);
  mkdir -p /tmp/term_set &&\
  cd /tmp/term_set &&\
  wget "https://github.com/kekemu/mac-os-terminal-env/archive/master.zip" &&\
  tar xzvf master.zip &&\
  cd mac-os-terminal-env-master &&\
  ./sh_env_imp.sh &&\
  cd "$PREV_WD" &&\
  rm -rf /tmp/term_set
  ```
