---
layout: post
title: "JavaScript : A way to find out the relative path of current js file to it's parent html"
---

##{{ page.title }}
==============

```js
//get explorer
(function(){
  var explorer = window.navigator.userAgent;
  if(explorer.indexOf('MSIE') >= 0){
    window.explorer = 'IE';
  }
  else if(explorer.indexOf('Firefox') >= 0){
    window.explorer = 'Firefox';
  }
  else if(explorer.indexOf('Chrome') >= 0){
    window.explorer = 'Chrome';
  }
  else if(explorer.indexOf('Opera') >= 0){
    window.explorer = 'Opera';
  }
  else if(explorer.indexOf('Safari') >= 0){
    window.explorer = 'Safari';
  }
})();

function getCurrentJSPath() {
  if(window.explorer == 'Chrome' || window.explorer == 'Firefox')
    return /(?:http|https|file):(\/+)(.*?\/.+?.js)/.exec(document.currentScript.src)[2];
  else {
    var a={}, stack;
    try{
      a.b();
    }catch(e){
      stack = e.stack || e.sourceURL || e.stacktrace;
    }
    return /(?:http|https|file):(\/+)(.*?\/.+?.js)/.exec(stack)[2];
  }
}

function getRelativePath(srcPath, desPath) {
  var difPos = 0;
  var slashNum = 0;
  var desSubStr;
  for(var i in srcPath) {
    if(srcPath[i] != desPath[i] && desSubStr == null) {
      difPos = i;
      desSubStr = desPath.substr(i, desPath.length);
    }
    if(srcPath[i] == '/' && desSubStr != null) {
      slashNum++;
    }
  }
  var relativePath = '';
  for(var i=0; i<slashNum; i++) {
    relativePath += "../";
  }
  relativePath += desSubStr;
  return relativePath;
}

var href = /(?:http|https|file):(\/+)(.+)/.exec(window.location.href)[2];
var current = getCurrentJSPath();
var relative = getRelativePath(href, current);
```

