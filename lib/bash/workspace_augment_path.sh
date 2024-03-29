# Obsolete: Use cdinout.
# Add script to `$HOME/.bashrc`.

LAST_WD=""

workspace_augment_path() {

    # microoptimizare pentru acelasi director
    if [ "$PWD" = "$LAST_WD" ]; then return 0; fi;

    # curat caile vechi existente
    export PATH=$(printf "%s" "$PATH" | sed 's/:/\n/g' | sed '/\/.workspace\/bin$/d' | sed '/^$/d' | tr '\n' ':')
    # curat caile vechi existente

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

    if [ ! -z "$PATH_ADDITION" ]; then
        export PATH="$PATH_ADDITION:$PATH"
    fi

    LAST_WD=`pwd`
}

workspace_augment_path_cmd=$'\n''workspace_augment_path'$'\n'
PROMPT_COMMAND="${PROMPT_COMMAND/$workspace_augment_path_cmd/}$workspace_augment_path_cmd"
