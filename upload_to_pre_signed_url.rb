require "./settings"

require "net/http"

# ファイル
file_path = "./images/polidog.jpg"

# 拡張子
file_extname = File.extname(file_path).delete!(".")

# ファイル名
file_name = File.basename(file_path)

# タイムスタンプ
timestamp = DateTime.now.strftime('%Y%m%d%H%M%S')

# アップロード先
object = $s3.bucket($bucket).object("#{file_extname}/#{timestamp}_#{file_name}")

# pre-signed urlを取得
presigned = object.presigned_post(server_side_encryption: "AES256")

# アップロード
cmd = "curl -v -X POST"
presigned.fields.each do |k, v|
  cmd << " -F \"#{k}=#{v}\""
end
cmd << " -F file=@#{file_path}"
cmd << " "
cmd << presigned.url

puts cmd
puts `#{cmd}`
