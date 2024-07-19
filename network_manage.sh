#!/bin/bash
# 网络管理脚本
# 1. 查看网络连接
view_network_connections() {
    echo "Network connections:"
    netstat -tuln
}
 
# 2. 检查网络连通性
check_network_connectivity() {
    local host="$1"
    local port="$2"
    echo "Checking connectivity to $host:$port ..."
    if nc -zv "$host" "$port" >/dev/null 2>&1; then
        echo "Connection to $host:$port successful."
    else
        echo "Connection to $host:$port failed."
    fi
}
 
# 3. 查看网络流量
view_network_traffic() {
    echo "Network traffic:"
    ifconfig
}
 
# 4. 防火墙管理
manage_firewall() {
    local action="$1"
    case $action in
        view_rules) iptables -L ;;
        add_rule) iptables -A INPUT -p tcp --dport "$2" -j ACCEPT ;;
        delete_rule) iptables -D INPUT -p tcp --dport "$2" -j ACCEPT ;;
        *) echo "Invalid action: $action" ;;
    esac
}
 
# 5. 异常处理
handle_error() {
    local error_message="$1"
    echo "Error: $error_message"
}
 
# 主函数
main() {
    local action="$1"
    case $action in
        view_connections) view_network_connections ;;
        check_connectivity) check_network_connectivity "$2" "$3" ;;
        view_traffic) view_network_traffic ;;
        manage_firewall) manage_firewall "$2" "$3" ;;
        *) handle_error "Invalid action: $action" ;;
    esac
}
 
# 调用主函数，并传入参数
main "$@"