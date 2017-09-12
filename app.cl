include node-core
    
express = require 'express'
app = express ()

do
    req res <- IO (app.get '/')
    res.sendFile '/home/ebs/Documents/code/todoCl/views/index.html'

do
    req resData <- IO (app.get '/data.json')
    resData.sendFile '/home/ebs/Documents/code/todoCl/data.json'

app.listen 3000
