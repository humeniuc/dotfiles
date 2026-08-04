#!/bin/bash

SCRIPT_DIR="$(dirname "$( readlink -f "${BASH_SOURCE[0]}" )")"

REPOSITORIES_PATH="${HOME}/repositories"
WEB_EXT_PATH="${REPOSITORIES_PATH}/web-ext"

_error_message() {
    [ -n "$1" ] && {
        echo "$1" >&2
        command -v /bin/notify-send >/dev/null && notify-send -- "$1"
    }
}

_exit() {
    [ -n "$1" ] && _error_message "$1"
    exit "${2:-1}"
}

_prerequisites()
{
    test -d "${REPOSITORIES_PATH}" || _exit "${REPOSITORIES_PATH} nu există"
    test -d "${HOME}/.local/bin" || _exit "${HOME}/.local/bin nu există"
    test -d "${WEB_EXT_PATH}" && _exit "${WEB_EXT_PATH} există"
    command -v npm >/dev/null || _exit "npm nu este instalat"
}

main()
{   
    _prerequisites

    mkdir "${WEB_EXT_PATH}" || _exit "${WEB_EXT_PATH} nu a putut fi creat"
    cd "${WEB_EXT_PATH}" || _exit "Nu am putut schimba directorul în ${WEB_EXT_PATH}"

    npm install web-ext
    ln -sr ./node_modules/.bin/web-ext "${HOME}/.local/bin/web-ext"

}

main "$@"
