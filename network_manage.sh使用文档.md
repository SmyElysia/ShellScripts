# 网络管理脚本使用文档

## 介绍

这个脚本提供了以下网络管理功能：

1. 查看网络连接
2. 检查网络连通性
3. 查看网络流量
4. 防火墙管理

## 使用说明

### 1. 查看网络连接

**功能**: 显示当前的网络连接。

**用法**:

```
./network_management.sh view_connections
```

**示例**:

```
./network_management.sh view_connections
```

### 2. 检查网络连通性

**功能**: 检查到指定主机和端口的网络连通性。

**用法**:

```
./network_management.sh check_connectivity <主机> <端口>
```

**参数**:

- `<主机>`: 要检查连通性的主机地址（例如 `example.com` 或 IP 地址）。
- `<端口>`: 要检查的端口号。

**示例**:

```
./network_management.sh check_connectivity example.com 80
```

### 3. 查看网络流量

**功能**: 显示当前网络接口的流量信息。

**用法**:

```
./network_management.sh view_traffic
```

**示例**:

```
./network_management.sh view_traffic
```

### 4. 防火墙管理

**功能**: 管理防火墙规则，包括查看、添加和删除规则。

**用法**:

```
./network_management.sh manage_firewall <操作> [端口]
```

**参数**:

- `<操作>`: 操作类型，可选值包括 `view_rules`、`add_rule` 和 `delete_rule`。
- `[端口]`: 仅在 `add_rule` 和 `delete_rule` 操作中需要，指定要管理的端口号。

**示例**:

- 查看防火墙规则:

  ```
  ./network_management.sh manage_firewall view_rules
  ```

- 添加防火墙规则:

  ```
  ./network_management.sh manage_firewall add_rule 80
  ```

- 删除防火墙规则:

  ```
  ./network_management.sh manage_firewall delete_rule 80
  ```

## 错误处理

脚本包含基本的异常处理功能，当输入的操作无效时，脚本会输出错误信息。

**示例**:

```
./network_management.sh invalid_action
```

输出:

```
Error: Invalid action: invalid_action
```

## 注意事项

- 确保脚本具有执行权限。可以使用 `chmod +x network_management.sh` 命令为脚本添加执行权限。
- 管理防火墙规则需要超级用户权限，请以 `root` 用户或使用 `sudo` 运行脚本。