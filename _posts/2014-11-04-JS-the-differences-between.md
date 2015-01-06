---
layout: post
title: "JavaScript : The differences between ..."
---

#{{ page.title }}
<br>
===============

{% highlight js %}
var F = function(){this.property = 3389;var field = 8080;this.get=function(){return field};};
{% endhighlight %}
define a class(function object) F with a property and a closure field.
----
{% highlight js %}
var P = {myProperty:314159};
{% endhighlight %}
define a object P.
----
{% highlight js %}
F.prototype = P;
{% endhighlight %}
set P as a prototype of F.
----
{% highlight js %}
var a = new F();
{% endhighlight %}
assign a object of F to variable a. a get the property, the get function and the myProperty by prototype chain. When we execute a.myProperty = 314, P.myProperty will no change. a can also get property property from F.
----
{% highlight js %}
var b = Object.create(F.prototype);
{% endhighlight %}
create a object with a prototype F.prototype i.e. P. When execute b.myProperty, we got 314159, and when we change P.myProperty = 314, b.myProperty changes too. However, when we assign b.myProperty = 666, the P.myProperty is still 314159, because this action create a new property in b and override the old property inherits from P. Moreover, b does not inherit property property from F.
----
{% highlight js %}
var c = {};c.prototype = Object.create(F.prototype);
{% endhighlight %}
create a object c and assign a new object like b to a property prototype. When it is a object, you cannot get it's prototype by using dot, when you use the object.prototype, you create a normal property named prototype. So, you can't change the prototype of a object, it is unchangeable when the object create. In this case, the object c cannot inherit the myProperty property from P.
----
{% highlight js %}
var d = Object.create(F);
{% endhighlight %}
create a very wird object with a prototype property reference to F.prototype. So far, i cannot find a application case for the syntex.
----
{% highlight js %}
var E = function(){};E.prototype = Object.create(F.prototype);
{% endhighlight %}
create a empty class(function object) with the prototype P. It means when P.myproperty changes, the D.prototype.myproperty changes, and the opposite will also be true. This syntax is used to class inheritance, you can add some logic in the braces to do more features include closure in subclass E. It's same as b, when E.prototype.myProperty changes, the origional myProperty in P and F.prototype will not change.

-----
###Wrapup:
{% highlight js %}
var b = Object.create(object a)
{% endhighlight %}
create a new object b inherit all the properties and prototype properties of a. These inherited properties can just be read, when assign the value to them by use b.property, it create a new property directly under object b, the origin property in a does not change.
{% highlight js %}
var b = Object.create(Function A.prototype)
{% endhighlight %}
create a new object b only inherit the A.prototype object but not inherit the property and method in A.
{% highlight js %}
var B = function(){};B.prototype = Object.create(Function A.prototype)
{% endhighlight %}
create a new class B inherit class A with only the properties and methods defined in A.prototype.
{% highlight js %}
var B = function(){};B.prototype = Object.create(new A())
{% endhighlight %}
create a new class B inherit class A with all properties and methods.
