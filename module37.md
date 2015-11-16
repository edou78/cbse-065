

&lt;hr/&gt;


| **Content** | Mathematical Functions- MOD(), POWER(), ROUND(), SQRT(), TRUNCATE() |
|:------------|:--------------------------------------------------------------------|
| **Team**    | Aishwarya.M.B, Ramnish.R                                            |
| **Discussion Page** | http://groups.google.com/group/cbse065/browse_thread/thread/2fea7bb7b04b6ada |
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module37.wiki&format=side&r=-1 |


&lt;hr/&gt;





# **Mathematical Functions** #
The mathematical functions are the built in functions which makes the mathematical calculations easy.
The following are the basic mathematical functions:
  * MOD()
  * POWER()
  * ROUND()
  * SQRT()
  * TRUNCATE()

## MOD() ##
  * MOD(A,B)
This functions returns the mod value of A and B provided A and B are integers.
Note : mod(a,b) is also applicable as there is no case sensitivity.


### SYNTAX ###

|select mod(a,b);|
|:---------------|


### DEALING WITH POSITIVE AND NEGATIVE VALUES OF A & B ###
  * ### Case: 1 ###
> > |a -> Positive|
|:------------|
> > |b -> Positive|


> If both the values are positive integers, we get a **positive** integer as output.

  * eg

> ##### mysql> select mod(10,4); #####

> The output is 2.


  * ### Case: 2 ###
> > |a -> Positive|
|:------------|
> > |b -> Negative|


> If a is positive and b is negative, we again get a **positive** integer as output.

  * eg

> ##### mysql> select mod(10,-4); #####

> The output is 2.


  * ### Case: 3 ###
> > |a -> Negative|
|:------------|
> > |b -> Positive|


> If a is negative and b is positive, we get a **negative** integer as output.

  * eg

> ##### mysql> select mod(-10,4); #####

> The output is -2.


  * ### Case: 4 ###
> > |a -> Negative|
|:------------|
> > |b -> Negative|


> If a & b are negative integers, we again get a **negative** integer as output.

  * eg

> ##### mysql> select mod(-10,-4); #####

> The output is -2.


## POWER() ##

  * POWER(A,B)
> > This function returns the value of A^B, provided A and B are integers.
> > Note : power(a,b) is also applicable as there is no case sensitivity.
> > > pow(a,b) is also applicable.

### SYNTAX ###

|select power(a,b);|
|:-----------------|

  * eg


> ##### mysql> select power(3,4); #####

> The output is 81.



## ROUND() ##

This function is used to round the decimal digits.

There are two forms of this function

  * round(a) -  rounds 'a' to the nearest decimal.
  * round(a,b) - rounds 'a' to 'b' decimal places.


### SYNTAX ###

|select round(a)|
|:--------------|

|select round(a,b)|
|:----------------|

  * eg

> ##### mysql> select round(11.123); #####

> The output is 11.


> ##### mysql> select round(11.123,2); #####

> The output is 11.12


## SQRT() ##

  * SQRT(A)
> > This function returns the value of square root of the integer 'A'.
> > Note : sqrt(a) is also applicable as there is no case sensitivity.

### SYNTAX ###

|select sqrt(a);|
|:--------------|

  * eg


> ##### mysql> select sqrt(2); #####

> The output is 1.4142135623731.