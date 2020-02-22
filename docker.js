var express = require('express');
var app = express();
var fs = require('fs');
var url = require('url');

app.get('/pullandtag', function(req, res){
  var query = url.parse(req.url, true).query;
  var source = query.source;
  var tag = query.tag;
  var contents = source + "\n" + tag;
  var file = 'pullandtag/1.req';
  //under /home
  fs.writeFile(file, contents, err => {
      res.writeHead(202, {'Content-Type': 'text/html'});
      res.end(contents);
  });
});

app.get('/images', function(req, res){
  var file = 'images/images.json';
  fs.access(file, (err) => {
    if (err) {
      res.writeHead(500, {'Content-Type': 'text/html'});
      console.log(err);
      res.end("not ready, try again");
      return;
    }

    fs.readFile(file, (err, data) => {
      if (err) {
        res.writeHead(500, {'Content-Type': 'text/html'});
        console.log(err);
        res.end("file read error");
        return;
      }
      res.writeHead(200, {'Content-Type': 'text/json'});
      res.end(data);
    });
  });
});

app.get('/remove', function(req, res){
  var query = url.parse(req.url, true).query;
  var image = query.image;
  var contents = image;
  
  var file = 'remove/1.req';
  fs.writeFile(file, contents, err => {
    res.writeHead(202, {'Content-Type': 'text/html'});
    res.end(contents);
  });
});

app.listen(8080);
