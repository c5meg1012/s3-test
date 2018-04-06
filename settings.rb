require "bundler/setup"

require "dotenv/load"
require "aws-sdk"

credentials = Aws::Credentials.new(
    ENV["AWS_ACCESS_KEY_ID"],
    ENV["AWS_SECRET_ACCESS_KEY"],
    nil
)

$bucket = "meru-test-s3"

$s3 = Aws::S3::Resource.new(
    credentials: credentials,
    region: "ap-northeast-1"
)

# バケットがなかったら作成する
$s3.create_bucket(bucket: $bucket) unless $s3.bucket($bucket).exists?
