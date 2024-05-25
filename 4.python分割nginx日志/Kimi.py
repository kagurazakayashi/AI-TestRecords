# 以下是一个Python脚本示例，该脚本可以满足你的要求。请确保你有足够的权限来创建文件夹和写入文件，并且已经安装了Python环境。

import os
import sys
import shutil

def create_directory(path):
    if not os.path.exists(path):
        os.makedirs(path)

def process_nginx_logs(log_file_path):
    with open(log_file_path, 'r') as file:
        for line in file:
            timestamp = line.split()[0]  # 假设时间戳是每行的第一个元素
            year, month, day, hour = timestamp.split('/')
            directory_path = os.path.join(year, month, day, hour)
            create_directory(directory_path)
            minute_log_path = os.path.join(directory_path, f"{minute}.log")
            # 假设日志中的分钟数是时间戳后的第二个元素
            minute = line.split()[1].split(':')[0]
            with open(minute_log_path, 'a') as minute_file:
                minute_file.write(line)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <nginx_log_file_path>")
        sys.exit(1)

    log_file_path = sys.argv[1]
    process_nginx_logs(log_file_path)

# 将上述代码保存为`script.py`，然后通过命令行运行，传入nginx日志文件的路径作为参数。例如：

# python script.py /path/to/your/nginx.log

# 这个脚本的工作流程如下：
# 1. 定义了一个`create_directory`函数，用于创建不存在的目录。
# 2. 定义了一个`process_nginx_logs`函数，用于处理日志文件：
#    - 打开日志文件并逐行读取。
#    - 从每行中提取时间戳和分钟数。
#    - 创建对应的目录结构。
#    - 打开或创建`分钟.log`文件，并将日志行追加进去。
# 3. 在`__main__`部分，检查命令行参数，并调用`process_nginx_logs`函数。

# 请注意，这个脚本假设日志文件的每一行都以时间戳开始，并且时间戳后的第二个元素是分钟数。如果日志格式有所不同，你可能需要对脚本进行相应的调整。
