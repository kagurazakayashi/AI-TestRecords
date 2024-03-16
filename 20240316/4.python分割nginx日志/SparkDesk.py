import os
import sys
from datetime import datetime

def create_log_folder(log_file_path):
    with open(log_file_path, 'r') as log_file:
        for line in log_file:
            timestamp = line.split(' ')[0]
            date_time = datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S')
            folder_path = os.path.join(date_time.strftime('%Y'), date_time.strftime('%m'), date_time.strftime('%d'), date_time.strftime('%H'))
            file_name = f"{date_time.strftime('%M')}.log"
            file_path = os.path.join(folder_path, file_name)

            if not os.path.exists(folder_path):
                os.makedirs(folder_path)

            with open(file_path, 'a') as log_file:
                log_file.write(line)

if __name__ == "__main__":
    log_file_path = sys.argv[1]
    create_log_folder(log_file_path)

# 将上述代码保存为一个 Python 脚本（例如：create_log_folder.py），然后在命令行中运行该脚本，传入 nginx 日志文件路径作为参数，例如：
# python create_log_folder.py /path/to/your/nginx/access.log
