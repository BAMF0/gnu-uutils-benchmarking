# GNU Coreutils/uutils coreutils evaluation
This repository collects results from benchmarking runs on the [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html) and the [uutils coreutils](https://github.com/uutils/coreutils).

Tested on GNU coreutils version `9.5-1ubuntu2+0.0.0~ubuntu20` and uutils/coreutils `0.1.0`.
## Evaluation
All utilities are compared using the [`hyperfine`](https://github.com/sharkdp/hyperfine) benchmarking tool. Typically, benchmarks take the form:

```shell
hyperfine '<GNU cmd> <input> [arg(s)]' '<uutil cmd> <input> [arg(s)]' -N --warmup 3
```

## Overview and Results
Benchmarks are sorted after function into directories. 

**NOTE**: See respective utility for statistical significance in each comparison.

#### **[`format_file_content/`](format_file_content/)**
  *  [fmt](format_file_content/fmt) - (GNU 3.51–3.59x faster)
  *  [fold](format_file_content/fold) - (GNU 2.0–2.08x faster)
  *  [pr](format_file_content/pr_UNSTABLE_LARGE_FILES) - (**uutils unstable**)
#### **[`numeric_operations/`](numeric_operations/)** 
  * [factor](numeric_operations/factor) - (GNU 3.15x faster)
  * [numfmt](numeric_operations/numfmt) - (GNU 3.44x faster)
  * [seq](numeric_operations/seq) - (GNU 1.05x faster)
#### **[`operate_characters/`](operate_characters/)**
  * [expand](operate_characters/expand_NO_FINISH) - (**uutils ran out ouf time**)
  * [unexpand](operate_characters/unexpand_NO_FINISH) - (**uutils ran out of time**)
#### **[`operate_sorted_files/`](operate_sorted_files/)**
  * [comm](operate_sorted_files/comm) - (uutils 1.42–1.50x faster)
  * [ptx](operate_sorted_files/ptx_GNU_EXT_NOT_IMPLEMENTED) - (**GNU extension not implemented for uutils**)
  * [shuf](operate_sorted_files/shuf) - (GNU 1.49–1.53x faster)
  * [sort](operate_sorted_files/sort_NO_FINISH) - (**uutils ran out of time**)
  * [uniq](operate_sorted_files/uniq) - (uutils 1.57–1.65x faster)
#### **[`output_entire_files/`](output_entire_files/)**
  * [base32](output_entire_files/base32) - (GNU 6.94–7.09x faster)
  * [base64](output_entire_files/base64) - (GNU ~7.95x faster) - **Reported**, see [#8574](https://github.com/uutils/coreutils/issues/8574)
  * [cat](output_entire_files/cat) - (uutils 6.26x faster for `truncated_4G_file`, GNU 1.11 times faster for `oneline_4G.txt`)
  * [nl](output_entire_files/nl) - (uutils 1.06–1.08x faster)
  * [od](output_entire_files/od) - (GNU 3.11–3.31x faster)
  * [tac](output_entire_files/tac) - (uutils 4.12–9.72x faster)
#### **[`output_part_files/`](output_part_files/)**
  * [head](output_part_files/head) - (uutils 1.09–2.06x faster)
  * [split](output_part_files/split) - (GNU 1.06–1.17x faster)
  * [tail](output_part_files/tail) - (uutils 1.27–1.36x faster)
#### **[`summarize_files/`](summarize_files/)**
  * [b2sum](summarize_files/b2sum) - (uutils 1.20x faster)
  * [cksum](summarize_files/cksum) - (GNU **17.34–17.75**x faster) - **Reported**, see [#8573](https://github.com/uutils/coreutils/issues/8573)
  * [md5sum](summarize_files/md5sum) - (GNU 1.28–1.29x faster)
  * [sha1sum](summarize_files/sha1sum) - (GNU 1.06–1.07x faster)
  * [sha224sum](summarize_files/sha224sum) – (GNU 2.91–2.96x faster)
  * [sha256sum](summarize_files/sha256sum) - (GNU 2.94-2.96x faster)
  * [sha384sum](summarize_files/sha384sum) - (GNU 1.24–1.27x faster)
  * [sha512sum](summarize_files/sha512sum) - (GNU 1.25–1.28x faster)
  * [sum](summarize_files/sum) - (uutils 2.18–2.19x faster)
  * [wc](summarize_files/wc) - (uutils 1.03x faster)

### Comments
Log directories have the form of `<cmd><_optional_comment>`. Comments include:
* `UNSTABLE_LARGE_FILES`: utility process is killed due to OOM for large files.
* `NO_FINISH`: utility runs for an exceedingly large amount of time, making execution time incomparable.
* `<feature>_NOT_IMPLEMENTED`: benchmark could not be run due to a feature missing in the uutils version.

## Reference Files
* `oneline_4G.txt`: A one line file consisting of only A's (4GB).
```shell
dd if=/dev/zero bs=1M count=4096 status=progress | tr '\0' 'A' |
head -c 4294967295 > oneline_4G.txt && echo >> oneline_4G.txt
```
* `truncated_4G_file`: A truncated file (4GB).
```shell
truncate -s 4G truncated_4G_file
```

## Reference Machine
* **OS**: Ubuntu Questing Quokka (development branch) 25.10
* **Hardware Model**: Lenovo Legion Slim 5 16IRH8
* **Processor**: 13th Gen Intel® Core™ i7-13620H × 16
* **Memory**: DDR5 16.0 GiB @ 5600 MT/s
