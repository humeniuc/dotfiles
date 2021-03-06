# în $HOME/.bashrc / $HOME/.bashrc_local adaugă:
# source "$HOME/dotfiles/bash/workspace_augment_path.sh"

LAST_WD=""

workspace_augment_path() {

    # microoptimizare pentru acelasi director
    if [ "$PWD" = "$LAST_WD" ]; then return 0; fi;

    # curat caile vechi existente
    PATH=$(echo "$PATH" | sed 's/:/\n/g' | sed '/\/.workspace\/bin$/d' | sed '/^$/d' | tr '\n' ':')

    # incep sa scanez incepand cu directorul curent, in sus cautant .workspace/bin
    PATH_ADDITION=""
    SCANDIR="$PWD"
    until [ "$SCANDIR" = "" ]; do
        RESOLVED_TARGET="$SCANDIR"/".workspace/bin"

        if [ -d "$RESOLVED_TARGET" ]; then
            PATH_ADDITION="$PATH_ADDITION:$RESOLVED_TARGET"
        fi

        SCANDIR="${SCANDIR%/*}"
    done

    PATH="$PATH_ADDITION:$PATH"
    LAST_WD=`pwd`
}

PROMPT_COMMAND_OLD="${PROMPT_COMMAND%; workspace_augment_path}"
if [ -z "$PROMPT_COMMAND_OLD" ]; then
    PROMPT_COMMAND="workspace_augment_path"
else
    PROMPT_COMMAND="$PROMPT_COMMAND_OLD; workspace_augment_path"
fi
