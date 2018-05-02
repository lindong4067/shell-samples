cat -n textfile1 > textfile2  # 将文档1加上行号输出到文档2
cat -b textfile1 textfile2 >> textfile3
cat /dev/null > textfile3 # 清空文档
cat /dev/fd0 > OUTFILE  # 将软盘内容输出到镜像文件
cat IMAGE_FILE > /dev/fd0 # 将image文件写到软盘
