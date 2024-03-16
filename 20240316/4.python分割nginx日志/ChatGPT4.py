import os
import sys
from datetime import datetime

def create_directory_structure(base_path, year, month, day, hour):
    """
    根据给定的年月日小时创建目录结构。
    """
    path = os.path.join(base_path, year, month, day, hour)
    if not os.path.exists(path):
        os.makedirs(path)
    return path

def process_log_file(log_file_path):
    """
    处理日志文件，按照时间将日志分配到相应的文件夹和文件中。
    """
    with open(log_file_path, 'r') as file:
        for line in file:
            try:
                # 假设每行日志的开始部分都是日期和时间
                datetime_str = line.split()[0] + ' ' + line.split()[1]
                # 解析日期时间
                log_datetime = datetime.strptime(datetime_str, "%Y/%m/%d %H:%M:%S")
                # 创建目录结构
                dir_path = create_directory_structure('logs', log_datetime.strftime("%Y"), log_datetime.strftime("%m"),
                                                      log_datetime.strftime("%d"), log_datetime.strftime("%H"))
                # 定义日志文件的路径
                log_file_name = f"{log_datetime.strftime('%M')}.log"
                log_file_path = os.path.join(dir_path, log_file_name)
                # 将日志追加到文件
                with open(log_file_path, 'a') as log_file:
                    log_file.write(line)
            except Exception as e:
                print(f"Error processing line: {line}. Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <path_to_log_file>")
        sys.exit(1)
    
    log_file_path = sys.argv[1]
    process_log_file(log_file_path)
