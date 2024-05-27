#!/bin/bash

var=1
var_list=(1 2 3 4)

echo "var_list: ${var_list}"
echo "index 2: ${var_list[2]}"
echo "var_list*: ${var_list[*]}"

var=$[var + 1]
echo "new var: ${var}"

if NoCmd; then
    echo ""
elif ls; then
    echo "ls "
else
    echo "NoCmd no run"
fi

# 数值比较
echo "========= 数值比较 ============="
if [ 1 -eq 1 ]; then
    echo "1 -eq 1"
fi
if [ 1 -ge 1 ]; then
    echo "1 >= 1 -ge"
fi
if [ 2 -gt 1 ]; then
    echo "2 > 1 -gt"
fi
if [ 1 -lt 2 ]; then
    echo "1 < 2 -lt"
fi
if [ 1 -ne 2 ]; then
    echo "1 != 2 -ne"
fi

echo "======== 字符串比较 ============="
s="asd"
if [ -n ${s} ]; then
    echo "s: ${s}"
    s=""
fi
if [ -z ${s} ]; then
    echo "s is empty"
fi

echo "======= 文件比较 ================="
if [ -d test_dir ]; then
    echo "test_dir is dir"
fi
if [ -f test_dir/test_file ]; then
    echo "test_dir/test_file is file"
fi

if [ ! -e test ]; then
    echo "test file/dir is not exist"
fi
echo "-r 可读"
echo "-s 存在且非空"
echo "-w 可写"
echo "-x 可执行"
echo "..."

if [ -d test_dir ] && [ -f test_dir/test_file ]; then
    echo "&&"
fi

echo "----- if 中的 () ------ "
if (cat test_dir/test_file); then
    echo "cat test_dir/test_file"
fi

echo "========= (()) 数值计算与逻辑判断 ========="
i=0
if (( i++ == 0 )); then
    echo "((i++) ((++i))"
    echo "i++ == 1"
fi

((++i))
echo ${i}

if [[ ${i} == 2 ]]; then
    echo "[[ \${i} == 2 ]]"
fi

echo "===== case ====="

case ${var} in
    1 | 2)
        echo "1";;
    *)
        echo "*) case"
esac

