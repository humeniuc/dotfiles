
_message()
{
    [ -n "$1" ] && {
        echo "$1" 
        command -v /bin/notify-send >/dev/null && notify-send -- "$1"
    }
}

_error_message() 
{
    [ -n "$1" ] && {
        echo "$1" >&2
        command -v /bin/notify-send >/dev/null && notify-send -- "$1"
    }
}

_exit()
{
    [ -n "$1" ] && _error_message "$1"
    exit 1
}


build_script()
{
    exe_path="${1}"
    exe_filename="${2}"

    echo "#!/bin/bash"
    echo "" 
    printf "cd %q && WINEPREFIX=%q wine start %q" "${exe_path}" "${WINEPREFIX}" "${exe_filename}" 
}


autodetect_path()
{
    find -type f \( -name 'Launch*.lnk' -o -name '*.exe' \) | fzf --prompt "Alege un fișer"
}

main()
{   
    # WINEPREFIX env var trebuie să fie setat
    [ ! -v "WINEPREFIX" ] && _exit "WINEPREFIX is not set"

    # path ca parameter sau autodetecție + selecție fzf
    path="${1}"
    [ -z "${path}" ] && path="$(autodetect_path)"
    [ -z "${path}" ] && _exit "path not set"

    # calea absolută către executabil
    path="$(readlink -f "${path}" )"

    # directorul executabilului wine
    exe_path="$( dirname "${path}" )"

    # filename-ul executabilului wine
    exe_filename="$( basename "${path}" )"

    # filename-ul link-ului
    slug="wine-$( echo "${exe_filename}" | iconv -t ascii//TRANSLIT | sed -r "s/[^a-zA-Z0-9]+/-/g" | sed -r "s/^-+\|-+$//g" | tr "A-Z" "a-z" )"
    target_dir="${HOME}/.local/bin/wine"
    target_exe="${target_dir}/${slug}"

    [ -f "${target_exe}" ] && _exit "${target_exe} link exists" 

    script_body="$( build_script "${exe_path}" "${exe_filename}" )"

    # prompt generate
    echo "${target_exe}"
    echo "${script_body}"
    read -p "Generez ${target_exe} ? (y/N)" -n 1 -r generate
    [ "${generate}" != "y" ] && _exit "Aborted"

    mkdir -p "${target_dir}";
    echo "${script_body}" > "${target_exe}" 
    chmod u+x "${target_exe}"

    _message "${target_exe} created"
}

main "$@"

