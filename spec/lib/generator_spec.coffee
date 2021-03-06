generator = require '../../lib/generator.coffee'
fs        = require 'fs'
#request = require('request')
#exec    = require('child_process').exec

appName = 'tasty'
mode    = 0755

listFiles = (dir) -> fs.readdirSync(dir).sort()

describe 'lib/generator.coffee', ->
  
  beforeEach -> generator.generate appName
  
  afterEach ->
    # remove files
    files = ['/app/client/app.coffee', '/app/css/app.styl', '/app/css/helpers.styl', '/app/server/app.coffee', '/app/views/app.jade', '/config/db.coffee', '/lib/css/reset.css', '/lib/client/jquery-1.5.min.js', '/public/images/logo.png']
    fs.unlinkSync appName + file, mode for file in files
    # then remove directories, in order of most nested
    directories = ['/app/client', '/app/css', '/app/server', '/app/shared', '/app/views', '/app', '/config', '/lib/client', '/lib/css', '/lib/server', '/lib', '/public/assets', '/public/images', '/public', '/vendor']
    fs.rmdirSync appName + directory, mode for directory in directories
    fs.rmdirSync appName, mode
    
  it 'should generate a new application in the given directory', ->
    expect(listFiles appName).toEqual ['app','config','lib','public','vendor']
    expect(listFiles appName + '/app').toEqual ['client', 'css', 'server', 'shared','views']
    expect(listFiles appName + '/lib').toEqual ['client', 'css', 'server']
    expect(listFiles appName + '/public').toEqual ['assets', 'images']
    # TODO check that other relevant files exist

  # getHomepage = (cb) ->
  #   request {uri:'http://localhost:3000/'}, (error, response, body) -> return cb(body)
          
  it 'should generate an application that will run fine right from the start', ->
    #
    # TODO - figure out a way to run the app, like an integration test
    #
    # pending
    # exec('node ' + appName + '/app.coffee')
    # expect(getHomepage()).toEqual('waa')
    # expect('waa').toEqual('waat')
        
      #return {error: error, response: response, body: body}
      #expect(response.statusCode).toEqual(200)
      #expect(error).toBeNull()
      
      # console.log body if !error && response.statusCode == 200
    # Generate a new application
    # it should run the app
    # it should check that it can visit the homepage and load the application fine.
