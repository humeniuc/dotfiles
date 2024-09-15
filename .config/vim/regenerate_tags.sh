#!/bin/bash
# Regenerate tags for documentation so it is available in vim
find . -type d -name 'doc' | xargs -I{} vim -E -c "helptags {}" -c "q"

