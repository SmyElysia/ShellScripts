# 系统管理与维护脚本使用文档

## 介绍

`system_check.sh` 脚本用于执行系统管理与维护任务，包括收集系统信息、日志清理、定时任务检查、服务状态检查、安全性检查和异常处理。

## 使用说明

### 1. 系统信息收集

**功能**: 收集系统的基本信息并记录到 `system_report.log` 文件中，包括操作系统版本、内核版本、CPU 信息、内存信息和磁盘使用情况。

**输出文件**:

- `system_report.log`: 包含系统信息的日志文件。

### 2. 日志清理

**功能**: 清理 `/var/log` 目录下超过 7 天的日志文件。

**操作**: 删除所有修改时间超过 7 天的 `.log` 文件。

### 3. 定时任务检查

**功能**: 将当前用户的定时任务（Cron Jobs）记录到 `system_report.log` 文件中。

**输出文件**:

- `system_report.log`: 包含定时任务信息的日志文件。

### 4. 服务状态检查

**功能**: 检查 `apache` 和 `sshd` 服务的状态，并将结果记录到 `system_report.log` 文件中。

**输出文件**:

- `system_report.log`: 包含服务状态信息的日志文件。

### 5. 安全性检查

**功能**: 检查防火墙配置和 SSH 配置，并将结果记录到 `system_report.log` 文件中。

**输出文件**:

- `system_report.log`: 包含安全性检查信息的日志文件。

### 6. 异常情况处理

**功能**: 检查 `apache2` 服务的状态。如果 `apache2` 服务未运行，则发送邮件通知管理员。

**邮件通知**:

- 邮件主题: `Apache2 Service Alert`
- 收件人: `admin@example.com`
- 邮件内容: `Apache2 service is not running on $(hostname). Please check.`

## 使用示例

1. **执行脚本**:

   ```
   ./system_check.sh
   ```

2. **查看生成的系统报告**:

   ```
   cat system_report.log
   ```

## 注意事项

- 确保脚本具有执行权限。可以使用 `chmod +x system_check.sh` 命令为脚本添加执行权限。
- 脚本中的 `mail` 命令需要邮件服务配置正确，才能成功发送通知。
- 确保 `apache2` 和 `sshd` 服务在系统上运行，并且 `iptables` 和 `sshd` 命令可以正确执行。