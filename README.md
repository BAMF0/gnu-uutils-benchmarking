# GNU Coreutils/uutils coreutils evaluation
This repository collects results from benchmarking runs on the [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html) and the [uutils coreutils](https://github.com/uutils/coreutils).
## Evaluation
All utilities are compared using the [`hyperfine`](https://github.com/sharkdp/hyperfine) benchmarking tool. Typically, benchmarks take the form:

```shell
hyperfine '<GNU cmd> <input> [arg(s)]' '<uutil cmd> <input> [arg(s)]' -N --warmup 3
```

## Reference Files
* `oneline_4G.txt`: A one line file consisting of only zeroes (4GB).
```shell
dd if=/dev/zero bs=1M count=4096 status=progress | tr '\0' 'A' |
head -c 4294967295 > oneline_4G.txt && echo >> oneline_4G.txt
```
* `truncated_4G_file`: A truncated file (4GB).
```shell
truncate -s 4G truncated_4G_file
```

