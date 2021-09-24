#!/bin/bash
# Regenerate tags for documentation so it is available in vim
find . -type d -name 'doc' | xargs -n1 -I{} vim -E -c "helptags {}" -c "q"

