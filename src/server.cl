include node-core
express = require 'express'
fs = require 'fs'
path = require 'path'
app = express ()
app.use '/' (express.static __dirname)
    
do
    req res <- IO (app.get '/')
    res.sendFile (path.join (__dirname ++ '/index.html'))

app.listen 8000
