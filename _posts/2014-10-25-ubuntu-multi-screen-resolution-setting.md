---
layout: post
title: "Ubuntu multi-screen resolution setting"
---

#{{ page.title }}
<br>
==============

{% highlight bash %}
>cvt 1920 1080
# 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

>xrandr --newmode  "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

>xrandr --addmode VGA-1 "1920x1080_60.00"

>xrandr --output VGA-1 --mode "1920x1080_60.00"
{% endhighlight %}
{% highlight bash %}
$ sudo gedit /etc/gdm/Init/Default
{% endhighlight %}
(this will ask for your root password type the password and a text editor will appear)in this you will see a text line like this
{% highlight bash %}
PATH=/usr/bin:$PATH
OLD_IFS=$IFS
{% endhighlight %}
just below this paste the step 3 to 5 commands
and then save it.

example :

{% highlight bash %}
#!/bin/sh
# Stolen from the debian kdm setup, aren't I sneaky
# Plus a lot of fun stuff added
# -George

PATH=/usr/bin:$PATH
OLD_IFS=$IFS
xrandr --newmode "1024x768" 70.00 1024 1072 1176 1328 768 771 775 798 -hsync +vsync

xrandr --addmode VGA1 1024x768_60.00

xrandr --output VGA1 --mode 1024x768

if [ -x '/usr/bin/xsplash' ];

then
/usr/bin/xsplash --gdm-session --daemon
{% endhighlight %}
