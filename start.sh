#!/bin/bash
#执行程序位置以及生成的日志文件位置
APP_NAME=Ant-0.0.1-SNAPSHOT.jar
LOG_DIR=/root/trap/logs
LOG_FILE=${LOG_DIR}/ant.log

#使用说明，用来提示输入参数
usage() {
  echo "Usage: sh demo.sh [start|stop|restart|status]"
  exit 1
}

#检查程序是否在运行
is_exist() {
  pid=$(ps -ef | grep $APP_NAME | grep -v grep | awk '{print $2}')
  #如果不存在返回1，存在返回0
  if [ -z "${pid}" ]; then
    return 1
  else
    return 0
  fi
}

#启动方法，添加时间戳
start() {
  is_exist
  if [ $? -eq "0" ]; then
    echo "${APP_NAME} is already running. pid=${pid} ."
  else
    nohup java -jar ${APP_NAME} --server.port=8082 -Xmx512m -Xms512m -Xmn256m >> ${LOG_FILE} 2>&1 &  #分配Jvm以及服务端口号
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ${APP_NAME} started." >> ${LOG_FILE}
  fi
}

#停止方法
stop() {
  is_exist
  if [ $? -eq "0" ]; then
    kill -9 $pid
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ${APP_NAME} stopped." >> ${LOG_FILE}
  else
    echo "${APP_NAME} is not running"
  fi
}

#输出运行状态
status() {
  is_exist
  if [ $? -eq "0" ]; then
    echo "${APP_NAME} is running. Pid is ${pid}"
  else
    echo "${APP_NAME} is not running."
  fi
}
#重启
restart() {
  stop
  start
}

#根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"start")
  start
  ;;
"stop")
  stop
  ;;
"status")
  status
  ;;
"restart")
  restart
  ;;
*)
  usage
  ;;
esac
