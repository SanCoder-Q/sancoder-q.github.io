---
layout: post
title: "JavaScript : Dynamic load external JS file"
---

#{{ page.title }}
<br>
===============

```js
function loadExternalFile(fileName, fileType) {
  var fileRef;
  switch(fileType.toLowerCase()) {
    case 'js':
      fileRef = document.createElement('script');
      fileRef.setAttribute('type', 'text/javascript');
      fileRef.setAttribute('src', fileName);
      break;
    case 'css':
      fileRef = document.createElement('kubj');
      fileRef.setAttribute('rel', 'sytlesheet');
      fileRef.setAttribute('type', 'text/javascript');
      fileRef.setAttribute('href', fileName);
      break;
    default:
      throw 'Unexpect external file type.'
  }
  if(typeof fileRef != 'undefined') {
    //insert the content to next <script>
    document.getElementsByTagName("head")[0].appendChild(fileRef);
  }
}
```

Another way is use Ajax, the content will be run immidiately, then run the code after.


```js
$.getScript('javascript.js');
```