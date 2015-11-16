

&lt;hr/&gt;



| **Content** | Introduction to Programming – Modular Programming, Object Oriented Programming, Event Driven Programming  |
|:------------|:----------------------------------------------------------------------------------------------------------|
| **Team**    | Siddharth Srivastava, Nilesh Govindarajan (www.itech7.com)                                                |
| **Discussion Page** | http://groups.google.co.in/group/cbse065/browse_thread/thread/a8d73c17b4614a32                            |
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module19.wiki&format=side&r=-1                   |




&lt;hr/&gt;






# Introduction #


**Computer programming** (often shortened to programming or coding) is the process of writing, testing, debugging/troubleshooting, and maintaining the source code of computer programs. This source code is written in a programming language.

A **Programming language** is a standardized communication technique for expressing instruction to a computer. Programming languages enable a programmer to precisely specify what data a computer will act upon, how these data will be stored/transmitted, and precisely what actions to take under various circumstances.
Many programming languages have some form of written specification of their syntax (form) and semantics (meaning). Some languages are defined by a specification document. For example, the C programming language is specified by an ISO Standard. Other languages, such as Perl, have a dominant implementation that is used as a reference.

# Modular Programming #

Modular programming is a software design technique that increases the extent to which software is composed from separate parts, called modules. It is also called Structered Programming.It is a subset of procedural programming that enforces a logical structure on the program being written to make it more efficient and easier to understand and modify. Infact Modular programming is subdividing your program into separate subprograms such as functions and subroutines.
Modular programming can be used to break up a large program into manageable units, or to create code that can be easily re-used.  A modular program consists of a main module and one or more auxiliary modules.  Each module originates from a separate source code file.

## Advantages of Modular Programming ##

1) Distributed Development:  It's main essence is reusability of code. The _Open Source Software_ has proven to be of immense help to this. For example, if your program needs initial and boundary conditions, use subroutines to set them. Then if someone else wants to compute a different solution using your program, only these subroutines need to be changed. This is a lot easier than having to read through a program line by line, trying to figure out what each line is supposed to do and whether it needs to be changed. And in ten years from now, you yourself will probably no longer remember how the program worked.

2) Subprograms make your actual program shorter, hence easier to read and understand. Further, the arguments show exactly what information a subprogram is using.

3) Subprograms make it simpler to figure out how the program operates. If the boundary conditions are implemented using a subroutine, the program can be searched for this subroutine to find all places where the boundary conditions are used.

4) Subprograms reduce the likelyhood of bugs. Because subprograms can use local variables, there is less change that the code in the subroutine interferes with that of the program itself, or with that in other subprograms.

## Modular Programming in Java ##

- Define new class in terms of old ones.

- Keeps classes small.

> It has long been possible to put a bunch of libraries on the Java classpath and run an application. The NetBeans Platform takes the management of libraries further—by actively taking part in the loading of libraries and enforcing that the minimum version of a library that another library uses is adequate.

# Object Oriented Programming #

Object-oriented programming (OOP) is a programming language model organized around "objects" rather than "actions" and data rather than logic.Object-oriented programming takes the view that what we really care about are the objects we want to manipulate rather than the logic required to manipulate them.

## Basic Concepts ##

**Object**

The fundamental idea behind object orientation is to combine both data and functions that operate upon them under a single unit called **object**. Software objects are often used to model the real-world objects that you find in everyday life. Object have characteristics and behavior.
Technically, Programmers developing a system model create object classes to represent each component of a system. Those generic classes are then used to create specific instances of each object for use in the program. Objects may interact with each other through the use of methods.
Examples of objects range from human beings (described by name, address, and so forth) to buildings and floors (whose properties can be described and managed) down to the little widgets on your computer desktop (such as buttons and scroll bars).

**Class**

In OOP, objects are members of classes. It defines the characteristics and behavior of an object.
Example: There may be thousands of other bicycles in existence, all of the same make and model. Each bicycle was built from the same set of blueprints and therefore contains the same components. In object-oriented terms, we say that your bicycle is an instance of the class of objects known as bicycles.

**Inheritence**

The idea of classes leads to the idea of inheritance. Inheritance provides a powerful and natural mechanism for organizing and structuring your software.
In object-oriented programming, inheritance is the concept that when a class of objects is defined, any subclass that is defined can inherit the definitions of one or more general classes. This means for the programmer that an object in a subclass need not carry its own definition of data and methods that are generic to the class (or classes) of which it is a part. This not only speeds up program development; it also ensures an inherent validity to the defined subclass object (what works and is consistent about the class will also work for the subclass).
Example: Class of vehicles is divided into cars, trucks, buses and motorcycles.

**Encapsulation**

Encapsulation conceals the functional details of a class from objects that send messages to it.
In object-oriented programming, information hiding or encapsulation (by way of nesting of types) reduces software development risk by shifting the code's dependency on an uncertain implementation (design decision) onto a well-defined interface. Clients of the interface perform operations purely through it so if the implementation changes, the clients do not have to change.

**Message**

A message in its most general meaning is an object of communication. It is a vessel which provides information.

**Polymorphism**

Subtype polymorphism, almost universally called just polymorphism in the context of object-oriented programming, is the ability of one type, A, to appear as and be used like another type, B.
Polymorphism allows the programmer to treat derived class members just like their parent class' members. More precisely, Polymorphism in object-oriented programming is the ability of objects belonging to different data types to respond to method calls of methods of the same name, each one according to an appropriate type-specific behavior. One method, or an operator such as +, -, or `*`, can be abstractly applied in many different situations.

**Overriding Polymorphism** If a Dog is commanded to speak(), this may elicit a bark(). However, if a Pig is commanded to speak(), this may elicit an oink(). They both inherit speak() from Animal, but their derived class methods override the methods of the parent class; this is Overriding Polymorphism.

**Overloading Polymorphism** Overloading Polymorphism is the use of one method signature, or one operator such as "+", to perform several different functions depending on the implementation. The "+" operator, for example, may be used to perform integer addition, float addition, list concatenation, or string concatenation.

**Parametric Polymorphism** In Parametric Polymorphism, the code is written without mention of any specific type and thus can be used transparently with any number of new types. Pointers are an example of a simple polymorphic routine that can be used with many different types of objects.

**Decoupling**

Decoupling allows for the separation of object interactions from classes and inheritance into distinct layers of abstraction. A common use of decoupling is to polymorphically decouple the encapsulation, which is the practice of using reusable code to prevent discrete code modules from interacting with each other.

## Object orientation and Databases ##

Both object-oriented programming and relational database management systems (RDBMSs) are extremely common in software today[update](update.md). Since relational databases don't store objects directly (though some RDBMSs have object-oriented features to approximate this), there is a general need to bridge the two worlds. There are a number of widely used solutions to this problem. One of the most common is object-relational mapping, as found in libraries like Java Data Objects and Ruby on Rails' ActiveRecord.

There are also object databases which can be used to replace RDBMSs, but these have not been as commercially successful as RDBMSs.

## Did you Know ? ##

  * Simula (1967) is generally accepted as the first language to have the primary features  of an object-oriented language.It was created for making simulation programs, in which what came to be called objects were the most important information representation.

  * Languages called "pure" OO languages, because everything in them is treated consistently as an object, from primitives such as characters and punctuation, all the way up to whole classes, prototypes, blocks, modules, etc. They were designed specifically to facilitate, even enforce, OO methods. Examples: Smalltalk, Eiffel, Ruby, JADE.

  * Languages designed mainly for OO programming, but with some procedural elements. Examples: C++, Java, Python.

# Event Driven Programming #

_Event Driven Programming is for dumb reaction to obvious stimuli_

In computer programming, event-driven programming or event-based programming is a programming paradigm in which the flow of the program is determined by events—i.e., sensor outputs or user actions (mouse clicks, key presses) or messages from other programs or threads.
Example: Games are the biggest example of these kinds of applications. The GUI based programs are all developed using event driven programming.

> But what is an **Event** ?

Events are the actions that are performed by the user during the application usage. If a user clicks a mouse button then the Click event occurs. If a user moves the mouse then the mouse move event occurs. Similarly an application can generate Key down event, Key up event.

## Characteristics of Events in Event Driven Programming ##

  * Events are generally referenced, indexed, or named based on an object (noun) and the type of action that triggered the event. For example, "icon3\_click" or "icon3 - onClick".

  * Events often return a status indicator as to whether the event was successful or not. For example, an "onValidate" event may return True if a form passed validation or False if it did not.Not all events need to return results.

  * Events can often "talk" to a declarative state framework and/or database. For example, in a GUI an event may be able to change the colors or text of an input box not related to the event.

  * Some rules usually need to be set about which event has priority if multiple events are triggered at the same time.

  * Events are often allowed to trigger other events through an API.

## Features of Event Driven Programming ##
  * Event Driven Programming is quite useful when dealing with GUIs, HCI, and other object systems where one expects response to action as the primary activity. It is inappropriate for systems that must do one thing well and finish without intervention (like compilers... this sort of thing implies ProceduralProgramming). It is also inappropriate for systems that must react intelligently based upon total observed context of any sort.

  * Event Driven Programming may or may not be Object Oriented or possess an Object Model.

  * Trivially, a language that supported only Event Driven Programming could perform procedural programming by accepting exactly one event, that being: (main\_event with (args)). Nonetheless, in practice, whether a particular program architecture can really be considered 'Event Driven Programming' doesn't often overlap with architectures that can reasonably be called 'Procedural Programming'... i.e. they do tend to be rather exclusive. This is true even when the programming language happens to be capable of both.

  * It's important to note that not all 'procedural languages' are capable of supporting Event Driven Programming. The ability to receive real events (as opposed to emulated events) is not implied even for a language that is Turing Complete. (Turing Complete only implies ability to perform any computable closed calculation, and says nothing of communication). Event Driven Programming fundamentally requires the ability to detect signals and trigger 'events' upon receiving them - e.g. via interrupts on a CPU, or continuous polling in a forever-loop.

  * Exception handlers **In some programming languages (eg PL/1) ,even though a program itself may not be predominantly event driven, certain abnormal events such as a hardware error, overflow (software) or "program checks" may occur that possibly prevents further processing. Exception handlers, may be provided by "ON statements" in (unseen) callers to provide housekeeping routines to clean up afterward before termination.**


# Programming Languages #

There are more than a hundred programming languages available in the world. It is not possible to cover all of them here. This section highlights some of the important programming languages in use now.

**Client Application Programming Languages -**

> The programming languages used for creating applications used on the client side. For example - Firefox, etc.

  * C
  * C++
  * C# (Pronounced as C sharp)
  * Java
  * Python

**Web Application Programming Languages -**

> The programming languages used for programming applications that interact with users on the web i.e. WWW.

  * PHP: Most popular, Open Source, Recursive acronym for HyperText PreProcessor, Platform (OS) Independent
  * Perl: Platform (OS) Independent
  * Java: Platform (OS) Independent
  * ASP: Works only on Windows
  * ASP.NET: Mostly used with Windows, No evidence of being used on Linux
  * Python: Platform (OS) Independent

**Server Application Programming Languages -**

> The programming languages which are used to write programs for performing different tasks on Linux servers.

  * Bash: Shell Script
  * Perl
  * C