#!/usr/bin/env bash

### direnv
if command -v direnv > /dev/null; then
  direnv hook bash > "$HOME/.local/share/bash-completion/completions/direnv.bash"
fi

### fd
if command -v fd > /dev/null && [ -f /usr/local/src/fd/autocomplete/fd.bash-completion ]; then
  cp /usr/local/src/fd/autocomplete/fd.bash-completion "$HOME/.local/share/bash-completion/completions/fd.bash"
fi

### Google Cloud SDK
if command -v brew >/dev/null; then
  if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
    cat "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" > "$HOME/.local/share/bash-completion/completions/google-cloud-sdk.bash"
  fi
fi

### Googler
if command -v googler > /dev/null; then
  if [ -f /usr/local/src/googler/googler-completion.bash ]; then
    cp /usr/local/src/googler/googler-completion.bash "$HOME/.local/share/bash-completion/completions/googler.bash"
  fi
  if [ -f /usr/local/src/googler/googler_at ]; then
    cp /usr/local/src/googler/googler_at "$HOME/.local/share/bash-completion/completions/googler-at.bash"
  fi
fi

### Hyperfine
if command -v hyperfine > /dev/null && [ -f /usr/local/src/hyperfine/autocomplete/hyperfine.bash-completion ]; then
  cp /usr/local/src/hyperfine/autocomplete/hyperfine.bash-completion "$HOME/.local/share/bash-completion/completions/hyperfine.bash"
fi

### mcfly
export MCFLY_KEY_SCHEME=vim
if command -v mcfly > /dev/null; then
  echo "$(mcfly init bash)" > "$HOME/.local/share/bash-completion/completions/mcfly.bash"
fi

### wp-cli (only bash available)
if command -v wp > /dev/null && [ -f /usr/local/src/wp-cli/wp-completion.bash ]; then
  cp /usr/local/src/wp-cli/wp-completion.bash "$HOME/.local/share/bash-completion/completions/wp.bash"
fi

### zoxide
if command -v zoxide >/dev/null; then
  echo "$(zoxide init bash)" > "$HOME/.local/share/bash-completion/completions/zoxide.bash"
fi