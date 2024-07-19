#!/bin/bash
# 清理30天前的日志文件的脚本

# 定义日志目录
LOG_DIR=/root/trap/logs

# 计算30天前的日期
THIRTY_DAYS_AGO=$(date -d "30 days ago" '+%Y-%m-%d')

# 查找并删除30天前的日志文件
find ${LOG_DIR} -type f -name "ant_*.log" -mtime +30 -exec rm -f {} \;

echo "清理了超过30天的日志,包括${THIRTY_DAYS_AGO}之前的日志。 "
