#!/usr/bin/env bash
# Utility for running a coreutils command against a set of inputs,
# benchmarking the GNU version in comparison to the uutils version.

if [ "$#" -lt 2 ]; then
    echo "Wrong number of arguments given. Usage: ./run_benchmark.sh <coreutil cmd with args> [input files]"
fi

command="${1}"
uutil_command="coreutils ${command}"

mkdir "${command}"
echo "[INFO] Generated directory for output: ${command}"

for i in "${@:2}"
do
    # Create a benchmark for each file
    input=$i
    filename="$(basename -- "${input}")"
    log_file="${command}_comparison_${filename}"

    touch "${log_file}"
    hyperfine "${command} ${input}" "${uutil_command} ${input}" -N --warmup 3 >&1 | tee "${log_file}"
    echo "[Generated with run_benchmark.sh]" >> "${log_file}"

    mv "${log_file}" "${command}/"
    echo "[INFO] Moved log to directory: ${command}"
    echo ""
done
