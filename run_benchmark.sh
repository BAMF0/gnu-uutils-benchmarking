#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Wrong number of arguments given. Usage: ./run_benchmark.sh <coreutil cmd with args> <input>"
fi

COMMAND="${1}"
INPUT="${2}"
UUTIL_COMMAND="coreutils ${COMMAND}"

FILENAME="$(basename -- "${INPUT}")"
LOG_FILE="${COMMAND}_comparison_${FILENAME}"

touch "${LOG_FILE}"
hyperfine "${COMMAND} ${INPUT}" "${UUTIL_COMMAND} ${INPUT}" -N --warmup 3 >&1 | tee "${LOG_FILE}"
