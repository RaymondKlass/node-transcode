AWS = require 'aws-sdk'
CONFIG = require './config/config.json'

AWS.config.loadFromPath('config/aws_credentials.json')

# An example to list all buckets...
#s3 = new AWS.S3()
#s3.listBuckets( (err, data) ->
#  for bucket in data.Buckets
#    console.log(bucket.Name)
#)

# Elastic Transcoder
eTrans = new AWS.ElasticTranscoder()

eTrans.listPipelines( (err, data) ->
  console.log(data)
)