# GNU Coreutils/uutils coreutils evaluation
This repository collects results from benchmarking runs on the [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html) and the [uutils coreutils](https://github.com/uutils/coreutils).

Tested on GNU coreutils version `9.5-1ubuntu2+0.0.0~ubuntu20` and uutils/coreutils `0.1.0`.
## Evaluation
All utilities are compared using the [`hyperfine`](https://github.com/sharkdp/hyperfine) benchmarking tool. Typically, benchmarks take the form:

```shell
hyperfine '<GNU cmd> <input> [arg(s)]' '<uutil cmd> <input> [arg(s)]' -N --warmup 3
```

## Overview and Results
Benchmarks are sorted after function into directories:
#### **[`format_file_content/`](format_file_content/)**
  *  [fmt](format_file_content/fmt)
  *  [fold](format_file_content/fold)
#### **[`numeric_operations/`](numeric_operations/)**
  * [factor](numeric_operations/factor)
  * [numfmt](numeric_operations/numfmt)
  * [seq](numeric_operations/seq)
#### **[`operate_characters/`](operate_characters/)**
  * [expand](operate_characters/expand_NO_FINISH)
  * [unexpand](operate_characters/unexpand_NO_FINISH)
#### **[`operate_sorted_files/`](operate_sorted_files/)**
  * [comm](operate_sorted_files/comm)
  * [ptx](operate_sorted_files/ptx_GNU_EXT_NOT_IMPLEMENTED)
  * [shuf](operate_sorted_files/shuf)
  * [sort](operate_sorted_files/sort_NO_FINISH)
  * [uniq](operate_sorted_files/uniq)
#### **[`output_entire_files/`](output_entire_files/)**
  * [base32](operate_entire_files/base32)
  * [base64](operate_entire_files/base64)
  * [cat](operate_entire_files/cat)
  * [nl](operate_entire_files/nl)
  * [od](operate_entire_files/od)
  * [tac](operate_entire_files/tac)
#### **[`output_part_files/`](output_part_files/)**
  * [head](operate_part_files/head)
  * [split](operate_part_files/split)
  * [tail](operate_part_files/tail)
#### **[`summarize_files/`](summarize_files/)**
  * [b2sum](summarize_files/b2sum)
  * [cksum](summarize_files/cksum)
  * [md5sum](summarize_files/md5sum)
  * [sha1sum](summarize_files/sha1sum)
  * [sha224sum](summarize_files/sha224sum)
  * [sha256sum](summarize_files/sha256sum)
  * [sha384sum](summarize_files/sha384sum)
  * [sha512sum](summarize_files/sha512sum)
  * [sum](summarize_files/sum)
  * [wc](summarize_files/wc)

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
