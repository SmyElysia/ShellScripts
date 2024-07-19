# 文件操作脚本使用文档

## 介绍

这个脚本包含了以下几种文件操作功能：

1. 文件备份
2. 文件压缩
3. 文件查找
4. 文件比较
5. 文件权限设置

## 使用说明

### 1. 文件备份

**功能**: 将指定文件备份到指定目录，并以当前日期和时间作为备份文件名的一部分。

**用法**:

```
./file_operation.sh backup <文件路径> <备份目录>
```

**参数**:

- `<文件路径>`: 要备份的文件的路径。
- `<备份目录>`: 备份文件存储的目录。

**示例**:

```
./file_operation.sh backup /path/to/file /path/to/backup/dir
```

### 2. 文件压缩

**功能**: 将指定目录压缩成一个 `.tar.gz` 格式的文件。

**用法**:

```
./file_operation.sh compress <目录路径> <输出文件>
```

**参数**:

- `<目录路径>`: 要压缩的目录路径。
- `<输出文件>`: 压缩后的文件名（包括路径和 `.tar.gz` 扩展名）。

**示例**:

```
./file_operation.sh compress /path/to/directory /path/to/output.tar.gz
```

### 3. 文件查找

**功能**: 查找指定目录下包含特定关键字的文件，并列出这些文件。

**用法**:

```
./file_operation.sh find <目录路径> <关键字>
```

**参数**:

- `<目录路径>`: 要搜索的目录路径。
- `<关键字>`: 要查找的关键字。

**示例**:

```
./file_operation.sh find /path/to/directory keyword
```

### 4. 文件比较

**功能**: 比较两个文件的内容是否相同。

**用法**:

```
./file_operation.sh compare <文件1路径> <文件2路径>
```

**参数**:

- `<文件1路径>`: 第一个文件的路径。
- `<文件2路径>`: 第二个文件的路径。

**示例**:

```
./file_operation.sh compare /path/to/file1 /path/to/file2
```

### 5. 文件权限设置

**功能**: 设置指定文件的权限。

**用法**:

```
./file_operation.sh set_permission <文件路径> <权限设置>
```

**参数**:

- `<文件路径>`: 要设置权限的文件路径。
- `<权限设置>`: 权限设置（例如 `755` 或 `644`）。

**示例**:

```
./file_operation.sh set_permission /path/to/file 755
```

## 错误处理

脚本包含基本的异常处理功能。当输入的操作无效时，脚本会输出错误信息。

**示例**:

```
./file_operation.sh invalid_action
```

输出:

```
Error: Invalid action: invalid_action
```

## 注意事项

- 确保脚本具有执行权限。可以使用 `chmod +x file_operation.sh` 命令为脚本添加执行权限。
- 备份目录和输出文件目录应具有写权限。