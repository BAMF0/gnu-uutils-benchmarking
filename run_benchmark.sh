#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Wrong number of arguments given. Usage: ./run_benchmark.sh <coreutil cmd with args> <input>"
fi

COMMAND="${1}"
INPUT="${2}"
UUTIL_COMMAND="coreutils ${COMMAND}"

hyperfine "${COMMAND} ${INPUT}" "${UUTIL_COMMAND} ${INPUT}" -N --warmup 3
