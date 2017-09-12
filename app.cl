include node-core
    
express = require 'express'
app = express ()

app.set 'views' './views'
app.set 'view engine' 'pug'

do
    req res <- IO (app.get '/')
    res.send '/index.html'

app.listen 3000
