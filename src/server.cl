include node-core
express = require 'express'
fs = require 'fs'
path = require 'path'
app = express ()

do
    req res <- IO (app.get '/')
    res.sendFile (path.join (__dirname ++ '/index.html'))

do
    req res <- IO (app.get '/tasks.json')
    res.sendFile (path.join (__dirname ++ '/tasks.json'))

app.listen 8000
