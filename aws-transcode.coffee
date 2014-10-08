AWS = require 'aws-sdk'
md5 = require 'MD5'

CONFIG = require './config/config.json'
Q = require 'q'

AWS.config.loadFromPath('config/aws_credentials.json')


pipeline_hash = (args...) ->
  big_arg = ''
  big_arg += String(arg) for arg in args
  return md5(big_arg)




# Elastic Transcoder
eTrans = new AWS.ElasticTranscoder()

# aSync Chain!
listPipelines = Q.nbind(eTrans.listPipelines, eTrans)
createPipeline = Q.nbind(eTrans.createPipeline, eTrans)
deletePipeline = Q.nbind(eTrans.deletePipeline, eTrans)



listPipelines().then( (data) ->
  for pipeline in data.pipelines:
    if pipeline.name == cur_pipeline
      return pipeline
).then (data) ->
  # here we would use the pipeline to start the job
)


#PsuedoCode:
#findPipelines()
#.then( pipelines) ->
#  See if Right Pipline exists
#.then( pipeline_to_use ) ->
#  create workflow
