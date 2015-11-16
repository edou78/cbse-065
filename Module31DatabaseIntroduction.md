# Introduction #

Computers are used to store data. From the analysis of data, we obtain information. The way in which data is organised or arranged has evolved historically. This is different from ideas such has puched card, tape, magnetic disk, semiconductor etc. which are more of a hardware technology.

By organisation of data for this module we are looking at a more abstract concept. Let us take an example.

Suppose an application is to be designed for preparing time table and attendance of students and teachers. We are then thinking in terms of subjects, days, holidays, teachers, students, rooms, time etc as logical way of organising data.

Suppose that we want offer this service on web to many schools across India at various schools at various locations. Then we are thinking in terms of states, location, different state boards and the such. We need to think of ways in which we have to organise the data.

Then we have various issues like how to get the data into the application, generating different daily, monthly, yearly reports from the data, ensuring the application is almost always available, taking care of any problems (or bugs as known in Software Industry / or issues as kcommonly referred to as in the rest of the IT industry), request for new features by users or necessitated by change of rules etc.

In this module our focus will be on the logical way data is arranged.

# Some History #

Data storage is not a new concept. We have as old a medium as cave paintings, stone carvings and the such. More recently paper took the role of that. Now we are in the age where it is stored in magnetic/optical/semiconductor media.

In the computer industry historically the organisation consisted of Hierarchical , network databases. Relational databases were developed later. the evolution has not stopped. Today we have vary large amount of data stored on the web by companies like yahoo, google using a more web friendly technology which provides distributed and highly available database.

Today a huge amount of project use a Relational Data Base Management System (RDBMS) a lot for various reasons:

  * Ubiquitous availability in both proprietary and Free/Open source licences
  * A large pool of people trained in this technology
  * Well tested technology in production environments

#sidebar
A note on environments:

Usually a project will had three distinct environments
  * Development
  * User Acceptance Testing (UAT)
  * Production or Live

Generally all the development takes place in the development environment. When the development team feels it is ready for testing, they release it on the UAT for some of the users to test the application functionality.

When the users and the development team are satisfied that the application can be deployed, a planned release of the application is made on the Live or Production environment.

Fast forward to present. One of the simplest organising method is a list where seperate items are appear in its own line. we will call this line a row. For example List of teachers. Now we want to identify the subject which they will be teaching. We then write down the subject to right of their names.

But this sort of writing down will result in duplicate appearances of subject against teacher name. For example if three teachers teach english, the datapoint english will appear three times. One of the main problem that Relational datamodel addresses is this: avoid data duplication.

So we then remodel out data as three distinct lists: Teachers, Subjects and Teacher-Subject.

eg.

|Teachers|
|:-------|
| Code   | Name   |
| 1      | A      |
| 2      | B      |
| 3      | C      |
|4       | D      |

|Subjects|
|:-------|
|Code    |Name    |
|1       |English |
|2       |Science |
|3       |Mathematics|
|4       |IT Practices|
|5       |Social Science|

Note that in the above two tables, the nuber is associated with the names and they are unique. Assuming
Teachers A and C teach English,
Teacher B teaches Mathematics and
Teacher D and C teach Science, The teacher-Subject list would look like

|Teacher-Subject|
|:--------------|
|Tcode          |Scode          |
|1 (A)          |1 (English)    |
|2 (B)          |3 (MAthematics)|
|3 (C)          |1 (English)    |
|3 (C)          |2 (Science)    |
|4 (D)          |2 (Science)    |

The words in () is for illustrative purposes. The actual list would contain the following data where all are numbers and no text.

|Teacher-Subject|
|:--------------|
|Tcode          |Scode          |
|1              |1              |
|2              |3              |
|3              |1              |
|3              |2              |
|4              |2              |

This is known a many to many relationship in the relational model where one teacher can take many subject and one subject can be taught multiple teachers.

In formal language, each of the above list is known as Table or relation. Each horizontal list of values is known as Row/Tuple and Each vertical list is known as Column/Attribute.

Often in the formal text books one would come across the terminology of Relation/Tuple/Attribute and most user manuals use the term Table/Row/Column

Using the above terminology, the serial number and name are the columns in the teachers table.

Now let us suppose we want to store the phone numbers of the teacher. We can readily see that we just need to add one more column to the table teacher.

If a new subject is added to the syllabus, one just need to add one row to the subjects column with a distinct or non duplicate number for the subject.

If a teacher's name changes, say after marriage, one just need to update that particular teacher's name accordingly.

Now that we have got the data into the table, we need to know now who teaches what. The steps are:

  1. Select first name of the list
  1. Look up the Teacher-Subject table where the code of teacher corresponds to the code that we have from the step one
  1. read the list of subject code if more than one is there
  1. read off the list of subjects we get in step 3 from the subjects table
  1. print it out
  1. repeat steps 1-5 till all the teachers code have been done with

Quite simple really!!

Most RDBMS use what is known as Structured Query Language or SQL in short for that purpose. So in that language the above six steps are done by the statement:

```
SELECT Teachers.name, Subjects.name from teacher, subjects, teacher-subject
   WHERE teacher-subject.tcode = teachers.code ;
```

If you noticed the above statement, we just mentioned _what_ to do. Nowhere did we mention _how_ to do. That usually is the responsibility of the RDBMS Engine/Software.

Because the procedure for obtaining the data was not explicitly spelled out as we did in the steps 1-6 above in SQL, this language is often referred to as non-procedural language.

Before the advent of SQL, the developers had to know not only what data was needed, but also where the data resided and had to specify how to access that data in the application.


Now for some theory. Historically  the idea of relational model for data ws first introduced by E. J Codd in his paper "A Relational Model of Data for Large Shared Data Banks" in 1970.

Many consider that for a DBMS to be called a RDBMS, all of Codd's rule should be satisfied.

## Codd's Rule ##
From [Codd's Rules](http://en.wikipedia.org/wiki/Codd's_rules):

Rule 0: The system must qualify as relational, as a database, and as a management system.
For a system to qualify as a relational database management system (RDBMS), that system must use its relational facilities (exclusively) to manage the database.
Rule 1: The information rule:
All information in the database is to be represented in one and only one way, namely by values in column positions within rows of tables.

Rule 2: The guaranteed access rule:
All data must be accessible. This rule is essentially a restatement of the fundamental requirement for primary keys. It says that every individual scalar value in the database must be logically addressable by specifying the name of the containing table, the name of the containing column and the primary key value of the containing row.

Rule 3: Systematic treatment of null values:
The DBMS must allow each field to remain null (or empty). Specifically, it must support a representation of "missing information and inapplicable information" that is systematic, distinct from all regular values (for example, "distinct from zero or any other number", in the case of numeric values), and independent of data type. It is also implied that such representations must be manipulated by the DBMS in a systematic way.

Rule 4: Active online catalog based on the relational model:
The system must support an online, inline, relational catalog that is accessible to authorized users by means of their regular query language. That is, users must be able to access the database's structure (catalog) using the same query language that they use to access the database's data.

Rule 5: The comprehensive data sublanguage rule:
The system must support at least one relational language that
  * Has a linear syntax
  * Can be used both interactively and within application programs,
  * Supports data definition operations (including view definitions), data manipulation operations (update as well as retrieval), security and integrity constraints, and transaction management operations (begin, commit, and rollback).

Rule 6: The view updating rule:
All views that are theoretically updatable must be updatable by the system.

Rule 7: High-level insert, update, and delete:
The system must support set-at-a-time insert, update, and delete operators. This means that data can be retrieved from a relational database in sets constructed of data from multiple rows and/or multiple tables. This rule states that insert, update, and delete operations should be supported for any retrievable set rather than just for a single row in a single table.

Rule 8: Physical data independence:
Changes to the physical level (how the data is stored, whether in arrays or linked lists etc.) must not require a change to an application based on the structure.

Rule 9: Logical data independence:
Changes to the logical level (tables, columns, rows, and so on) must not require a change to an application based on the structure. Logical data independence is more difficult to achieve than physical data independence.

Rule 10: Integrity independence:
Integrity constraints must be specified separately from application programs and stored in the catalog. It must be possible to change such constraints as and when appropriate without unnecessarily affecting existing applications.

Rule 11: Distribution independence:
The distribution of portions of the database to various locations should be invisible to users of the database. Existing applications should continue to operate successfully :
when a distributed version of the DBMS is first introduced; and
when existing distributed data are redistributed around the system.

Rule 12: The nonsubversion rule:
If the system provides a low-level (record-at-a-time) interface, then that interface cannot be used to subvert the system, for example, bypassing a relational security or integrity constraint


## Commonly available RDBMS ##


The following table lists some of the most commonly used RDBMS as described above

| RDBMS | Free/Proprietary | Remarks |
|:------|:-----------------|:--------|
| PostgreSQL | Free             | A true RDBMS |
| MySQL | Dual Licencing   |Initially was not treated as a true RDBMS but over time it gained many RDBMS features |
| Firebird | Free             |         |
|DB2 from IBM | Proprietary      | Very feature rich RDBMS |
| Oracle | Proprietary      | Very feature rich RDBMS |

A more complete comparison can be seen at:

[RDBMS Comparison](http://en.wikipedia.org/wiki/Comparison_of_relational_database_management_systems)

There are other considerations such as High performance, high availability, distributed transactions etc which are often associated with RDBMS. Various combinations of technologies and techniques are used to achieve these features.



Add your content here.  Format your content with:

  * Text in **bold** or _italic_

  * Headings, paragraphs, and lists

  * Automatic links to other wiki pages



(For reference -- to be removed in the final version)
http://www.databasejournal.com/sqletc/article.php/1428721/Introduction-to-Databases-for-the-Web-Pt-1.htm