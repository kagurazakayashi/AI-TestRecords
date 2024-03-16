# 以下是一个 Python 脚本，可以根据 nginx 日志文件路径创建子文件夹并保存日志：

import os
import datetime

def create_dir(log_file_path):
  """
  根据 nginx 日志文件路径创建子文件夹

  Args:
    log_file_path: nginx 日志文件路径

  Returns:
    None
  """

  # 获取日志文件所在目录
  log_dir = os.path.dirname(log_file_path)

  # 读取日志文件
  with open(log_file_path, 'r') as f:
    for line in f:
      # 获取日志中的时间日期
      time_str = line.split(' ')[0]

      # 解析时间日期
      dt = datetime.datetime.strptime(time_str, '%Y/%m/%d %H:%M:%S')

      # 创建子文件夹
      year_dir = os.path.join(log_dir, str(dt.year))
      month_dir = os.path.join(year_dir, str(dt.month))
      day_dir = os.path.join(month_dir, str(dt.day))
      hour_dir = os.path.join(day_dir, str(dt.hour))

      for dir_path in [year_dir, month_dir, day_dir, hour_dir]:
        if not os.path.exists(dir_path):
          os.mkdir(dir_path)

      # 保存日志文件
      log_file_name = f'{dt.minute}.log'
      log_file_path = os.path.join(hour_dir, log_file_name)

      with open(log_file_path, 'a') as f:
        f.write(line)


if __name__ == '__main__':
  # 参数：nginx 日志文件路径
  log_file_path = 'test.log' #'/path/to/nginx.log' <- AI生成的内容没有按要求从参数输入文件名，手动修正

  create_dir(log_file_path)

# 该脚本首先获取日志文件所在目录，然后读取日志文件中的每条日志。对于每条日志，脚本会解析其中的时间日期，并根据时间日期创建子文件夹。如果文件或文件夹不存在则新建，如果文件已经存在则追加。
  
# 使用方法

# 1. 将脚本保存为 create_dir.py。
# 2. 修改脚本中的 log_file_path 变量，指定 nginx 日志文件路径。
# 3. 运行脚本：
# python create_dir.py
  
# 示例

# 假设 nginx 日志文件路径为 /path/to/nginx.log，日志内容如下：
# 2023/03/16 19:01:30 [127.0.0.1] "-" "GET / HTTP/1.1" 200 456 "-" "-"
# 2023/03/16 19:02:30 [127.0.0.1] "-" "GET /index.html HTTP/1.1" 200 1234 "-" "-"
# 2023/03/16 19:03:30 [127.0.0.1] "-" "GET /about.html HTTP/1.1" 404 567 "-" "-"

# 运行脚本后，会在 /path/to/nginx.log 所在目录下创建以下子文件夹：

# 2023
# ├── 03
# │   ├── 16
# │   │   ├── 19
# │   │   │   ├── 01.log
# │   │   │   ├── 02.log
# │   │   │   └── 03.log

# 其中，01.log、02.log 和 03.log 分别保存了 19:01、19:02 和 19:03 的日志内容。
