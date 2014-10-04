AWS = require 'aws-sdk'

AWS.config.loadFromPath('config/aws_credentials.json')

# An example to list all buckets...
s3 = new AWS.S3()
s3.listBuckets( (err, data) ->
  for bucket in data.Buckets
    console.log(bucket.Name)
)