# 好的，以下是一个 Python 脚本示例，它接受一个 Nginx 日志文件的路径作为参数，然后根据日志中的时间戳创建相应的子文件夹，并将日志按分钟保存：

import os
import sys
from datetime import datetime

# 检查命令行参数
if len(sys.argv) != 2:
    print("Usage: python script.py <path_to_nginx_log_file>")
    sys.exit(1)

log_file_path = sys.argv[1]

# 确保提供的路径存在
if not os.path.isfile(log_file_path):
    print(f"Error: File {log_file_path} does not exist.")
    sys.exit(1)

try:
    with open(log_file_path, 'r') as file:
        for line in file:
            # 假设日志的时间戳格式为 '2023/03/16 19:01:30'
            timestamp_str = line.split()[0]
            timestamp = datetime.strptime(timestamp_str, '%Y/%m/%d %H:%M:%S')
            
            # 创建文件夹路径 '年/月/日/小时'
            folder_path = timestamp.strftime('%Y/%m/%d/%H')
            if not os.path.exists(folder_path):
                os.makedirs(folder_path)
            
            # 日志文件名为 '分钟.log'
            log_filename = timestamp.strftime('%M.log')
            log_file_full_path = os.path.join(folder_path, log_filename)
            
            # 如果文件存在则追加，不存在则新建
            with open(log_file_full_path, 'a') as log_file:
                log_file.write(line)

except Exception as e:
    print(f"An error occurred: {e}")
    sys.exit(1)

print("Log processing complete.")

# 使用此脚本时，需要将其保存为 .py 文件，并确保你有 Python 环境。然后，通过命令行运行它，并传入 Nginx 日志文件的路径作为参数。例如：

# python script.py /path/to/nginx/log/file

# 这个脚本会读取日志文件，解析每行日志的时间戳，并根据这些时间戳创建相应的子文件夹和日志文件。如果子文件夹或日志文件不存在，脚本会创建它们；如果已经存在，则会追加内容到日志文件中。请确保在运行脚本之前，你有足够的权限来创建文件夹和文件。如果你遇到任何问题，请随时告诉我！
