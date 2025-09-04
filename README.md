# GNU coreutils/uutils coreutils evaluation

## Reference Files
* `oneline_4G.txt`: A one line file consisting of only zeroes (4GB).
    * Generation:
```shell
dd if=/dev/zero bs=1M count=4096 status=progress | tr '\0' 'A' |
head -c 4294967295 > oneline_4G.txt && echo >> oneline_4G.txt
```
* `truncated_4G_file`: A truncated file (4GB).
    * Generation:
```shell
truncate -s 4G truncated_4G_file
```

