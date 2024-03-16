# 下面是一个简单的 Python 脚本，它使用 argparse 处理命令行参数，并根据日志文件中的时间戳创建相应的子目录和日志文件：

import argparse
import os
from datetime import datetime

def create_dirs_and_move_logs(log_file_path):
    with open(log_file_path, 'r') as log_file:
        for line in log_file:
            timestamp_str = line.split()[0]  # 获取每行的日志时间戳
            timestamp = datetime.strptime(timestamp_str, '%Y/%m/%d %H:%M:%S')
            
            # 根据时间戳创建子目录
            dir_path = f"{timestamp.year}/{timestamp.month}/{timestamp.day}/{timestamp.hour}"
            os.makedirs(dir_path, exist_ok=True)

            # 创建或追加到分钟.log文件
            minute_log_file = os.path.join(dir_path, f"{timestamp.minute}.log")
            with open(minute_log_file, 'a') as minute_log:
                minute_log.write(line)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process nginx log file.')
    parser.add_argument('log_file', type=str, help='Path to the nginx log file')

    args = parser.parse_args()

    create_dirs_and_move_logs(args.log_file)

# 运行这个脚本时，你需要提供一个 nginx 日志文件的路径作为参数。例如：

# python script.py /path/to/nginx/access.log
    
# 这个脚本将会读取 nginx 日志文件，并按照日志条目的时间戳创建对应的子目录结构，并将每条日志追加到相应的“分钟.log”文件中。如果目录或文件已经存在，os.makedirs() 和 open(file, 'a') 将会确保不会抛出错误而是直接进行追加操作。
