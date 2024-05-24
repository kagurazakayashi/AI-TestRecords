# 下面是一个简单的Python脚本，它接受一个Nginx日志文件路径作为参数，并根据每条日志中的时间戳创建相应的文件夹结构，并将日志条目写入对应的“分钟.log”文件中。

import os  
import sys  
from datetime import datetime  
  
def create_folder_structure(log_entry_time):  
    # 根据时间创建文件夹路径  
    folder_path = log_entry_time.strftime('%Y/%m/%d/%H')  
    # 如果文件夹不存在，则创建  
    os.makedirs(folder_path, exist_ok=True)  
    return folder_path  
  
def write_to_minute_log(folder_path, log_entry):  
    # 分钟日志文件名  
    minute_log_file = os.path.join(folder_path, '分钟.log')  
    # 以追加模式打开文件并写入日志条目  
    with open(minute_log_file, 'a') as f:  
        f.write(log_entry + '\n')  
  
def process_nginx_log(log_file_path):  
    try:  
        with open(log_file_path, 'r') as log_file:  
            for line in log_file:  
                # 假设日志时间戳位于每行的开始，格式为 "2023/03/16 19:01:30"  
                timestamp_str = line[:19]  # 截取时间戳部分  
                try:  
                    # 将字符串时间戳转换为datetime对象  
                    log_entry_time = datetime.strptime(timestamp_str, '%Y/%m/%d %H:%M:%S')  
                    # 创建文件夹结构  
                    folder_path = create_folder_structure(log_entry_time)  
                    # 写入分钟日志文件  
                    write_to_minute_log(folder_path, line)  
                except ValueError as e:  
                    print(f"无法解析时间戳: {timestamp_str}. 错误: {e}")  
    except FileNotFoundError:  
        print(f"文件未找到: {log_file_path}")  
    except Exception as e:  
        print(f"处理日志文件时发生错误: {e}")  
  
if __name__ == '__main__':  
    # 确保提供了日志文件路径作为参数  
    if len(sys.argv) != 2:  
        print("用法: python script.py <nginx_log_file_path>")  
        sys.exit(1)  
  
    # 获取传入的Nginx日志文件路径  
    nginx_log_file_path = sys.argv[1]  
  
    # 处理Nginx日志文件  
    process_nginx_log(nginx_log_file_path)

# 要使用此脚本，请将其保存为.py文件（例如nginx_log_processor.py），然后在命令行中运行，并提供Nginx日志文件路径作为参数。例如：

# python nginx_log_processor.py /path/to/your/nginx/access.log
    
# 脚本将读取提供的日志文件，为每条日志条目创建相应的文件夹结构，并将日志条目追加到对应的“分钟.log”文件中。如果文件夹或文件已存在，则不会重新创建，而是追加到现有文件中。如果无法解析时间戳或发生其他错误，脚本将打印错误消息。
