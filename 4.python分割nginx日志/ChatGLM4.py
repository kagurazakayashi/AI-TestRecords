# 首先，我们需要解析日志文件中的日期和时间，然后根据这些信息创建文件夹和文件。以下是一个基本的 Python 脚本，用于实现这个功能：

import os
import re
import sys

def create_folder_and_file(log_file_path):
    # 使用正则表达式解析日志中的日期和时间
    date_time_pattern = re.compile(r'(\d{4}/\d{2}/\d{2} \d{2}:\d{2}:\d{2})')
    
    # 检查传入的日志文件是否存在
    if not os.path.exists(log_file_path):
        print(f"日志文件不存在: {log_file_path}")
        return
    
    # 读取日志文件内容
    with open(log_file_path, 'r') as file:
        lines = file.readlines()
    
    # 遍历每一行日志
    for line in lines:
        # 匹配日期和时间
        match = date_time_pattern.search(line)
        if match:
            date_time_str = match.group(1)
            # 解析年、月、日、小时和分钟
            year, month, day, hour_min = date_time_str.split('/')
            hour, minute = hour_min.split(' ')[1].split(':')[:2]
            
            # 构建文件夹路径
            folder_path = os.path.join(year, month, day, hour)
            
            # 创建文件夹（如果不存在）
            full_folder_path = os.path.join(os.getcwd(), folder_path)
            if not os.path.exists(full_folder_path):
                os.makedirs(full_folder_path)
            
            # 构建文件路径
            file_name = f"{minute}.log"
            full_file_path = os.path.join(full_folder_path, file_name)
            
            # 写入或追加内容到文件
            with open(full_file_path, 'a') as f:
                f.write(line)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("请提供一个日志文件路径")
    else:
        log_file_path = sys.argv[1]
        create_folder_and_file(log_file_path)

# 保存这个脚本为 process_nginx_logs.py，然后在命令行中运行它，传入你的 nginx 日志文件路径作为参数：

# python process_nginx_logs.py /path/to/your/nginx/log/file

# 这个脚本会解析传入的日志文件，根据每条日志的时间创建相应的文件夹和文件，如果文件已经存在，则将新的日志内容追加到文件末尾。
