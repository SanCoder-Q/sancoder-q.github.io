---
layout: post
title: Compare dmesgs
---

#{{ page.title }}
<br>
=======

{% highlight bash %}
cat dmesg |cut -b 15- >dmesgc
cat dmesg.old |cut -b 15- >dmesgc.0
diff dmesgc dmesgc.0
{% endhighlight %}
