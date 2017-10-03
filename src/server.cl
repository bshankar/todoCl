include node-core
http = require 'http'
url = require 'url'
fs = require 'fs'
path = require 'path'

server = do
    req res <- IO (http.createServer ())
    print req.url
    res.end 'hello world'
    
server.listen 8000
