#!/bin/bash

#系统管理与维护脚本

# 1. 系统信息收集
echo "System Information:" >> system_report.log
echo "OS Version: $(uname -a)" >> system_report.log
echo "Kernel Version: $(uname -r)" >> system_report.log
echo "CPU Info: $(cat /proc/cpuinfo)" >> system_report.log
echo "Memory Info: $(free -m)" >> system_report.log
echo "Disk Usage: $(df -h)" >> system_report.log

# 2. 日志清理（假设每周清理一次）
find /var/log -name "*.log" -mtime +7 -exec rm -rf {} \;
 
# 3. 定时任务检查
echo "Cron Jobs:" >> system_report.log
crontab -l >> system_report.log

# 4. 服务状态检查
echo "Service Status:" >> system_report.log
systemctl status apache >> system_report.log
systemctl status sshd >> system_report.log

# 5. 安全性检查
echo "Firewall Configuration:" >> system_report.log
iptables -L >> system_report.log
echo "SSH Configuration:" >> system_report.log
sshd -T >> system_report.log

# 6. 异常情况处理（示例：如果服务apache2状态异常，则发送邮件通知管理员）
if systemctl status apache2 | grep "Active: active (running)" >/dev/null; then
    echo "Apache2 is running normally."
else
    echo "Apache2 is not running. Sending notification to admin..."
    mail -s "Apache2 Service Alert" admin@example.com <<< "Apache2 service is not running on $(hostname). Please check."
fi
 
# 结束
echo "System maintenance report generated."