require "./settings"

# オブジェクトの取得
object = $s3.bucket($bucket).object("jpg/20180407214211_polidog.jpg")

# pre-signed urlの取得してURIオブジェクトにする
# :expires_inで、有効期間(sec)を指定。デフォルト900sec。MAX 1week(604800sec)
pre_signed_url = URI.parse(object.presigned_url(:get, expires_in: 30))

puts pre_signed_url
