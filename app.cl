include node-core
    
express = require 'express'
app = express ()

do
    req res <- IO (app.get '/')
    res.sendFile '/home/ebs/Documents/code/todoCl/views/index.html'

app.listen 3000
