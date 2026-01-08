# GUARD: ChatGPT Codex / Sandboxed Shells
# these eval lines are the real content of .zprofile, but the Codex CLI runs in a restricted sandbox where the 
# filesystem is Read-Only and process inspection (ps) is blocked. So check if the pyenv directory is writable before 
# initializing: if it's NOT writable (sandbox), skip this block to prevent error spam in codex. This is better than not
# running this in all non-interactive shells which may have other side effects
if [ -w "$HOME/.pyenv/shims" ]; then
    # 1. Initialize pyenv
    eval "$(pyenv init --path)"
fi
