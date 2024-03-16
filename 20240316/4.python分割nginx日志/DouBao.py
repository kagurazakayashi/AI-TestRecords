# 以下是一个使用 Python 实现的脚本，可以根据传入的 Nginx 日志文件路径，根据每条日志的时间日期创建子文件夹，并将“分钟.log”作为文件名保存在里面：

import os
import datetime

def process_log_file(log_file_path):
    # 打开日志文件并读取每一行
    with open(log_file_path, 'r') as f:
        for line in f.readlines():
            # 提取每行日志中的时间日期
            date_time = line.split(' ')[0]

            # 将时间日期解析为 datetime 对象
            dt = datetime.datetime.strptime(date_time, '%Y/%m/%d %H:%M:%S')

            # 获取年、月、日、小时和分钟
            year = dt.year
            month = dt.month
            day = dt.day
            hour = dt.hour
            minute = dt.minute

            # 创建文件夹路径
            folder_path = f'{year}/{month}/{day}/{hour}'

            # 创建文件夹，如果不存在
            if not os.path.exists(folder_path):
                os.makedirs(folder_path)

            # 保存文件，文件名格式为“分钟.log”
            file_path = f'{folder_path}/{minute}.log'
            with open(file_path, 'a') as g:
                g.write(line)

# 示例用法
log_file_path = 'test.log' # 'your_log_file_path' <- AI生成的内容没有按要求从参数输入文件名，手动修正
process_log_file(log_file_path)

# 在上述代码中，我们定义了一个名为process_log_file的函数，它接受一个日志文件路径作为参数。在函数内部，我们使用open函数打开日志文件，并逐行读取其中的内容。对于每一行，我们提取出时间日期部分，并将其解析为datetime对象。然后，我们根据时间日期的年、月、日、小时和分钟，创建文件夹路径。如果文件夹不存在，我们使用os.makedirs函数创建它。最后，我们将当前行的内容保存到以分钟为文件名的文件中。
# 你可以将log_file_path替换为实际的 Nginx 日志文件路径，并运行代码来处理日志文件。脚本会根据日志中的时间日期创建子文件夹，并将每一行内容保存到相应的文件中。
# 请注意，这只是一个简单的示例代码，可能需要根据你的实际需求进行一些调整和优化。例如，你可能需要处理文件创建和写入时的错误情况，或者根据具体的日志格式进行适当的修改。希望这个示例对你有所帮助！如果还有其他问题，请随时提问。
