# mac-os-terminal-env
[@KennethanCeyer](https://github.com/KennethanCeyer)님의 아래 포스트를 자동화.
- https://blog.pigno.se/post/184576332493/완벽한-mac-작업환경-세팅하기-vim-zsh-iterm

아래 명령어로 적용 가능 합니다.

```
PREV_WD=$(pwd)
mkdir -p /tmp/term_set &&\
cd /tmp/term_set &&\
wget "https://github.com/kekemu/mac-os-terminal-env/archive/master.zip" &&\
tar xzvf master.zip &&\
cd mac-os-terminal-env-master &&\
./sh_env_imp.sh &&\
cd "$PREV_WD" &&\
rm -rf /tmp/term_set
```
