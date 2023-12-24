#!/bin/bash

RUN_SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
MAIN_SCRIPT_DIR="${RUN_SCRIPT_DIR}/src/q"
PAUSE_ON_END="true";

. "$RUN_SCRIPT_DIR/config.env"

if [ ! -z "$Q_CMD" ]; then
    echo "Using custom Q command"
else
    echo "Using default Q command"
    case "$OSTYPE" in
        msys*)  # Windows (Assumes q.exe has been added to PATH)
            Q_CMD="q"
            ;;
        *)      # Other (ie. Linux)
            if [ ! -z "`command -v rlwrap`" ]; then
                RLWRAP_CMD="rlwrap"
            else
                RLWRAP_CMD=""
            fi

            Q_CMD="$RLWRAP_CMD $QHOME/l[36][24]/q"
            ;;
    esac
fi

# Move user into directory of the q files
cd "${MAIN_SCRIPT_DIR}"

# Starting main.q
echo "Starting main.q . . ."
$Q_CMD "main.q" -fps "${FPS}"

# Return user to previous directory they were in
cd "$OLDPWD"

if [ "$PAUSE_ON_END" = "true" ]; then
    read -p "Press Enter to continue . . . " ans
fi
