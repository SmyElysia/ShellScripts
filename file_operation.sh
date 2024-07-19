#!/bin/bash
# 文件操作脚本
# 1. 文件备份
backup_file() {
    local file="$1"
    local backup_dir="$2"
    local backup_file="${backup_dir}/$(basename ${file}).$(date +%Y-%m-%d_%H-%M-%S)"
    cp "$file" "$backup_file"
    echo "File $file backed up to $backup_file"
}
 
# 2. 文件压缩
compress_directory() {
    local dir="$1"
    local output_file="$2"
    tar -czf "$output_file" "$dir"
    echo "Directory $dir compressed to $output_file"
}
 
# 3. 文件查找
find_files() {
    local directory="$1"
    local keyword="$2"
    echo "Files containing '$keyword' in directory $directory:"
    find "$directory" -type f -name "*$keyword*" -exec ls {} \;
}
 
# 4. 文件比较
compare_files() {
    local file1="$1"
    local file2="$2"
    if diff "$file1" "$file2" >/dev/null; then
        echo "Files $file1 and $file2 are identical."
    else
        echo "Files $file1 and $file2 are different."
    fi
}
 
# 5. 文件权限设置
set_file_permission() {
    local file="$1"
    local permission="$2"
    chmod "$permission" "$file"
    echo "Permission of file $file set to $permission"
}
 
# 6. 异常处理
handle_error() {
    local error_message="$1"
    echo "Error: $error_message"
}
 
# 主函数
main() {
    local action="$1"
    case $action in
        backup) backup_file "$2" "$3" ;;
        compress) compress_directory "$2" "$3" ;;
        find) find_files "$2" "$3" ;;
        compare) compare_files "$2" "$3" ;;
        set_permission) set_file_permission "$2" "$3" ;;
        *) handle_error "Invalid action: $action" ;;
    esac
}
 
# 调用主函数，并传入参数
main "$@"