require "./settings"

# ファイル
file_path = "./images/polidog.jpg"
file = File.open(file_path)

# 拡張子
file_extname = File.extname(file_path).delete!(".")

# ファイル名
file_name = File.basename(file_path)

# タイムスタンプ
timestamp = DateTime.now.strftime('%Y%m%d%H%M%S')

# アップロード
$s3.bucket($bucket).object("#{file_extname}/#{timestamp}_#{file_name}").put(body: file)
