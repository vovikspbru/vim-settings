eval "$(ssh-agent -s)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vkuznetsov/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vkuznetsov/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vkuznetsov/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vkuznetsov/dev/google-cloud-sdk/completion.zsh.inc'; fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=$JAVA_HOME/bin:$PATH
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
source <(mesh completion zsh)
mesh completion zsh > "${fpath[1]}/_mesh"

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF='%f'
COLOR_RED='%F{red}'
COLOR_GIT='%F{green}'
COLOR_YELLOW='%F{yellow}'
function ps1() {
    echo '$COLOR_RED`print -P %~`$COLOR_GIT $(parse_git_branch)$COLOR_DEF$ '
}
function ps2() {
    echo '$COLOR_YELLOW===>$COLOR_DEF '
}

setopt PROMPT_SUBST
PS1="$(ps1)"
PS2="$(ps2)"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
