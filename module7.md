#System Software


&lt;hr/&gt;



| **Content** | **System Software** Introduction to Operating Systems, Need of operating systems, Functions of Operating System, Types of operating system, Free/Open Source Operating Systems (GNU Linux, OpenSolaris?, OpenBSD, Microsoft Windows, Android,Symbian)  |
|:------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Team**    | Siji Sunny, Mayank Joshi                                                                                                                                                                                                                               |
| **Discussion Page** | http://groups.google.com/group/cbse065/browse_thread/thread/e1e66933022ada97                                                                                                                                                                           |
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module7.wiki&format=side&r=-1                                                                                                                                                                 |



&lt;hr/&gt;




# System software #

System software provides services to other softwares and users to make efficient use of computer hardware. This module will cover Operating systems.

## Topics ##

  * Introduction to Operating Systems
  * Need of Operating System
  * Functions of Operating System
  * Types of Operating System
  * Free/Open Source Operating Systems
    1. Unix
      * GNU Linux
      * OpenSolaris (This is provided by Sun Microsystems)
      * BSD (OpenBSD, FreeBSD, many other variants)
    1. Microsoft Windows
    1. MS-DOS (now obsolete)
    1. Android
    1. Symbian

## Introduction to Operating System ##

We all have been using computers in some form or the other in our day to day life in this 21st century. Be it a desktop computer, server, PDA or a cellphone, computers have become an integral part of our day to day life. All these electronic gadgets are not that useful if we were to only receive the hardware. What makes them useful for us is **something** which manages the hardware components of these electronic gadgets. This **something** is what is known as an Operating System.

As a user of a cellphone we don't concern ourselves with how the cellphone is starting off or how the display panel gets the information displayed. What we are concerned about is making a phone call or sending an SMS. Operating system is a piece of code which shields the users from nitty gritty details of underlying hardware components and provides services to users which makes it easier for them to operate the electronic components. Operating systems not only assist the user in making efficient use of the hardware but also provide facilities to users to extend the functionality of the entire system by providing interfaces which can be used to access the hardware components through software developed by programmers.

A computer system comprises of four major components, namely hardware, operating system, application programs, users. These four components can be thought of to be stacked in following fashion:

![http://lh4.ggpht.com/_kpglEYwtRpk/S0v8-7_xlJI/AAAAAAAAN50/6R7r5XojptE/OS_Stack.jpg](http://lh4.ggpht.com/_kpglEYwtRpk/S0v8-7_xlJI/AAAAAAAAN50/6R7r5XojptE/OS_Stack.jpg)

There is no set definition for what an Operating system should comprise of. If we look at different Operating systems available today then we can immediately see that there is a great difference between them. However as an end user the difference we normally see is from point of view of applications that come bundled along with the Operating System. Though at the end of the day these applications are the most used software by end user but these applications won't be our area of concern. What we are concerned with is the software which governs the hardware and provides services to end users and applications for making efficient use of the electronic components associated with a computer system. This software is the Operating system (also known as **kernel** of operating system) and keeping in view this aspect of an Operating system we can immediately identify few key elements that can be associated with an Operating system.

  * _a technical layer of software_ for driving the hardware of computer system, like disk drives, keyboard, screen etc.
  * _a filesystem_ which provides a way of organizing files logically
  * _a simple command language_ which enables users to run their own programs and manipulate their files in a simple way.
  * As an operating system is in charge of computer hardware, all requests to use its resources and devices need to go through the operating system. Thus an operating system should provide _legal entry points_ into its code for performing basic operations like writing to devices etc.



