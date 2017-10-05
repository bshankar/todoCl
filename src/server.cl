include node-core
express = require 'express'
bodyParser = require 'body-parser'
fs = require 'fs'
path = require 'path'
app = express ()
app.use (bodyParser ())
app.use '/' (express.static __dirname)
    
do
    req res <- IO (app.get '/')
    res.sendFile (path.join (__dirname ++ '/index.html'))

do
    req res <- IO (app.put '/tasks.json')
    let body = JSON.stringify (req.body)
    err <- IO (fs.writeFile './tasks.json' body)
    maybeErr err (putLine err)
    res.send 'ok'
    
app.listen 8000
