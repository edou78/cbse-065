

&lt;hr/&gt;



| **Content** | **Utility Software** Compression tools, Anti Virus, SPAM Filters, File Management tools, Archiving, Backups, Time snapshots of disk and Disk Management tools |
|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Team**    | J T D'souza                                                                                                                                                   |
| **Discussion Page** | http://groups.google.com/group/cbse065/browse_thread/thread/afae959fd217d881                                                                                  |
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module8.wiki&format=side&r=-1                                                                        |
| **Old Version List** | http://code.google.com/p/cbse-065/source/list?path=/wiki/module8.wiki                                                                                         |



&lt;hr/&gt;





# Introduction #

Standard utilities available on a GNU/Linux OS


# Details #

This module provides an introduction to the standard utilities available on a GNU/Linux OS installation. We shall cover the features of each utility and the command line syntax for doing typical administrative tasks.

We shall be using debian distribution named Lenny. However what we learn here will be applicable on almost any GNU/Linux distribution like Fedora, Suse, Mandriva, Ubuntu, Slacware etc. Embedded distributions like DSL, MontaVista, Emdebian etc, may not have all the utilities and even included utilities will have several features missing.

Utilities are small command line programs used to do mundane installation, maintanence, configuration and testing tasks.
These programs can be divided into a few broad categories
  1. Shell
  1. Disk, File and directory utils

  1. Network utils
  1. Search utils
  1. Install utils
  1. Editors
  1. Others

== Shell == C FSF
The shell is a macroprocessor that exucutes commands, which are created using it's internal programming language and /or it's builtin commands.
A Unix shell is both a command interpreter and a programming language. As a command interpreter, the shell provides a user interface to other utilities such as those listed above. The programming language features allow these utilities to be combined. Files containing commands can be created, and become commands themselves. These new commands have the same status as system commands in directories such as /bin, allowing users or groups to establish custom environments to automate their common tasks.

Shells may be used interactively or non-interactively. In interactive mode, they accept input typed from the keyboard. When executing non-interactively, shells execute commands read from a file.

A shell allows execution of gnu commands, both synchronously and asynchronously. The shell waits for synchronous commands to complete before accepting more input; asynchronous commands continue to execute in parallel with the shell while it reads and executes additional commands. The redirection constructs permit fine-grained control of the input and output of those commands. Moreover, the shell allows control over the contents of commands' environments.

Shells also provide a small set of built-in commands (builtins) implementing functionality impossible or inconvenient to obtain via separate utilities. For example, cd, break, continue, and exec) cannot be implemented outside of the shell because they directly manipulate the shell itself. The history, getopts, kill, or pwd builtins, among others, could be implemented in separate utilities, but they are more convenient to use as builtin commands. All of the shell builtins are described in subsequent sections.

While executing commands is essential, most of the power (and complexity) of shells is due to their embedded programming languages. Like any high-level language, the shell provides variables, flow control constructs, quoting, and functions.

Shells offer features geared specifically for interactive use rather than to augment the programming language. These interactive features include job control, command line editing, command history and aliases. Each of these features is described here.

There are several flavours of shells like
  * Sh shell
  * C shell - Csh
  * Korn shell - Ksh
  * Bourne shell - bash

The bash shell is the most widely used shell in most FLOSS distributions.

## Basic Shell Features ##

Bash is an acronym for ‘Bourne-Again SHell’. The Bourne shell is the traditional Unix shell originally written by Stephen Bourne. All of the Bourne shell builtin commands are available in Bash, The rules for evaluation and quoting are taken from the posix specification for the `standard' Unix shell.

This chapter briefly summarizes the shell's `building blocks': commands, control structures, shell functions, shell parameters, shell expansions, redirections, which are a way to direct input and output from and to named files, and how the shell executes commands. Typing "man bash" on the shell command prompt will give you all the stuff we have printed below.

  1. Shell Syntax: What your input means to the shell.
  1. Shell Commands: The types of commands you can use.
  1. Shell Functions: Grouping commands by name.
  1. Shell Parameters: How the shell stores values.
  1. Shell Expansions: How Bash expands parameters and the various expansions available.
  1. Redirections: A way to control where input and output go.
  1. Executing Commands: What happens when you run a command.
  1. Shell Scripts: Executing files of shell commands.

### Shell Syntax ###

  * Shell Operation: The basic operation of the shell.
  * Quoting: How to remove the special meaning from characters.
  * Comments: How to specify comments.

When the shell reads input, it proceeds through a sequence of operations. If the input indicates the beginning of a comment, the shell ignores the comment symbol (‘#’), and the rest of that line.

Otherwise, roughly speaking, the shell reads its input and divides the input into words and operators, employing the quoting rules to select which meanings to assign various words and characters.

The shell then parses these tokens into commands and other constructs, removes the special meaning of certain words or characters, expands others, redirects input and output as needed, executes the specified command, waits for the command's exit status, and makes that exit status available for further inspection or processing.

#### Shell Operation ####

The following is a brief description of the shell's operation when it reads and executes a command. Basically, the shell does the following:

  1. Reads its input from a file (see Shell Scripts), from a string supplied as an argument to the -c invocation option (see Invoking Bash), or from the user's terminal.
> 2. Breaks the input into words and operators, obeying the quoting rules described in Quoting. These tokens are separated by metacharacters. Alias expansion is performed by this step (see Aliases).
> 3. Parses the tokens into simple and compound commands (see Shell Commands).
> 4. Performs the various shell expansions (see Shell Expansions), breaking the expanded tokens into lists of filenames (see Filename Expansion) and commands and arguments.
> 5. Performs any necessary redirections (see Redirections) and removes the redirection operators and their operands from the argument list.
> 6. Executes the command (see Executing Commands).
> 7. Optionally waits for the command to complete and collects its exit status (see Exit Status).

#### Quoting ####

  * Escape Character: How to remove the special meaning from a single character.
  * Single Quotes: How to inhibit all interpretation of a sequence of characters.
  * Double Quotes: How to suppress most of the interpretation of a sequence of characters.
  * ANSI-C Quoting: How to expand ANSI-C sequences in quoted strings.
  * Locale Translation: How to translate strings into different languages.

Quoting is used to remove the special meaning of certain characters or words to the shell. Quoting can be used to disable special treatment for special characters, to prevent reserved words from being recognized as such, and to prevent parameter expansion.

Each of the shell metacharacters (see Definitions) has special meaning to the shell and must be quoted if it is to represent itself. When the command history expansion facilities are being used (see History Interaction), the history expansion character, usually ‘!’, must be quoted to prevent history expansion. See Bash History Facilities, for more details concerning history expansion.

There are three quoting mechanisms: the escape character, single quotes, and double quotes.

##### Escape Character #####

A non-quoted backslash ‘\’ is the Bash escape character. It preserves the literal value of the next character that follows, with the exception of newline. If a \newline pair appears, and the backslash itself is not quoted, the \newline is treated as a line continuation (that is, it is removed from the input stream and effectively ignored).
Single Quotes

Enclosing characters in single quotes (‘'’) preserves the literal value of each character within the quotes. A single quote may not occur between single quotes, even when preceded by a backslash.

##### Double Quotes #####

Enclosing characters in double quotes (‘"’) preserves the literal value of all characters within the quotes, with the exception of ‘$’, ‘`’, ‘\’, and, when history expansion is enabled, ‘!’. The characters ‘$’ and ‘`’ retain their special meaning within double quotes (see Shell Expansions). The backslash retains its special meaning only when followed by one of the following characters: ‘$’, ‘`’, ‘"’, ‘\’, or newline. Within double quotes, backslashes that are followed by one of these characters are removed. Backslashes preceding characters without a special meaning are left unmodified. A double quote may be quoted within double quotes by preceding it with a backslash. If enabled, history expansion will be performed unless an ‘!’ appearing in double quotes is escaped using a backslash. The backslash preceding the ‘!’ is not removed.

The special parameters `‘*’` and ‘@’ have special meaning when in double quotes (see Shell Parameter Expansion).

##### ANSI-C Quoting #####

Words of the form $'string' are treated specially. The word expands to string, with backslash-escaped characters replaced as specified by the ANSI C standard. Backslash escape sequences, if present, are decoded as follows:

\a
> alert (bell)
\b
> backspace
\e
> an escape character (not ANSI C)
\f
> form feed
\n
> newline
\r
> carriage return
\t
> horizontal tab
\v
> vertical tab
\\
> backslash
\'
> single quote
\nnn
> the eight-bit character whose value is the octal value nnn (one to three digits)
\xHH
> the eight-bit character whose value is the hexadecimal value HH (one or two hex digits)
\cx
> a control-x character

The expanded result is single-quoted, as if the dollar sign had not been present.


##### Locale-Specific Translation #####

A double-quoted string preceded by a dollar sign (‘$’) will cause the string to be translated according to the current locale. If the current locale is C or POSIX, the dollar sign is ignored. If the string is translated and replaced, the replacement is double-quoted.

Some systems use the message catalog selected by the LC\_MESSAGES shell variable. Others create the name of the message catalog from the value of the TEXTDOMAIN shell variable, possibly adding a suffix of ‘.mo’. If you use the TEXTDOMAIN variable, you may need to set the TEXTDOMAINDIR variable to the location of the message catalog files. Still others use both variables in this fashion: TEXTDOMAINDIR/LC\_MESSAGES/LC\_MESSAGES/TEXTDOMAIN.mo.

##### Comments #####

In a non-interactive shell, or an interactive shell in which the interactive\_comments option to the shopt builtin is enabled (see The Shopt Builtin), a word beginning with ‘#’ causes that word and all remaining characters on that line to be ignored. An interactive shell without the interactive\_comments option enabled does not allow comments. The interactive\_comments option is on by default in interactive shells. See Interactive Shells, for a description of what makes a shell interactive.

## Shell Commands ##

A simple shell command such as echo a b c consists of the command itself followed by arguments, separated by spaces.

More complex shell commands are composed of simple commands arranged together in a variety of ways: in a pipeline in which the output of one command becomes the input of a second, in a loop or conditional construct, or in some other grouping.

=== Simple Commands: === The most common type of command.

=== Pipelines: === Connecting the input and output of several commands.

=== Lists: === How to execute commands sequentially.

=== Compound Commands: === Shell commands for control flow.

=== Coprocesses: === Two-way communication between commands.

### Simple Commands ###

A simple command is the kind of command encountered most often. It's just a sequence of words separated by blanks, terminated by one of the shell's control operators (see Definitions). The first word generally specifies a command to be executed, with the rest of the words being that command's arguments.

The return status (see Exit Status) of a simple command is its exit status as provided by the posix 1003.1 waitpid function, or 128+n if the command was terminated by signal n.

eg. ls
will list the contents of the current directory
ls -l will list the contents of the current directory but in the long format

### Pipelines ###

A pipeline is a sequence of simple commands separated by one of the control operators ‘|’ or ‘|&’.

The format for a pipeline is

> [[-p](time.md)] [!] command1 [[| or |&](.md) command2 ...]

The output of each command in the pipeline is connected via a pipe to the input of the next command. That is, each command reads the previous command's output. This connection is performed before any redirections specified by the command.

If ‘|&’ is used, the standard error of command1 is connected to command2's standard input through the pipe; it is shorthand for 2>&1 |. This implicit redirection of the standard error is performed after any redirections specified by the command.

The reserved word time causes timing statistics to be printed for the pipeline once it finishes. The statistics currently consist of elapsed (wall-clock) time and user and system time consumed by the command's execution. The -p option changes the output format to that specified by posix. The TIMEFORMAT variable may be set to a format string that specifies how the timing information should be displayed. See Bash Variables, for a description of the available formats. The use of time as a reserved word permits the timing of shell builtins, shell functions, and pipelines. An external time command cannot time these easily.

If the pipeline is not executed asynchronously (see Lists), the shell waits for all commands in the pipeline to complete.

Each command in a pipeline is executed in its own subshell (see Command Execution Environment). The exit status of a pipeline is the exit status of the last command in the pipeline, unless the pipefail option is enabled (see The Set Builtin). If pipefail is enabled, the pipeline's return status is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands exit successfully. If the reserved word ‘!’ precedes the pipeline, the exit status is the logical negation of the exit status as described above. The shell waits for all commands in the pipeline to terminate before returning a value.

### Lists of Commands ###

A list is a sequence of one or more pipelines separated by one of the operators ‘;’, ‘&’, ‘&&’, or ‘||’, and optionally terminated by one of ‘;’, ‘&’, or a newline.

Of these list operators, ‘&&’ and ‘||’ have equal precedence, followed by ‘;’ and ‘&’, which have equal precedence.

A sequence of one or more newlines may appear in a list to delimit commands, equivalent to a semicolon.

If a command is terminated by the control operator ‘&’, the shell executes the command asynchronously in a subshell. This is known as executing the command in the background. The shell does not wait for the command to finish, and the return status is 0 (true). When job control is not active (see Job Control), the standard input for asynchronous commands, in the absence of any explicit redirections, is redirected from /dev/null.

Commands separated by a ‘;’ are executed sequentially; the shell waits for each command to terminate in turn. The return status is the exit status of the last command executed.

and and or lists are sequences of one or more pipelines separated by the control operators ‘&&’ and ‘||’, respectively. and and or lists are executed with left associativity.

An and list has the form

> command1 && command2

command2 is executed if, and only if, command1 returns an exit status of zero.

An or list has the form

> command1 || command2

command2 is executed if, and only if, command1 returns a non-zero exit status.

The return status of and and or lists is the exit status of the last command executed in the list.

### Compound Commands ###

  * Looping Constructs: Shell commands for iterative action.
  * Conditional Constructs: Shell commands for conditional execution.
  * Command Grouping: Ways to group commands.

Compound commands are the shell programming constructs. Each construct begins with a reserved word or control operator and is terminated by a corresponding reserved word or operator. Any redirections (see Redirections) associated with a compound command apply to all commands within that compound command unless explicitly overridden.

Bash provides looping constructs, conditional commands, and mechanisms to group commands and execute them as a unit.

### Coprocesses ###

A coprocess is a shell command preceded by the coproc reserved word. A coprocess is executed asynchronously in a subshell, as if the command had been terminated with the ‘&’ control operator, with a two-way pipe established between the executing shell and the coprocess.

The format for a coprocess is:

> coproc [NAME](NAME.md) command [redirections](redirections.md)

This creates a coprocess named NAME. If NAME is not supplied, the default name is COPROC. NAME must not be supplied if command is a simple command (see Simple Commands); otherwise, it is interpreted as the first word of the simple command.

When the coproc is executed, the shell creates an array variable (see Arrays) named NAME in the context of the executing shell. The standard output of command is connected via a pipe to a file descriptor in the executing shell, and that file descriptor is assigned to NAME[0](0.md). The standard input of command is connected via a pipe to a file descriptor in the executing shell, and that file descriptor is assigned to NAME[1](1.md). This pipe is established before any redirections specified by the command (see Redirections). The file descriptors can be utilized as arguments to shell commands and redirections using standard word expansions.

The process id of the shell spawned to execute the coprocess is available as the value of the variable NAME\_PID. The wait builtin command may be used to wait for the coprocess to terminate.

The return status of a coprocess is the exit status of command.

## Shell Functions ##

Shell functions are a way to group commands for later execution using a single name for the group. They are executed just like a "regular" command. When the name of a shell function is used as a simple command name, the list of commands associated with that function name is executed. Shell functions are executed in the current shell context; no new process is created to interpret them.

Functions are declared using this syntax:

> [function ](.md) name () compound-command [redirections ](.md)

This defines a shell function named name. The reserved word function is optional. If the function reserved word is supplied, the parentheses are optional. The body of the function is the compound command compound-command (see Compound Commands). That command is usually a list enclosed between { and }, but may be any compound command listed above. compound-command is executed whenever name is specified as the name of a command. Any redirections (see Redirections) associated with the shell function are performed when the function is executed.

A function definition may be deleted using the -f option to the unset builtin (see Bourne Shell Builtins).

The exit status of a function definition is zero unless a syntax error occurs or a readonly function with the same name already exists. When executed, the exit status of a function is the exit status of the last command executed in the body.

Note that for historical reasons, in the most common usage the curly braces that surround the body of the function must be separated from the body by blanks or newlines. This is because the braces are reserved words and are only recognized as such when they are separated from the command list by whitespace or another shell metacharacter. Also, when using the braces, the list must be terminated by a semicolon, a ‘&’, or a newline.

When a function is executed, the arguments to the function become the positional parameters during its execution (see Positional Parameters). The special parameter ‘#’ that expands to the number of positional parameters is updated to reflect the change. Special parameter 0 is unchanged. The first element of the FUNCNAME variable is set to the name of the function while the function is executing. All other aspects of the shell execution environment are identical between a function and its caller with the exception that the DEBUG and RETURN traps are not inherited unless the function has been given the trace attribute using the declare builtin or the -o functrace option has been enabled with the set builtin, (in which case all functions inherit the DEBUG and RETURN traps). See Bourne Shell Builtins, for the description of the trap builtin.

If the builtin command return is executed in a function, the function completes and execution resumes with the next command after the function call. Any command associated with the RETURN trap is executed before execution resumes. When a function completes, the values of the positional parameters and the special parameter ‘#’ are restored to the values they had prior to the function's execution. If a numeric argument is given to return, that is the function's return status; otherwise the function's return status is the exit status of the last command executed before the return.

Variables local to the function may be declared with the local builtin. These variables are visible only to the function and the commands it invokes.

Function names and definitions may be listed with the -f option to the declare or typeset builtin commands (see Bash Builtins). The -F option to declare or typeset will list the function names only (and optionally the source file and line number, if the extdebug shell option is enabled). Functions may be exported so that subshells automatically have them defined with the -f option to the export builtin (see Bourne Shell Builtins). Note that shell functions and variables with the same name may result in multiple identically-named entries in the environment passed to the shell's children. Care should be taken in cases where this may cause a problem.

Functions may be recursive. No limit is placed on the number of recursive calls.

## Shell Parameters ##

  * Positional Parameters: The shell's command-line arguments.
  * Special Parameters: Parameters denoted by special characters.

A parameter is an entity that stores values. It can be a name, a number, or one of the special characters listed below. A variable is a parameter denoted by a name. A variable has a value and zero or more attributes. Attributes are assigned using the declare builtin command (see the description of the declare builtin in Bash Builtins).

A parameter is set if it has been assigned a value. The null string is a valid value. Once a variable is set, it may be unset only by using the unset builtin command.

A variable may be assigned to by a statement of the form

> name=[value](value.md)

If value is not given, the variable is assigned the null string. All values undergo tilde expansion, parameter and variable expansion, command substitution, arithmetic expansion, and quote removal (detailed below). If the variable has its integer attribute set, then value is evaluated as an arithmetic expression even if the $((...)) expansion is not used (see Arithmetic Expansion). Word splitting is not performed, with the exception of "$@" as explained below. Filename expansion is not performed. Assignment statements may also appear as arguments to the alias, declare, typeset, export, readonly, and local builtin commands.

In the context where an assignment statement is assigning a value to a shell variable or array index (see Arrays), the ‘+=’ operator can be used to append to or add to the variable's previous value. When ‘+=’ is applied to a variable for which the integer attribute has been set, value is evaluated as an arithmetic expression and added to the variable's current value, which is also evaluated. When ‘+=’ is applied to an array variable using compound assignment (see Arrays), the variable's value is not unset (as it is when using ‘=’), and new values are appended to the array beginning at one greater than the array's maximum index (for indexed arrays), or added as additional key-value pairs in an associative array. When applied to a string-valued variable, value is expanded and appended to the variable's value.

### Positional Parameters ###

A positional parameter is a parameter denoted by one or more digits, other than the single digit 0. Positional parameters are assigned from the shell's arguments when it is invoked, and may be reassigned using the set builtin command. Positional parameter N may be referenced as ${N}, or as $N when N consists of a single digit. Positional parameters may not be assigned to with assignment statements. The set and shift builtins are used to set and unset them (see Shell Builtin Commands). The positional parameters are temporarily replaced when a shell function is executed (see Shell Functions).

When a positional parameter consisting of more than a single digit is expanded, it must be enclosed in braces.

### Special Parameters ###

The shell treats several parameters specially. These parameters may only be referenced; assignment to them is not allowed.

`*`
> Expands to the positional parameters, starting from one. When the expansion occurs within double quotes, it expands to a single word with the value of each parameter separated by the first character of the IFS special variable. That is, `"$*"` is equivalent to "$1c$2c...", where c is the first character of the value of the IFS variable. If IFS is unset, the parameters are separated by spaces. If IFS is null, the parameters are joined without intervening separators.
@
> Expands to the positional parameters, starting from one. When the expansion occurs within double quotes, each parameter expands to a separate word. That is, "$@" is equivalent to "$1" "$2" .... If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. When there are no positional parameters, "$@" and $@ expand to nothing (i.e., they are removed).
#
> Expands to the number of positional parameters in decimal.
?
> Expands to the exit status of the most recently executed foreground pipeline.
-
> (A hyphen.) Expands to the current option flags as specified upon invocation, by the set builtin command, or those set by the shell itself (such as the -i option).
$
> Expands to the process id of the shell. In a () subshell, it expands to the process id of the invoking shell, not the subshell.
!
> Expands to the process id of the most recently executed background (asynchronous) command.
0
> Expands to the name of the shell or shell script. This is set at shell initialization. If Bash is invoked with a file of commands (see Shell Scripts), $0 is set to the name of that file. If Bash is started with the -c option (see Invoking Bash), then $0 is set to the first argument after the string to be executed, if one is present. Otherwise, it is set to the filename used to invoke Bash, as given by argument zero.
_> (An underscore.) At shell startup, set to the absolute pathname used to invoke the shell or shell script being executed as passed in the environment or argument list. Subsequently, expands to the last argument to the previous command, after expansion. Also set to the full pathname used to invoke each command executed and placed in the environment exported to that command. When checking mail, this parameter holds the name of the mail file._

## Shell Expansions ##

Expansion is performed on the command line after it has been split into tokens. There are seven kinds of expansion performed:

  * brace expansion
  * tilde expansion
  * parameter and variable expansion
  * command substitution
  * arithmetic expansion
  * word splitting
  * filename expansion

  * Brace Expansion: Expansion of expressions within braces.
  * Tilde Expansion: Expansion of the ~ character.
  * Shell Parameter Expansion: How Bash expands variables to their values.
  * Command Substitution: Using the output of a command as an argument.
  * Arithmetic Expansion: How to use arithmetic in shell expansions.
  * Process Substitution: A way to write and read to and from a command.
  * Word Splitting: How the results of expansion are split into separate arguments.
  * Filename Expansion: A shorthand for specifying filenames matching patterns.
  * Quote Removal: How and when quote characters are removed from words.

The order of expansions is: brace expansion, tilde expansion, parameter, variable, and arithmetic expansion and command substitution (done in a left-to-right fashion), word splitting, and filename expansion.

On systems that can support it, there is an additional expansion available: process substitution. This is performed at the same time as parameter, variable, and arithmetic expansion and command substitution.

Only brace expansion, word splitting, and filename expansion can change the number of words of the expansion; other expansions expand a single word to a single word. The only exceptions to this are the expansions of "$@" (see Special Parameters) and "${name[@]}" (see Arrays).

After all expansions, quote removal (see Quote Removal) is performed.

### Brace Expansion ###

Brace expansion is a mechanism by which arbitrary strings may be generated. This mechanism is similar to filename expansion (see Filename Expansion), but the file names generated need not exist. Patterns to be brace expanded take the form of an optional preamble, followed by either a series of comma-separated strings or a seqeunce expression between a pair of braces, followed by an optional postscript. The preamble is prefixed to each string contained within the braces, and the postscript is then appended to each resulting string, expanding left to right.

Brace expansions may be nested. The results of each expanded string are not sorted; left to right order is preserved. For example,

> bash$ echo a{d,c,b}e
> ade ace abe

A sequence expression takes the form {x..y[incr](incr.md)}, where x and y are either integers or single characters, and incr, an optional increment, is an integer. When integers are supplied, the expression expands to each number between x and y, inclusive. Supplied integers may be prefixed with ‘0’ to force each term to have the same width. When either x or y begins with a zero, the shell attempts to force all generated terms to contain the same number of digits, zero-padding where necessary. When characters are supplied, the expression expands to each character lexicographically between x and y, inclusive. Note that both x and y must be of the same type. When the increment is supplied, it is used as the difference between each term. The default increment is 1 or -1 as appropriate.

Brace expansion is performed before any other expansions, and any characters special to other expansions are preserved in the result. It is strictly textual. Bash does not apply any syntactic interpretation to the context of the expansion or the text between the braces. To avoid conflicts with parameter expansion, the string ‘${’ is not considered eligible for brace expansion.

A correctly-formed brace expansion must contain unquoted opening and closing braces, and at least one unquoted comma or a valid sequence expression. Any incorrectly formed brace expansion is left unchanged.

A { or ‘,’ may be quoted with a backslash to prevent its being considered part of a brace expression. To avoid conflicts with parameter expansion, the string ‘${’ is not considered eligible for brace expansion.

This construct is typically used as shorthand when the common prefix of the strings to be generated is longer than in the above example:

> mkdir /usr/local/src/bash/{old,new,dist,bugs}

or

> ` chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}} `

### Tilde Expansion ###

If a word begins with an unquoted tilde character (‘~’), all of the characters up to the first unquoted slash (or all characters, if there is no unquoted slash) are considered a tilde-prefix. If none of the characters in the tilde-prefix are quoted, the characters in the tilde-prefix following the tilde are treated as a possible login name. If this login name is the null string, the tilde is replaced with the value of the HOME shell variable. If HOME is unset, the home directory of the user executing the shell is substituted instead. Otherwise, the tilde-prefix is replaced with the home directory associated with the specified login name.

If the tilde-prefix is ‘~+’, the value of the shell variable PWD replaces the tilde-prefix. If the tilde-prefix is ‘~-’, the value of the shell variable OLDPWD, if it is set, is substituted.

If the characters following the tilde in the tilde-prefix consist of a number N, optionally prefixed by a ‘+’ or a ‘-’, the tilde-prefix is replaced with the corresponding element from the directory stack, as it would be displayed by the dirs builtin invoked with the characters following tilde in the tilde-prefix as an argument (see The Directory Stack). If the tilde-prefix, sans the tilde, consists of a number without a leading ‘+’ or ‘-’, ‘+’ is assumed.

If the login name is invalid, or the tilde expansion fails, the word is left unchanged.

Each variable assignment is checked for unquoted tilde-prefixes immediately following a ‘:’ or the first ‘=’. In these cases, tilde expansion is also performed. Consequently, one may use file names with tildes in assignments to PATH, MAILPATH, and CDPATH, and the shell assigns the expanded value.

The following table shows how Bash treats unquoted tilde-prefixes:

~
> The value of $HOME
~/foo
> $HOME/foo
~fred/foo
> The subdirectory foo of the home directory of the user fred
~+/foo
> $PWD/foo
~-/foo
> ${OLDPWD-'~-'}/foo
~N
> The string that would be displayed by ‘dirs +N’
~+N
> The string that would be displayed by ‘dirs +N’
~-N
> The string that would be displayed by ‘dirs -N’

### Shell Parameter Expansion ###

The ‘$’ character introduces parameter expansion, command substitution, or arithmetic expansion. The parameter name or symbol to be expanded may be enclosed in braces, which are optional but serve to protect the variable to be expanded from characters immediately following it which could be interpreted as part of the name.

When braces are used, the matching ending brace is the first ‘}’ not escaped by a backslash or within a quoted string, and not within an embedded arithmetic expansion, command substitution, or parameter expansion.

The basic form of parameter expansion is ${parameter}. The value of parameter is substituted. The braces are required when parameter is a positional parameter with more than one digit, or when parameter is followed by a character that is not to be interpreted as part of its name.

If the first character of parameter is an exclamation point, a level of variable indirection is introduced. Bash uses the value of the variable formed from the rest of parameter as the name of the variable; this variable is then expanded and that value is used in the rest of the substitution, rather than the value of parameter itself. This is known as indirect expansion. The exceptions to this are the expansions of ${!prefix`*`} and ${!name[@]} described below. The exclamation point must immediately follow the left brace in order to introduce indirection.

In each of the cases below, word is subject to tilde expansion, parameter expansion, command substitution, and arithmetic expansion.

When not performing substring expansion, using the form described below, Bash tests for a parameter that is unset or null. Omitting the colon results in a test only for a parameter that is unset. Put another way, if the colon is included, the operator tests for both parameter's existence and that its value is not null; if the colon is omitted, the operator tests only for existence.

${parameter:−word}
> If parameter is unset or null, the expansion of word is substituted. Otherwise, the value of parameter is substituted.
${parameter:=word}
> If parameter is unset or null, the expansion of word is assigned to parameter. The value of parameter is then substituted. Positional parameters and special parameters may not be assigned to in this way.
${parameter:?word}
> If parameter is null or unset, the expansion of word (or a message to that effect if word is not present) is written to the standard error and the shell, if it is not interactive, exits. Otherwise, the value of parameter is substituted.
${parameter:+word}
> If parameter is null or unset, nothing is substituted, otherwise the expansion of word is substituted.
${parameter:offset}
${parameter:offset:length}
> Expands to up to length characters of parameter starting at the character specified by offset. If length is omitted, expands to the substring of parameter starting at the character specified by offset. length and offset are arithmetic expressions (see Shell Arithmetic). This is referred to as Substring Expansion.

> length must evaluate to a number greater than or equal to zero. If offset evaluates to a number less than zero, the value is used as an offset from the end of the value of parameter. If parameter is ‘@’, the result is length positional parameters beginning at offset. If parameter is an indexed array name subscripted by ‘@’ or ‘`*`’, the result is the length members of the array beginning with ${parameter[offset](offset.md)}. A negative offset is taken relative to one greater than the maximum index of the specified array. Substring expansion applied to an associative array produces undefined results.

> Note that a negative offset must be separated from the colon by at least one space to avoid being confused with the ‘:-’ expansion. Substring indexing is zero-based unless the positional parameters are used, in which case the indexing starts at 1 by default. If offset is 0, and the positional parameters are used, $@ is prefixed to the list.
${!prefix`*` }
${!prefix@}
> Expands to the names of variables whose names begin with prefix, separated by the first character of the IFS special variable. When ‘@’ is used and the expansion appears within double quotes, each variable name expands to a separate word.
${!name[@]}
${!name[`*`]}
> If name is an array variable, expands to the list of array indices (keys) assigned in name. If name is not an array, expands to 0 if name is set and null otherwise. When ‘@’ is used and the expansion appears within double quotes, each key expands to a separate word.
${#parameter}
> The length in characters of the expanded value of parameter is substituted. If parameter is ‘`*`’ or ‘@’, the value substituted is the number of positional parameters. If parameter is an array name subscripted by ‘`*`’ or ‘@’, the value substituted is the number of elements in the array.
${parameter#word}
${parameter##word}
> The word is expanded to produce a pattern just as in filename expansion (see Filename Expansion). If the pattern matches the beginning of the expanded value of parameter, then the result of the expansion is the expanded value of parameter with the shortest matching pattern (the ‘#’ case) or the longest matching pattern (the ‘##’ case) deleted. If parameter is ‘@’ or ‘`*`’, the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with ‘@’ or ‘`*`’, the pattern removal operation is applied to each member of the array in turn, and the expansion is the resultant list.
${parameter%word}
${parameter%%word}
> The word is expanded to produce a pattern just as in filename expansion. If the pattern matches a trailing portion of the expanded value of parameter, then the result of the expansion is the value of parameter with the shortest matching pattern (the ‘%’ case) or the longest matching pattern (the ‘%%’ case) deleted. If parameter is ‘@’ or ‘`*`’, the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with ‘@’ or ‘`*`’, the pattern removal operation is applied to each member of the array in turn, and the expansion is the resultant list.
${parameter/pattern/string}
> The pattern is expanded to produce a pattern just as in filename expansion. Parameter is expanded and the longest match of pattern against its value is replaced with string. If pattern begins with ‘/’, all matches of pattern are replaced with string. Normally only the first match is replaced. If pattern begins with ‘#’, it must match at the beginning of the expanded value of parameter. If pattern begins with ‘%’, it must match at the end of the expanded value of parameter. If string is null, matches of pattern are deleted and the / following pattern may be omitted. If parameter is ‘@’ or ‘`*`’, the substitution operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with ‘@’ or ‘`*`’, the substitution operation is applied to each member of the array in turn, and the expansion is the resultant list.
${parameter^pattern}
${parameter^^pattern}
${parameter,pattern}
${parameter,,pattern}
> This expansion modifies the case of alphabetic characters in parameter. The pattern is expanded to produce a pattern just as in pathname expansion. The ‘<sup>’ operator converts lowercase letters matching pattern to uppercase; the ‘,’ operator converts matching uppercase letters to lowercase. The ‘</sup><sup>’ and ‘,,’ expansions convert each matched character in the expanded value; the ‘</sup>’ and ‘,’ expansions match and convert only the first character in the expanded value. If pattern is omitted, it is treated like a ‘?’, which matches every character. If parameter is ‘@’ or `‘*’`, the case modification operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with ‘@’ or ‘`*`’, the case modification operation is applied to each member of the array in turn, and the expansion is the resultant list.

### Command Substitution ###

Command substitution allows the output of a command to replace the command itself. Command substitution occurs when a command is enclosed as follows:

> $(command)

or

> `command`

Bash performs the expansion by executing command and replacing the command substitution with the standard output of the command, with any trailing newlines deleted. Embedded newlines are not deleted, but they may be removed during word splitting. The command substitution $(cat file) can be replaced by the equivalent but faster $(< file).

When the old-style backquote form of substitution is used, backslash retains its literal meaning except when followed by ‘$’, ‘`’, or ‘\’. The first backquote not preceded by a backslash terminates the command substitution. When using the $(command) form, all characters between the parentheses make up the command; none are treated specially.

Command substitutions may be nested. To nest when using the backquoted form, escape the inner backquotes with backslashes.

If the substitution appears within double quotes, word splitting and filename expansion are not performed on the results.

### Arithmetic Expansion ###

Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result. The format for arithmetic expansion is:

> $(( expression ))

The expression is treated as if it were within double quotes, but a double quote inside the parentheses is not treated specially. All tokens in the expression undergo parameter expansion, command substitution, and quote removal. Arithmetic expansions may be nested.

The evaluation is performed according to the rules listed below (see Shell Arithmetic). If the expression is invalid, Bash prints a message indicating failure to the standard error and no substitution occurs.

### Process Substitution ###

Process substitution is supported on systems that support named pipes (fifos) or the /dev/fd method of naming open files. It takes the form of

> <(list)

or

> >(list)

The process list is run with its input or output connected to a fifo or some file in /dev/fd. The name of this file is passed as an argument to the current command as the result of the expansion. If the >(list) form is used, writing to the file will provide input for list. If the <(list) form is used, the file passed as an argument should be read to obtain the output of list. Note that no space may appear between the < or > and the left parenthesis, otherwise the construct would be interpreted as a redirection.

When available, process substitution is performed simultaneously with parameter and variable expansion, command substitution, and arithmetic expansion.

### Word Splitting ###

The shell scans the results of parameter expansion, command substitution, and arithmetic expansion that did not occur within double quotes for word splitting.

The shell treats each character of $IFS as a delimiter, and splits the results of the other expansions into words on these characters. If IFS is unset, or its value is exactly 

&lt;space&gt;



&lt;tab&gt;



&lt;newline&gt;

, the default, then sequences of 

&lt;space&gt;

, 

&lt;tab&gt;

, and 

&lt;newline&gt;

 at the beginning and end of the results of the previous expansions are ignored, and any sequence of IFS characters not at the beginning or end serves to delimit words. If IFS has a value other than the default, then sequences of the whitespace characters space and tab are ignored at the beginning and end of the word, as long as the whitespace character is in the value of IFS (an IFS whitespace character). Any character in IFS that is not IFS whitespace, along with any adjacent IFS whitespace characters, delimits a field. A sequence of IFS whitespace characters is also treated as a delimiter. If the value of IFS is null, no word splitting occurs.

Explicit null arguments ("" or '') are retained. Unquoted implicit null arguments, resulting from the expansion of parameters that have no values, are removed. If a parameter with no value is expanded within double quotes, a null argument results and is retained.

Note that if no expansion occurs, no splitting is performed.

### Filename Expansion ###

> `*` Pattern Matching: How the shell matches patterns.

After word splitting, unless the -f option has been set (see The Set Builtin), Bash scans each word for the characters ‘`*`’, ‘?’, and ‘[’. If one of these characters appears, then the word is regarded as a pattern, and replaced with an alphabetically sorted list of file names matching the pattern. If no matching file names are found, and the shell option nullglob is disabled, the word is left unchanged. If the nullglob option is set, and no matches are found, the word is removed. If the failglob shell option is set, and no matches are found, an error message is printed and the command is not executed. If the shell option nocaseglob is enabled, the match is performed without regard to the case of alphabetic characters.

When a pattern is used for filename generation, the character ‘.’ at the start of a filename or immediately following a slash must be matched explicitly, unless the shell option dotglob is set. When matching a file name, the slash character must always be matched explicitly. In other cases, the ‘.’ character is not treated specially.

See the description of shopt in The Shopt Builtin, for a description of the nocaseglob, nullglob, failglob, and dotglob options.

The GLOBIGNORE shell variable may be used to restrict the set of filenames matching a pattern. If GLOBIGNORE is set, each matching filename that also matches one of the patterns in GLOBIGNORE is removed from the list of matches. The filenames . and .. are always ignored when GLOBIGNORE is set and not null. However, setting GLOBIGNORE to a non-null value has the effect of enabling the dotglob shell option, so all other filenames beginning with a ‘.’ will match. To get the old behavior of ignoring filenames beginning with a ‘.’, make ‘.`*`’ one of the patterns in GLOBIGNORE. The dotglob option is disabled when GLOBIGNORE is unset.

### Quote Removal ###

After the preceding expansions, all unquoted occurrences of the characters ‘\’, ‘'’, and ‘"’ that did not result from one of the above expansions are removed.

### Redirections ###

Before a command is executed, its input and output may be redirected using a special notation interpreted by the shell. Redirection may also be used to open and close files for the current shell execution environment. The following redirection operators may precede or appear anywhere within a simple command or may follow a command. Redirections are processed in the order they appear, from left to right.

In the following descriptions, if the file descriptor number is omitted, and the first character of the redirection operator is ‘<’, the redirection refers to the standard input (file descriptor 0). If the first character of the redirection operator is ‘>’, the redirection refers to the standard output (file descriptor 1).

The word following the redirection operator in the following descriptions, unless otherwise noted, is subjected to brace expansion, tilde expansion, parameter expansion, command substitution, arithmetic expansion, quote removal, filename expansion, and word splitting. If it expands to more than one word, Bash reports an error.

Note that the order of redirections is significant. For example, the command

> ls > dirlist 2>&1

directs both standard output (file descriptor 1) and standard error (file descriptor 2) to the file dirlist, while the command

> ls 2>&1 > dirlist

directs only the standard output to file dirlist, because the standard error was made a copy of the standard output before the standard output was redirected to dirlist.

Bash handles several filenames specially when they are used in redirections, as described in the following table:

/dev/fd/fd
> If fd is a valid integer, file descriptor fd is duplicated.
/dev/stdin
> File descriptor 0 is duplicated.
/dev/stdout
> File descriptor 1 is duplicated.
/dev/stderr
> File descriptor 2 is duplicated.
/dev/tcp/host/port
> If host is a valid hostname or Internet address, and port is an integer port number or service name, Bash attempts to open a TCP connection to the corresponding socket.
/dev/udp/host/port
> If host is a valid hostname or Internet address, and port is an integer port number or service name, Bash attempts to open a UDP connection to the corresponding socket.

A failure to open or create a file causes the redirection to fail.

Redirections using file descriptors greater than 9 should be used with care, as they may conflict with file descriptors the shell uses internally.

#### Redirecting Input ####

Redirection of input causes the file whose name results from the expansion of word to be opened for reading on file descriptor n, or the standard input (file descriptor 0) if n is not specified.

The general format for redirecting input is:

> [n](n.md)<word

#### Redirecting Output ####

Redirection of output causes the file whose name results from the expansion of word to be opened for writing on file descriptor n, or the standard output (file descriptor 1) if n is not specified. If the file does not exist it is created; if it does exist it is truncated to zero size.

The general format for redirecting output is:

> [n](n.md)>[|]word

If the redirection operator is ‘>’, and the noclobber option to the set builtin has been enabled, the redirection will fail if the file whose name results from the expansion of word exists and is a regular file. If the redirection operator is ‘>|’, or the redirection operator is ‘>’ and the noclobber option is not enabled, the redirection is attempted even if the file named by word exists.
3.6.3 Appending Redirected Output

Redirection of output in this fashion causes the file whose name results from the expansion of word to be opened for appending on file descriptor n, or the standard output (file descriptor 1) if n is not specified. If the file does not exist it is created.

The general format for appending output is:

> [n](n.md)>>word

#### Redirecting Standard Output and Standard Error ####

This construct allows both the standard output (file descriptor 1) and the standard error output (file descriptor 2) to be redirected to the file whose name is the expansion of word.

There are two formats for redirecting standard output and standard error:

> &>word

and

> >&word

Of the two forms, the first is preferred. This is semantically equivalent to

> >word 2>&1

#### Appending Standard Output and Standard Error ####

This construct allows both the standard output (file descriptor 1) and the standard error output (file descriptor 2) to be appended to the file whose name is the expansion of word.

The format for appending standard output and standard error is:

> &>>word

This is semantically equivalent to

> >>word 2>&1

#### Here Documents ####

This type of redirection instructs the shell to read input from the current source until a line containing only word (with no trailing blanks) is seen. All of the lines read up to that point are then used as the standard input for a command.

The format of here-documents is:

> <<[−]word
> > here-document

> delimiter

No parameter expansion, command substitution, arithmetic expansion, or filename expansion is performed on word. If any characters in word are quoted, the delimiter is the result of quote removal on word, and the lines in the here-document are not expanded. If word is unquoted, all lines of the here-document are subjected to parameter expansion, command substitution, and arithmetic expansion. In the latter case, the character sequence \newline is ignored, and ‘\’ must be used to quote the characters ‘\’, ‘$’, and ‘`’.

If the redirection operator is ‘<<-’, then all leading tab characters are stripped from input lines and the line containing delimiter. This allows here-documents within shell scripts to be indented in a natural fashion.

#### Here Strings ####

A variant of here documents, the format is:

> <<< word

The word is expanded and supplied to the command on its standard input.

#### Duplicating File Descriptors ####

The redirection operator

> [n](n.md)<&word

is used to duplicate input file descriptors. If word expands to one or more digits, the file descriptor denoted by n is made to be a copy of that file descriptor. If the digits in word do not specify a file descriptor open for input, a redirection error occurs. If word evaluates to ‘-’, file descriptor n is closed. If n is not specified, the standard input (file descriptor 0) is used.

The operator

> [n](n.md)>&word

is used similarly to duplicate output file descriptors. If n is not specified, the standard output (file descriptor 1) is used. If the digits in word do not specify a file descriptor open for output, a redirection error occurs. As a special case, if n is omitted, and word does not expand to one or more digits, the standard output and standard error are redirected as described previously.

#### Moving File Descriptors ####

The redirection operator

> [n](n.md)<&digit-

moves the file descriptor digit to file descriptor n, or the standard input (file descriptor 0) if n is not specified. digit is closed after being duplicated to n.

Similarly, the redirection operator

> [n](n.md)>&digit-

moves the file descriptor digit to file descriptor n, or the standard output (file descriptor 1) if n is not specified.

#### Opening File Descriptors for Reading and Writing ####

The redirection operator

> [n](n.md)<>word

causes the file whose name is the expansion of word to be opened for both reading and writing on file descriptor n, or on file descriptor 0 if n is not specified. If the file does not exist, it is created.

### Executing Commands ###

  * Simple Command Expansion: How Bash expands simple commands before executing them.
  * Command Search and Execution: How Bash finds commands and runs them.
  * Command Execution Environment: The environment in which Bash executes commands that are not shell builtins.
  * Environment: The environment given to a command.
  * Exit Status: The status returned by commands and how Bash interprets it.
  * Signals: What happens when Bash or a command it runs receives a signal.

#### Simple Command Expansion ####

When a simple command is executed, the shell performs the following expansions, assignments, and redirections, from left to right.

  1. The words that the parser has marked as variable assignments (those preceding the command name) and redirections are saved for later processing.
> 2. The words that are not variable assignments or redirections are expanded (see Shell Expansions). If any words remain after expansion, the first word is taken to be the name of the command and the remaining words are the arguments.
> 3. Redirections are performed as described above (see Redirections).
> 4. The text after the ‘=’ in each variable assignment undergoes tilde expansion, parameter expansion, command substitution, arithmetic expansion, and quote removal before being assigned to the variable.

If no command name results, the variable assignments affect the current shell environment. Otherwise, the variables are added to the environment of the executed command and do not affect the current shell environment. If any of the assignments attempts to assign a value to a readonly variable, an error occurs, and the command exits with a non-zero status.

If no command name results, redirections are performed, but do not affect the current shell environment. A redirection error causes the command to exit with a non-zero status.

If there is a command name left after expansion, execution proceeds as described below. Otherwise, the command exits. If one of the expansions contained a command substitution, the exit status of the command is the exit status of the last command substitution performed. If there were no command substitutions, the command exits with a status of zero.

#### Command Search and Execution ####

After a command has been split into words, if it results in a simple command and an optional list of arguments, the following actions are taken.

  1. If the command name contains no slashes, the shell attempts to locate it. If there exists a shell function by that name, that function is invoked as described in Shell Functions.
> 2. If the name does not match a function, the shell searches for it in the list of shell builtins. If a match is found, that builtin is invoked.
> 3. If the name is neither a shell function nor a builtin, and contains no slashes, Bash searches each element of $PATH for a directory containing an executable file by that name. Bash uses a hash table to remember the full pathnames of executable files to avoid multiple PATH searches (see the description of hash in Bourne Shell Builtins). A full search of the directories in $PATH is performed only if the command is not found in the hash table. If the search is unsuccessful, the shell searches for a defined shell function named command\_not\_found\_handle. If that function exists, it is invoked with the original command and the original command's arguments as its arguments, and the function's exit status becomes the exit status of the shell. If that function is not defined, the shell prints an error message and returns an exit status of 127.
> 4. If the search is successful, or if the command name contains one or more slashes, the shell executes the named program in a separate execution environment. Argument 0 is set to the name given, and the remaining arguments to the command are set to the arguments supplied, if any.
> 5. If this execution fails because the file is not in executable format, and the file is not a directory, it is assumed to be a shell script and the shell executes it as described in Shell Scripts.
> 6. If the command was not begun asynchronously, the shell waits for the command to complete and collects its exit status.

#### Command Execution Environment ####

The shell has an execution environment, which consists of the following:

  * open files inherited by the shell at invocation, as modified by redirections supplied to the exec builtin
  * the current working directory as set by cd, pushd, or popd, or inherited by the shell at invocation
  * the file creation mode mask as set by umask or inherited from the shell's parent
  * current traps set by trap
  * shell parameters that are set by variable assignment or with set or inherited from the shell's parent in the environment
  * shell functions defined during execution or inherited from the shell's parent in the environment
  * options enabled at invocation (either by default or with command-line arguments) or by set
  * options enabled by shopt (see The Shopt Builtin)
  * shell aliases defined with alias (see Aliases)
  * various process ids, including those of background jobs (see Lists), the value of $$, and the value of $PPID

When a simple command other than a builtin or shell function is to be executed, it is invoked in a separate execution environment that consists of the following. Unless otherwise noted, the values are inherited from the shell.

  * the shell's open files, plus any modifications and additions specified by redirections to the command
  * the current working directory
  * the file creation mode mask
  * shell variables and functions marked for export, along with variables exported for the command, passed in the environment (see Environment)
  * traps caught by the shell are reset to the values inherited from the shell's parent, and traps ignored by the shell are ignored

A command invoked in this separate environment cannot affect the shell's execution environment.

Command substitution, commands grouped with parentheses, and asynchronous commands are invoked in a subshell environment that is a duplicate of the shell environment, except that traps caught by the shell are reset to the values that the shell inherited from its parent at invocation. Builtin commands that are invoked as part of a pipeline are also executed in a subshell environment. Changes made to the subshell environment cannot affect the shell's execution environment.

Subshells spawned to execute command substitutions inherit the value of the -e option from the parent shell. When not in posix mode, Bash clears the -e option in such subshells.

If a command is followed by a ‘&’ and job control is not active, the default standard input for the command is the empty file /dev/null. Otherwise, the invoked command inherits the file descriptors of the calling shell as modified by redirections.

#### Environment ####

When a program is invoked it is given an array of strings called the environment. This is a list of name-value pairs, of the form name=value.

Bash provides several ways to manipulate the environment. On invocation, the shell scans its own environment and creates a parameter for each name found, automatically marking it for export to child processes. Executed commands inherit the environment. The export and ‘declare -x’ commands allow parameters and functions to be added to and deleted from the environment. If the value of a parameter in the environment is modified, the new value becomes part of the environment, replacing the old. The environment inherited by any executed command consists of the shell's initial environment, whose values may be modified in the shell, less any pairs removed by the unset and ‘export -n’ commands, plus any additions via the export and ‘declare -x’ commands.

The environment for any simple command or function may be augmented temporarily by prefixing it with parameter assignments, as described in Shell Parameters. These assignment statements affect only the environment seen by that command.

If the -k option is set (see The Set Builtin), then all parameter assignments are placed in the environment for a command, not just those that precede the command name.

When Bash invokes an external command, the variable ‘$_’ is set to the full path name of the command and passed to that command in its environment._

#### Exit Status ####

The exit status of an executed command is the value returned by the waitpid system call or equivalent function. Exit statuses fall between 0 and 255, though, as explained below, the shell may use values above 125 specially. Exit statuses from shell builtins and compound commands are also limited to this range. Under certain circumstances, the shell will use special values to indicate specific failure modes.

For the shell's purposes, a command which exits with a zero exit status has succeeded. A non-zero exit status indicates failure. This seemingly counter-intuitive scheme is used so there is one well-defined way to indicate success and a variety of ways to indicate various failure modes. When a command terminates on a fatal signal whose number is N, Bash uses the value 128+N as the exit status.

If a command is not found, the child process created to execute it returns a status of 127. If a command is found but is not executable, the return status is 126.

If a command fails because of an error during expansion or redirection, the exit status is greater than zero.

The exit status is used by the Bash conditional commands (see Conditional Constructs) and some of the list constructs (see Lists).

All of the Bash builtins return an exit status of zero if they succeed and a non-zero status on failure, so they may be used by the conditional and list constructs. All builtins return an exit status of 2 to indicate incorrect usage.

#### Signals ####

When Bash is interactive, in the absence of any traps, it ignores SIGTERM (so that ‘kill 0’ does not kill an interactive shell), and SIGINT is caught and handled (so that the wait builtin is interruptible). When Bash receives a SIGINT, it breaks out of any executing loops. In all cases, Bash ignores SIGQUIT. If job control is in effect (see Job Control), Bash ignores SIGTTIN, SIGTTOU, and SIGTSTP.

Non-builtin commands started by Bash have signal handlers set to the values inherited by the shell from its parent. When job control is not in effect, asynchronous commands ignore SIGINT and SIGQUIT in addition to these inherited handlers. Commands run as a result of command substitution ignore the keyboard-generated job control signals SIGTTIN, SIGTTOU, and SIGTSTP.

The shell exits by default upon receipt of a SIGHUP. Before exiting, an interactive shell resends the SIGHUP to all jobs, running or stopped. Stopped jobs are sent SIGCONT to ensure that they receive the SIGHUP. To prevent the shell from sending the SIGHUP signal to a particular job, it should be removed from the jobs table with the disown builtin (see Job Control Builtins) or marked to not receive SIGHUP using disown -h.

If the huponexit shell option has been set with shopt (see The Shopt Builtin), Bash sends a SIGHUP to all jobs when an interactive login shell exits.

If Bash is waiting for a command to complete and receives a signal for which a trap has been set, the trap will not be executed until the command completes. When Bash is waiting for an asynchronous command via the wait builtin, the reception of a signal for which a trap has been set will cause the wait builtin to return immediately with an exit status greater than 128, immediately after which the trap is executed.

### Shell Scripts ###

A shell script is a text file containing shell commands. When such a file is used as the first non-option argument when invoking Bash, and neither the -c nor -s option is supplied (see Invoking Bash), Bash reads and executes commands from the file, then exits. This mode of operation creates a non-interactive shell. The shell first searches for the file in the current directory, and looks in the directories in $PATH if not found there.

When Bash runs a shell script, it sets the special parameter 0 to the name of the file, rather than the name of the shell, and the positional parameters are set to the remaining arguments, if any are given. If no additional arguments are supplied, the positional parameters are unset.

A shell script may be made executable by using the chmod command to turn on the execute bit. When Bash finds such a file while searching the $PATH for a command, it spawns a subshell to execute it. In other words, executing

> filename arguments

is equivalent to executing

> bash filename arguments

if filename is an executable shell script. This subshell reinitializes itself, so that the effect is as if a new shell had been invoked to interpret the script, with the exception that the locations of commands remembered by the parent (see the description of hash in Bourne Shell Builtins) are retained by the child.

Most versions of Unix make this a part of the operating system's command execution mechanism. If the first line of a script begins with the two characters ‘#!’, the remainder of the line specifies an interpreter for the program. Thus, you can specify Bash, awk, Perl, or some other interpreter and write the rest of the script file in that language.

The arguments to the interpreter consist of a single optional argument following the interpreter name on the first line of the script file, followed by the name of the script file, followed by the rest of the arguments. Bash will perform this action on operating systems that do not handle it themselves. Note that some older versions of Unix limit the interpreter name and argument to a maximum of 32 characters.

Bash scripts often begin with #! /bin/bash (assuming that Bash has been installed in /bin), since this ensures that Bash will be used to interpret the script, even if it is executed under another shell.

## Shell Builtin Commands ##

  * Bourne Shell Builtins: Builtin commands inherited from the Bourne Shell.
  * Bash Builtins: Table of builtins specific to Bash.
  * Modifying Shell Behavior: Builtins to modify shell attributes and optional behavior.
  * Special Builtins: Builtin commands classified specially by POSIX.

Builtin commands are contained within the shell itself. When the name of a builtin command is used as the first word of a simple command (see Simple Commands), the shell executes the command directly, without invoking another program. Builtin commands are necessary to implement functionality impossible or inconvenient to obtain with separate utilities.

This section briefly describes the builtins which Bash inherits from the Bourne Shell, as well as the builtin commands which are unique to or have been extended in Bash.

Several builtin commands are described in other chapters: builtin commands which provide the Bash interface to the job control facilities (see Job Control Builtins), the directory stack (see Directory Stack Builtins), the command history (see Bash History Builtins), and the programmable completion facilities (see Programmable Completion Builtins).

Many of the builtins have been extended by posix or Bash.

Unless otherwise noted, each builtin command documented as accepting options preceded by ‘-’ accepts ‘--’ to signify the end of the options. For example, the :, true, false, and test builtins do not accept options.

### Bourne Shell Builtins ###

The following shell builtin commands are inherited from the Bourne Shell. These commands are implemented as specified by the posix standard.

: (a colon)

> : [arguments](arguments.md)

> Do nothing beyond expanding arguments and performing redirections. The return status is zero.
. (a period)

> . filename [arguments](arguments.md)

> Read and execute commands from the filename argument in the current shell context. If filename does not contain a slash, the PATH variable is used to find filename. When Bash is not in posix mode, the current directory is searched if filename is not found in $PATH. If any arguments are supplied, they become the positional parameters when filename is executed. Otherwise the positional parameters are unchanged. The return status is the exit status of the last command executed, or zero if no commands are executed. If filename is not found, or cannot be read, the return status is non-zero. This builtin is equivalent to source.
break

> break [n](n.md)

> Exit from a for, while, until, or select loop. If n is supplied, the nth enclosing loop is exited. n must be greater than or equal to 1. The return status is zero unless n is not greater than or equal to 1.
cd

> cd [-L|-P] [directory](directory.md)

> Change the current working directory to directory. If directory is not given, the value of the HOME shell variable is used. If the shell variable CDPATH exists, it is used as a search path. If directory begins with a slash, CDPATH is not used.

> The -P option means to not follow symbolic links; symbolic links are followed by default or with the -L option. If directory is ‘-’, it is equivalent to $OLDPWD.

> If a non-empty directory name from CDPATH is used, or if ‘-’ is the first argument, and the directory change is successful, the absolute pathname of the new working directory is written to the standard output.

> The return status is zero if the directory is successfully changed, non-zero otherwise.
continue

> continue [n](n.md)

> Resume the next iteration of an enclosing for, while, until, or select loop. If n is supplied, the execution of the nth enclosing loop is resumed. n must be greater than or equal to 1. The return status is zero unless n is not greater than or equal to 1.
eval

> eval [arguments](arguments.md)

> The arguments are concatenated together into a single command, which is then read and executed, and its exit status returned as the exit status of eval. If there are no arguments or only empty arguments, the return status is zero.
exec

> exec [-cl] [-a name] [[arguments](command.md)]

> If command is supplied, it replaces the shell without creating a new process. If the -l option is supplied, the shell places a dash at the beginning of the zeroth argument passed to command. This is what the login program does. The -c option causes command to be executed with an empty environment. If -a is supplied, the shell passes name as the zeroth argument to command. If no command is specified, redirections may be used to affect the current shell environment. If there are no redirection errors, the return status is zero; otherwise the return status is non-zero.
exit

> exit [n](n.md)

> Exit the shell, returning a status of n to the shell's parent. If n is omitted, the exit status is that of the last command executed. Any trap on EXIT is executed before the shell terminates.
export

> export [-fn] [-p] [name[=value]]

> Mark each name to be passed to child processes in the environment. If the -f option is supplied, the names refer to shell functions; otherwise the names refer to shell variables. The -n option means to no longer mark each name for export. If no names are supplied, or if the -p option is given, a list of exported names is displayed. The -p option displays output in a form that may be reused as input. If a variable name is followed by =value, the value of the variable is set to value.

> The return status is zero unless an invalid option is supplied, one of the names is not a valid shell variable name, or -f is supplied with a name that is not a shell function.
getopts

> getopts optstring name [args](args.md)

> getopts is used by shell scripts to parse positional parameters. optstring contains the option characters to be recognized; if a character is followed by a colon, the option is expected to have an argument, which should be separated from it by white space. The colon (‘:’) and question mark (‘?’) may not be used as option characters. Each time it is invoked, getopts places the next option in the shell variable name, initializing name if it does not exist, and the index of the next argument to be processed into the variable OPTIND. OPTIND is initialized to 1 each time the shell or a shell script is invoked. When an option requires an argument, getopts places that argument into the variable OPTARG. The shell does not reset OPTIND automatically; it must be manually reset between multiple calls to getopts within the same shell invocation if a new set of parameters is to be used.

> When the end of options is encountered, getopts exits with a return value greater than zero. OPTIND is set to the index of the first non-option argument, and name is set to ‘?’.

> getopts normally parses the positional parameters, but if more arguments are given in args, getopts parses those instead.

> getopts can report errors in two ways. If the first character of optstring is a colon, silent error reporting is used. In normal operation diagnostic messages are printed when invalid options or missing option arguments are encountered. If the variable OPTERR is set to 0, no error messages will be displayed, even if the first character of optstring is not a colon.

> If an invalid option is seen, getopts places ‘?’ into name and, if not silent, prints an error message and unsets OPTARG. If getopts is silent, the option character found is placed in OPTARG and no diagnostic message is printed.

> If a required argument is not found, and getopts is not silent, a question mark (‘?’) is placed in name, OPTARG is unset, and a diagnostic message is printed. If getopts is silent, then a colon (‘:’) is placed in name and OPTARG is set to the option character found.
hash

> hash [-r] [-p filename] [-dt] [name](name.md)

> Remember the full pathnames of commands specified as name arguments, so they need not be searched for on subsequent invocations. The commands are found by searching through the directories listed in $PATH. The -p option inhibits the path search, and filename is used as the location of name. The -r option causes the shell to forget all remembered locations. The -d option causes the shell to forget the remembered location of each name. If the -t option is supplied, the full pathname to which each name corresponds is printed. If multiple name arguments are supplied with -t the name is printed before the hashed full pathname. The -l option causes output to be displayed in a format that may be reused as input. If no arguments are given, or if only -l is supplied, information about remembered commands is printed. The return status is zero unless a name is not found or an invalid option is supplied.
pwd

> pwd [-LP]

> Print the absolute pathname of the current working directory. If the -P option is supplied, the pathname printed will not contain symbolic links. If the -L option is supplied, the pathname printed may contain symbolic links. The return status is zero unless an error is encountered while determining the name of the current directory or an invalid option is supplied.
readonly

> readonly [-aApf] [name[=value]] ...

> Mark each name as readonly. The values of these names may not be changed by subsequent assignment. If the -f option is supplied, each name refers to a shell function. The -a option means each name refers to an indexed array variable; the -A option means each name refers to an associative array variable. If no name arguments are given, or if the -p option is supplied, a list of all readonly names is printed. The -p option causes output to be displayed in a format that may be reused as input. If a variable name is followed by =value, the value of the variable is set to value. The return status is zero unless an invalid option is supplied, one of the name arguments is not a valid shell variable or function name, or the -f option is supplied with a name that is not a shell function.
return

> return [n](n.md)

> Cause a shell function to exit with the return value n. If n is not supplied, the return value is the exit status of the last command executed in the function. This may also be used to terminate execution of a script being executed with the . (or source) builtin, returning either n or the exit status of the last command executed within the script as the exit status of the script. Any command associated with the RETURN trap is executed before execution resumes after the function or script. The return status is non-zero if return is used outside a function and not during the execution of a script by . or source.
shift

> shift [n](n.md)

> Shift the positional parameters to the left by n. The positional parameters from n+1 ... $# are renamed to $1 ... $#-n. Parameters represented by the numbers $# to $#-n+1 are unset. n must be a non-negative number less than or equal to $#. If n is zero or greater than $#, the positional parameters are not changed. If n is not supplied, it is assumed to be 1. The return status is zero unless n is greater than $# or less than zero, non-zero otherwise.
test
[
> Evaluate a conditional expression expr. Each operator and operand must be a separate argument. Expressions are composed of the primaries described below in Bash Conditional Expressions. test does not accept any options, nor does it accept and ignore an argument of -- as signifying the end of options.

> When the [form is used, the last argument to the command must be a ](.md).

> Expressions may be combined using the following operators, listed in decreasing order of precedence. The evaluation depends on the number of arguments; see below.

> ! expr
> > True if expr is false.

> ( expr )
> > Returns the value of expr. This may be used to override the normal precedence of operators.

> expr1 -a expr2
> > True if both expr1 and expr2 are true.

> expr1 -o expr2
> > True if either expr1 or expr2 is true.


> The test and [ builtins evaluate conditional expressions using a set of rules based on the number of arguments.

> 0 arguments
> > The expression is false.
  1. argument
> > The expression is true if and only if the argument is not null.

> 2 arguments
> > If the first argument is ‘!’, the expression is true if and only if the second argument is null. If the first argument is one of the unary conditional operators (see Bash Conditional Expressions), the expression is true if the unary test is true. If the first argument is not a valid unary operator, the expression is false.

> 3 arguments
> > If the second argument is one of the binary conditional operators (see Bash Conditional Expressions), the result of the expression is the result of the binary test using the first and third arguments as operands. The ‘-a’ and ‘-o’ operators are considered binary operators when there are three arguments. If the first argument is ‘!’, the value is the negation of the two-argument test using the second and third arguments. If the first argument is exactly ‘(’ and the third argument is exactly ‘)’, the result is the one-argument test of the second argument. Otherwise, the expression is false.

> 4 arguments
> > If the first argument is ‘!’, the result is the negation of the three-argument expression composed of the remaining arguments. Otherwise, the expression is parsed and evaluated according to precedence using the rules listed above.

> 5 or more arguments
> > The expression is parsed and evaluated according to precedence using the rules listed above.


times


> times

> Print out the user and system times used by the shell and its children. The return status is zero.
trap

> trap [-lp] [arg](arg.md) [...](sigspec.md)

> The commands in arg are to be read and executed when the shell receives signal sigspec. If arg is absent (and there is a single sigspec) or equal to ‘-’, each specified signal's disposition is reset to the value it had when the shell was started. If arg is the null string, then the signal specified by each sigspec is ignored by the shell and commands it invokes. If arg is not present and -p has been supplied, the shell displays the trap commands associated with each sigspec. If no arguments are supplied, or only -p is given, trap prints the list of commands associated with each signal number in a form that may be reused as shell input. The -l option causes the shell to print a list of signal names and their corresponding numbers. Each sigspec is either a signal name or a signal number. Signal names are case insensitive and the SIG prefix is optional. If a sigspec is 0 or EXIT, arg is executed when the shell exits. If a sigspec is DEBUG, the command arg is executed before every simple command, for command, case command, select command, every arithmetic for command, and before the first command executes in a shell function. Refer to the description of the extglob option to the shopt builtin (see The Shopt Builtin) for details of its effect on the DEBUG trap. If a sigspec is ERR, the command arg is executed whenever a simple command has a non-zero exit status, subject to the following conditions. The ERR trap is not executed if the failed command is part of the command list immediately following an until or while keyword, part of the test following the if or elif reserved words, part of a command executed in a && or || list, or if the command's return status is being inverted using !. These are the same conditions obeyed by the errexit option. If a sigspec is RETURN, the command arg is executed each time a shell function or a script executed with the . or source builtins finishes executing.

> Signals ignored upon entry to the shell cannot be trapped or reset. Trapped signals that are not being ignored are reset to their original values in a child process when it is created.

> The return status is zero unless a sigspec does not specify a valid signal.
umask

> umask [-p] [-S] [mode](mode.md)

> Set the shell process's file creation mask to mode. If mode begins with a digit, it is interpreted as an octal number; if not, it is interpreted as a symbolic mode mask similar to that accepted by the chmod command. If mode is omitted, the current value of the mask is printed. If the -S option is supplied without a mode argument, the mask is printed in a symbolic format. If the -p option is supplied, and mode is omitted, the output is in a form that may be reused as input. The return status is zero if the mode is successfully changed or if no mode argument is supplied, and non-zero otherwise.

> Note that when the mode is interpreted as an octal number, each number of the umask is subtracted from 7. Thus, a umask of 022 results in permissions of 755.
unset

> unset [-fv] [name](name.md)

> Each variable or function name is removed. If no options are supplied, or the -v option is given, each name refers to a shell variable. If the -f option is given, the names refer to shell functions, and the function definition is removed. Readonly variables and functions may not be unset. The return status is zero unless a name is readonly.

### Bash Builtin Commands ###

This section describes builtin commands which are unique to or have been extended in Bash. Some of these commands are specified in the posix standard.

alias

> alias [-p] [name[=value] ...]

> Without arguments or with the -p option, alias prints the list of aliases on the standard output in a form that allows them to be reused as input. If arguments are supplied, an alias is defined for each name whose value is given. If no value is given, the name and value of the alias is printed. Aliases are described in Aliases.
bind

> bind [-m keymap] [-lpsvPSV]
> bind [-m keymap] [-q function] [-u function] [-r keyseq]
> bind [-m keymap] -f filename
> bind [-m keymap] -x keyseq:shell-command
> bind [-m keymap] keyseq:function-name
> bind readline-command

> Display current Readline (see Command Line Editing) key and function bindings, bind a key sequence to a Readline function or macro, or set a Readline variable. Each non-option argument is a command as it would appear in a Readline initialization file (see Readline Init File), but each binding or command must be passed as a separate argument; e.g., ‘"\C-x\C-r":re-read-init-file’.

> Options, if supplied, have the following meanings:

> -m keymap
> > Use keymap as the keymap to be affected by the subsequent bindings. Acceptable keymap names are emacs, emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move, vi-command, and vi-insert. vi is equivalent to vi-command; emacs is equivalent to emacs-standard.

> -l
> > List the names of all Readline functions.

> -p
> > Display Readline function names and bindings in such a way that they can be used as input or in a Readline initialization file.

> -P
> > List current Readline function names and bindings.

> -v
> > Display Readline variable names and values in such a way that they can be used as input or in a Readline initialization file.

> -V
> > List current Readline variable names and values.

> -s
> > Display Readline key sequences bound to macros and the strings they output in such a way that they can be used as input or in a Readline initialization file.

> -S
> > Display Readline key sequences bound to macros and the strings they output.

> -f filename
> > Read key bindings from filename.

> -q function
> > Query about which keys invoke the named function.

> -u function
> > Unbind all keys bound to the named function.

> -r keyseq
> > Remove any current binding for keyseq.

> -x keyseq:shell-command
> > Cause shell-command to be executed whenever keyseq is entered. When shell-command is executed, the shell sets the READLINE\_LINE variable to the contents of the Readline line buffer and the READLINE\_POINT variable to the current location of the insertion point. If the executed command changes the value of READLINE\_LINE or READLINE\_POINT, those new values will be reflected in the editing state.


> The return status is zero unless an invalid option is supplied or an error occurs.
builtin

> builtin [shell-builtin [args](args.md)]

> Run a shell builtin, passing it args, and return its exit status. This is useful when defining a shell function with the same name as a shell builtin, retaining the functionality of the builtin within the function. The return status is non-zero if shell-builtin is not a shell builtin command.
caller

> caller [expr](expr.md)

> Returns the context of any active subroutine call (a shell function or a script executed with the . or source builtins).

> Without expr, caller displays the line number and source filename of the current subroutine call. If a non-negative integer is supplied as expr, caller displays the line number, subroutine name, and source file corresponding to that position in the current execution call stack. This extra information may be used, for example, to print a stack trace. The current frame is frame 0.

> The return value is 0 unless the shell is not executing a subroutine call or expr does not correspond to a valid position in the call stack.
command

> command [-pVv] command [...](arguments.md)

> Runs command with arguments ignoring any shell function named command. Only shell builtin commands or commands found by searching the PATH are executed. If there is a shell function named ls, running ‘command ls’ within the function will execute the external command ls instead of calling the function recursively. The -p option means to use a default value for PATH that is guaranteed to find all of the standard utilities. The return status in this case is 127 if command cannot be found or an error occurred, and the exit status of command otherwise.

> If either the -V or -v option is supplied, a description of command is printed. The -v option causes a single word indicating the command or file name used to invoke command to be displayed; the -V option produces a more verbose description. In this case, the return status is zero if command is found, and non-zero if not.
declare

> declare [-aAfFilrtux] [-p] [name[=value] ...]

> Declare variables and give them attributes. If no names are given, then display the values of variables instead.

> The -p option will display the attributes and values of each name. When -p is used with name arguments, additional options are ignored.

> When -p is supplied without name arguments, declare will display the attributes and values of all variables having the attributes specified by the additional options. If no other options are supplied with -p, declare will display the attributes and values of all shell variables. The -f option will restrict the display to shell functions.

> The -F option inhibits the display of function definitions; only the function name and attributes are printed. If the extdebug shell option is enabled using shopt (see The Shopt Builtin), the source file name and line number where the function is defined are displayed as well. -F implies -f. The following options can be used to restrict output to variables with the specified attributes or to give variables attributes:

> -a
> > Each name is an indexed array variable (see Arrays).

> -A
> > Each name is an associative array variable (see Arrays).

> -f
> > Use function names only.

> -i
> > The variable is to be treated as an integer; arithmetic evaluation (see Shell Arithmetic) is performed when the variable is assigned a value.

> -l
> > When the variable is assigned a value, all upper-case characters are converted to lower-case. The upper-case attribute is disabled.

> -r
> > Make names readonly. These names cannot then be assigned values by subsequent assignment statements or unset.

> -t
> > Give each name the trace attribute. Traced functions inherit the DEBUG and RETURN traps from the calling shell. The trace attribute has no special meaning for variables.

> -u
> > When the variable is assigned a value, all lower-case characters are converted to upper-case. The lower-case attribute is disabled.

> -x
> > Mark each name for export to subsequent commands via the environment.


> Using ‘+’ instead of ‘-’ turns off the attribute instead, with the exceptions that ‘+a’ may not be used to destroy an array variable and ‘+r’ will not remove the readonly attribute. When used in a function, declare makes each name local, as with the local command. If a variable name is followed by =value, the value of the variable is set to value.

> The return status is zero unless an invalid option is encountered, an attempt is made to define a function using ‘-f foo=bar’, an attempt is made to assign a value to a readonly variable, an attempt is made to assign a value to an array variable without using the compound assignment syntax (see Arrays), one of the names is not a valid shell variable name, an attempt is made to turn off readonly status for a readonly variable, an attempt is made to turn off array status for an array variable, or an attempt is made to display a non-existent function with -f.
echo

> echo [-neE] [...](arg.md)

> Output the args, separated by spaces, terminated with a newline. The return status is always 0. If -n is specified, the trailing newline is suppressed. If the -e option is given, interpretation of the following backslash-escaped characters is enabled. The -E option disables the interpretation of these escape characters, even on systems where they are interpreted by default. The xpg\_echo shell option may be used to dynamically determine whether or not echo expands these escape characters by default. echo does not interpret -- to mean the end of options.

> echo interprets the following escape sequences:

> \a
> > alert (bell)

> \b
> > backspace

> \c
> > suppress further output

> \e
> > escape

> \f
> > form feed

> \n
> > new line

> \r
> > carriage return

> \t
> > horizontal tab

> \v
> > vertical tab

> \\
> > backslash

> \0nnn
> > the eight-bit character whose value is the octal value nnn (zero to three octal digits)

> \xHH
> > the eight-bit character whose value is the hexadecimal value HH (one or two hex digits)


enable


> enable [-a] [-dnps] [-f filename] [...](name.md)

> Enable and disable builtin shell commands. Disabling a builtin allows a disk command which has the same name as a shell builtin to be executed without specifying a full pathname, even though the shell normally searches for builtins before disk commands. If -n is used, the names become disabled. Otherwise names are enabled. For example, to use the test binary found via $PATH instead of the shell builtin version, type ‘enable -n test’.

> If the -p option is supplied, or no name arguments appear, a list of shell builtins is printed. With no other arguments, the list consists of all enabled shell builtins. The -a option means to list each builtin with an indication of whether or not it is enabled.

> The -f option means to load the new builtin command name from shared object filename, on systems that support dynamic loading. The -d option will delete a builtin loaded with -f.

> If there are no options, a list of the shell builtins is displayed. The -s option restricts enable to the posix special builtins. If -s is used with -f, the new builtin becomes a special builtin (see Special Builtins).

> The return status is zero unless a name is not a shell builtin or there is an error loading a new builtin from a shared object.
help

> help [-dms] [pattern](pattern.md)

> Display helpful information about builtin commands. If pattern is specified, help gives detailed help on all commands matching pattern, otherwise a list of the builtins is printed.

> Options, if supplied, have the following meanings:

> -d
> > Display a short description of each pattern

> -m
> > Display the description of each pattern in a manpage-like format

> -s
> > Display only a short usage synopsis for each pattern


> The return status is zero unless no command matches pattern.
let

> let expression [expression](expression.md)

> The let builtin allows arithmetic to be performed on shell variables. Each expression is evaluated according to the rules given below in Shell Arithmetic. If the last expression evaluates to 0, let returns 1; otherwise 0 is returned.
local

> local [option](option.md) name[=value] ...

> For each argument, a local variable named name is created, and assigned value. The option can be any of the options accepted by declare. local can only be used within a function; it makes the variable name have a visible scope restricted to that function and its children. The return status is zero unless local is used outside a function, an invalid name is supplied, or name is a readonly variable.
logout

> logout [n](n.md)

> Exit a login shell, returning a status of n to the shell's parent.
mapfile

> mapfile [-n count] [-O origin] [-s count] [-t] [-u fd] [
> -C callback] [-c quantum] [array](array.md)

> Read lines from the standard input into array variable array, or from file descriptor fd if the -u option is supplied. The variable MAPFILE is the default array. Options, if supplied, have the following meanings:

> -n
> > Copy at most count lines. If count is 0, all lines are copied.

> -O
> > Begin assigning to array at index origin. The default index is 0.

> -s
> > Discard the first count lines read.

> -t
> > Remove a trailing line from each line read.

> -u
> > Read lines from file descriptor fd instead of the standard input.

> -C
> > Evaluate callback each time quantumP lines are read. The -c option specifies quantum.

> -c
> > Specify the number of lines read between each call to callback.


> If -C is specified without -c, the default quantum is 5000. When callback is evaluated, it is supplied the index of the next array element to be assigned as an additional argument. callback is evaluated after the line is read but before the array element is assigned.

> If not supplied with an explicit origin, mapfile will clear array before assigning to it.

> mapfile returns successfully unless an invalid option or option argument is supplied, or array is invalid or unassignable.
printf

> printf [-v var] format [arguments](arguments.md)

> Write the formatted arguments to the standard output under the control of the format. The format is a character string which contains three types of objects: plain characters, which are simply copied to standard output, character escape sequences, which are converted and copied to the standard output, and format specifications, each of which causes printing of the next successive argument. In addition to the standard printf(1) formats, ‘%b’ causes printf to expand backslash escape sequences in the corresponding argument, (except that ‘\c’ terminates output, backslashes in ‘\'’, ‘\"’, and ‘\?’ are not removed, and octal escapes beginning with ‘\0’ may contain up to four digits), and ‘%q’ causes printf to output the corresponding argument in a format that can be reused as shell input.

> The -v option causes the output to be assigned to the variable var rather than being printed to the standard output.

> The format is reused as necessary to consume all of the arguments. If the format requires more arguments than are supplied, the extra format specifications behave as if a zero value or null string, as appropriate, had been supplied. The return value is zero on success, non-zero on failure.
read

> read [-ers] [-a aname] [-d delim] [-i text] [-n nchars] [-p prompt] [-t timeout] [-u fd] [...](name.md)

> One line is read from the standard input, or from the file descriptor fd supplied as an argument to the -u option, and the first word is assigned to the first name, the second word to the second name, and so on, with leftover words and their intervening separators assigned to the last name. If there are fewer words read from the input stream than names, the remaining names are assigned empty values. The characters in the value of the IFS variable are used to split the line into words. The backslash character ‘\’ may be used to remove any special meaning for the next character read and for line continuation. If no names are supplied, the line read is assigned to the variable REPLY. The return code is zero, unless end-of-file is encountered, read times out (in which case the return code is greater than 128), or an invalid file descriptor is supplied as the argument to -u.

> Options, if supplied, have the following meanings:

> -a aname
> > The words are assigned to sequential indices of the array variable aname, starting at 0. All elements are removed from aname before the assignment. Other name arguments are ignored.

> -d delim
> > The first character of delim is used to terminate the input line, rather than newline.

> -e
> > Readline (see Command Line Editing) is used to obtain the line. Readline uses the current (or default, if line editing was not previously active) editing settings.

> -i text
> > If Readline is being used to read the line, text is placed into the editing buffer before editing begins.

> -n nchars
> > read returns after reading nchars characters rather than waiting for a complete line of input.

> -p prompt
> > Display prompt, without a trailing newline, before attempting to read any input. The prompt is displayed only if input is coming from a terminal.

> -r
> > If this option is given, backslash does not act as an escape character. The backslash is considered to be part of the line. In particular, a backslash-newline pair may not be used as a line continuation.

> -s
> > Silent mode. If input is coming from a terminal, characters are not echoed.

> -t timeout
> > Cause read to time out and return failure if a complete line of input is not read within timeout seconds. timeout may be a decimal number with a fractional portion following the decimal point. This option is only effective if read is reading input from a terminal, pipe, or other special file; it has no effect when reading from regular files. If timeout is 0, read returns success if input is available on the specified file descriptor, failure otherwise. The exit status is greater than 128 if the timeout is exceeded.

> -u fd
> > Read input from file descriptor fd.


readarray


> readarray [-n count] [-O origin] [-s count] [-t] [-u fd] [
> -C callback] [-c quantum] [array](array.md)

> Read lines from the standard input into array variable array, or from file descriptor fd if the -u option is supplied.

> A synonym for mapfile.
source

> source filename

> A synonym for . (see Bourne Shell Builtins).
type

> type [-afptP] [...](name.md)

> For each name, indicate how it would be interpreted if used as a command name.

> If the -t option is used, type prints a single word which is one of ‘alias’, ‘function’, ‘builtin’, ‘file’ or ‘keyword’, if name is an alias, shell function, shell builtin, disk file, or shell reserved word, respectively. If the name is not found, then nothing is printed, and type returns a failure status.

> If the -p option is used, type either returns the name of the disk file that would be executed, or nothing if -t would not return ‘file’.

> The -P option forces a path search for each name, even if -t would not return ‘file’.

> If a command is hashed, -p and -P print the hashed value, not necessarily the file that appears first in $PATH.

> If the -a option is used, type returns all of the places that contain an executable named file. This includes aliases and functions, if and only if the -p option is not also used.

> If the -f option is used, type does not attempt to find shell functions, as with the command builtin.

> The return status is zero if all of the names are found, non-zero if any are not found.
typeset

> typeset [-afFrxi] [-p] [name[=value] ...]

> The typeset command is supplied for compatibility with the Korn shell; however, it has been deprecated in favor of the declare builtin command.
ulimit

> ulimit [-abcdefilmnpqrstuvxHST] [limit](limit.md)

> ulimit provides control over the resources available to processes started by the shell, on systems that allow such control. If an option is given, it is interpreted as follows:

> -S
> > Change and report the soft limit associated with a resource.

> -H
> > Change and report the hard limit associated with a resource.

> -a
> > All current limits are reported.

> -b
> > The maximum socket buffer size.

> -c
> > The maximum size of core files created.

> -d
> > The maximum size of a process's data segment.

> -e
> > The maximum scheduling priority ("nice").

> -f
> > The maximum size of files written by the shell and its children.

> -i
> > The maximum number of pending signals.

> -l
> > The maximum size that may be locked into memory.

> -m
> > The maximum resident set size (many systems do not honor this limit).

> -n
> > The maximum number of open file descriptors (most systems do not allow this value to be set).

> -p
> > The pipe buffer size.

> -q
> > The maximum number of bytes in POSIX message queues.

> -r
> > The maximum real-time scheduling priority.

> -s
> > The maximum stack size.

> -t
> > The maximum amount of cpu time in seconds.

> -u
> > The maximum number of processes available to a single user.

> -v
> > The maximum amount of virtual memory available to the process.

> -x
> > The maximum number of file locks.

> -T
> > The maximum number of threads.


> If limit is given, it is the new value of the specified resource; the special limit values hard, soft, and unlimited stand for the current hard limit, the current soft limit, and no limit, respectively. A hard limit cannot be increased by a non-root user once it is set; a soft limit may be increased up to the value of the hard limit. Otherwise, the current value of the soft limit for the specified resource is printed, unless the -H option is supplied. When setting new limits, if neither -H nor -S is supplied, both the hard and soft limits are set. If no option is given, then -f is assumed. Values are in 1024-byte increments, except for -t, which is in seconds, -p, which is in units of 512-byte blocks, and -n and -u, which are unscaled values.

> The return status is zero unless an invalid option or argument is supplied, or an error occurs while setting a new limit.
unalias

> unalias [-a] [... ](name.md)

> Remove each name from the list of aliases. If -a is supplied, all aliases are removed. Aliases are described in Aliases.

### Modifying Shell Behavior ###

  * The Set Builtin: Change the values of shell attributes and positional parameters.
  * The Shopt Builtin: Modify shell optional behavior.

#### The Set Builtin ####

This builtin is so complicated that it deserves its own section. set allows you to change the values of shell options and set the positional parameters, or to display the names and values of shell variables.

set

> set [--abefhkmnptuvxBCEHPT] [-o option] [...](argument.md)
> set [+abefhkmnptuvxBCEHPT] [+o option] [...](argument.md)

> If no options or arguments are supplied, set displays the names and values of all shell variables and functions, sorted according to the current locale, in a format that may be reused as input for setting or resetting the currently-set variables. Read-only variables cannot be reset. In posix mode, only shell variables are listed.

> When options are supplied, they set or unset shell attributes. Options, if specified, have the following meanings:

> -a
> > Mark variables and function which are modified or created for export to the environment of subsequent commands.

> -b
> > Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt.

> -e
> > Exit immediately if a pipeline (see Pipelines), which may consist of a single simple command (see Simple Commands), a subshell command enclosed in parentheses (see Command Grouping), or one of the commands executed as part of a command list enclosed by braces (see Command Grouping) returns a non-zero status. The shell does not exit if the command that fails is part of the command list immediately following a while or until keyword, part of the test in an if statement, part of any command executed in a && or | list except the command following the final && or ||, any command in a pipeline but the last, or if the command's return status is being inverted with !. A trap on ERR, if set, is executed before the shell exits.|
|:--------------------------------------------------|


> This option applies to the shell environment and each subshell environment separately (see Command Execution Environment), and may cause subshells to exit before executing all the commands in the subshell.
> -f
> > Disable file name generation (globbing).

> -h
> > Locate and remember (hash) commands as they are looked up for execution. This option is enabled by default.

> -k
> > All arguments in the form of assignment statements are placed in the environment for a command, not just those that precede the command name.

> -m
> > Job control is enabled (see Job Control).

> -n
> > Read commands but do not execute them; this may be used to check a script for syntax errors. This option is ignored by interactive shells.

> -o option-name
> > Set the option corresponding to option-name:


> allexport
> > Same as -a.

> braceexpand
> > Same as -B.

> emacs
> > Use an emacs-style line editing interface (see Command Line Editing). This also affects the editing interface used for read -e.

> errexit
> > Same as -e.

> errtrace
> > Same as -E.

> functrace
> > Same as -T.

> hashall
> > Same as -h.

> histexpand
> > Same as -H.

> history
> > Enable command history, as described in Bash History Facilities. This option is on by default in interactive shells.

> ignoreeof
> > An interactive shell will not exit upon reading EOF.

> keyword
> > Same as -k.

> monitor
> > Same as -m.

> noclobber
> > Same as -C.

> noexec
> > Same as -n.

> noglob
> > Same as -f.

> nolog
> > Currently ignored.

> notify
> > Same as -b.

> nounset
> > Same as -u.

> onecmd
> > Same as -t.

> physical
> > Same as -P.

> pipefail
> > If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully. This option is disabled by default.

> posix
> > Change the behavior of Bash where the default operation differs from the posix standard to match the standard (see Bash POSIX Mode). This is intended to make Bash behave as a strict superset of that standard.

> privileged
> > Same as -p.

> verbose
> > Same as -v.

> vi
> > Use a vi-style line editing interface. This also affects the editing interface used for read -e.

> xtrace
> > Same as -x.



> -p
> > Turn on privileged mode. In this mode, the $BASH\_ENV and $ENV files are not processed, shell functions are not inherited from the environment, and the SHELLOPTS, CDPATH and GLOBIGNORE variables, if they appear in the environment, are ignored. If the shell is started with the effective user (group) id not equal to the real user (group) id, and the -p option is not supplied, these actions are taken and the effective user id is set to the real user id. If the -p option is supplied at startup, the effective user id is not reset. Turning this option off causes the effective user and group ids to be set to the real user and group ids.

> -t
> > Exit after reading and executing one command.

> -u
> > Treat unset variables as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit.

> -v
> > Print shell input lines as they are read.

> -x
> > Print a trace of simple commands, for commands, case commands, select commands, and arithmetic for commands and their arguments or associated word lists after they are expanded and before they are executed. The value of the PS4 variable is expanded and the resultant value is printed before the command and its expanded arguments.

> -B
> > The shell will perform brace expansion (see Brace Expansion). This option is on by default.

> -C
> > Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files.

> -E
> > If set, any trap on ERR is inherited by shell functions, command substitutions, and commands executed in a subshell environment. The ERR trap is normally not inherited in such cases.

> -H
> > Enable ‘!’ style history substitution (see History Interaction). This option is on by default for interactive shells.

> -P
> > If set, do not follow symbolic links when performing commands such as cd which change the current directory. The physical directory is used instead. By default, Bash follows the logical chain of directories when performing commands which change the current directory.


> For example, if /usr/sys is a symbolic link to /usr/local/sys then:

> $ cd /usr/sys; echo $PWD
> /usr/sys
> $ cd ..; pwd
> /usr

> If set -P is on, then:

> $ cd /usr/sys; echo $PWD
> /usr/local/sys
> $ cd ..; pwd
> /usr/local


> -T
> > If set, any trap on DEBUG and RETURN are inherited by shell functions, command substitutions, and commands executed in a subshell environment. The DEBUG and RETURN traps are normally not inherited in such cases.

> --
> > If no arguments follow this option, then the positional parameters are unset. Otherwise, the positional parameters are set to the arguments, even if some of them begin with a ‘-’.

> -
> > Signal the end of options, cause all remaining arguments to be assigned to the positional parameters. The -x and -v options are turned off. If there are no arguments, the positional parameters remain unchanged.


> Using ‘+’ rather than ‘-’ causes these options to be turned off. The options can also be used upon invocation of the shell. The current set of options may be found in $-.

> The remaining N arguments are positional parameters and are assigned, in order, to $1, $2, ... $N. The special parameter # is set to N.

> The return status is always zero unless an invalid option is supplied.

#### The Shopt Builtin ####

This builtin allows you to change additional shell optional behavior.

shopt

> shopt [-pqsu] [-o] [...](optname.md)

> Toggle the values of variables controlling optional shell behavior. With no options, or with the -p option, a list of all settable options is displayed, with an indication of whether or not each is set. The -p option causes output to be displayed in a form that may be reused as input. Other options have the following meanings:

> -s
> > Enable (set) each optname.

> -u
> > Disable (unset) each optname.

> -q
> > Suppresses normal output; the return status indicates whether the optname is set or unset. If multiple optname arguments are given with -q, the return status is zero if all optnames are enabled; non-zero otherwise.

> -o
> > Restricts the values of optname to be those defined for the -o option to the set builtin (see The Set Builtin).


> If either -s or -u is used with no optname arguments, the display is limited to those options which are set or unset, respectively.

> Unless otherwise noted, the shopt options are disabled (off) by default.

> The return status when listing options is zero if all optnames are enabled, non-zero otherwise. When setting or unsetting options, the return status is zero unless an optname is not a valid shell option.

> The list of shopt options is:

> autocd
> > If set, a command name that is the name of a directory is executed as if it were the argument to the cd command. This option is only used by interactive shells.

> cdable\_vars
> > If this is set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.

> cdspell
> > If set, minor errors in the spelling of a directory component in a cd command will be corrected. The errors checked for are transposed characters, a missing character, and a character too many. If a correction is found, the corrected path is printed, and the command proceeds. This option is only used by interactive shells.

> checkhash
> > If this is set, Bash checks that a command found in the hash table exists before trying to execute it. If a hashed command no longer exists, a normal path search is performed.

> checkjobs
> > If set, Bash lists the status of any stopped and running jobs before exiting an interactive shell. If any jobs are running, this causes the exit to be deferred until a second exit is attempted without an intervening command (see Job Control). The shell always postpones exiting if any jobs are stopped.

> checkwinsize
> > If set, Bash checks the window size after each command and, if necessary, updates the values of LINES and COLUMNS.

> cmdhist
> > If set, Bash attempts to save all lines of a multiple-line command in the same history entry. This allows easy re-editing of multi-line commands.

> compat31
> > If set, Bash changes its behavior to that of version 3.1 with respect to quoted arguments to the conditional command's =~ operator.

> dirspell
> > If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.

> dotglob
> > If set, Bash includes filenames beginning with a `.' in the results of filename expansion.

> execfail
> > If this is set, a non-interactive shell will not exit if it cannot execute the file specified as an argument to the exec builtin command. An interactive shell does not exit if exec fails.

> expand\_aliases
> > If set, aliases are expanded as described below under Aliases, Aliases. This option is enabled by default for interactive shells.

> extdebug
> > If set, behavior intended for use by debuggers is enabled:

  1. The -F option to the declare builtin (see Bash Builtins) displays the source file name and line number corresponding to each function name supplied as an argument.

> 2. If the command run by the DEBUG trap returns a non-zero value, the next command is skipped and not executed.
> 3. If the command run by the DEBUG trap returns a value of 2, and the shell is executing in a subroutine (a shell function or a shell script executed by the . or source builtins), a call to return is simulated.
> 4. BASH\_ARGC and BASH\_ARGV are updated as described in their descriptions (see Bash Variables).
> 5. Function tracing is enabled: command substitution, shell functions, and subshells invoked with ( command ) inherit the DEBUG and RETURN traps.
> 6. Error tracing is enabled: command substitution, shell functions, and subshells invoked with ( command ) inherit the ERROR trap.


> extglob
> > If set, the extended pattern matching features described above (see Pattern Matching) are enabled.

> extquote
> > If set, $'string' and $"string" quoting is performed within ${parameter} expansions enclosed in double quotes. This option is enabled by default.

> failglob
> > If set, patterns which fail to match filenames during pathname expansion result in an expansion error.

> force\_fignore
> > If set, the suffixes specified by the FIGNORE shell variable cause words to be ignored when performing word completion even if the ignored words are the only possible completions. See Bash Variables, for a description of FIGNORE. This option is enabled by default.

> globstar
> > If set, the pattern ‘’ used in a filename expansion context will match all files and zero or more directories and subdirectories. If the pattern is followed by a ‘/’, only directories and subdirectories match.

> gnu\_errfmt
> > If set, shell error messages are written in the standard gnu error message format.

> histappend
> > If set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.

> histreedit
> > If set, and Readline is being used, a user is given the opportunity to re-edit a failed history substitution.

> histverify
> > If set, and Readline is being used, the results of history substitution are not immediately passed to the shell parser. Instead, the resulting line is loaded into the Readline editing buffer, allowing further modification.

> hostcomplete
> > If set, and Readline is being used, Bash will attempt to perform hostname completion when a word containing a ‘@’ is being completed (see Commands For Completion). This option is enabled by default.

> huponexit
> > If set, Bash will send SIGHUP to all jobs when an interactive login shell exits (see Signals).

> interactive\_comments
> > Allow a word beginning with ‘#’ to cause that word and all remaining characters on that line to be ignored in an interactive shell. This option is enabled by default.

> lithist
> > If enabled, and the cmdhist option is enabled, multi-line commands are saved to the history with embedded newlines rather than using semicolon separators where possible.

> login\_shell
> > The shell sets this option if it is started as a login shell (see Invoking Bash). The value may not be changed.

> mailwarn
> > If set, and a file that Bash is checking for mail has been accessed since the last time it was checked, the message "The mail in mailfile has been read" is displayed.

> no\_empty\_cmd\_completion
> > If set, and Readline is being used, Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line.

> nocaseglob
> > If set, Bash matches filenames in a case-insensitive fashion when performing filename expansion.

> nocasematch
> > If set, Bash matches patterns in a case-insensitive fashion when performing matching while executing case or [[ conditional commands.

> nullglob
> > If set, Bash allows filename patterns which match no files to expand to a null string, rather than themselves.

> progcomp
> > If set, the programmable completion facilities (see Programmable Completion) are enabled. This option is enabled by default.

> promptvars
> > If set, prompt strings undergo parameter expansion, command substitution, arithmetic expansion, and quote removal after being expanded as described below (see Printing a Prompt). This option is enabled by default.

> restricted\_shell
> > The shell sets this option if it is started in restricted mode (see The Restricted Shell). The value may not be changed. This is not reset when the startup files are executed, allowing the startup files to discover whether or not a shell is restricted.

> shift\_verbose
> > If this is set, the shift builtin prints an error message when the shift count exceeds the number of positional parameters.

> sourcepath
> > If set, the source builtin uses the value of PATH to find the directory containing the file supplied as an argument. This option is enabled by default.

> xpg\_echo
> > If set, the echo builtin expands backslash-escape sequences by default.


> The return status when listing options is zero if all optnames are enabled, non-zero otherwise. When setting or unsetting options, the return status is zero unless an optname is not a valid shell option.

### Special Builtins ###

For historical reasons, the posix standard has classified several builtin commands as special. When Bash is executing in posix mode, the special builtins differ from other builtin commands in three respects:

  1. Special builtins are found before shell functions during command lookup.
> 2. If a special builtin returns an error status, a non-interactive shell exits.
> 3. Assignment statements preceding the command stay in effect in the shell environment after the command completes.

When Bash is not executing in posix mode, these builtins behave no differently than the rest of the Bash builtin commands. The Bash posix mode is described in Bash POSIX Mode.

These are the posix special builtins:

> break : . continue eval exec exit export readonly return set
> shift trap unset

## Shell Variables ##

  * Bourne Shell Variables: Variables which Bash uses in the same way as the Bourne Shell.
  * Bash Variables: List of variables that exist in Bash.

This chapter describes the shell variables that Bash uses. Bash automatically assigns default values to a number of variables.

### Bourne Shell Variables ###

Bash uses certain shell variables in the same way as the Bourne shell. In some cases, Bash assigns a default value to the variable.

CDPATH
> A colon-separated list of directories used as a search path for the cd builtin command.
HOME
> The current user's home directory; the default for the cd builtin command. The value of this variable is also used by tilde expansion (see Tilde Expansion).
IFS
> A list of characters that separate fields; used when the shell splits words as part of expansion.
MAIL
> If this parameter is set to a filename and the MAILPATH variable is not set, Bash informs the user of the arrival of mail in the specified file.
MAILPATH
> A colon-separated list of filenames which the shell periodically checks for new mail. Each list entry can specify the message that is printed when new mail arrives in the mail file by separating the file name from the message with a ‘?’. When used in the text of the message, $_expands to the name of the current mail file.
OPTARG
> The value of the last option argument processed by the getopts builtin.
OPTIND
> The index of the last option argument processed by the getopts builtin.
PATH
> A colon-separated list of directories in which the shell looks for commands. A zero-length (null) directory name in the value of PATH indicates the current directory. A null directory name may appear as two adjacent colons, or as an initial or trailing colon.
PS1
> The primary prompt string. The default value is ‘\s-\v\$ ’. See Printing a Prompt, for the complete list of escape sequences that are expanded before PS1 is displayed.
PS2
> The secondary prompt string. The default value is ‘> ’._

### Bash Variables ###

These variables are set or used by Bash, but other shells do not normally treat them specially.

A few variables used by Bash are described in different chapters: variables for controlling the job control facilities (see Job Control Variables).

BASH
> The full pathname used to execute the current instance of Bash.
BASHPID
> Expands to the process id of the current Bash process. This differs from $$ under certain circumstances, such as subshells that do not require Bash to be re-initialized.
BASH\_ALIASES
> An associative array variable whose members correspond to the internal list of aliases as maintained by the alias builtin (see Bourne Shell Builtins). Elements added to this array appear in the alias list; unsetting array elements cause aliases to be removed from the alias list.
BASH\_ARGC
> An array variable whose values are the number of parameters in each frame of the current bash execution call stack. The number of parameters to the current subroutine (shell function or script executed with . or source) is at the top of the stack. When a subroutine is executed, the number of parameters passed is pushed onto BASH\_ARGC. The shell sets BASH\_ARGC only when in extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin).
BASH\_ARGV
> An array variable containing all of the parameters in the current bash execution call stack. The final parameter of the last subroutine call is at the top of the stack; the first parameter of the initial call is at the bottom. When a subroutine is executed, the parameters supplied are pushed onto BASH\_ARGV. The shell sets BASH\_ARGV only when in extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin).
BASH\_CMDS
> An associative array variable whose members correspond to the internal hash table of commands as maintained by the hash builtin (see Bourne Shell Builtins). Elements added to this array appear in the hash table; unsetting array elements cause commands to be removed from the hash table.
BASH\_COMMAND
> The command currently being executed or about to be executed, unless the shell is executing a command as the result of a trap, in which case it is the command executing at the time of the trap.
BASH\_ENV
> If this variable is set when Bash is invoked to execute a shell script, its value is expanded and used as the name of a startup file to read before executing the script. See Bash Startup Files.
BASH\_EXECUTION\_STRING
> The command argument to the -c invocation option.
BASH\_LINENO
> An array variable whose members are the line numbers in source files corresponding to each member of FUNCNAME. ${BASH\_LINENO[$i]} is the line number in the source file where ${FUNCNAME[$i]} was called (or ${BASH\_LINENO[$i-1]} if referenced within another shell function). The corresponding source file name is ${BASH\_SOURCE[$i]}. Use LINENO to obtain the current line number.
BASH\_REMATCH
> An array variable whose members are assigned by the ‘=~’ binary operator to the [[ conditional command (see Conditional Constructs). The element with index 0 is the portion of the string matching the entire regular expression. The element with index n is the portion of the string matching the nth parenthesized subexpression. This variable is read-only.
BASH\_SOURCE
> An array variable whose members are the source filenames corresponding to the elements in the FUNCNAME array variable.
BASH\_SUBSHELL
> Incremented by one each time a subshell or subshell environment is spawned. The initial value is 0.
BASH\_VERSINFO
> A readonly array variable (see Arrays) whose members hold version information for this instance of Bash. The values assigned to the array members are as follows:

> BASH\_VERSINFO[0](0.md)
> > The major version number (the release).

> BASH\_VERSINFO[1](1.md)
> > The minor version number (the version).

> BASH\_VERSINFO[2](2.md)
> > The patch level.

> BASH\_VERSINFO[3](3.md)
> > The build version.

> BASH\_VERSINFO[4](4.md)
> > The release status (e.g., beta1).

> BASH\_VERSINFO[5](5.md)
> > The value of MACHTYPE.


BASH\_VERSION

> The version number of the current instance of Bash.
COLUMNS
> Used by the select builtin command to determine the terminal width when printing selection lists. Automatically set upon receipt of a SIGWINCH.
COMP\_CWORD
> An index into ${COMP\_WORDS} of the word containing the current cursor position. This variable is available only in shell functions invoked by the programmable completion facilities (see Programmable Completion).
COMP\_LINE
> The current command line. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).
COMP\_POINT
> The index of the current cursor position relative to the beginning of the current command. If the current cursor position is at the end of the current command, the value of this variable is equal to ${#COMP\_LINE}. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).
COMP\_TYPE
> Set to an integer value corresponding to the type of completion attempted that caused a completion function to be called: TAB, for normal completion, ‘?’, for listing completions after successive tabs, ‘!’, for listing alternatives on partial word completion, ‘@’, to list completions if the word is not unmodified, or ‘%’, for menu completion. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).
COMP\_KEY
> The key (or final key of a key sequence) used to invoke the current completion function.
COMP\_WORDBREAKS
> The set of characters that the Readline library treats as word separators when performing word completion. If COMP\_WORDBREAKS is unset, it loses its special properties, even if it is subsequently reset.
COMP\_WORDS
> An array variable consisting of the individual words in the current command line. The line is split into words as Readline would split it, using COMP\_WORDBREAKS as described above. This variable is available only in shell functions invoked by the programmable completion facilities (see Programmable Completion).
COMPREPLY
> An array variable from which Bash reads the possible completions generated by a shell function invoked by the programmable completion facility (see Programmable Completion).
DIRSTACK
> An array variable containing the current contents of the directory stack. Directories appear in the stack in the order they are displayed by the dirs builtin. Assigning to members of this array variable may be used to modify directories already in the stack, but the pushd and popd builtins must be used to add and remove directories. Assignment to this variable will not change the current directory. If DIRSTACK is unset, it loses its special properties, even if it is subsequently reset.
EMACS
> If Bash finds this variable in the environment when the shell starts with value ‘t’, it assumes that the shell is running in an emacs shell buffer and disables line editing.
EUID
> The numeric effective user id of the current user. This variable is readonly.
FCEDIT
> The editor used as a default by the -e option to the fc builtin command.
FIGNORE
> A colon-separated list of suffixes to ignore when performing filename completion. A file name whose suffix matches one of the entries in FIGNORE is excluded from the list of matched file names. A sample value is ‘.o:~’
FUNCNAME
> An array variable containing the names of all shell functions currently in the execution call stack. The element with index 0 is the name of any currently-executing shell function. The bottom-most element is "main". This variable exists only when a shell function is executing. Assignments to FUNCNAME have no effect and return an error status. If FUNCNAME is unset, it loses its special properties, even if it is subsequently reset.
GLOBIGNORE
> A colon-separated list of patterns defining the set of filenames to be ignored by filename expansion. If a filename matched by a filename expansion pattern also matches one of the patterns in GLOBIGNORE, it is removed from the list of matches.
GROUPS
> An array variable containing the list of groups of which the current user is a member. Assignments to GROUPS have no effect and return an error status. If GROUPS is unset, it loses its special properties, even if it is subsequently reset.
histchars
> Up to three characters which control history expansion, quick substitution, and tokenization (see History Interaction). The first character is the history expansion character, that is, the character which signifies the start of a history expansion, normally ‘!’. The second character is the character which signifies `quick substitution' when seen as the first character on a line, normally ‘^’. The optional third character is the character which indicates that the remainder of the line is a comment when found as the first character of a word, usually ‘#’. The history comment character causes history substitution to be skipped for the remaining words on the line. It does not necessarily cause the shell parser to treat the rest of the line as a comment.
HISTCMD
> The history number, or index in the history list, of the current command. If HISTCMD is unset, it loses its special properties, even if it is subsequently reset.
HISTCONTROL
> A colon-separated list of values controlling how commands are saved on the history list. If the list of values includes ‘ignorespace’, lines which begin with a space character are not saved in the history list. A value of ‘ignoredups’ causes lines which match the previous history entry to not be saved. A value of ‘ignoreboth’ is shorthand for ‘ignorespace’ and ‘ignoredups’. A value of ‘erasedups’ causes all previous lines matching the current line to be removed from the history list before that line is saved. Any value not in the above list is ignored. If HISTCONTROL is unset, or does not include a valid value, all lines read by the shell parser are saved on the history list, subject to the value of HISTIGNORE. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTCONTROL.
HISTFILE
> The name of the file to which the command history is saved. The default value is ~/.bash\_history.
HISTFILESIZE
> The maximum number of lines contained in the history file. When this variable is assigned a value, the history file is truncated, if necessary, by removing the oldest entries, to contain no more than that number of lines. The history file is also truncated to this size after writing it when an interactive shell exits. The default value is 500.
HISTIGNORE
> A colon-separated list of patterns used to decide which command lines should be saved on the history list. Each pattern is anchored at the beginning of the line and must match the complete line (no implicit `‘*’` is appended). Each pattern is tested against the line after the checks specified by HISTCONTROL are applied. In addition to the normal shell pattern matching characters, ‘&’ matches the previous history line. ‘&’ may be escaped using a backslash; the backslash is removed before attempting a match. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTIGNORE.

> HISTIGNORE subsumes the function of HISTCONTROL. A pattern of ‘&’ is identical to ignoredups, and a pattern of ‘[ ]`*`’ is identical to ignorespace. Combining these two patterns, separating them with a colon, provides the functionality of ignoreboth.
HISTSIZE
> The maximum number of commands to remember on the history list. The default value is 500.
HISTTIMEFORMAT
> If this variable is set and not null, its value is used as a format string for strftime to print the time stamp associated with each history entry displayed by the history builtin. If this variable is set, time stamps are written to the history file so they may be preserved across shell sessions. This uses the history comment character to distinguish timestamps from other history lines.
HOSTFILE
> Contains the name of a file in the same format as /etc/hosts that should be read when the shell needs to complete a hostname. The list of possible hostname completions may be changed while the shell is running; the next time hostname completion is attempted after the value is changed, Bash adds the contents of the new file to the existing list. If HOSTFILE is set, but has no value, Bash attempts to read /etc/hosts to obtain the list of possible hostname completions. When HOSTFILE is unset, the hostname list is cleared.
HOSTNAME
> The name of the current host.
HOSTTYPE
> A string describing the machine Bash is running on.
IGNOREEOF
> Controls the action of the shell on receipt of an EOF character as the sole input. If set, the value denotes the number of consecutive EOF characters that can be read as the first character on an input line before the shell will exit. If the variable exists but does not have a numeric value (or has no value) then the default is 10. If the variable does not exist, then EOF signifies the end of input to the shell. This is only in effect for interactive shells.
INPUTRC
> The name of the Readline initialization file, overriding the default of ~/.inputrc.
LANG
> Used to determine the locale category for any category not specifically selected with a variable starting with LC_.
LC\_ALL
> This variable overrides the value of LANG and any other LC_ variable specifying a locale category.
LC\_COLLATE
> This variable determines the collation order used when sorting the results of filename expansion, and determines the behavior of range expressions, equivalence classes, and collating sequences within filename expansion and pattern matching (see Filename Expansion).
LC\_CTYPE
> This variable determines the interpretation of characters and the behavior of character classes within filename expansion and pattern matching (see Filename Expansion).
LC\_MESSAGES
> This variable determines the locale used to translate double-quoted strings preceded by a ‘$’ (see Locale Translation).
LC\_NUMERIC
> This variable determines the locale category used for number formatting.
LINENO
> The line number in the script or shell function currently executing.
LINES
> Used by the select builtin command to determine the column length for printing selection lists. Automatically set upon receipt of a SIGWINCH.
MACHTYPE
> A string that fully describes the system type on which Bash is executing, in the standard gnu cpu-company-system format.
MAILCHECK
> How often (in seconds) that the shell should check for mail in the files specified in the MAILPATH or MAIL variables. The default is 60 seconds. When it is time to check for mail, the shell does so before displaying the primary prompt. If this variable is unset, or set to a value that is not a number greater than or equal to zero, the shell disables mail checking.
OLDPWD
> The previous working directory as set by the cd builtin.
OPTERR
> If set to the value 1, Bash displays error messages generated by the getopts builtin command.
OSTYPE
> A string describing the operating system Bash is running on.
PIPESTATUS
> An array variable (see Arrays) containing a list of exit status values from the processes in the most-recently-executed foreground pipeline (which may contain only a single command).
POSIXLY\_CORRECT
> If this variable is in the environment when bash starts, the shell enters posix mode (see Bash POSIX Mode) before reading the startup files, as if the --posix invocation option had been supplied. If it is set while the shell is running, bash enables posix mode, as if the command

> set -o posix

> had been executed.
PPID
> The process id of the shell's parent process. This variable is readonly.
PROMPT\_COMMAND
> If set, the value is interpreted as a command to execute before the printing of each primary prompt ($PS1).
PROMPT\_DIRTRIM
> If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the \w and \W prompt string escapes (see Printing a Prompt). Characters removed are replaced with an ellipsis.
PS3
> The value of this variable is used as the prompt for the select command. If this variable is not set, the select command prompts with ‘#? ’
PS4
> The value is the prompt printed before the command line is echoed when the -x option is set (see The Set Builtin). The first character of PS4 is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is ‘+ ’.
PWD
> The current working directory as set by the cd builtin.
RANDOM
> Each time this parameter is referenced, a random integer between 0 and 32767 is generated. Assigning a value to this variable seeds the random number generator.
REPLY
> The default variable for the read builtin.
SECONDS
> This variable expands to the number of seconds since the shell was started. Assignment to this variable resets the count to the value assigned, and the expanded value becomes the value assigned plus the number of seconds since the assignment.
SHELL
> The full pathname to the shell is kept in this environment variable. If it is not set when the shell starts, Bash assigns to it the full pathname of the current user's login shell.
SHELLOPTS
> A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -o option to the set builtin command (see The Set Builtin). The options appearing in SHELLOPTS are those reported as ‘on’ by ‘set -o’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.
SHLVL
> Incremented by one each time a new instance of Bash is started. This is intended to be a count of how deeply your Bash shells are nested.
TIMEFORMAT
> The value of this parameter is used as a format string specifying how the timing information for pipelines prefixed with the time reserved word should be displayed. The ‘%’ character introduces an escape sequence that is expanded to a time value or other information. The escape sequences and their meanings are as follows; the braces denote optional portions.

> %%
> > A literal ‘%’.

> %[p](p.md)[l](l.md)R
> > The elapsed time in seconds.

> %[p](p.md)[l](l.md)U
> > The number of CPU seconds spent in user mode.

> %[p](p.md)[l](l.md)S
> > The number of CPU seconds spent in system mode.

> %P
> > The CPU percentage, computed as (%U + %S) / %R.


> The optional p is a digit specifying the precision, the number of fractional digits after a decimal point. A value of 0 causes no decimal point or fraction to be output. At most three places after the decimal point may be specified; values of p greater than 3 are changed to 3. If p is not specified, the value 3 is used.

> The optional l specifies a longer format, including minutes, of the form MMmSS.FFs. The value of p determines whether or not the fraction is included.

> If this variable is not set, Bash acts as if it had the value

> $'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'

> If the value is null, no timing information is displayed. A trailing newline is added when the format string is displayed.
TMOUT
> If set to a value greater than zero, TMOUT is treated as the default timeout for the read builtin (see Bash Builtins). The select command (see Conditional Constructs) terminates if input does not arrive after TMOUT seconds when input is coming from a terminal.

> In an interactive shell, the value is interpreted as the number of seconds to wait for input after issuing the primary prompt when the shell is interactive. Bash terminates after that number of seconds if input does not arrive.
TMPDIR
> If set, Bash uses its value as the name of a directory in which Bash creates temporary files for the shell's use.
UID
> The numeric real user id of the current user. This variable is readonly.

## Bash Features ##

This section describes features unique to Bash.

  * Invoking Bash: Command line options that you can give to Bash.
  * Bash Startup Files: When and how Bash executes scripts.
  * Interactive Shells: What an interactive shell is.
  * Bash Conditional Expressions: Primitives used in composing expressions for the test builtin.
  * Shell Arithmetic: Arithmetic on shell variables.
  * Aliases: Substituting one command for another.
  * Arrays: Array Variables.
  * The Directory Stack: History of visited directories.
  * Printing a Prompt: Controlling the PS1 string.
  * The Restricted Shell: A more controlled mode of shell execution.
  * Bash POSIX Mode: Making Bash behave more closely to what the POSIX standard specifies.

### Invoking Bash ###

> bash [long-opt] [-ir] [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt\_option] [...](argument.md)
> bash [long-opt] [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt\_option] -c string [...](argument.md)
> bash [long-opt] -s [-abefhkmnptuvxdBCDHP] [-o option] [-O shopt\_option] [...](argument.md)

In addition to the single-character shell command-line options (see The Set Builtin), there are several multi-character options that you can use. These options must appear on the command line before the single-character options to be recognized.

--debugger
> Arrange for the debugger profile to be executed before the shell starts. Turns on extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin) and shell function tracing (see The Set Builtin for a description of the -o functrace option).
--dump-po-strings
> A list of all double-quoted strings preceded by ‘$’ is printed on the standard output in the gnu gettext PO (portable object) file format. Equivalent to -D except for the output format.
--dump-strings
> Equivalent to -D.
--help
> Display a usage message on standard output and exit successfully.
--init-file filename
--rcfile filename
> Execute commands from filename (instead of ~/.bashrc) in an interactive shell.
--login
> Equivalent to -l.
--noediting
> Do not use the gnu Readline library (see Command Line Editing) to read command lines when the shell is interactive.
--noprofile
> Don't load the system-wide startup file /etc/profile or any of the personal initialization files ~/.bash\_profile, ~/.bash\_login, or ~/.profile when Bash is invoked as a login shell.
--norc
> Don't read the ~/.bashrc initialization file in an interactive shell. This is on by default if the shell is invoked as sh.
--posix
> Change the behavior of Bash where the default operation differs from the posix standard to match the standard. This is intended to make Bash behave as a strict superset of that standard. See Bash POSIX Mode, for a description of the Bash posix mode.
--restricted
> Make the shell a restricted shell (see The Restricted Shell).
--verbose
> Equivalent to -v. Print shell input lines as they're read.
--version
> Show version information for this instance of Bash on the standard output and exit successfully.

There are several single-character options that may be supplied at invocation which are not available with the set builtin.

-c string
> Read and execute commands from string after processing the options, then exit. Any remaining arguments are assigned to the positional parameters, starting with $0.
-i
> Force the shell to run interactively. Interactive shells are described in Interactive Shells.
-l
> Make this shell act as if it had been directly invoked by login. When the shell is interactive, this is equivalent to starting a login shell with ‘exec -l bash’. When the shell is not interactive, the login shell startup files will be executed. ‘exec bash -l’ or ‘exec bash --login’ will replace the current shell with a Bash login shell. See Bash Startup Files, for a description of the special behavior of a login shell.
-r
> Make the shell a restricted shell (see The Restricted Shell).
-s
> If this option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell.
-D
> A list of all double-quoted strings preceded by ‘$’ is printed on the standard output. These are the strings that are subject to language translation when the current locale is not C or POSIX (see Locale Translation). This implies the -n option; no commands will be executed.
[-+]O [shopt\_option](shopt_option.md)
> shopt\_option is one of the shell options accepted by the shopt builtin (see The Shopt Builtin). If shopt\_option is present, -O sets the value of that option; +O unsets it. If shopt\_option is not supplied, the names and values of the shell options accepted by shopt are printed on the standard output. If the invocation option is +O, the output is displayed in a format that may be reused as input.
--
> A -- signals the end of options and disables further option processing. Any arguments after the -- are treated as filenames and arguments.

A login shell is one whose first character of argument zero is ‘-’, or one invoked with the --login option.

An interactive shell is one started without non-option arguments, unless -s is specified, without specifying the -c option, and whose input and output are both connected to terminals (as determined by isatty(3)), or one started with the -i option. See Interactive Shells, for more information.

If arguments remain after option processing, and neither the -c nor the -s option has been supplied, the first argument is assumed to be the name of a file containing shell commands (see Shell Scripts). When Bash is invoked in this fashion, $0 is set to the name of the file, and the positional parameters are set to the remaining arguments. Bash reads and executes commands from this file, then exits. Bash's exit status is the exit status of the last command executed in the script. If no commands are executed, the exit status is 0.

### Bash Startup Files ###

This section describes how Bash executes its startup files. If any of the files exist but cannot be read, Bash reports an error. Tildes are expanded in file names as described above under Tilde Expansion (see Tilde Expansion).

Interactive shells are described in Interactive Shells.
Invoked as an interactive login shell, or with --login

When Bash is invoked as an interactive login shell, or as a non-interactive shell with the --login option, it first reads and executes commands from the file /etc/profile, if that file exists. After reading that file, it looks for ~/.bash\_profile, ~/.bash\_login, and ~/.profile, in that order, and reads and executes commands from the first one that exists and is readable. The --noprofile option may be used when the shell is started to inhibit this behavior.

When a login shell exits, Bash reads and executes commands from the file ~/.bash\_logout, if it exists.
Invoked as an interactive non-login shell

When an interactive shell that is not a login shell is started, Bash reads and executes commands from ~/.bashrc, if that file exists. This may be inhibited by using the --norc option. The --rcfile file option will force Bash to read and execute commands from file instead of ~/.bashrc.

So, typically, your ~/.bash\_profile contains the line

> if [-f ~/.bashrc ](.md); then . ~/.bashrc; fi

after (or before) any login-specific initializations.
Invoked non-interactively

When Bash is started non-interactively, to run a shell script, for example, it looks for the variable BASH\_ENV in the environment, expands its value if it appears there, and uses the expanded value as the name of a file to read and execute. Bash behaves as if the following command were executed:

> if [-n "$BASH\_ENV" ](.md); then . "$BASH\_ENV"; fi

but the value of the PATH variable is not used to search for the file name.

As noted above, if a non-interactive shell is invoked with the --login option, Bash attempts to read and execute commands from the login shell startup files.
Invoked with name sh

If Bash is invoked with the name sh, it tries to mimic the startup behavior of historical versions of sh as closely as possible, while conforming to the posix standard as well.

When invoked as an interactive login shell, or as a non-interactive shell with the --login option, it first attempts to read and execute commands from /etc/profile and ~/.profile, in that order. The --noprofile option may be used to inhibit this behavior. When invoked as an interactive shell with the name sh, Bash looks for the variable ENV, expands its value if it is defined, and uses the expanded value as the name of a file to read and execute. Since a shell invoked as sh does not attempt to read and execute commands from any other startup files, the --rcfile option has no effect. A non-interactive shell invoked with the name sh does not attempt to read any other startup files.

When invoked as sh, Bash enters posix mode after the startup files are read.
Invoked in posix mode

When Bash is started in posix mode, as with the --posix command line option, it follows the posix standard for startup files. In this mode, interactive shells expand the ENV variable and commands are read and executed from the file whose name is the expanded value. No other startup files are read.
Invoked by remote shell daemon

Bash attempts to determine when it is being run with its standard input connected to a a network connection, as if by the remote shell daemon, usually rshd, or the secure shell daemon sshd. If Bash determines it is being run in this fashion, it reads and executes commands from ~/.bashrc, if that file exists and is readable. It will not do this if invoked as sh. The --norc option may be used to inhibit this behavior, and the --rcfile option may be used to force another file to be read, but rshd does not generally invoke the shell with those options or allow them to be specified.
Invoked with unequal effective and real uid/gids

If Bash is started with the effective user (group) id not equal to the real user (group) id, and the -p option is not supplied, no startup files are read, shell functions are not inherited from the environment, the SHELLOPTS variable, if it appears in the environment, is ignored, and the effective user id is set to the real user id. If the -p option is supplied at invocation, the startup behavior is the same, but the effective user id is not reset.

### Interactive Shells ###

  * What is an Interactive Shell?: What determines whether a shell is Interactive.
  * Is this Shell Interactive?: How to tell if a shell is interactive.
  * Interactive Shell Behavior: What changes in a interactive shell?

#### What is an Interactive Shell? ####

An interactive shell is one started without non-option arguments, unless -s is specified, without specifying the -c option, and whose input and error output are both connected to terminals (as determined by isatty(3)), or one started with the -i option.

An interactive shell generally reads from and writes to a user's terminal.

The -s invocation option may be used to set the positional parameters when an interactive shell is started.

#### Is this Shell Interactive? ####

To determine within a startup script whether or not Bash is running interactively, test the value of the ‘-’ special parameter. It contains i when the shell is interactive. For example:

> {{{case "$-" in
  * **)	echo This shell is interactive ;;
  * echo This shell is not interactive ;;
> esac}}}**

Alternatively, startup scripts may examine the variable PS1; it is unset in non-interactive shells, and set in interactive shells. Thus:

> if [-z "$PS1" ](.md); then
> > echo This shell is not interactive

> else
> > echo This shell is interactive

> fi


#### Interactive Shell Behavior ####

When the shell is running interactively, it changes its behavior in several ways.

  1. Startup files are read and executed as described in Bash Startup Files.
> 2. Job Control (see Job Control) is enabled by default. When job control is in effect, Bash ignores the keyboard-generated job control signals SIGTTIN, SIGTTOU, and SIGTSTP.
> 3. Bash expands and displays PS1 before reading the first line of a command, and expands and displays PS2 before reading the second and subsequent lines of a multi-line command.
> 4. Bash executes the value of the PROMPT\_COMMAND variable as a command before printing the primary prompt, $PS1 (see Bash Variables).
> 5. Readline (see Command Line Editing) is used to read commands from the user's terminal.
> 6. Bash inspects the value of the ignoreeof option to set -o instead of exiting immediately when it receives an EOF on its standard input when reading a command (see The Set Builtin).
> 7. Command history (see Bash History Facilities) and history expansion (see History Interaction) are enabled by default. Bash will save the command history to the file named by $HISTFILE when an interactive shell exits.
> 8. Alias expansion (see Aliases) is performed by default.
> 9. In the absence of any traps, Bash ignores SIGTERM (see Signals).
  1. . In the absence of any traps, SIGINT is caught and handled ((see Signals). SIGINT will interrupt some shell builtins.
  1. . An interactive login shell sends a SIGHUP to all jobs on exit if the huponexit shell option has been enabled (see Signals).
  1. . The -n invocation option is ignored, and ‘set -n’ has no effect (see The Set Builtin).
  1. . Bash will check for mail periodically, depending on the values of the MAIL, MAILPATH, and MAILCHECK shell variables (see Bash Variables).
  1. . Expansion errors due to references to unbound shell variables after ‘set -u’ has been enabled will not cause the shell to exit (see The Set Builtin).
  1. . The shell will not exit on expansion errors caused by var being unset or null in ${var:?word} expansions (see Shell Parameter Expansion).
  1. . Redirection errors encountered by shell builtins will not cause the shell to exit.
  1. . When running in posix mode, a special builtin returning an error status will not cause the shell to exit (see Bash POSIX Mode).
  1. . A failed exec will not cause the shell to exit (see Bourne Shell Builtins).
  1. . Parser syntax errors will not cause the shell to exit.
> 20. Simple spelling correction for directory arguments to the cd builtin is enabled by default (see the description of the cdspell option to the shopt builtin in The Shopt Builtin).
> 21. The shell will check the value of the TMOUT variable and exit if a command is not read within the specified number of seconds after printing $PS1 (see Bash Variables).

### Bash Conditional Expressions ###

Conditional expressions are used by the [[ compound command and the test and [ builtin commands.

Expressions may be unary or binary. Unary expressions are often used to examine the status of a file. There are string operators and numeric comparison operators as well. If the file argument to one of the primaries is of the form /dev/fd/N, then file descriptor N is checked. If the file argument to one of the primaries is one of /dev/stdin, /dev/stdout, or /dev/stderr, file descriptor 0, 1, or 2, respectively, is checked.

Unless otherwise specified, primaries that operate on files follow symbolic links and operate on the target of the link, rather than the link itself.

-a file
> True if file exists.
-b file
> True if file exists and is a block special file.
-c file
> True if file exists and is a character special file.
-d file
> True if file exists and is a directory.
-e file
> True if file exists.
-f file
> True if file exists and is a regular file.
-g file
> True if file exists and its set-group-id bit is set.
-h file
> True if file exists and is a symbolic link.
-k file
> True if file exists and its "sticky" bit is set.
-p file
> True if file exists and is a named pipe (FIFO).
-r file
> True if file exists and is readable.
-s file
> True if file exists and has a size greater than zero.
-t fd
> True if file descriptor fd is open and refers to a terminal.
-u file
> True if file exists and its set-user-id bit is set.
-w file
> True if file exists and is writable.
-x file
> True if file exists and is executable.
-O file
> True if file exists and is owned by the effective user id.
-G file
> True if file exists and is owned by the effective group id.
-L file
> True if file exists and is a symbolic link.
-S file
> True if file exists and is a socket.
-N file
> True if file exists and has been modified since it was last read.
file1 -nt file2
> True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not.
file1 -ot file2
> True if file1 is older than file2, or if file2 exists and file1 does not.
file1 -ef file2
> True if file1 and file2 refer to the same device and inode numbers.
-o optname
> True if shell option optname is enabled. The list of options appears in the description of the -o option to the set builtin (see The Set Builtin).
-z string
> True if the length of string is zero.
-n string
string
> True if the length of string is non-zero.
string1 == string2
> True if the strings are equal. ‘=’ may be used in place of ‘==’ for strict posix compliance.
string1 != string2
> True if the strings are not equal.
string1 < string2
> True if string1 sorts before string2 lexicographically in the current locale.
string1 > string2
> True if string1 sorts after string2 lexicographically in the current locale.
arg1 OP arg2
> OP is one of ‘-eq’, ‘-ne’, ‘-lt’, ‘-le’, ‘-gt’, or ‘-ge’. These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to arg2, respectively. Arg1 and arg2 may be positive or negative integers.


### Shell Arithmetic ###

The shell allows arithmetic expressions to be evaluated, as one of the shell expansions or by the let and the -i option to the declare builtins.

Evaluation is done in fixed-width integers with no check for overflow, though division by 0 is trapped and flagged as an error. The operators and their precedence, associativity, and values are the same as in the C language. The following list of operators is grouped into levels of equal-precedence operators. The levels are listed in order of decreasing precedence.

id++ id--
> variable post-increment and post-decrement
++id --id
> variable pre-increment and pre-decrement
- +
> unary minus and plus
! ~
> logical and bitwise negation
`**`
> exponentiation
`* / %`
> multiplication, division, remainder
+ -
> addition, subtraction
<< >>
> left and right bitwise shifts
`<= >= < >`
> comparison
`== !=`
> equality and inequality
&
> bitwise AND
^
> bitwise exclusive OR
|
> bitwise OR
&&
> logical AND

> logical OR
expr ? expr : expr
> conditional operator
`= *= /= %= += -= <<= >>= &= ^= |=`
> assignment
expr1 , expr2
> comma

Shell variables are allowed as operands; parameter expansion is performed before the expression is evaluated. Within an expression, shell variables may also be referenced by name without using the parameter expansion syntax. A shell variable that is null or unset evaluates to 0 when referenced by name without using the parameter expansion syntax. The value of a variable is evaluated as an arithmetic expression when it is referenced, or when a variable which has been given the integer attribute using ‘declare -i’ is assigned a value. A null value evaluates to 0. A shell variable need not have its integer attribute turned on to be used in an expression.

Constants with a leading 0 are interpreted as octal numbers. A leading ‘0x’ or ‘0X’ denotes hexadecimal. Otherwise, numbers take the form [base#](base#.md)n, where base is a decimal number between 2 and 64 representing the arithmetic base, and n is a number in that base. If base# is omitted, then base 10 is used. The digits greater than 9 are represented by the lowercase letters, the uppercase letters, ‘@’, and ‘_’, in that order. If base is less than or equal to 36, lowercase and uppercase letters may be used interchangeably to represent numbers between 10 and 35._

Operators are evaluated in order of precedence. Sub-expressions in parentheses are evaluated first and may override the precedence rules above.

### Aliases ###

Aliases allow a string to be substituted for a word when it is used as the first word of a simple command. The shell maintains a list of aliases that may be set and unset with the alias and unalias builtin commands.

The first word of each simple command, if unquoted, is checked to see if it has an alias. If so, that word is replaced by the text of the alias. The characters ‘/’, ‘$’, ‘`’, ‘=’ and any of the shell metacharacters or quoting characters listed above may not appear in an alias name. The replacement text may contain any valid shell input, including shell metacharacters. The first word of the replacement text is tested for aliases, but a word that is identical to an alias being expanded is not expanded a second time. This means that one may alias ls to "ls -F", for instance, and Bash does not try to recursively expand the replacement text. If the last character of the alias value is a space or tab character, then the next command word following the alias is also checked for alias expansion.

Aliases are created and listed with the alias command, and removed with the unalias command.

There is no mechanism for using arguments in the replacement text, as in csh. If arguments are needed, a shell function should be used (see Shell Functions).

Aliases are not expanded when the shell is not interactive, unless the expand\_aliases shell option is set using shopt (see The Shopt Builtin).

The rules concerning the definition and use of aliases are somewhat confusing. Bash always reads at least one complete line of input before executing any of the commands on that line. Aliases are expanded when a command is read, not when it is executed. Therefore, an alias definition appearing on the same line as another command does not take effect until the next line of input is read. The commands following the alias definition on that line are not affected by the new alias. This behavior is also an issue when functions are executed. Aliases are expanded when a function definition is read, not when the function is executed, because a function definition is itself a compound command. As a consequence, aliases defined in a function are not available until after that function is executed. To be safe, always put alias definitions on a separate line, and do not use alias in compound commands.

For almost every purpose, shell functions are preferred over aliases.

### Arrays ###

Bash provides one-dimensional indexed and associative array variables. Any variable may be used as an indexed array; the declare builtin will explicitly declare an array. There is no maximum limit on the size of an array, nor any requirement that members be indexed or assigned contiguously. Indexed arrays are referenced using integers (including arithmetic expressions (see Shell Arithmetic) and are zero-based; associative arrays use arbitrary strings.

An indexed array is created automatically if any variable is assigned to using the syntax

> name[subscript](subscript.md)=value

The subscript is treated as an arithmetic expression that must evaluate to a number greater than or equal to zero. To explicitly declare an array, use

> declare -a name

The syntax

> declare -a name[subscript](subscript.md)

is also accepted; the subscript is ignored.

Associative arrays are created using

> declare -A name.

Attributes may be specified for an array variable using the declare and readonly builtins. Each attribute applies to all members of an array.

Arrays are assigned to using compound assignments of the form

> name=(value1 ... valuen)

where each value is of the form [subscript](subscript.md)=string. Indexed array assignments do not require the bracket and subscript. When assigning to indexed arrays, if the optional subscript is supplied, that index is assigned to; otherwise the index of the element assigned is the last index assigned to by the statement plus one. Indexing starts at zero.

When assigning to an associative array, the subscript is required.

This syntax is also accepted by the declare builtin. Individual array elements may be assigned to using the name[subscript](subscript.md)=value syntax introduced above.

Any element of an array may be referenced using ${name[subscript](subscript.md)}. The braces are required to avoid conflicts with the shell's filename expansion operators. If the subscript is ‘@’ or `‘*’`, the word expands to all members of the array name. These subscripts differ only when the word appears within double quotes. If the word is double-quoted, ${name[`*`]} expands to a single word with the value of each array member separated by the first character of the IFS variable, and ${name[@]} expands each element of name to a separate word. When there are no array members, ${name[@]} expands to nothing. If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. This is analogous to the expansion of the special parameters ‘@’ and `‘*’`. ${#name[subscript](subscript.md)} expands to the length of ${name[subscript](subscript.md)}. If subscript is ‘@’ or `‘*’`, the expansion is the number of elements in the array. Referencing an array variable without a subscript is equivalent to referencing with a subscript of 0.

The unset builtin is used to destroy arrays. unset name[subscript](subscript.md) destroys the array element at index subscript. Care must be taken to avoid unwanted side effects caused by filename generation. unset name, where name is an array, removes the entire array. A subscript of `‘*’` or ‘@’ also removes the entire array.

The declare, local, and readonly builtins each accept a -a option to specify an indexed array and a -A option to specify an associative array. The read builtin accepts a -a option to assign a list of words read from the standard input to an array, and can read values from the standard input into individual array elements. The set and declare builtins display array values in a way that allows them to be reused as input.

### The Directory Stack ###

  * Directory Stack Builtins: Bash builtin commands to manipulate the directory stack.

The directory stack is a list of recently-visited directories. The pushd builtin adds directories to the stack as it changes the current directory, and the popd builtin removes specified directories from the stack and changes the current directory to the directory removed. The dirs builtin displays the contents of the directory stack.

The contents of the directory stack are also visible as the value of the DIRSTACK shell variable.


#### Directory Stack Builtins ####

dirs

> dirs [+N | -N] [-clpv]

> Display the list of currently remembered directories. Directories are added to the list with the pushd command; the popd command removes directories from the list.

> +N
> > Displays the Nth directory (counting from the left of the list printed by dirs when invoked without options), starting with zero.

> -N
> > Displays the Nth directory (counting from the right of the list printed by dirs when invoked without options), starting with zero.

> -c
> > Clears the directory stack by deleting all of the elements.

> -l
> > Produces a longer listing; the default listing format uses a tilde to denote the home directory.

> -p
> > Causes dirs to print the directory stack with one entry per line.

> -v
> > Causes dirs to print the directory stack with one entry per line, prefixing each entry with its index in the stack.


popd


> popd [+N | -N] [-n]

> Remove the top entry from the directory stack, and cd to the new top directory. When no arguments are given, popd removes the top directory from the stack and performs a cd to the new top directory. The elements are numbered from 0 starting at the first directory listed with dirs; i.e., popd is equivalent to popd +0.

> +N
> > Removes the Nth directory (counting from the left of the list printed by dirs), starting with zero.

> -N
> > Removes the Nth directory (counting from the right of the list printed by dirs), starting with zero.

> -n
> > Suppresses the normal change of directory when removing directories from the stack, so that only the stack is manipulated.


pushd


> pushd [-n] [+N | -N | dir ]

> Save the current directory on the top of the directory stack and then cd to dir. With no arguments, pushd exchanges the top two directories.

> -n
> > Suppresses the normal change of directory when adding directories to the stack, so that only the stack is manipulated.

> +N
> > Brings the Nth directory (counting from the left of the list printed by dirs, starting with zero) to the top of the list by rotating the stack.

> -N
> > Brings the Nth directory (counting from the right of the list printed by dirs, starting with zero) to the top of the list by rotating the stack.

> dir
> > Makes the current working directory be the top of the stack, and then executes the equivalent of `cd dir'. cds to dir.

### Controlling the Prompt ###

The value of the variable PROMPT\_COMMAND is examined just before Bash prints each primary prompt. If PROMPT\_COMMAND is set and has a non-null value, then the value is executed just as if it had been typed on the command line.

In addition, the following table describes the special characters which can appear in the prompt variables:

\a

> A bell character.
\d
> The date, in "Weekday Month Date" format (e.g., "Tue May 26").
\D{format}
> The format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required.
\e
> An escape character.
\h
> The hostname, up to the first `.'.
\H
> The hostname.
\j
> The number of jobs currently managed by the shell.
\l
> The basename of the shell's terminal device name.
\n
> A newline.
\r
> A carriage return.
\s
> The name of the shell, the basename of $0 (the portion following the final slash).
\t
> The time, in 24-hour HH:MM:SS format.
\T
> The time, in 12-hour HH:MM:SS format.
\@
> The time, in 12-hour am/pm format.
\A
> The time, in 24-hour HH:MM format.
\u
> The username of the current user.
\v
> The version of Bash (e.g., 2.00)
\V
> The release of Bash, version + patchlevel (e.g., 2.00.0)
\w
> The current working directory, with $HOME abbreviated with a tilde (uses the $PROMPT\_DIRTRIM variable).
\W
> The basename of $PWD, with $HOME abbreviated with a tilde.
\!
> The history number of this command.
\#
> The command number of this command.
\$
> If the effective uid is 0, #, otherwise $.
\nnn
> The character whose ASCII code is the octal value nnn.
\\
> A backslash.
\[
> Begin a sequence of non-printing characters. This could be used to embed a terminal control sequence into the prompt.
\]
> End a sequence of non-printing characters.

The command number and the history number are usually different: the history number of a command is its position in the history list, which may include commands restored from the history file (see Bash History Facilities), while the command number is the position in the sequence of commands executed during the current shell session.

After the string is decoded, it is expanded via parameter expansion, command substitution, arithmetic expansion, and quote removal, subject to the value of the promptvars shell option (see Bash Builtins).

### The Restricted Shell ###

If Bash is started with the name rbash, or the --restricted or -r option is supplied at invocation, the shell becomes restricted. A restricted shell is used to set up an environment more controlled than the standard shell. A restricted shell behaves identically to bash with the exception that the following are disallowed or not performed:

  * Changing directories with the cd builtin.
  * Setting or unsetting the values of the SHELL, PATH, ENV, or BASH\_ENV variables.
  * Specifying command names containing slashes.
  * Specifying a filename containing a slash as an argument to the . builtin command.
  * Specifying a filename containing a slash as an argument to the -p option to the hash builtin command.
  * Importing function definitions from the shell environment at startup.
  * Parsing the value of SHELLOPTS from the shell environment at startup.
  * Redirecting output using the ‘>’, ‘>|’, ‘<>’, ‘>&’, ‘&>’, and ‘>>’ redirection operators.
  * Using the exec builtin to replace the shell with another command.
  * Adding or deleting builtin commands with the -f and -d options to the enable builtin.
  * Using the enable builtin command to enable disabled shell builtins.
  * Specifying the -p option to the command builtin.
  * Turning off restricted mode with ‘set +r’ or ‘set +o restricted’.

These restrictions are enforced after any startup files are read.

When a command that is found to be a shell script is executed (see Shell Scripts), rbash turns off any restrictions in the shell spawned to execute the script.

### Bash POSIX Mode ###

Starting Bash with the --posix command-line option or executing ‘set -o posix’ while Bash is running will cause Bash to conform more closely to the posix standard by changing the behavior to match that specified by posix in areas where the Bash default differs.

When invoked as sh, Bash enters posix mode after reading the startup files.

The following list is what's changed when `posix mode' is in effect:

  1. When a command in the hash table no longer exists, Bash will re-search $PATH to find the new location. This is also available with ‘shopt -s checkhash’.
> 2. The message printed by the job control code and builtins when a job exits with a non-zero status is `Done(status)'.
> 3. The message printed by the job control code and builtins when a job is stopped is `Stopped(signame)', where signame is, for example, SIGTSTP.
> 4. The bg builtin uses the required format to describe each job placed in the background, which does not include an indication of whether the job is the current or previous job.
> 5. Reserved words appearing in a context where reserved words are recognized do not undergo alias expansion.
> 6. The posix PS1 and PS2 expansions of ‘!’ to the history number and ‘!!’ to ‘!’ are enabled, and parameter expansion is performed on the values of PS1 and PS2 regardless of the setting of the promptvars option.
> 7. The posix startup files are executed ($ENV) rather than the normal Bash files.
> 8. Tilde expansion is only performed on assignments preceding a command name, rather than on all assignment statements on the line.
> 9. The default history file is ~/.sh\_history (this is the default value of $HISTFILE).
  1. . The output of ‘kill -l’ prints all the signal names on a single line, separated by spaces, without the ‘SIG’ prefix.
  1. . The kill builtin does not accept signal names with a ‘SIG’ prefix.
  1. . Non-interactive shells exit if filename in . filename is not found.
  1. . Non-interactive shells exit if a syntax error in an arithmetic expansion results in an invalid expression.
  1. . Redirection operators do not perform filename expansion on the word in the redirection unless the shell is interactive.
  1. . Redirection operators do not perform word splitting on the word in the redirection.
  1. . Function names must be valid shell names. That is, they may not contain characters other than letters, digits, and underscores, and may not start with a digit. Declaring a function with an invalid name causes a fatal syntax error in non-interactive shells.
  1. . posix special builtins are found before shell functions during command lookup.
  1. . If a posix special builtin returns an error status, a non-interactive shell exits. The fatal errors are those listed in the POSIX standard, and include things like passing incorrect options, redirection errors, variable assignment errors for assignments preceding the command name, and so on.
  1. . If CDPATH is set, the cd builtin will not implicitly append the current directory to it. This means that cd will fail if no valid directory name can be constructed from any of the entries in $CDPATH, even if the a directory with the same name as the name given as an argument to cd exists in the current directory.
> 20. A non-interactive shell exits with an error status if a variable assignment error occurs when no command name follows the assignment statements. A variable assignment error occurs, for example, when trying to assign a value to a readonly variable.
> 21. A non-interactive shell exits with an error status if the iteration variable in a for statement or the selection variable in a select statement is a readonly variable.
> 22. Process substitution is not available.
> 23. Assignment statements preceding posix special builtins persist in the shell environment after the builtin completes.
> 24. Assignment statements preceding shell function calls persist in the shell environment after the function returns, as if a posix special builtin command had been executed.
> 25. The export and readonly builtin commands display their output in the format required by posix.
> 26. The trap builtin displays signal names without the leading SIG.
> 27. The trap builtin doesn't check the first argument for a possible signal specification and revert the signal handling to the original disposition if it is, unless that argument consists solely of digits and is a valid signal number. If users want to reset the handler for a given signal to the original disposition, they should use ‘-’ as the first argument.
> 28. The . and source builtins do not search the current directory for the filename argument if it is not found by searching PATH.
> 29. Subshells spawned to execute command substitutions inherit the value of the -e option from the parent shell. When not in posix mode, Bash clears the -e option in such subshells.
> 30. Alias expansion is always enabled, even in non-interactive shells.
> 31. When the alias builtin displays alias definitions, it does not display them with a leading ‘alias ’ unless the -p option is supplied.
> 32. When the set builtin is invoked without options, it does not display shell function names and definitions.
> 33. When the set builtin is invoked without options, it displays variable values without quotes, unless they contain shell metacharacters, even if the result contains nonprinting characters.
> 34. When the cd builtin is invoked in logical mode, and the pathname constructed from $PWD and the directory name supplied as an argument does not refer to an existing directory, cd will fail instead of falling back to physical mode.
> 35. When the pwd builtin is supplied the -P option, it resets $PWD to a pathname containing no symlinks.
> 36. The pwd builtin verifies that the value it prints is the same as the current directory, even if it is not asked to check the file system with the -P option.
> 37. When listing the history, the fc builtin does not include an indication of whether or not a history entry has been modified.
> 38. The default editor used by fc is ed.
> 39. The type and command builtins will not report a non-executable file as having been found, though the shell will attempt to execute such a file if it is the only so-named file found in $PATH.
> 40. The vi editing mode will invoke the vi editor directly when the ‘v’ command is run, instead of checking $VISUAL and $EDITOR.
> 41. When the xpg\_echo option is enabled, Bash does not attempt to interpret any arguments to echo as options. Each argument is displayed, after escape characters are converted.
> 42. The ulimit builtin uses a block size of 512 bytes for the -c and -f options.

There is other posix behavior that Bash does not implement by default even when in posix mode. Specifically:

  1. The fc builtin checks $EDITOR as a program to edit history entries if FCEDIT is unset, rather than defaulting directly to ed. fc uses ed if EDITOR is unset.
> 2. As noted above, Bash requires the xpg\_echo option to be enabled for the echo builtin to be fully conformant.

Bash can be configured to be posix-conformant by default, by specifying the --enable-strict-posix-default to configure when building (see Optional Features).

## Job Control ##

This chapter discusses what job control is, how it works, and how Bash allows you to access its facilities.

  * Job Control Basics: How job control works.
  * Job Control Builtins: Bash builtin commands used to interact with job control.
  * Job Control Variables: Variables Bash uses to customize job control.

### Job Control Basics ###

Job control refers to the ability to selectively stop (suspend) the execution of processes and continue (resume) their execution at a later point. A user typically employs this facility via an interactive interface supplied jointly by the system's terminal driver and Bash.

The shell associates a job with each pipeline. It keeps a table of currently executing jobs, which may be listed with the jobs command. When Bash starts a job asynchronously, it prints a line that looks like:

> [1](1.md) 25647

indicating that this job is job number 1 and that the process id of the last process in the pipeline associated with this job is 25647. All of the processes in a single pipeline are members of the same job. Bash uses the job abstraction as the basis for job control.

To facilitate the implementation of the user interface to job control, the operating system maintains the notion of a current terminal process group id. Members of this process group (processes whose process group id is equal to the current terminal process group id) receive keyboard-generated signals such as SIGINT. These processes are said to be in the foreground. Background processes are those whose process group id differs from the terminal's; such processes are immune to keyboard-generated signals. Only foreground processes are allowed to read from or write to the terminal. Background processes which attempt to read from (write to) the terminal are sent a SIGTTIN (SIGTTOU) signal by the terminal driver, which, unless caught, suspends the process.

If the operating system on which Bash is running supports job control, Bash contains facilities to use it. Typing the suspend character (typically ‘<sup>Z’, Control-Z) while a process is running causes that process to be stopped and returns control to Bash. Typing the delayed suspend character (typically ‘</sup>Y’, Control-Y) causes the process to be stopped when it attempts to read input from the terminal, and control to be returned to Bash. The user then manipulates the state of this job, using the bg command to continue it in the background, the fg command to continue it in the foreground, or the kill command to kill it. A ‘^Z’ takes effect immediately, and has the additional side effect of causing pending output and typeahead to be discarded.

There are a number of ways to refer to a job in the shell. The character ‘%’ introduces a job specification (jobspec).

Job number n may be referred to as ‘%n’. The symbols ‘%%’ and ‘%+’ refer to the shell's notion of the current job, which is the last job stopped while it was in the foreground or started in the background. A single ‘%’ (with no accompanying job specification) also refers to the current job. The previous job may be referenced using ‘%-’. If there is only a single job, ‘%+’ and ‘%-’ can both be used to refer to that job. In output pertaining to jobs (e.g., the output of the jobs command), the current job is always flagged with a ‘+’, and the previous job with a ‘-’.

A job may also be referred to using a prefix of the name used to start it, or using a substring that appears in its command line. For example, ‘%ce’ refers to a stopped ce job. Using ‘%?ce’, on the other hand, refers to any job containing the string ‘ce’ in its command line. If the prefix or substring matches more than one job, Bash reports an error.

Simply naming a job can be used to bring it into the foreground: ‘%1’ is a synonym for ‘fg %1’, bringing job 1 from the background into the foreground. Similarly, ‘%1 &’ resumes job 1 in the background, equivalent to ‘bg %1’

The shell learns immediately whenever a job changes state. Normally, Bash waits until it is about to print a prompt before reporting changes in a job's status so as to not interrupt any other output. If the -b option to the set builtin is enabled, Bash reports such changes immediately (see The Set Builtin). Any trap on SIGCHLD is executed for each child process that exits.

If an attempt to exit Bash is made while jobs are stopped, (or running, if the checkjobs option is enabled – see The Shopt Builtin), the shell prints a warning message, and if the checkjobs option is enabled, lists the jobs and their statuses. The jobs command may then be used to inspect their status. If a second attempt to exit is made without an intervening command, Bash does not print another warning, and any stopped jobs are terminated.

### Job Control Builtins ###

bg

> bg [...](jobspec.md)

> Resume each suspended job jobspec in the background, as if it had been started with ‘&’. If jobspec is not supplied, the current job is used. The return status is zero unless it is run when job control is not enabled, or, when run with job control enabled, any jobspec was not found or specifies a job that was started without job control.
fg

> fg [jobspec](jobspec.md)

> Resume the job jobspec in the foreground and make it the current job. If jobspec is not supplied, the current job is used. The return status is that of the command placed into the foreground, or non-zero if run when job control is disabled or, when run with job control enabled, jobspec does not specify a valid job or jobspec specifies a job that was started without job control.
jobs

> jobs [-lnprs] [jobspec](jobspec.md)
> jobs -x command [arguments](arguments.md)

> The first form lists the active jobs. The options have the following meanings:

> -l
> > List process ids in addition to the normal information.

> -n
> > Display information only about jobs that have changed status since the user was last notified of their status.

> -p
> > List only the process id of the job's process group leader.

> -r
> > Restrict output to running jobs.

> -s
> > Restrict output to stopped jobs.


> If jobspec is given, output is restricted to information about that job. If jobspec is not supplied, the status of all jobs is listed.

> If the -x option is supplied, jobs replaces any jobspec found in command or arguments with the corresponding process group id, and executes command, passing it arguments, returning its exit status.
kill

> kill [-s sigspec] [-n signum] [-sigspec] jobspec or pid
> kill -l [exit\_status](exit_status.md)

> Send a signal specified by sigspec or signum to the process named by job specification jobspec or process id pid. sigspec is either a case-insensitive signal name such as SIGINT (with or without the SIG prefix) or a signal number; signum is a signal number. If sigspec and signum are not present, SIGTERM is used. The -l option lists the signal names. If any arguments are supplied when -l is given, the names of the signals corresponding to the arguments are listed, and the return status is zero. exit\_status is a number specifying a signal number or the exit status of a process terminated by a signal. The return status is zero if at least one signal was successfully sent, or non-zero if an error occurs or an invalid option is encountered.
wait

> wait [or pid ...](jobspec.md)

> Wait until the child process specified by each process id pid or job specification jobspec exits and return the exit status of the last command waited for. If a job spec is given, all processes in the job are waited for. If no arguments are given, all currently active child processes are waited for, and the return status is zero. If neither jobspec nor pid specifies an active child process of the shell, the return status is 127.
disown

> disown [-ar] [-h] [...](jobspec.md)

> Without options, each jobspec is removed from the table of active jobs. If the -h option is given, the job is not removed from the table, but is marked so that SIGHUP is not sent to the job if the shell receives a SIGHUP. If jobspec is not present, and neither the -a nor -r option is supplied, the current job is used. If no jobspec is supplied, the -a option means to remove or mark all jobs; the -r option without a jobspec argument restricts operation to running jobs.
suspend

> suspend [-f]

> Suspend the execution of this shell until it receives a SIGCONT signal. A login shell cannot be suspended; the -f option can be used to override this and force the suspension.

When job control is not active, the kill and wait builtins do not accept jobspec arguments. They must be supplied process ids.


### Job Control Variables ###

auto\_resume
> This variable controls how the shell interacts with the user and job control. If this variable exists then single word simple commands without redirections are treated as candidates for resumption of an existing job. There is no ambiguity allowed; if there is more than one job beginning with the string typed, then the most recently accessed job will be selected. The name of a stopped job, in this context, is the command line used to start it. If this variable is set to the value ‘exact’, the string supplied must match the name of a stopped job exactly; if set to ‘substring’, the string supplied needs to match a substring of the name of a stopped job. The ‘substring’ value provides functionality analogous to the ‘%?’ job id (see Job Control Basics). If set to any other value, the supplied string must be a prefix of a stopped job's name; this provides functionality analogous to the ‘%’ job id.

## Command Line Editing ##

This chapter describes the basic features of the gnu command line editing interface. Command line editing is provided by the Readline library, which is used by several different programs, including Bash. Command line editing is enabled by default when using an interactive shell, unless the --noediting option is supplied at shell invocation. Line editing is also used when using the -e option to the read builtin command (see Bash Builtins). By default, the line editing commands are similar to those of emacs. A vi-style line editing interface is also available. Line editing can be enabled at any time using the -o emacs or -o vi options to the set builtin command (see The Set Builtin), or disabled using the +o emacs or +o vi options to set.

  * Introduction and Notation: Notation used in this text.
  * Readline Interaction: The minimum set of commands for editing a line.
  * Readline Init File: Customizing Readline from a user's view.
  * Bindable Readline Commands: A description of most of the Readline commands available for binding
  * Readline vi Mode: A short description of how to make Readline behave like the vi editor.
  * Programmable Completion: How to specify the possible completions for a specific command.
  * Programmable Completion Builtins: Builtin commands to specify how to complete arguments for a particular command.

### Introduction to Line Editing ###
The following paragraphs describe the notation used to represent keystrokes.

The text C-k is read as `Control-K' and describes the character produced when the 

&lt;k&gt;

 key is pressed while the Control key is depressed.

The text M-k is read as `Meta-K' and describes the character produced when the Meta key (if you have one) is depressed, and the 

&lt;k&gt;

 key is pressed. The Meta key is labeled 

&lt;ALT&gt;

 on many keyboards. On keyboards with two keys labeled 

&lt;ALT&gt;

 (usually to either side of the space bar), the 

&lt;ALT&gt;

 on the left side is generally set to work as a Meta key. The 

&lt;ALT&gt;

 key on the right may also be configured to work as a Meta key or may be configured as some other modifier, such as a Compose key for typing accented characters.

If you do not have a Meta or 

&lt;ALT&gt;

 key, or another key working as a Meta key, the identical keystroke can be generated by typing 

&lt;ESC&gt;

 first, and then typing 

&lt;k&gt;

. Either process is known as metafying the 

&lt;k&gt;

 key.

The text M-C-k is read as `Meta-Control-k' and describes the character produced by metafying C-k.

In addition, several keys have their own names. Specifically, 

&lt;DEL&gt;

, 

&lt;ESC&gt;

, 

&lt;LFD&gt;

, 

&lt;SPC&gt;

, 

&lt;RET&gt;

, and 

&lt;TAB&gt;

 all stand for themselves when seen in this text, or in an init file (see Readline Init File). If your keyboard lacks a 

&lt;LFD&gt;

 key, typing 

&lt;C-j&gt;

 will produce the desired character. The 

&lt;RET&gt;

 key may be labeled 

&lt;Return&gt;

 or 

&lt;Enter&gt;

 on some keyboards.


### Readline Interaction ###

Often during an interactive session you type in a long line of text, only to notice that the first word on the line is misspelled. The Readline library gives you a set of commands for manipulating the text as you type it in, allowing you to just fix your typo, and not forcing you to retype the majority of the line. Using these editing commands, you move the cursor to the place that needs correction, and delete or insert the text of the corrections. Then, when you are satisfied with the line, you simply press 

&lt;RET&gt;

. You do not have to be at the end of the line to press 

&lt;RET&gt;

; the entire line is accepted regardless of the location of the cursor within the line.

  * Readline Bare Essentials: The least you need to know about Readline.
  * Readline Movement Commands: Moving about the input line.
  * Readline Killing Commands: How to delete text, and how to get it back!
  * Readline Arguments: Giving numeric arguments to commands.
  * Searching: Searching through previous lines.

#### Readline Bare Essentials ####

In order to enter characters into the line, simply type them. The typed character appears where the cursor was, and then the cursor moves one space to the right. If you mistype a character, you can use your erase character to back up and delete the mistyped character.

Sometimes you may mistype a character, and not notice the error until you have typed several other characters. In that case, you can type C-b to move the cursor to the left, and then correct your mistake. Afterwards, you can move the cursor to the right with C-f.

When you add text in the middle of a line, you will notice that characters to the right of the cursor are `pushed over' to make room for the text that you have inserted. Likewise, when you delete text behind the cursor, characters to the right of the cursor are `pulled back' to fill in the blank space created by the removal of the text. A list of the bare essentials for editing the text of an input line follows.

C-b
> Move back one character.
C-f
> Move forward one character.


&lt;DEL&gt;

 or 

&lt;Backspace&gt;


> Delete the character to the left of the cursor.
C-d
> Delete the character underneath the cursor.
Printing characters
> Insert the character into the line at the cursor.
C-_or C-x C-u
> Undo the last editing command. You can undo all the way back to an empty line._

(Depending on your configuration, the 

&lt;Backspace&gt;

 key be set to delete the character to the left of the cursor and the 

&lt;DEL&gt;

 key set to delete the character underneath the cursor, like C-d, rather than the character to the left of the cursor.)

#### Readline Movement Commands ####

The above table describes the most basic keystrokes that you need in order to do editing of the input line. For your convenience, many other commands have been added in addition to C-b, C-f, C-d, and 

&lt;DEL&gt;

. Here are some commands for moving more rapidly about the line.

C-a
> Move to the start of the line.
C-e
> Move to the end of the line.
M-f
> Move forward a word, where a word is composed of letters and digits.
M-b
> Move backward a word.
C-l
> Clear the screen, reprinting the current line at the top.

Notice how C-f moves forward a character, while M-f moves forward a word. It is a loose convention that control keystrokes operate on characters while meta keystrokes operate on words.

#### Readline Killing Commands ####

Killing text means to delete the text from the line, but to save it away for later use, usually by yanking (re-inserting) it back into the line. (`Cut' and `paste' are more recent jargon for `kill' and `yank'.)

If the description for a command says that it `kills' text, then you can be sure that you can get the text back in a different (or the same) place later.

When you use a kill command, the text is saved in a kill-ring. Any number of consecutive kills save all of the killed text together, so that when you yank it back, you get it all. The kill ring is not line specific; the text that you killed on a previously typed line is available to be yanked back later, when you are typing another line. Here is the list of commands for killing text.

C-k
> Kill the text from the current cursor position to the end of the line.
M-d
> Kill from the cursor to the end of the current word, or, if between words, to the end of the next word. Word boundaries are the same as those used by M-f.
M-

&lt;DEL&gt;


> Kill from the cursor the start of the current word, or, if between words, to the start of the previous word. Word boundaries are the same as those used by M-b.
C-w
> Kill from the cursor to the previous whitespace. This is different than M-

&lt;DEL&gt;

 because the word boundaries differ.

Here is how to yank the text back into the line. Yanking means to copy the most-recently-killed text from the kill buffer.

C-y
> Yank the most recently killed text back into the buffer at the cursor.
M-y
> Rotate the kill-ring, and yank the new top. You can only do this if the prior command is C-y or M-y.

#### Readline Arguments ####

You can pass numeric arguments to Readline commands. Sometimes the argument acts as a repeat count, other times it is the sign of the argument that is significant. If you pass a negative argument to a command which normally acts in a forward direction, that command will act in a backward direction. For example, to kill text back to the start of the line, you might type ‘M-- C-k’.

The general way to pass numeric arguments to a command is to type meta digits before the command. If the first `digit' typed is a minus sign (‘-’), then the sign of the argument will be negative. Once you have typed one meta digit to get the argument started, you can type the remainder of the digits, and then the command. For example, to give the C-d command an argument of 10, you could type ‘M-1 0 C-d’, which will delete the next ten characters on the input line.

#### Searching for Commands in the History ####

Readline provides commands for searching through the command history (see Bash History Facilities) for lines containing a specified string. There are two search modes: incremental and non-incremental.

Incremental searches begin before the user has finished typing the search string. As each character of the search string is typed, Readline displays the next entry from the history matching the string typed so far. An incremental search requires only as many characters as needed to find the desired history entry. To search backward in the history for a particular string, type C-r. Typing C-s searches forward through the history. The characters present in the value of the isearch-terminators variable are used to terminate an incremental search. If that variable has not been assigned a value, the 

&lt;ESC&gt;

 and C-J characters will terminate an incremental search. C-g will abort an incremental search and restore the original line. When the search is terminated, the history entry containing the search string becomes the current line.

To find other matching entries in the history list, type C-r or C-s as appropriate. This will search backward or forward in the history for the next entry matching the search string typed so far. Any other key sequence bound to a Readline command will terminate the search and execute that command. For instance, a 

&lt;RET&gt;

 will terminate the search and accept the line, thereby executing the command from the history list. A movement command will terminate the search, make the last line found the current line, and begin editing.

Readline remembers the last incremental search string. If two C-rs are typed without any intervening characters defining a new search string, any remembered search string is used.

Non-incremental searches read the entire search string before starting to search for matching history lines. The search string may be typed by the user or be part of the contents of the current line.


### Readline Init File ###

Although the Readline library comes with a set of Emacs-like keybindings installed by default, it is possible to use a different set of keybindings. Any user can customize programs that use Readline by putting commands in an inputrc file, conventionally in his home directory. The name of this file is taken from the value of the shell variable INPUTRC. If that variable is unset, the default is ~/.inputrc. If that file does not exist or cannot be read, the ultimate default is /etc/inputrc.

When a program which uses the Readline library starts up, the init file is read, and the key bindings are set.

In addition, the C-x C-r command re-reads this init file, thus incorporating any changes that you might have made to it.

  * Readline Init File Syntax: Syntax for the commands in the inputrc file.
  * Conditional Init Constructs: Conditional key bindings in the inputrc file.
  * Sample Init File: An example inputrc file.


#### Readline Init File Syntax ####

There are only a few basic constructs allowed in the Readline init file. Blank lines are ignored. Lines beginning with a ‘#’ are comments. Lines beginning with a ‘$’ indicate conditional constructs (see Conditional Init Constructs). Other lines denote variable settings and key bindings.

Variable Settings
> You can modify the run-time behavior of Readline by altering the values of variables in Readline using the set command within the init file. The syntax is simple:

> set variable value

> Here, for example, is how to change from the default Emacs-like key binding to use vi line editing commands:

> set editing-mode vi

> Variable names and values, where appropriate, are recognized without regard to case. Unrecognized variable names are ignored.

> Boolean variables (those that can be set to on or off) are set to on if the value is null or empty, on (case-insensitive), or 1. Any other value results in the variable being set to off.

> The bind -V command lists the current Readline variable names and values. See Bash Builtins.

> A great deal of run-time behavior is changeable with the following variables.

> bell-style
> > Controls what happens when Readline wants to ring the terminal bell. If set to ‘none’, Readline never rings the bell. If set to ‘visible’, Readline uses a visible bell if one is available. If set to ‘audible’ (the default), Readline attempts to ring the terminal's bell.

> bind-tty-special-chars
> > If set to ‘on’, Readline attempts to bind the control characters treated specially by the kernel's terminal driver to their Readline equivalents.

> comment-begin
> > The string to insert at the beginning of the line when the insert-comment command is executed. The default value is "#".

> completion-ignore-case
> > If set to ‘on’, Readline performs filename matching and completion in a case-insensitive fashion. The default value is ‘off’.

> completion-prefix-display-length
> > The length in characters of the common prefix of a list of possible completions that is displayed without modification. When set to a value greater than zero, common prefixes longer than this value are replaced with an ellipsis when displaying possible completions.

> completion-query-items
> > The number of possible completions that determines when the user is asked whether the list of possibilities should be displayed. If the number of possible completions is greater than this value, Readline will ask the user whether or not he wishes to view them; otherwise, they are simply listed. This variable must be set to an integer value greater than or equal to 0. A negative value means Readline should never ask. The default limit is 100.

> convert-meta
> > If set to ‘on’, Readline will convert characters with the eighth bit set to an ascii key sequence by stripping the eighth bit and prefixing an 

&lt;ESC&gt;

 character, converting them to a meta-prefixed key sequence. The default value is ‘on’.

> disable-completion
> > If set to ‘On’, Readline will inhibit word completion. Completion characters will be inserted into the line as if they had been mapped to self-insert. The default is ‘off’.

> editing-mode
> > The editing-mode variable controls which default set of key bindings is used. By default, Readline starts up in Emacs editing mode, where the keystrokes are most similar to Emacs. This variable can be set to either ‘emacs’ or ‘vi’.

> enable-keypad
> > When set to ‘on’, Readline will try to enable the application keypad when it is called. Some systems need this to enable the arrow keys. The default is ‘off’.

> expand-tilde
> > If set to ‘on’, tilde expansion is performed when Readline attempts word completion. The default is ‘off’.

> history-preserve-point
> > If set to ‘on’, the history code attempts to place the point (the current cursor position) at the same location on each history line retrieved with previous-history or next-history. The default is ‘off’.

> history-size
> > Set the maximum number of history entries saved in the history list. If set to zero, the number of entries in the history list is not limited.

> horizontal-scroll-mode
> > This variable can be set to either ‘on’ or ‘off’. Setting it to ‘on’ means that the text of the lines being edited will scroll horizontally on a single screen line when they are longer than the width of the screen, instead of wrapping onto a new screen line. By default, this variable is set to ‘off’.

> input-meta
> > If set to ‘on’, Readline will enable eight-bit input (it will not clear the eighth bit in the characters it reads), regardless of what the terminal claims it can support. The default value is ‘off’. The name meta-flag is a synonym for this variable.

> isearch-terminators
> > The string of characters that should terminate an incremental search without subsequently executing the character as a command (see Searching). If this variable has not been given a value, the characters 

&lt;ESC&gt;

 and C-J will terminate an incremental search.

> keymap
> > Sets Readline's idea of the current keymap for key binding commands. Acceptable keymap names are emacs, emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move, vi-command, and vi-insert. vi is equivalent to vi-command; emacs is equivalent to emacs-standard. The default value is emacs. The value of the editing-mode variable also affects the default keymap.

> mark-directories
> > If set to ‘on’, completed directory names have a slash appended. The default is ‘on’.

> mark-modified-lines
> > This variable, when set to ‘on’, causes Readline to display an asterisk (`‘*’`) at the start of history lines which have been modified. This variable is ‘off’ by default.

> mark-symlinked-directories
> > If set to ‘on’, completed names which are symbolic links to directories have a slash appended (subject to the value of mark-directories). The default is ‘off’.

> match-hidden-files
> > This variable, when set to ‘on’, causes Readline to match files whose names begin with a ‘.’ (hidden files) when performing filename completion, unless the leading ‘.’ is supplied by the user in the filename to be completed. This variable is ‘on’ by default.

> output-meta
> > If set to ‘on’, Readline will display characters with the eighth bit set directly rather than as a meta-prefixed escape sequence. The default is ‘off’.

> page-completions
> > If set to ‘on’, Readline uses an internal more-like pager to display a screenful of possible completions at a time. This variable is ‘on’ by default.

> print-completions-horizontally
> > If set to ‘on’, Readline will display completions with matches sorted horizontally in alphabetical order, rather than down the screen. The default is ‘off’.

> revert-all-at-newline
> > If set to ‘on’, Readline will undo all changes to history lines before returning when accept-line is executed. By default, history lines may be modified and retain individual undo lists across calls to readline. The default is ‘off’.

> show-all-if-ambiguous
> > This alters the default behavior of the completion functions. If set to ‘on’, words which have more than one possible completion cause the matches to be listed immediately instead of ringing the bell. The default value is ‘off’.

> show-all-if-unmodified
> > This alters the default behavior of the completion functions in a fashion similar to show-all-if-ambiguous. If set to ‘on’, words which have more than one possible completion without any possible partial completion (the possible completions don't share a common prefix) cause the matches to be listed immediately instead of ringing the bell. The default value is ‘off’.

> visible-stats
> > If set to ‘on’, a character denoting a file's type is appended to the filename when listing possible completions. The default is ‘off’.


Key Bindings

> The syntax for controlling key bindings in the init file is simple. First you need to find the name of the command that you want to change. The following sections contain tables of the command name, the default keybinding, if any, and a short description of what the command does.

> Once you know the name of the command, simply place on a line in the init file the name of the key you wish to bind the command to, a colon, and then the name of the command. There can be no space between the key name and the colon – that will be interpreted as part of the key name. The name of the key can be expressed in different ways, depending on what you find most comfortable.

> In addition to command names, readline allows keys to be bound to a string that is inserted when the key is pressed (a macro).

> The bind -p command displays Readline function names and bindings in a format that can put directly into an initialization file. See Bash Builtins.

> keyname: function-name or macro
> > keyname is the name of a key spelled out in English. For example:


> Control-u: universal-argument
> Meta-Rubout: backward-kill-word
> Control-o: "> output"

> In the above example, C-u is bound to the function universal-argument, M-DEL is bound to the function backward-kill-word, and C-o is bound to run the macro expressed on the right hand side (that is, to insert the text ‘> output’ into the line).

> A number of symbolic character names are recognized while processing this key binding syntax: DEL, ESC, ESCAPE, LFD, NEWLINE, RET, RETURN, RUBOUT, SPACE, SPC, and TAB.
> "keyseq": function-name or macro
> > keyseq differs from keyname above in that strings denoting an entire key sequence can be specified, by placing the key sequence in double quotes. Some gnu Emacs style key escapes can be used, as in the following example, but the special character names are not recognized.


> "\C-u": universal-argument
> "\C-x\C-r": re-read-init-file
> "\e[11~": "Function Key 1"

> In the above example, C-u is again bound to the function universal-argument (just as it was in the first example), ‘C-x C-r’ is bound to the function re-read-init-file, and ‘

&lt;ESC&gt;

 <[> 

&lt;1&gt;

 

&lt;1&gt;

 <~>’ is bound to insert the text ‘Function Key 1’.

> The following gnu Emacs style escape sequences are available when specifying key sequences:

> \C-
> > control prefix

> \M-
> > meta prefix

> \e
> > an escape character

> \\
> > backslash

> \"
> > <">, a double quotation mark

> \'
> > <'>, a single quote or apostrophe


> In addition to the gnu Emacs style escape sequences, a second set of backslash escapes is available:

> \a
> > alert (bell)

> \b
> > backspace

> \d
> > delete

> \f
> > form feed

> \n
> > newline

> \r
> > carriage return

> \t
> > horizontal tab

> \v
> > vertical tab

> \nnn
> > the eight-bit character whose value is the octal value nnn (one to three digits)

> \xHH
> > the eight-bit character whose value is the hexadecimal value HH (one or two hex digits)


> When entering the text of a macro, single or double quotes must be used to indicate a macro definition. Unquoted text is assumed to be a function name. In the macro body, the backslash escapes described above are expanded. Backslash will quote any other character in the macro text, including ‘"’ and ‘'’. For example, the following binding will make ‘C-x \’ insert a single ‘\’ into the line:

> "\C-x\\": "\\"

#### Conditional Init Constructs ####

Readline implements a facility similar in spirit to the conditional compilation features of the C preprocessor which allows key bindings and variable settings to be performed as the result of tests. There are four parser directives used.

$if
> The $if construct allows bindings to be made based on the editing mode, the terminal being used, or the application using Readline. The text of the test extends to the end of the line; no characters are required to isolate it.

> mode
> > The mode= form of the $if directive is used to test whether Readline is in emacs or vi mode. This may be used in conjunction with the ‘set keymap’ command, for instance, to set bindings in the emacs-standard and emacs-ctlx keymaps only if Readline is starting out in emacs mode.

> term
> > The term= form may be used to include terminal-specific key bindings, perhaps to bind the key sequences output by the terminal's function keys. The word on the right side of the ‘=’ is tested against both the full name of the terminal and the portion of the terminal name before the first ‘-’. This allows sun to match both sun and sun-cmd, for instance.

> application
> > The application construct is used to include application-specific settings. Each program using the Readline library sets the application name, and you can test for a particular value. This could be used to bind key sequences to functions useful for a specific program. For instance, the following command adds a key sequence that quotes the current or previous word in Bash:


> $if Bash
  1. Quote the current or previous word
> "\C-xq": "\eb\"\ef\""
> $endif


$endif
> This command, as seen in the previous example, terminates an $if command.
$else
> Commands in this branch of the $if directive are executed if the test fails.
$include
> This directive takes a single filename as an argument and reads commands and bindings from that file. For example, the following directive reads from /etc/inputrc:

> $include /etc/inputrc

#### Sample Init File ####

Here is an example of an inputrc file. This illustrates key binding, variable assignment, and conditional syntax.

```
     # This file controls the behaviour of line input editing for
     # programs that use the GNU Readline library.  Existing
     # programs include FTP, Bash, and GDB.
     #
     # You can re-read the inputrc file with C-x C-r.
     # Lines beginning with '#' are comments.
     #
     # First, include any systemwide bindings and variable
     # assignments from /etc/Inputrc
     $include /etc/Inputrc
     
     #
     # Set various bindings for emacs mode.
     
     set editing-mode emacs
     
     $if mode=emacs
     
     Meta-Control-h:	backward-kill-word	Text after the function name is ignored
     
     #
     # Arrow keys in keypad mode
     #
     #"\M-OD":        backward-char
     #"\M-OC":        forward-char
     #"\M-OA":        previous-history
     #"\M-OB":        next-history
     #
     # Arrow keys in ANSI mode
     #
     "\M-[D":        backward-char
     "\M-[C":        forward-char
     "\M-[A":        previous-history
     "\M-[B":        next-history
     #
     # Arrow keys in 8 bit keypad mode
     #
     #"\M-\C-OD":       backward-char
     #"\M-\C-OC":       forward-char
     #"\M-\C-OA":       previous-history
     #"\M-\C-OB":       next-history
     #
     # Arrow keys in 8 bit ANSI mode
     #
     #"\M-\C-[D":       backward-char
     #"\M-\C-[C":       forward-char
     #"\M-\C-[A":       previous-history
     #"\M-\C-[B":       next-history
     
     C-q: quoted-insert
     
     $endif
     
     # An old-style binding.  This happens to be the default.
     TAB: complete
     
     # Macros that are convenient for shell interaction
     $if Bash
     # edit the path
     "\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
     # prepare to type a quoted word --
     # insert open and close double quotes
     # and move to just after the open quote
     "\C-x\"": "\"\"\C-b"
     # insert a backslash (testing backslash escapes
     # in sequences and macros)
     "\C-x\\": "\\"
     # Quote the current or previous word
     "\C-xq": "\eb\"\ef\""
     # Add a binding to refresh the line, which is unbound
     "\C-xr": redraw-current-line
     # Edit variable on current line.
     "\M-\C-v": "\C-a\C-k$\C-y\M-\C-e\C-a\C-y="
     $endif
     
     # use a visible bell if one is available
     set bell-style visible
     
     # don't strip characters to 7 bits when reading
     set input-meta on
     
     # allow iso-latin1 characters to be inserted rather
     # than converted to prefix-meta sequences
     set convert-meta off
     
     # display characters with the eighth bit set directly
     # rather than as meta-prefixed characters
     set output-meta on
     
     # if there are more than 150 possible completions for
     # a word, ask the user if he wants to see all of them
     set completion-query-items 150
     
     # For FTP
     $if Ftp
     "\C-xg": "get \M-?"
     "\C-xt": "put \M-?"
     "\M-.": yank-last-arg
     $endif
```

### Commands For Moving ###

beginning-of-line (C-a)
> Move to the start of the current line.
end-of-line (C-e)
> Move to the end of the line.
forward-char (C-f)
> Move forward a character.
backward-char (C-b)
> Move back a character.
forward-word (M-f)
> Move forward to the end of the next word. Words are composed of letters and digits.
backward-word (M-b)
> Move back to the start of the current or previous word. Words are composed of letters and digits.
shell-forward-word ()
> Move forward to the end of the next word. Words are delimited by non-quoted shell metacharacters.
shell-backward-word ()
> Move back to the start of the current or previous word. Words are delimited by non-quoted shell metacharacters.
clear-screen (C-l)
> Clear the screen and redraw the current line, leaving the current line at the top of the screen.
redraw-current-line ()
> Refresh the current line. By default, this is unbound.

### Commands For Manipulating The History ###

accept-line (Newline or Return)
> Accept the line regardless of where the cursor is. If this line is non-empty, add it to the history list according to the setting of the HISTCONTROL and HISTIGNORE variables. If this line is a modified history line, then restore the history line to its original state.
previous-history (C-p)
> Move `back' through the history list, fetching the previous command.
next-history (C-n)
> Move `forward' through the history list, fetching the next command.
beginning-of-history (M-<)
> Move to the first line in the history.
end-of-history (M->)
> Move to the end of the input history, i.e., the line currently being entered.
reverse-search-history (C-r)
> Search backward starting at the current line and moving `up' through the history as necessary. This is an incremental search.
forward-search-history (C-s)
> Search forward starting at the current line and moving `down' through the the history as necessary. This is an incremental search.
non-incremental-reverse-search-history (M-p)
> Search backward starting at the current line and moving `up' through the history as necessary using a non-incremental search for a string supplied by the user.
non-incremental-forward-search-history (M-n)
> Search forward starting at the current line and moving `down' through the the history as necessary using a non-incremental search for a string supplied by the user.
history-search-forward ()
> Search forward through the history for the string of characters between the start of the current line and the point. This is a non-incremental search. By default, this command is unbound.
history-search-backward ()
> Search backward through the history for the string of characters between the start of the current line and the point. This is a non-incremental search. By default, this command is unbound.
yank-nth-arg (M-C-y)
> Insert the first argument to the previous command (usually the second word on the previous line) at point. With an argument n, insert the nth word from the previous command (the words in the previous command begin with word 0). A negative argument inserts the nth word from the end of the previous command. Once the argument n is computed, the argument is extracted as if the ‘!n’ history expansion had been specified.
yank-last-arg (M-. or M-_)
> Insert last argument to the previous command (the last word of the previous history entry). With an argument, behave exactly like yank-nth-arg. Successive calls to yank-last-arg move back through the history list, inserting the last argument of each line in turn. The history expansion facilities are used to extract the last argument, as if the ‘!$’ history expansion had been specified._

### Commands For Changing Text ###

delete-char (C-d)
> Delete the character at point. If point is at the beginning of the line, there are no characters in the line, and the last character typed was not bound to delete-char, then return eof.
backward-delete-char (Rubout)
> Delete the character behind the cursor. A numeric argument means to kill the characters instead of deleting them.
forward-backward-delete-char ()
> Delete the character under the cursor, unless the cursor is at the end of the line, in which case the character behind the cursor is deleted. By default, this is not bound to a key.
quoted-insert (C-q or C-v)
> Add the next character typed to the line verbatim. This is how to insert key sequences like C-q, for example.
self-insert (a, b, A, 1, !, ...)
> Insert yourself.
transpose-chars (C-t)
> Drag the character before the cursor forward over the character at the cursor, moving the cursor forward as well. If the insertion point is at the end of the line, then this transposes the last two characters of the line. Negative arguments have no effect.
transpose-words (M-t)
> Drag the word before point past the word after point, moving point past that word as well. If the insertion point is at the end of the line, this transposes the last two words on the line.
upcase-word (M-u)
> Uppercase the current (or following) word. With a negative argument, uppercase the previous word, but do not move the cursor.
downcase-word (M-l)
> Lowercase the current (or following) word. With a negative argument, lowercase the previous word, but do not move the cursor.
capitalize-word (M-c)
> Capitalize the current (or following) word. With a negative argument, capitalize the previous word, but do not move the cursor.
overwrite-mode ()
> Toggle overwrite mode. With an explicit positive numeric argument, switches to overwrite mode. With an explicit non-positive numeric argument, switches to insert mode. This command affects only emacs mode; vi mode does overwrite differently. Each call to readline() starts in insert mode.

> In overwrite mode, characters bound to self-insert replace the text at point rather than pushing the text to the right. Characters bound to backward-delete-char replace the character before point with a space.

> By default, this command is unbound.

### Killing And Yanking ###

kill-line (C-k)
> Kill the text from point to the end of the line.
backward-kill-line (C-x Rubout)
> Kill backward to the beginning of the line.
unix-line-discard (C-u)
> Kill backward from the cursor to the beginning of the current line.
kill-whole-line ()
> Kill all characters on the current line, no matter where point is. By default, this is unbound.
kill-word (M-d)
> Kill from point to the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as forward-word.
backward-kill-word (M-

&lt;DEL&gt;

)
> Kill the word behind point. Word boundaries are the same as backward-word.
shell-kill-word ()
> Kill from point to the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as shell-forward-word.
backward-kill-word ()
> Kill the word behind point. Word boundaries are the same as shell-backward-word.
unix-word-rubout (C-w)
> Kill the word behind point, using white space as a word boundary. The killed text is saved on the kill-ring.
unix-filename-rubout ()
> Kill the word behind point, using white space and the slash character as the word boundaries. The killed text is saved on the kill-ring.
delete-horizontal-space ()
> Delete all spaces and tabs around point. By default, this is unbound.
kill-region ()
> Kill the text in the current region. By default, this command is unbound.
copy-region-as-kill ()
> Copy the text in the region to the kill buffer, so it can be yanked right away. By default, this command is unbound.
copy-backward-word ()
> Copy the word before point to the kill buffer. The word boundaries are the same as backward-word. By default, this command is unbound.
copy-forward-word ()
> Copy the word following point to the kill buffer. The word boundaries are the same as forward-word. By default, this command is unbound.
yank (C-y)
> Yank the top of the kill ring into the buffer at point.
yank-pop (M-y)
> Rotate the kill-ring, and yank the new top. You can only do this if the prior command is yank or yank-pop.

### Specifying Numeric Arguments ###

digit-argument (M-0, M-1, ... M--)
> Add this digit to the argument already accumulating, or start a new argument. M-- starts a negative argument.
universal-argument ()
> This is another way to specify an argument. If this command is followed by one or more digits, optionally with a leading minus sign, those digits define the argument. If the command is followed by digits, executing universal-argument again ends the numeric argument, but is otherwise ignored. As a special case, if this command is immediately followed by a character that is neither a digit or minus sign, the argument count for the next command is multiplied by four. The argument count is initially one, so executing this function the first time makes the argument count four, a second time makes the argument count sixteen, and so on. By default, this is not bound to a key.

### Letting Readline Type For You ###

complete (

&lt;TAB&gt;

)
> Attempt to perform completion on the text before point. The actual completion performed is application-specific. Bash attempts completion treating the text as a variable (if the text begins with ‘$’), username (if the text begins with ‘~’), hostname (if the text begins with ‘@’), or command (including aliases and functions) in turn. If none of these produces a match, filename completion is attempted.
possible-completions (M-?)
> List the possible completions of the text before point.
insert-completions (M-`*`)
> Insert all completions of the text before point that would have been generated by possible-completions.
menu-complete ()
> Similar to complete, but replaces the word to be completed with a single match from the list of possible completions. Repeated execution of menu-complete steps through the list of possible completions, inserting each match in turn. At the end of the list of completions, the bell is rung (subject to the setting of bell-style) and the original text is restored. An argument of n moves n positions forward in the list of matches; a negative argument may be used to move backward through the list. This command is intended to be bound to 

&lt;TAB&gt;

, but is unbound by default.
delete-char-or-list ()
> Deletes the character under the cursor if not at the beginning or end of the line (like delete-char). If at the end of the line, behaves identically to possible-completions. This command is unbound by default.
complete-filename (M-/)
> Attempt filename completion on the text before point.
possible-filename-completions (C-x /)
> List the possible completions of the text before point, treating it as a filename.
complete-username (M-~)
> Attempt completion on the text before point, treating it as a username.
possible-username-completions (C-x ~)
> List the possible completions of the text before point, treating it as a username.
complete-variable (M-$)
> Attempt completion on the text before point, treating it as a shell variable.
possible-variable-completions (C-x $)
> List the possible completions of the text before point, treating it as a shell variable.
complete-hostname (M-@)
> Attempt completion on the text before point, treating it as a hostname.
possible-hostname-completions (C-x @)
> List the possible completions of the text before point, treating it as a hostname.
complete-command (M-!)
> Attempt completion on the text before point, treating it as a command name. Command completion attempts to match the text against aliases, reserved words, shell functions, shell builtins, and finally executable filenames, in that order.
possible-command-completions (C-x !)
> List the possible completions of the text before point, treating it as a command name.
dynamic-complete-history (M-

&lt;TAB&gt;

)
> Attempt completion on the text before point, comparing the text against lines from the history list for possible completion matches.
dabbrev-expand ()
> Attempt menu completion on the text before point, comparing the text against lines from the history list for possible completion matches.
complete-into-braces (M-{)
> Perform filename completion and insert the list of possible completions enclosed within braces so the list is available to the shell (see Brace Expansion).

### Keyboard Macros ###

start-kbd-macro (C-x ()
> Begin saving the characters typed into the current keyboard macro.
end-kbd-macro (C-x ))
> Stop saving the characters typed into the current keyboard macro and save the definition.
call-last-kbd-macro (C-x e)
> Re-execute the last keyboard macro defined, by making the characters in the macro appear as if typed at the keyboard.

### Some Miscellaneous Commands ###

re-read-init-file (C-x C-r)
> Read in the contents of the inputrc file, and incorporate any bindings or variable assignments found there.
abort (C-g)
> Abort the current editing command and ring the terminal's bell (subject to the setting of bell-style).
do-uppercase-version (M-a, M-b, M-x, ...)
> If the metafied character x is lowercase, run the command that is bound to the corresponding uppercase character.
prefix-meta (

&lt;ESC&gt;

)
> Metafy the next character typed. This is for keyboards without a meta key. Typing ‘

&lt;ESC&gt;

 f’ is equivalent to typing M-f.
undo (C-_or C-x C-u)
> Incremental undo, separately remembered for each line.
revert-line (M-r)
> Undo all changes made to this line. This is like executing the undo command enough times to get back to the beginning.
tilde-expand (M-&)
> Perform tilde expansion on the current word.
set-mark (C-@)
> Set the mark to the point. If a numeric argument is supplied, the mark is set to that position.
exchange-point-and-mark (C-x C-x)
> Swap the point with the mark. The current cursor position is set to the saved position, and the old cursor position is saved as the mark.
character-search (C-])
> A character is read and point is moved to the next occurrence of that character. A negative count searches for previous occurrences.
character-search-backward (M-C-])
> A character is read and point is moved to the previous occurrence of that character. A negative count searches for subsequent occurrences.
insert-comment (M-#)
> Without a numeric argument, the value of the comment-begin variable is inserted at the beginning of the current line. If a numeric argument is supplied, this command acts as a toggle: if the characters at the beginning of the line do not match the value of comment-begin, the value is inserted, otherwise the characters in comment-begin are deleted from the beginning of the line. In either case, the line is accepted as if a newline had been typed. The default value of comment-begin causes this command to make the current line a shell comment. If a numeric argument causes the comment character to be removed, the line will be executed by the shell.
dump-functions ()
> Print all of the functions and their key bindings to the Readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.
dump-variables ()
> Print all of the settable variables and their values to the Readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.
dump-macros ()
> Print all of the Readline key sequences bound to macros and the strings they output. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.
glob-complete-word (M-g)
> The word before point is treated as a pattern for pathname expansion, with an asterisk implicitly appended. This pattern is used to generate a list of matching file names for possible completions.
glob-expand-word (C-x `*`)
> The word before point is treated as a pattern for pathname expansion, and the list of matching file names is inserted, replacing the word. If a numeric argument is supplied, a `‘*’` is appended before pathname expansion.
glob-list-expansions (C-x g)
> The list of expansions that would have been generated by glob-expand-word is displayed, and the line is redrawn. If a numeric argument is supplied, a `‘*’` is appended before pathname expansion.
display-shell-version (C-x C-v)
> Display version information about the current instance of Bash.
shell-expand-line (M-C-e)
> Expand the line as the shell does. This performs alias and history expansion as well as all of the shell word expansions (see Shell Expansions).
history-expand-line (M-^)
> Perform history expansion on the current line.
magic-space ()
> Perform history expansion on the current line and insert a space (see History Interaction).
alias-expand-line ()
> Perform alias expansion on the current line (see Aliases).
history-and-alias-expand-line ()
> Perform history and alias expansion on the current line.
insert-last-argument (M-. or M-_)
> A synonym for yank-last-arg.
operate-and-get-next (C-o)
> Accept the current line for execution and fetch the next line relative to the current line from the history for editing. Any argument is ignored.
edit-and-execute-command (C-xC-e)
> Invoke an editor on the current command line, and execute the result as shell commands. Bash attempts to invoke $VISUAL, $EDITOR, and emacs as the editor, in that order.

### Programmable Completion ###

When word completion is attempted for an argument to a command for which a completion specification (a compspec) has been defined using the complete builtin (see Programmable Completion Builtins), the programmable completion facilities are invoked.

First, the command name is identified. If a compspec has been defined for that command, the compspec is used to generate the list of possible completions for the word. If the command word is a full pathname, a compspec for the full pathname is searched for first. If no compspec is found for the full pathname, an attempt is made to find a compspec for the portion following the final slash.

Once a compspec has been found, it is used to generate the list of matching words. If a compspec is not found, the default Bash completion described above (see Commands For Completion) is performed.

First, the actions specified by the compspec are used. Only matches which are prefixed by the word being completed are returned. When the -f or -d option is used for filename or directory name completion, the shell variable FIGNORE is used to filter the matches. See Bash Variables, for a description of FIGNORE.

Any completions specified by a filename expansion pattern to the -G option are generated next. The words generated by the pattern need not match the word being completed. The GLOBIGNORE shell variable is not used to filter the matches, but the FIGNORE shell variable is used.

Next, the string specified as the argument to the -W option is considered. The string is first split using the characters in the IFS special variable as delimiters. Shell quoting is honored. Each word is then expanded using brace expansion, tilde expansion, parameter and variable expansion, command substitution, and arithmetic expansion, as described above (see Shell Expansions). The results are split using the rules described above (see Word Splitting). The results of the expansion are prefix-matched against the word being completed, and the matching words become the possible completions.

After these matches have been generated, any shell function or command specified with the -F and -C options is invoked. When the command or function is invoked, the COMP\_LINE, COMP\_POINT, COMP\_KEY, and COMP\_TYPE variables are assigned values as described above (see Bash Variables). If a shell function is being invoked, the COMP\_WORDS and COMP\_CWORD variables are also set. When the function or command is invoked, the first argument is the name of the command whose arguments are being completed, the second argument is the word being completed, and the third argument is the word preceding the word being completed on the current command line. No filtering of the generated completions against the word being completed is performed; the function or command has complete freedom in generating the matches.

Any function specified with -F is invoked first. The function may use any of the shell facilities, including the compgen and compopt builtins described below (see Programmable Completion Builtins), to generate the matches. It must put the possible completions in the COMPREPLY array variable.

Next, any command specified with the -C option is invoked in an environment equivalent to command substitution. It should print a list of completions, one per line, to the standard output. Backslash may be used to escape a newline, if necessary.

After all of the possible completions are generated, any filter specified with the -X option is applied to the list. The filter is a pattern as used for pathname expansion; a ‘&’ in the pattern is replaced with the text of the word being completed. A literal ‘&’ may be escaped with a backslash; the backslash is removed before attempting a match. Any completion that matches the pattern will be removed from the list. A leading ‘!’ negates the pattern; in this case any completion not matching the pattern will be removed.

Finally, any prefix and suffix specified with the -P and -S options are added to each member of the completion list, and the result is returned to the Readline completion code as the list of possible completions.

If the previously-applied actions do not generate any matches, and the -o dirnames option was supplied to complete when the compspec was defined, directory name completion is attempted.

If the -o plusdirs option was supplied to complete when the compspec was defined, directory name completion is attempted and any matches are added to the results of the other actions.

By default, if a compspec is found, whatever it generates is returned to the completion code as the full set of possible completions. The default Bash completions are not attempted, and the Readline default of filename completion is disabled. If the -o bashdefault option was supplied to complete when the compspec was defined, the default Bash completions are attempted if the compspec generates no matches. If the -o default option was supplied to complete when the compspec was defined, Readline's default completion will be performed if the compspec (and, if attempted, the default Bash completions) generate no matches.

When a compspec indicates that directory name completion is desired, the programmable completion functions force Readline to append a slash to completed names which are symbolic links to directories, subject to the value of the mark-directories Readline variable, regardless of the setting of the mark-symlinked-directories Readline variable.

### Programmable Completion Builtins ###

Two builtin commands are available to manipulate the programmable completion facilities.

compgen

> compgen [option](option.md) [word](word.md)

> Generate possible completion matches for word according to the options, which may be any option accepted by the complete builtin with the exception of -p and -r, and write the matches to the standard output. When using the -F or -C options, the various shell variables set by the programmable completion facilities, while available, will not have useful values.

> The matches will be generated in the same way as if the programmable completion code had generated them directly from a completion specification with the same flags. If word is specified, only those completions matching word will be displayed.

> The return value is true unless an invalid option is supplied, or no matches were generated.
complete

> complete [-abcdefgjksuv] [-o comp-option] [-E] [-A action] [-G globpat] [-W wordlist]
> [-F function] [-C command] [-X filterpat]
> [-P prefix] [-S suffix] name [...](name.md)
> complete -pr [-E] [...](name.md)

> Specify how arguments to each name should be completed. If the -p option is supplied, or if no options are supplied, existing completion specifications are printed in a way that allows them to be reused as input. The -r option removes a completion specification for each name, or, if no names are supplied, all completion specifications. The -E option indicates that the remaining options and actions should apply to “empty” command completion; that is, completion attempted on a blank line.

> The process of applying these completion specifications when word completion is attempted is described above (see Programmable Completion).

> Other options, if specified, have the following meanings. The arguments to the -G, -W, and -X options (and, if necessary, the -P and -S options) should be quoted to protect them from expansion before the complete builtin is invoked.

> -o comp-option
> > The comp-option controls several aspects of the compspec's behavior beyond the simple generation of completions. comp-option may be one of:


> bashdefault
> > Perform the rest of the default Bash completions if the compspec generates no matches.

> default
> > Use Readline's default filename completion if the compspec generates no matches.

> dirnames
> > Perform directory name completion if the compspec generates no matches.

> filenames
> > Tell Readline that the compspec generates filenames, so it can perform any filename-specific processing (like adding a slash to directory names quoting special characters, or suppressing trailing spaces). This option is intended to be used with shell functions specified with -F.

> nospace
> > Tell Readline not to append a space (the default) to words completed at the end of the line.

> plusdirs
> > After any matches defined by the compspec are generated, directory name completion is attempted and any matches are added to the results of the other actions.



> -A action
> > The action may be one of the following to generate a list of possible completions:


> alias
> > Alias names. May also be specified as -a.

> arrayvar
> > Array variable names.

> binding
> > Readline key binding names (see Bindable Readline Commands).

> builtin
> > Names of shell builtin commands. May also be specified as -b.

> command
> > Command names. May also be specified as -c.

> directory
> > Directory names. May also be specified as -d.

> disabled
> > Names of disabled shell builtins.

> enabled
> > Names of enabled shell builtins.

> export
> > Names of exported shell variables. May also be specified as -e.

> file
> > File names. May also be specified as -f.

> function
> > Names of shell functions.

> group
> > Group names. May also be specified as -g.

> helptopic
> > Help topics as accepted by the help builtin (see Bash Builtins).

> hostname
> > Hostnames, as taken from the file specified by the HOSTFILE shell variable (see Bash Variables).

> job
> > Job names, if job control is active. May also be specified as -j.

> keyword
> > Shell reserved words. May also be specified as -k.

> running
> > Names of running jobs, if job control is active.

> service
> > Service names. May also be specified as -s.

> setopt
> > Valid arguments for the -o option to the set builtin (see The Set Builtin).

> shopt
> > Shell option names as accepted by the shopt builtin (see Bash Builtins).

> signal
> > Signal names.

> stopped
> > Names of stopped jobs, if job control is active.

> user
> > User names. May also be specified as -u.

> variable
> > Names of all shell variables. May also be specified as -v.



> -G globpat
> > The filename expansion pattern globpat is expanded to generate the possible completions.

> -W wordlist
> > The wordlist is split using the characters in the IFS special variable as delimiters, and each resultant word is expanded. The possible completions are the members of the resultant list which match the word being completed.

> -C command
> > command is executed in a subshell environment, and its output is used as the possible completions.

> -F function
> > The shell function function is executed in the current shell environment. When it finishes, the possible completions are retrieved from the value of the COMPREPLY array variable.

> -X filterpat
> > filterpat is a pattern as used for filename expansion. It is applied to the list of possible completions generated by the preceding options and arguments, and each completion matching filterpat is removed from the list. A leading ‘!’ in filterpat negates the pattern; in this case, any completion not matching filterpat is removed.

> -P prefix
> > prefix is added at the beginning of each possible completion after all other options have been applied.

> -S suffix
> > suffix is appended to each possible completion after all other options have been applied.


> The return value is true unless an invalid option is supplied, an option other than -p or -r is supplied without a name argument, an attempt is made to remove a completion specification for a name for which no specification exists, or an error occurs adding a completion specification.
compopt

> compopt [-o option] [+o option] [name](name.md)

> Modify completion options for each name according to the options, or for the currently-execution completion if no names are supplied. If no options are given, display the completion options for each name or the current completion. The possible values of option are those valid for the complete builtin described above.

> The return value is true unless an invalid option is supplied, an attempt is made to modify the options for a name for which no completion specification exists, or an output error occurs.

## Using History Interactively ##
This chapter describes how to use the gnu History Library interactively, from a user's standpoint. It should be considered a user's guide. For information on using the gnu History Library in other programs, see the gnu Readline Library Manual.
Bash History Facilities: How Bash lets you manipulate your command history.
Bash History Builtins: The Bash builtin commands that manipulate the command history.
History Interaction: What it feels like using History as a user.


### Bash History Facilities ###
When the -o history option to the set builtin is enabled (see The Set Builtin), the shell provides access to the command history, the list of commands previously typed. The value of the HISTSIZE shell variable is used as the number of commands to save in a history list. The text of the last $HISTSIZE commands (default 500) is saved. The shell stores each command in the history list prior to parameter and variable expansion but after history expansion is performed, subject to the values of the shell variables HISTIGNORE and HISTCONTROL.
When the shell starts up, the history is initialized from the file named by the HISTFILE variable (default ~/.bash\_history). The file named by the value of HISTFILE is truncated, if necessary, to contain no more than the number of lines specified by the value of the HISTFILESIZE variable. When an interactive shell exits, the last $HISTSIZE lines are copied from the history list to the file named by $HISTFILE. If the histappend shell option is set (see Bash Builtins), the lines are appended to the history file, otherwise the history file is overwritten. If HISTFILE is unset, or if the history file is unwritable, the history is not saved. After saving the history, the history file is truncated to contain no more than $HISTFILESIZE lines. If HISTFILESIZE is not set, no truncation is performed.
If the HISTTIMEFORMAT is set, the time stamp information associated with each history entry is written to the history file, marked with the history comment character. When the history file is read, lines beginning with the history comment character followed immediately by a digit are interpreted as timestamps for the previous history line.
The builtin command fc may be used to list or edit and re-execute a portion of the history list. The history builtin may be used to display or modify the history list and manipulate the history file. When using command-line editing, search commands are available in each editing mode that provide access to the history list (see Commands For History).
The shell allows control over which commands are saved on the history list. The HISTCONTROL and HISTIGNORE variables may be set to cause the shell to save only a subset of the commands entered. The cmdhist shell option, if enabled, causes the shell to attempt to save each line of a multi-line command in the same history entry, adding semicolons where necessary to preserve syntactic correctness. The lithist shell option causes the shell to save the command with embedded newlines instead of semicolons. The shopt builtin is used to set these options. See Bash Builtins, for a description of shopt.

### Bash History Builtins ###
Bash provides two builtin commands which manipulate the history list and history file.
fc
> fc [-e ename] [-lnr] [first](first.md) [last](last.md)
> fc -s [pat=rep] [command](command.md)
Fix Command. In the first form, a range of commands from first to last is selected from the history list. Both first and last may be specified as a string (to locate the most recent command beginning with that string) or as a number (an index into the history list, where a negative number is used as an offset from the current command number). If last is not specified it is set to first. If first is not specified it is set to the previous command for editing and −16 for listing. If the -l flag is given, the commands are listed on standard output. The -n flag suppresses the command numbers when listing. The -r flag reverses the order of the listing. Otherwise, the editor given by ename is invoked on a file containing those commands. If ename is not given, the value of the following variable expansion is used: ${FCEDIT:-${EDITOR:-vi}}. This says to use the value of the FCEDIT variable if set, or the value of the EDITOR variable if that is set, or vi if neither is set. When editing is complete, the edited commands are echoed and executed.
In the second form, command is re-executed after each instance of pat in the selected command is replaced by rep.
A useful alias to use with the fc command is r='fc -s', so that typing ‘r cc’ runs the last command beginning with cc and typing ‘r’ re-executes the last command (see Aliases).
history
{{{          history [n](n.md)
> history -c
> history -d offset
> history [-anrw] [filename](filename.md)
> history -ps arg     # This file controls the behaviour of line input editing for
     # programs that use the GNU Readline library.  Existing
     # programs include FTP, Bash, and GDB.
     #
     # You can re-read the inputrc file with C-x C-r.
     # Lines beginning with '#' are comments.
     #
     # First, include any systemwide bindings and variable
     # assignments from /etc/Inputrc
     $include /etc/Inputrc
     
     #
     # Set various bindings for emacs mode.
     
     set editing-mode emacs
     
     $if mode=emacs
     
     Meta-Control-h:	backward-kill-word	Text after the function name is ignored
     
     #
     # Arrow keys in keypad mode
     #
     #"\M-OD":        backward-char
     #"\M-OC":        forward-char
     #"\M-OA":        previous-history
     #"\M-OB":        next-history
     #
     # Arrow keys in ANSI mode
     #
     "\M-[D":        backward-char
     "\M-[C":        forward-char
     "\M-[A":        previous-history
     "\M-[B":        next-history
     #
     # Arrow keys in 8 bit keypad mode
     #
     #"\M-\C-OD":       backward-char
     #"\M-\C-OC":       forward-char
     #"\M-\C-OA":       previous-history
     #"\M-\C-OB":       next-history
     #
     # Arrow keys in 8 bit ANSI mode
     #
     #"\M-\C-[D":       backward-char
     #"\M-\C-[C":       forward-char
     #"\M-\C-[A":       previous-history
     #"\M-\C-[B":       next-history
     
     C-q: quoted-insert
     
     $endif
     
     # An old-style binding.  This happens to be the default.
     TAB: complete
     
     # Macros that are convenient for shell interaction
     $if Bash
     # edit the path
     "\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
     # prepare to type a quoted word --
     # insert open and close double quotes
     # and move to just after the open quote
     "\C-x\"": "\"\"\C-b"
     # insert a backslash (testing backslash escapes
     # in sequences and macros)
     "\C-x\\": "\\"
     # Quote the current or previous word
     "\C-xq": "\eb\"\ef\""
     # Add a binding to refresh the line, which is unbound
     "\C-xr": redraw-current-line
     # Edit variable on current line.
     "\M-\C-v": "\C-a\C-k$\C-y\M-\C-e\C-a\C-y="
     $endif
     
     # use a visible bell if one is available
     set bell-style visible
     
     # don't strip characters to 7 bits when reading
     set input-meta on
     
     # allow iso-latin1 characters to be inserted rather
     # than converted to prefix-meta sequences
     set convert-meta off
     
     # display characters with the eighth bit set directly
     # rather than as meta-prefixed characters
     set output-meta on
     
     # if there are more than 150 possible completions for
     # a word, ask the user if he wants to see all of them
     set completion-query-items 150
     
     # For FTP
     $if Ftp
     "\C-xg": "get \M-?"
     "\C-xt": "put \M-?"
     "\M-.": yank-last-arg
     $endif
}}}
With no options, display the history list with line numbers. Lines prefixed with a {{{‘*’}}} have been modified. An argument of n lists only the last n lines. If the shell variable HISTTIMEFORMAT is set and not null, it is used as a format string for strftime to display the time stamp associated with each displayed history entry. No intervening blank is printed between the formatted time stamp and the history line. 
Options, if supplied, have the following meanings: 
-c
Clear the history list. This may be combined with the other options to replace the history list completely. 

-d offset
Delete the history entry at position offset. offset should be specified as it appears when the history is displayed. 

-a
Append the new history lines (history lines entered since the beginning of the current Bash session) to the history file. 

-n
Append the history lines not already read from the history file to the current history list. These are lines appended to the history file since the beginning of the current Bash session. 

-r
Read the current history file and append its contents to the history list. 

-w
Write out the current history to the history file. 

-p
Perform history substitution on the args and display the result on the standard output, without storing the results in the history list. 

-s
The args are added to the end of the history list as a single entry. 
When any of the -w, -r, -a, or -n options is used, if filename is given, then it is used as the history file. If not, then the value of the HISTFILE variable is used. 

=== History Expansion ===
The History library provides a history expansion feature that is similar to the history expansion provided by csh. This section describes the syntax used to manipulate the history information. 
History expansions introduce words from the history list into the input stream, making it easy to repeat commands, insert the arguments to a previous command into the current input line, or fix errors in previous commands quickly. 
History expansion takes place in two parts. The first is to determine which line from the history list should be used during substitution. The second is to select portions of that line for inclusion into the current one. The line selected from the history is called the event, and the portions of that line that are acted upon are called words. Various modifiers are available to manipulate the selected words. The line is broken into words in the same fashion that Bash does, so that several words surrounded by quotes are considered one word. History expansions are introduced by the appearance of the history expansion character, which is ‘!’ by default. Only ‘\’ and ‘'’ may be used to escape the history expansion character. 
Several shell options settable with the shopt builtin (see Bash Builtins) may be used to tailor the behavior of history expansion. If the histverify shell option is enabled, and Readline is being used, history substitutions are not immediately passed to the shell parser. Instead, the expanded line is reloaded into the Readline editing buffer for further modification. If Readline is being used, and the histreedit shell option is enabled, a failed history expansion will be reloaded into the Readline editing buffer for correction. The -p option to the history builtin command may be used to see what a history expansion will do before using it. The -s option to the history builtin may be used to add commands to the end of the history list without actually executing them, so that they are available for subsequent recall. This is most useful in conjunction with Readline. 
The shell allows control of the various characters used by the history expansion mechanism with the histchars variable, as explained above (see Bash Variables). The shell uses the history comment character to mark history timestamps when writing the history file. 
Event Designators: How to specify which history line to use. 
Word Designators: Specifying which words are of interest. 
Modifiers: Modifying the results of substitution. 

==== Event Designators ====
An event designator is a reference to a command line entry in the history list. 
!
Start a history substitution, except when followed by a space, tab, the end of the line, ‘=’ or ‘(’ (when the extglob shell option is enabled using the shopt builtin). 
!n
Refer to command line n. 
!-n
Refer to the command n lines back. 
!!
Refer to the previous command. This is a synonym for ‘!-1’. 
!string
Refer to the most recent command starting with string. 
!?string[?]
Refer to the most recent command containing string. The trailing ‘?’ may be omitted if the string is followed immediately by a newline. 
^string1^string2^
Quick Substitution. Repeat the last command, replacing string1 with string2. Equivalent to !!:s/string1/string2/. 
!#
The entire command line typed so far. 
==== Word Designators ====
Word designators are used to select desired words from the event. A ‘:’ separates the event specification from the word designator. It may be omitted if the word designator begins with a ‘^’, ‘$’, {{{‘*’}}}, ‘-’, or ‘%’. Words are numbered from the beginning of the line, with the first word being denoted by 0 (zero). Words are inserted into the current line separated by single spaces. 
For example, 
!!
designates the preceding command. When you type this, the preceding command is repeated in toto. 
!!:$
designates the last argument of the preceding command. This may be shortened to !$. 
!fi:2
designates the second argument of the most recent command starting with the letters fi. 
Here are the word designators: 
0 (zero)
The 0th word. For many applications, this is the command word. 
n
The nth word. 
^
The first argument; that is, word 1. 
$
The last argument. 
%
The word matched by the most recent ‘?string?’ search. 
x-y
A range of words; ‘-y’ abbreviates ‘0-y’. 
{{{*}}}
All of the words, except the 0th. This is a synonym for ‘1-$’. It is not an error to use {{{‘*’}}} if there is just one word in the event; the empty string is returned in that case. 
{{{x*}}}
Abbreviates ‘x-$’ 
x-
Abbreviates ‘x-$’ like {{{‘x*’}}}, but omits the last word. 
If a word designator is supplied without an event specification, the previous command is used as the event. 
==== Modifiers ====
After the optional word designator, you can add a sequence of one or more of the following modifiers, each preceded by a ‘:’. 
h
Remove a trailing pathname component, leaving only the head. 
t
Remove all leading pathname components, leaving the tail. 
r
Remove a trailing suffix of the form ‘.suffix’, leaving the basename. 
e
Remove all but the trailing suffix. 
p
Print the new command but do not execute it. 
q
Quote the substituted words, escaping further substitutions. 
x
Quote the substituted words as with ‘q’, but break into words at spaces, tabs, and newlines. 
s/old/new/
Substitute new for the first occurrence of old in the event line. Any delimiter may be used in place of ‘/’. The delimiter may be quoted in old and new with a single backslash. If ‘&’ appears in new, it is replaced by old. A single backslash will quote the ‘&’. The final delimiter is optional if it is the last character on the input line. 
&
Repeat the previous substitution. 
g
a
Cause changes to be applied over the entire event line. Used in conjunction with ‘s’, as in gs/old/new/, or with ‘&’. 
G
Apply the following ‘s’ modifier once to each word in the event. 


|| *Content* || *Utility Software* Compression tools, Anti Virus, SPAM Filters, File Management tools, Archiving, Backups, Time snapshots of disk and Disk Management tools ||
|| *Team* || J T D'souza  ||
|| *Discussion Page* || [http://groups.google.com/group/cbse065/browse_thread/thread/afae959fd217d881] ||
|| *Changes* || http://code.google.com/p/cbse-065/source/diff?path=/wiki/module8.wiki&format=side&r=-1 || 
|| *Old Version List* || http://code.google.com/p/cbse-065/source/list?path=/wiki/module8.wiki ||

<hr/>

<wiki:toc max_depth="5" />

= Introduction =

Standard utilities available on a GNU/Linux OS


= Details =

This module provides an introduction to the standard utilities available on a GNU/Linux OS installation. We shall cover the features of each utility and the command line syntax for doing typical administrative tasks.

We shall be using debian distribution named Lenny. However what we learn here will be applicable on almost any GNU/Linux distribution like Fedora, Suse, Mandriva, Ubuntu, Slacware etc. Embedded distributions like DSL, MontaVista, Emdebian etc, may not have all the utilities and even included utilities will have several features missing. 

Utilities are small command line programs used to do mundane installation, maintenance, configuration and testing tasks.
These programs can be divided into a few broad categories
 #1 Shell
 #2 File, Shell and Text utils
 #3 Disk utils
 #4 Network utils
 #5 Search utils
 #6 Install utils
 #7 Editors
 #8 Others

Before we proceed any further we will take a look at that most profound creation of all - man. No it is not man from hu-man or wo-man, but man from manual and will beat super-man. It is your mana from heaven and will save you from disaster always. Well at least from disaster on the computer, where quite often even superman like powers fail.
man is a shortform for manual and gives you a brief description of the programme and it's usage syntax for the innumerable options available with every utility.
The syntax for man is man `<command>`
Thus typing 
man man 
will, in a bout of self glorification, tell you all about itself and give you the details of what the man command does and it's usage options. Although man itself has several options just typing man `<command>` is sufficient for most purposes.

So before you go and type rm and wipe your disk clean, please type man rm to understand the implications of your action. Well even if you are not going to wipe your disk clean do use man - especially when this textbook gets boring.

The usage syntax for every utility listed below is available with man. Infact this module is a printed version of each utility's manpage with occasional changes.

==  Fileutils, shellutils and textutils ==

These utilities are available in the coreutils package in Debain  / Redhat and their derivatives.  Previously a set of three packages,  GNU fileutils, shellutils and textutils, implemented the core set of GNU utilities.

on apt based distributions like debian, Ubuntu, Knoppix etc 
apt-get install coreutils 
will install coreutils

On rpm based distros like Redhat, Fedora, etc
rpm -i coreutils
will install coreutils

And by the way, you just learn't how to install a package on debian and derivative distros and Redhat and derivative distros in the above two paras.
 
In the previous section on shells, you have seen how output from one command is piped to a second (or third or more) command. We can pipe the output of a utility to another one to ease tasks or realise more complex tasks.
For example ls gives you a long list if you have many files and the output scrolls off the top of your screen. So you use ls | less which will give you a scrollable output.
Or ls -al | grep ^d which will only list directories.

For complex repetitive tasks one can write a bash script.

=== basename ===
Strip directory and suffix from filenames
Examples

 basename /usr/bin/sort
              Output "sort".

 basename include/stdio.h .h
              Output "stdio".

=== cat ===
Concatenate FILE(s), or standard input, to standard output.

       -A, --show-all
              equivalent to -vET

       -b, --number-nonblank
              number nonempty output lines

       -e     equivalent to -vE

       -E, --show-ends
              display $ at end of each line

       -n, --number
              number all output lines

       -s, --squeeze-blank
              suppress repeated empty output lines

       -t     equivalent to -vT

       -T, --show-tabs
             display TAB characters as ^I

       -u     (ignored)

       -v, --show-nonprinting
              use ^ and M- notation, except for LFD and TAB

       --help display this help and exit

       --version
              output version information and exit

       With no FILE, or when FILE is -, read standard input.

EXAMPLES

 cat /usr/share/doc/manpages/README.Debian 

 will give you details of the debian GNU/Linux manual pages

=== chgrp === 
Change  the group of each FILE to GROUP.  With --reference, change the group of each FILE to that of RFILE.
       -c, --changes
              like verbose but report only when a change is made

       --dereference
              affect the referent of each symbolic link (this is the default),  rather  than  the  symbolic link itself

       -h, --no-dereference
              affect  each  symbolic  link  instead of any referenced file (useful only on systems that can change the ownership of a symlink)

       --no-preserve-root
              do not treat / specially (the default)

       --preserve-root
              fail to operate recursively on /

       -f, --silent, --quiet
              suppress most error messages

       --reference=RFILE
              use RFILE's group rather than specifying a GROUP value

       -R, --recursive
              operate on files and directories recursively

       -v, --verbose
              output a diagnostic for every file processed

       The following options modify how a hierarchy is traversed when the -R option is also specified. If more than one is specified, only the final one takes effect.

       -H     if a command line argument is a symbolic link to a directory, traverse it

       -L     traverse every symbolic link to a directory encountered

       -P     do not traverse any symbolic links (default)

       --help display this help and exit

       --version
              output version information and exit

EXAMPLES
       chgrp staff /u
              Change the group of /u to "staff".

       chgrp -hR staff /u
              Change the group of /u and subfiles to "staff".

=== chmod ===

This manual page documents the GNU version of chmod.  chmod changes the file mode bits of each given file according to mode, which can be either a symbolic representation of  changes to make, or an octal number representing the bit pattern for the new mode bits.

The  format  of a symbolic mode is [ugoa...][[+-=][perms...]...], where perms is either zero or more letters from the set rwxXst, or a single letter from the set ugo.  Multiple symbolic  modes  can  be given, separated by commas.

A combination of the letters ugoa controls which users' access to the file will be changed: the user who owns it (u), other users in the file's group (g), other users not in the file's  group  (o),  or all  users (a).  If none of these are given, the effect is as if a were given, but bits that are set in the umask are not affected.

The operator + causes the selected file mode bits to be added to the existing file mode bits of each file;  -  causes them to be removed; and = causes them to be added and causes unmentioned bits to be removed except that a directory's unmentioned set user and group ID bits are not affected.

The letters rwxXst select file mode bits for the affected users: read (r), write  (w),  execute  (or search for directories) (x), execute/search only if the file is a directory or already has execute permission for some user (X), set user or group ID on execution (s), restricted deletion flag or sticky bit (t).  Instead of one or more of these letters, you can specify exactly one of the letters ugo: the permissions granted to the user who owns the file (u), the  permissions  granted  to  other users who are members of the file's group (g), and the permissions granted to users that are in neither of the two preceding categories (o).

A numeric mode is from one to four octal digits (0-7), derived by adding up the bits with values  4, 2,  and 1.  Omitted digits are assumed to be leading zeros.  The first digit selects the set user ID (4) and set group ID (2) and restricted deletion or sticky (1) attributes.  The second digit selects permissions  for the user who owns the file: read (4), write (2), and execute (1); the third selects permissions for other users in the file's group, with the same values;  and  the  fourth  for  other users not in the file's group, with the same values.

chmod  never  changes  the  permissions of symbolic links; the chmod system call cannot change their permissions. This is not a problem since the permissions of symbolic links are never used. However, for each symbolic link listed on the command line, chmod changes the permissions of the pointed-to file. In contrast, chmod ignores symbolic links encountered during  recursive  directory traversals.

*SETUID AND SETGID BITS*
       chmod clears the set-group-ID bit of a regular file if the file's group ID does not match the user's effective group ID or one of the user's supplementary group IDs, unless the user has appropriate privileges. Additional restrictions may cause the set-user-ID and set-group-ID bits of MODE or RFILE to be ignored.  This behavior depends on the policy and functionality of the underlying  chmod system call.  When in doubt, check the underlying system behavior. 
       chmod preserves a directory's set-user-ID and set-group-ID bits unless you explicitly specify otherwise. You can set or clear the bits with symbolic modes like u+s and g-s, and you can set (but  not clear) the bits with a numeric mode.

*RESTRICTED DELETION FLAG OR STICKY BIT*
       The restricted deletion flag or sticky bit is a single bit, whose interpretation depends on the file
       type.  For directories, it prevents unprivileged users from removing  or  renaming  a  file  in  the
       directory unless they own the file or the directory; this is called the restricted deletion flag for
       the directory, and is commonly found on world-writable directories like /tmp.  For regular files  on
       some  older  systems, the bit saves the program's text image on the swap device so it will load more
       quickly when run; this is called the sticky bit.

OPTIONS
       Change the mode of each FILE to MODE.

       -c, --changes
              like verbose but report only when a change is made

       --no-preserve-root
              do not treat / specially (the default)

       --preserve-root
              fail to operate recursively on /

       -f, --silent, --quiet
       -v, --verbose
              output a diagnostic for every file processed

       --reference=RFILE
              use RFILE's mode instead of MODE values

       -R, --recursive
              change files and directories recursively

       --help display this help and exit

       --version
              output version information and exit

       Each MODE is of the form `[ugoa]*([-+=]([rwxXst]*|[ugo]))+`.

=== chown ===
This  manual page documents the GNU version of chown.  chown changes the user and/or group ownership of each given file. If only an owner (a user name or numeric user ID) is given, that user is made the  owner of each given file, and the files' group is not changed.  If the owner is followed by a colon and a group name (or numeric group ID), with no spaces between them, the  group ownership of the files is changed as well. If a colon but no group name follows the user name, that user is made the owner of the files and the group of the files is changed to that user's login group. If the colon and group are given, but the owner is omitted, only the group of the files is changed; in this   case, chown performs the same function as chgrp.  If only a colon is given, or if the entire operand is empty, neither the owner nor the group is changed.

OPTIONS
       Change  the  owner  and/or  group  of each FILE to OWNER and/or GROUP.  With --reference, change the
       owner and group of each FILE to those of RFILE.

       -c, --changes
              like verbose but report only when a change is made

       --dereference
              affect the referent of each symbolic link (this is the default),  rather  than  the  symbolic
              link itself

       -h, --no-dereference
              affect  each  symbolic  link  instead of any referenced file (useful only on systems that can
              change the ownership of a symlink)

       --from=CURRENT_OWNER:CURRENT_GROUP
              change the owner and/or group of each file only if its current owner and/or group match those
              specified here.  Either may be omitted, in which case a match is not required for the omitted
              attribute.

       --no-preserve-root
              do not treat / specially (the default)

       --preserve-root
              fail to operate recursively on /

       -f, --silent, --quiet
              suppress most error messages

       --reference=RFILE
              use RFILE's owner and group rather than specifying OWNER:GROUP values

       -R, --recursive
              operate on files and directories recursively

       -v, --verbose
              output a diagnostic for every file processed

       The following options modify how a hierarchy is traversed when the -R option is also specified.   If
       more than one is specified, only the final one takes effect.

       -H     if a command line argument is a symbolic link to a directory, traverse it

       -L     traverse every symbolic link to a directory encountered

       -P     do not traverse any symbolic links (default)

       --help display this help and exit

       --version
              output version information and exit

       Owner is unchanged if missing.  Group is unchanged if missing, but changed to login group if implied by a : following a symbolic OWNER.  OWNER and GROUP may be numeric as well as symbolic.

EXAMPLES
       chown root /u
              Change the owner of /u to "root".

       chown root:staff /u
              Likewise, but also change its group to "staff".

       chown -hR root /u
              Change the owner of /u and subfiles to "root".


=== chroot ===
       Run COMMAND with root directory set to NEWROOT.

       --help display this help and exit

       --version
              output version information and exit

       If no command is given, run `${SHELL} -i` (default: /bin/sh).

=== cksum ===
      Print CRC checksum and byte counts of each FILE.

       --help display this help and exit

       --version
              output version information and exit
EXAMPLES
       cksum /bin/ls
       3265941495 92312 /bin/ls
       displays the crc checksum 3265941495 and byte count 92312 of /bin/ls
   
=== comm ===
       Compare sorted files FILE1 and FILE2 line by line.

       With no options, produce three-column output.  Column one contains lines unique to FILE1, column two
       contains lines unique to FILE2, and column three contains lines common to both files.

       -1     suppress lines unique to FILE1

       -2     suppress lines unique to FILE2

       -3     suppress lines that appear in both files

       --help display this help and exit

       --version
        output version information and exit


=== cp ===
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --archive
              same as -dpR

       --backup[=CONTROL]
              make a backup of each existing destination file

       -b     like --backup but does not accept an argument

       --copy-contents
              copy contents of special files when recursive

       -d     same as --no-dereference --preserve=links

       -f, --force
              if an existing destination file cannot be opened, remove it and try again

       -i, --interactive
              prompt before overwrite

       -H     follow command-line symbolic links in SOURCE

       -l, --link
              link files instead of copying

       -L, --dereference
              always follow symbolic links in SOURCE

       -P, --no-dereference
              never follow symbolic links in SOURCE

       -p     same as --preserve=mode,ownership,timestamps

       --preserve[=ATTR_LIST]
              preserve  the  specified  attributes  (default: mode,ownership,timestamps), if possible additional attributes: context, links, all

       --no-preserve=ATTR_LIST
              don't preserve the specified attributes

       --parents
              use full source file name under DIRECTORY

       -R, -r, --recursive
              copy directories recursively

       --remove-destination
              remove each existing destination file before attempting to open it (contrast with --force)

       --sparse=WHEN
              control creation of sparse files

       --strip-trailing-slashes
              remove any trailing slashes from each SOURCE argument

       -s, --symbolic-link
              make symbolic links instead of copying

       -S, --suffix=SUFFIX
              override the usual backup suffix

       -t, --target-directory=DIRECTORY
              copy all SOURCE arguments into DIRECTORY

       -T, --no-target-directory
              treat DEST as a normal file

       -u, --update
              copy only when the SOURCE file is newer than the destination file  or  when  the  destination
              file is missing

       -v, --verbose
              explain what is being done

       -x, --one-file-system
              stay on this file system

       --help display this help and exit

       --version
              output version information and exit

       By default, sparse SOURCE files are detected by a crude heuristic and the corresponding DEST file is
       made sparse as well.  That is the behavior selected by --sparse=auto.   Specify  --sparse=always  to
       create  a  sparse  DEST file whenever the SOURCE file contains a long enough sequence of zero bytes.
       Use --sparse=never to inhibit creation of sparse files.

       The backup suffix is ~, unless set with --suffix or  SIMPLE_BACKUP_SUFFIX.   The  version  control
       method  may be selected via the --backup option or through the VERSION_CONTROL environment variable.
       Here are the values:

       none, off
              never make backups (even if --backup is given)

       numbered, t
              make numbered backups

       existing, nil
              numbered if numbered backups exist, simple otherwise

       simple, never
              always make simple backups

       As a special case, cp makes a backup of SOURCE when the force  and  backup  options  are  given  and
       SOURCE and DEST are the same name for an existing, regular file.

EXAMPLES
       cp ~/somefile /bkp/
          copies somefile from the users home directory to the bkp directory
       cp -rvp ~/ /bkp/
          copy recursively everything from the users home dirctory to the bkp directory, displaying what is going on, and preserving permissions.

=== csplit ===
 Output  pieces  of FILE separated by PATTERN(s) to files "xx00", "xx01", ..., and output byte counts
       of each piece to standard output.

       Mandatory arguments to long options are mandatory for short options too.

       -b, --suffix-format=FORMAT
              use sprintf FORMAT instead of %02d

       -f, --prefix=PREFIX
              use PREFIX instead of 'xx'

       -k, --keep-files
              do not remove output files on errors

       -n, --digits=DIGITS
              use specified number of digits instead of 2

       -s, --quiet, --silent
              do not print counts of output file sizes

       -z, --elide-empty-files
              remove empty output files

       --help display this help and exit

       --version
              output version information and exit

       Read standard input if FILE is -.  Each PATTERN may be:

       INTEGER
              copy up to but not including specified line number

       /REGEXP/[OFFSET]
              copy up to but not including a matching line

       %REGEXP%[OFFSET]
              skip to, but not including a matching line

       `{INTEGER}`
              repeat the previous pattern specified number of times

       `{*}`    repeat the previous pattern as many times as possible

       A line OFFSET is a required "+" or "-" followed by a positive integer.

=== cut ===
 Print selected parts of lines from each FILE to standard output.

       Mandatory arguments to long options are mandatory for short options too.

       -b, --bytes=LIST
              select only these bytes

       -c, --characters=LIST
              select only these characters

       -d, --delimiter=DELIM
              use DELIM instead of TAB for field delimiter

       -f, --fields=LIST
              select  only  these fields;  also print any line that contains no delimiter character, unless
              the -s option is specified

       -n     (ignored)

       --complement
              complement the set of selected bytes, characters or fields.

       -s, --only-delimited
              do not print lines not containing delimiters

       --output-delimiter=STRING
              use STRING as the output delimiter the default is to use the input delimiter

       --help display this help and exit

       --version
              output version information and exit

       Use one, and only one of -b, -c or -f.  Each LIST is made up of one range, or many ranges  separated
       by  commas.   Selected  input  is  written in the same order that it is read, and is written exactly
       once.  Each range is one of:

       N      N'th byte, character or field, counted from 1

       N-     from N'th byte, character or field, to end of line

       N-M    from N'th to M'th (included) byte, character or field

       -M     from first to M'th (included) byte, character or field

       With no FILE, or when FILE is -, read standard input.


=== date ===
 Display the current time in the given FORMAT, or set the system date.

       -d, --date=STRING
              display time described by STRING, not "now"

       -f, --file=DATEFILE
              like --date once for each line of DATEFILE

       -r, --reference=FILE
              display the last modification time of FILE

       -R, --rfc-2822
              output date and time in RFC 2822 format.  Example: Mon, 07 Aug 2006 12:34:56 -0600

       --rfc-3339=TIMESPEC
              output  date  and  time in RFC 3339 format.  TIMESPEC="date", "seconds", or "ns" for date and
              time to the indicated precision.  Date and time components are separated by a  single  space:
              2006-08-07 12:34:56-06:00

       -s, --set=STRING
              set time described by STRING

       -u, --utc, --universal

       --help display this help and exit

       --version
              output version information and exit

       FORMAT controls the output.  The only valid option for the second form specifies Coordinated Universal Time.  Interpreted sequences are:

`         %%     a literal %

       %a     locale's abbreviated weekday name (e.g., Sun)

       %A     locale's full weekday name (e.g., Sunday)

       %b     locale's abbreviated month name (e.g., Jan)

       %B     locale's full month name (e.g., January)

       %c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)

       %C     century; like %Y, except omit last two digits (e.g., 21)

       %d     day of month (e.g, 01)

       %D     date; same as %m/%d/%y

       %e     day of month, space padded; same as %_d

       %F     full date; same as %Y-%m-%d

       %g     last two digits of year of ISO week number (see %G)

       %G     year of ISO week number (see %V); normally useful only with %V

       %h     same as %b

       %H     hour (00..23)

       %I     hour (01..12)

       %j     day of year (001..366)

       %k     hour ( 0..23)

       %l     hour ( 1..12)

       %m     month (01..12)

       %M     minute (00..59)

       %n     a newline

       %N     nanoseconds (000000000..999999999)

       %p     locale's equivalent of either AM or PM; blank if not known

       %P     like %p, but lower case

       %r     locale's 12-hour clock time (e.g., 11:11:04 PM)

       %R     24-hour hour and minute; same as %H:%M

       %s     seconds since 1970-01-01 00:00:00 UTC

       %S     second (00..60)

       %t     a tab

       %T     time; same as %H:%M:%S

       %u     day of week (1..7); 1 is Monday

       %U     week number of year, with Sunday as first day of week (00..53)

       %V     ISO week number, with Monday as first day of week (01..53)

       %w     day of week (0..6); 0 is Sunday

       %W     week number of year, with Monday as first day of week (00..53)

       %x     locale's date representation (e.g., 12/31/99)

       %X     locale's time representation (e.g., 23:13:48)

       %y     last two digits of year (00..99)

       %Y     year

       %z     +hhmm numeric timezone (e.g., -0400)

       %:z    +hh:mm numeric timezone (e.g., -04:00)

       %::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)

       %:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)

       %Z     alphabetic time zone abbreviation (e.g., EDT)

       By default, date pads numeric fields with zeroes.  The following optional flags may follow "%":

       -      (hyphen) do not pad the field

       _      (underscore) pad with spaces

       0      (zero) pad with zeros

       ^      use upper case if possible

       `#`      use opposite case if possible

       After any flags comes an optional field width, as a decimal number; then an optional modifier, which
       is  either  E  to  use the locale's alternate representations if available, or O to use the locale's
       alternate numeric symbols if available.
`
=== dd ===

 Copy a file, converting and formatting according to the operands.

       bs=BYTES
              force ibs=BYTES and obs=BYTES

       cbs=BYTES
              convert BYTES bytes at a time

       conv=CONVS
              convert the file as per the comma separated symbol list

       count=BLOCKS
              copy only BLOCKS input blocks

       ibs=BYTES
              read BYTES bytes at a time

       if=FILE
              read from FILE instead of stdin

       iflag=FLAGS
              read as per the comma separated symbol list

       obs=BYTES
              write BYTES bytes at a time

       of=FILE
              write to FILE instead of stdout

       oflag=FLAGS
              write as per the comma separated symbol list

       seek=BLOCKS
              skip BLOCKS obs-sized blocks at start of output

       skip=BLOCKS
              skip BLOCKS ibs-sized blocks at start of input

       status=noxfer
              suppress transfer statistics

       BLOCKS and BYTES may be followed by the following multiplicative suffixes: xM M, c 1, w 2, b 512, kB
`           1000, K 1024, MB 1000*1000, M 1024*1024, GB 1000*1000*1000, G 1024*1024*1024, and so on for T, P, E,
       Z, Y.`

       Each CONV symbol may be:

       ascii  from EBCDIC to ASCII

       ebcdic from ASCII to EBCDIC

       ibm    from ASCII to alternate EBCDIC

       block  pad newline-terminated records with spaces to cbs-size

       unblock replace trailing spaces in cbs-size records with newline

       lcase  change upper case to lower case

       nocreat do not create the output file

       excl   fail if the output file already exists

       notrunc do not truncate the output file

       ucase  change lower case to upper case

       swab   swap every pair of input bytes

       noerror continue after read errors

       sync   pad every input block with NULs to ibs-size; when used with block or unblock, pad with spaces rather than NULs

       fdatasync physically write output file data before finishing

       fsync  likewise, but also write metadata

       Each FLAG symbol may be:

       append append mode (makes sense only for output; conv=notrunc suggested)

       direct use direct I/O for data

              directory fail unless a directory dsync     use synchronized I/O for data sync      likewise,
              but  also  for  metadata  nonblock   use non-blocking I/O noatime   do not update access time
              noctty    do not assign controlling terminal from file nofollow  do not follow symlinks

       Sending a USR1 signal to a running "dd" process makes it print I/O statistics to standard error  and
       then resume copying.

              $ dd if=/dev/zero of=/dev/null& pid=$!
              $ kill -USR1 $pid; sleep 1; kill $pid

              `18335302+0  records  in 18335302+0 records out 9387674624 bytes (9.4 GB) copied, 34.6279 seconds, 271 MB/s'

       Options are:

       --help display this help and exit

       --version output version information and exit


=== df ===

This manual page documents the GNU version of df.  df displays the amount of disk space available on
       the file system containing each file name argument.  If no file name is given, the  space  available
       on all currently mounted file systems is shown.  Disk space is shown in 1K blocks by default, unless
       the environment variable POSIXLY_CORRECT is set, in which case 512-byte blocks are used.

       If an argument is the absolute file name of a disk device node containing a mounted file system,  df
       shows  the  space available on that file system rather than on the file system containing the device
       node (which is always the root file system).  This version of df cannot show the space available  on
       unmounted file systems, because on most kinds of systems doing so requires very nonportable intimate
       knowledge of file system structures.

OPTIONS
       Show information about the file system on which each FILE resides, or all file systems by default.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              include dummy file systems

       -B, --block-size=SIZE
              use SIZE-byte blocks

       -h, --human-readable
              print sizes in human readable format (e.g., 1K 234M 2G)

       -H, --si
              likewise, but use powers of 1000 not 1024

       -i, --inodes
              list inode information instead of block usage

       -k     like --block-size=1K

       -l, --local
              limit listing to local file systems

       --no-sync
              do not invoke sync before getting usage info (default)

       -P, --portability
              use the POSIX output format

       --sync invoke sync before getting usage info

       -t, --type=TYPE
              limit listing to file systems of type TYPE

       -T, --print-type
              print file system type

       -x, --exclude-type=TYPE
              limit listing to file systems not of type TYPE

       -v     (ignored)

       --help display this help and exit
`SIZE may be (or may be an integer optionally followed by) one of following:  kB  1000,  K  1024,  MB 1000*1000, M 1024*1024, and so on for G, T, P, E, Z, Y.`


=== dir ===
 
List information about the FILEs (the current directory by default).  Sort entries alphabetically if
       none of -cftuvSUX nor --sort.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author
              with -l, print the author of each file

       -b, --escape
              print octal escapes for nongraphic characters

       --block-size=SIZE
              use SIZE-byte blocks

       -B, --ignore-backups
              do not list implied entries ending with ~

       -c     with -lt: sort by, and show, ctime (time of last modification  of  file  status  information)
              with -l: show ctime and sort by name otherwise: sort by ctime

       -C     list entries by columns

       --color[=WHEN]
              control  whether  color is used to distinguish file types.  WHEN may be never, always, or
              auto

       -d, --directory
              list directory entries instead of contents, and do not dereference symbolic links

       -D, --dired
              generate output designed for Emacs' dired mode

       -f     do not sort, enable -aU, disable -ls --color

       -F, --classify
              append indicator `(one of */=>@|)` to entries

       --file-type
              likewise, except do not append `*`

       --format=WORD
              across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C

       --full-time
              like -l --time-style=full-iso

       -g     like -l, but do not list owner

       --group-directories-first
              group directories before files

       -G, --no-group
              in a long listing, don't print group names

       -h, --human-readable
              with -l, print sizes in human readable format (e.g., 1K 234M 2G)

       --si   likewise, but use powers of 1000 not 1024

       -H, --dereference-command-line
              follow symbolic links listed on the command line

       --dereference-command-line-symlink-to-dir
              follow each command line symbolic link that points to a directory

       --hide=PATTERN
              do not list implied entries matching shell PATTERN (overridden by -a or -A)

       --indicator-style=WORD
              append indicator with style WORD to  entry  names:  none  (default),  slash  (-p),  file-type
              (--file-type), classify (-F)

       -i, --inode
              print the index number of each file

       -I, --ignore=PATTERN
              do not list implied entries matching shell PATTERN

       -k     like --block-size=1K

       -l     use a long listing format

       -L, --dereference
              when  showing  file  information  for a symbolic link, show information for the file the link
              references rather than for the link itself

       -m     fill width with a comma separated list of entries

       -n, --numeric-uid-gid
              like -l, but list numeric user and group IDs

       -N, --literal
              print raw entry names (don't treat e.g. control characters specially)

       -o     like -l, but do not list group information

       -p, --indicator-style=slash
              append / indicator to directories

       -q, --hide-control-chars
              print ? instead of non graphic characters

       --show-control-chars
              show non graphic characters as-is (default unless program is 'ls' and output is a terminal)

       -Q, --quote-name
              enclose entry names in double quotes

       --quoting-style=WORD
              use quoting style WORD for entry names: literal, locale, shell, shell-always, c, escape

       -r, --reverse
              reverse order while sorting

       -R, --recursive
              list subdirectories recursively

       -s, --size
              print the size of each file, in blocks

       -S     sort by file size

       --sort=WORD
              sort by WORD instead of name: none -U, extension -X, size -S, time -t, version -v

       --time=WORD
              with -l, show time as WORD instead of modification time: atime -u, access -u, use  -u,  ctime
              -c, or status -c; use specified time as sort key if --sort=time

       --time-style=STYLE
              with  -l,  show times using style STYLE: full-iso, long-iso, iso, locale, +FORMAT.  FORMAT is
              interpreted like date; if FORMAT is `FORMAT1<newline>FORMAT2,` FORMAT1 applies to  non-recent
              files  and  FORMAT2  to  recent files; if STYLE is prefixed with posix-, STYLE takes effect
              only outside the POSIX locale

       -t     sort by modification time

       -T, --tabsize=COLS
              assume tab stops at each COLS instead of 8

       -u     with -lt: sort by, and show, access time with -l: show access time and sort  by  name  otherwise: sort by access time

       -U     do not sort; list entries in directory order

       -v     sort by version

       -w, --width=COLS
              assume screen width instead of current value

       -x     list entries by lines instead of by columns

       -X     sort alphabetically by entry extension

       -Z, --context
              print any SELinux security context of each file

       -1     list one file per line

       --help display this help and exit

       --version
              output version information and exit

       SIZE  may  be  (or  may  be an integer optionally followed by) one of following: kB 1000, K 1024, MB 1000*1000, M 1024*1024, and so on for G, T, P, E, Z, Y.

       By default, color is not  used  to  distinguish  types  of  files.   That  is  equivalent  to  using
       --color=none.   Using  the  --color option without the optional WHEN argument is equivalent to using
       --color=always.  With --color=auto, color codes are output only if standard output is connected to a
       terminal  (tty).  The environment variable LS_COLORS can influence the colors, and can be set easily
       by the dircolors command.

       Exit status is 0 if OK, 1 if minor problems, 2 if serious trouble.


=== dircolors ===
      Output commands to set the LS_COLORS environment variable.

   Determine format of output:
       -b, --sh, --bourne-shell
              output Bourne shell code to set LS_COLORS

       -c, --csh, --c-shell
              output C shell code to set LS_COLORS

       -p, --print-database
              output defaults

       --help display this help and exit

       --version
              output version information and exit

       If  FILE is specified, read it to determine which colors to use for which file types and extensions.
       Otherwise, a precompiled database is used.  For details on the format of these files, run dircolors
       --print-database.

=== dirname ===

       Print  NAME  with  its trailing /component removed; if NAME contains no /'s, output '.' (meaning the
       current directory).

       --help display this help and exit

       --version
              output version information and exit

EXAMPLES
       dirname /usr/bin/sort
              Output "/usr/bin".

       dirname stdio.h
              Output ".".

=== du ===

Summarize disk usage of each FILE, recursively for directories.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              write counts for all files, not just directories

       --apparent-size
              print  apparent sizes, rather than disk usage; although the apparent size is usually smaller,
              it may be larger due to holes in (sparse) files, internal fragmentation,  indirect  blocks,
              and the like

       -B, --block-size=SIZE
              use SIZE-byte blocks

       -b, --bytes
              equivalent to "--apparent-size --block-size=1"

       -c, --total
              produce a grand total

       -D, --dereference-args
              dereference only symlinks that are listed on the command line

       --files0-from=F
              summarize disk usage of the NUL-terminated file names specified in file F

       -H     like --si, but also evokes a warning; will soon change to be equivalent to --dereference-args
              (-D)

       -h, --human-readable
              print sizes in human readable format (e.g., 1K 234M 2G)

       --si   like -h, but use powers of 1000 not 1024

       -k     like --block-size=1K

       -l, --count-links
              count sizes many times if hard linked

       -m     like --block-size=1M

       -L, --dereference
              dereference all symbolic links

       -P, --no-dereference
              don't follow any symbolic links (this is the default)

       -0, --null
              end each output line with 0 byte rather than newline

       -S, --separate-dirs
              do not include size of subdirectories

       -s, --summarize
              display only a total for each argument

       -x, --one-file-system
              skip directories on different file systems

       -X FILE, --exclude-from=FILE
              Exclude files that match any pattern in FILE.

       --exclude=PATTERN
              Exclude files that match PATTERN.

       --max-depth=N
              print the total for a directory (or file, with --all) only if it is N or fewer  levels  below
              the command line argument;  --max-depth=0 is the same as --summarize

       --time show time of the last modification of any file in the directory, or any of its subdirectories

       --time=WORD
              show time as WORD instead of modification time: atime, access, use, ctime or status

       --time-style=STYLE
              show times using style STYLE: full-iso, long-iso, iso, +FORMAT  FORMAT  is  interpreted  like
              'date'

       --help display this help and exit

       --version
              output version information and exit

       SIZE  may  be  (or  may  be an integer optionally followed by) one of following: kB 1000, K 1024, MB `1000*1000, M 1024*1024,` and so on for G, T, P, E, Z, Y.

PATTERNS
       PATTERN is a shell pattern (not a regular expression).  The pattern ?  matches  any  one  character,
       whereas  `*` matches any string (composed of zero, one or multiple characters).  For example, `*.o` will
       match any files whose names end in .o.  Therefore, the command

              du --exclude=`*.o`

       will skip all files and subdirectories ending in .o (including the file .o itself).

=== echo ===

Echo the STRING(s) to standard output.

       -n     do not output the trailing newline

       -e     enable interpretation of backslash escapes

       -E     disable interpretation of backslash escapes (default)

       --help display this help and exit

       --version
              output version information and exit

       If -e is in effect, the following sequences are recognized:

       \0NNN  the character whose ASCII code is NNN (octal)

       \\     backslash

       \a     alert (BEL)

       \b     backspace

       \c     suppress trailing newline

       \f     form feed

       \n     new line

       \r     carriage return

       \t     horizontal tab

       \v     vertical tab

       NOTE:  your  shell  may have its own version of echo, which usually supersedes the version described
       here.  Please refer to your shell's documentation for details about the options it supports.

=== env ===

       Set each NAME to VALUE in the environment and run COMMAND.

       -i, --ignore-environment
              start with an empty environment

       -u, --unset=NAME
              remove variable from the environment

       --help display this help and exit

       --version
              output version information and exit

       A mere - implies -i.  If no COMMAND, print the resulting environment.


=== expand ===

      Convert  tabs  in each FILE to spaces, writing to standard output.  With no FILE, or when FILE is -,
       read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -i, --initial
              do not convert tabs after non blanks

       -t, --tabs=NUMBER
              have tabs NUMBER characters apart, not 8

       -t, --tabs=LIST
              use comma separated list of explicit tab positions

       --help display this help and exit

       --version
              output version information and exit

=== expr ===

       --help display this help and exit

       --version
              output version information and exit

       Print  the  value  of EXPRESSION to standard output.  A blank line below separates increasing preceâ
       dence groups.  EXPRESSION may be:

       ARG1 | ARG2
              ARG1 if it is neither null nor 0, otherwise ARG2

       ARG1 & ARG2
              ARG1 if neither argument is null or 0, otherwise 0

       ARG1 < ARG2
              ARG1 is less than ARG2

       ARG1 <= ARG2
              ARG1 is less than or equal to ARG2

       ARG1 = ARG2
              ARG1 is equal to ARG2

       ARG1 != ARG2
              ARG1 is unequal to ARG2

       ARG1 >= ARG2
              ARG1 is greater than or equal to ARG2

       ARG1 > ARG2
              ARG1 is greater than ARG2

       ARG1 + ARG2
              arithmetic sum of ARG1 and ARG2

       ARG1 - ARG2
              arithmetic difference of ARG1 and ARG2

       ARG1 `*` ARG2
              arithmetic product of ARG1 and ARG2

       ARG1 / ARG2
              arithmetic quotient of ARG1 divided by ARG2

       ARG1 % ARG2
              arithmetic remainder of ARG1 divided by ARG2

       STRING : REGEXP
              anchored pattern match of REGEXP in STRING

       match STRING REGEXP
              same as STRING : REGEXP

       substr STRING POS LENGTH
              substring of STRING, POS counted from 1

       index STRING CHARS
              index in STRING where any CHARS is found, or 0

       length STRING
              length of STRING

       + TOKEN
              interpret TOKEN as a string, even if it is a

              keyword like âmatchâ or an operator like "/"

       ( EXPRESSION )
              value of EXPRESSION

       Beware that many operators need to be escaped or quoted for shells.  Comparisons are  arithmetic  if
       both  ARGs  are numbers, else lexicographical.  Pattern matches return the string matched between \(
       and \) or null; if \( and \) are not used, they return the number of characters matched or 0.

       Exit status is 0 if EXPRESSION is neither null nor 0, 1 if EXPRESSION is null or 0, 2 if  EXPRESSION
       is syntactically invalid, and 3 if an error occurred.

=== factor ===

       Print the prime factors of each NUMBER.

       --help display this help and exit

       --version
              output version information and exit

       Print the prime factors of all specified integer NUMBERs.  If no arguments are specified on the command line, they are read from standard input.

=== false ===

      Exit with a status code indicating failure.

       --help display this help and exit

       --version
              output version information and exit

       NOTE:  your  shell may have its own version of false, which usually supersedes the version described
       here.  Please refer to your shell's documentation for details about the options it supports.

=== fmt ===

       Reformat  each  paragraph in the FILE(s), writing to standard output.  If no FILE or if FILE is -,
       read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -c, --crown-margin
              preserve indentation of first two lines

       -p, --prefix=STRING
              reformat only lines beginning with STRING, reattaching the prefix to reformatted lines

       -s, --split-only
              split long lines, but do not refill

       -t, --tagged-paragraph
              indentation of first line different from second

       -u, --uniform-spacing
              one space between words, two after sentences

       -w, --width=WIDTH
              maximum line width (default of 75 columns)

       --help display this help and exit

       --version
              output version information and exit

       With no FILE, or when FILE is -, read standard input.

=== fold ===

       Wrap input lines in each FILE (standard input by default), writing to standard output.

       Mandatory arguments to long options are mandatory for short options too.

       -b, --bytes
              count bytes rather than columns

       -s, --spaces
              break at spaces

       -w, --width=WIDTH
              use WIDTH columns instead of 80

       --help display this help and exit

       --version
              output version information and exit

=== groups ===
       print the groups a user is in

      --help display this help and exit

       --version
              output version information and exit

       Same as id -Gn.  If no USERNAME, use current process.

=== head ===

      Print  the  first  10  lines of each FILE to standard output.  With more than one FILE, precede each
       with a header giving the file name.  With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -c, --bytes=[-]N
              print the first N bytes of each file; with the leading â-â, print all but the last N bytes of
              each file

       -n, --lines=[-]N
              print the first N lines instead of the first 10; with the leading â-â, print all but the last
              N lines of each file

       -q, --quiet, --silent
              never print headers giving file names

       -v, --verbose
              always print headers giving file names

       --help display this help and exit

       --version
              output version information and exit

       N may  have  a  multiplier  suffix:  b  512,  kB  1000,  K  1024,  MB  `1000*1000,  M  1024*1024,  GB       1000*1000*1000, G 1024*1024*1024,` and so on for T, P, E, Z, Y.

=== hostid ===

       Print the numeric identifier (in hexadecimal) for the current host.

       --help display this help and exit

       --version
              output version information and exit


=== id ===

       Print information for USERNAME, or the current user.

       -a     ignore, for compatibility with other versions

       -Z, --context
              print only the security context of the current user

       -g, --group
              print only the effective group ID

       -G, --groups
              print all group IDs

       -n, --name
              print a name instead of a number, for -ugG

       -r, --real
              print the real ID instead of the effective ID, with -ugG

       -u, --user
              print only the effective user ID

       --help display this help and exit

       --version
              output version information and exit

       Without any OPTION, print some useful set of identified information.

=== install ===

      In the first three forms, copy SOURCE to DEST or multiple SOURCE(s) to the existing DIRECTORY, while
       setting permission modes and owner/group.  In the 4th form,  create  all  components  of  the  given
       DIRECTORY(ies).

       Mandatory arguments to long options are mandatory for short options too.

       --backup[=CONTROL]
              make a backup of each existing destination file

       -b     like --backup but does not accept an argument

       -c     (ignored)

       -d, --directory
              treat all arguments as directory names; create all components of the specified directories

       -D     create all leading components of DEST except the last, then copy SOURCE to DEST

       -g, --group=GROUP
              set group ownership, instead of processâ current group

       -m, --mode=MODE
              set permission mode (as in chmod), instead of rwxr-xr-x

       -o, --owner=OWNER
              set ownership (super-user only)

       -p, --preserve-timestamps
              apply access/modification times of SOURCE files to corresponding destination files

       -s, --strip
              strip symbol tables

       -S, --suffix=SUFFIX
              override the usual backup suffix

       -t, --target-directory=DIRECTORY
              copy all SOURCE arguments into DIRECTORY

       -T, --no-target-directory
              treat DEST as a normal file

       -v, --verbose
              print the name of each directory as it is created

       --preserve-context
              preserve SELinux security context

       -Z, --context=CONTEXT
              set SELinux security context of files and directories

       --help display this help and exit

       --version
              output version information and exit

       The  backup  suffix  is  "~", unless set with --suffix or SIMPLE_BACKUP_SUFFIX.  The version control
       method may be selected via the --backup option or through the VERSION_CONTROL environment  variable.
       Here are the values:

       none, off
              never make backups (even if --backup is given)

       numbered, t
              make numbered backups

       existing, nil
              numbered if numbered backups exist, simple otherwise

       simple, never
              always make simple backups

=== join ===

      For  each  pair  of  input  lines  with identical join fields, write a line to standard output.  The
       default join field is the first, delimited by whitespace.  When FILE1 or FILE2 (not both) is -, read
       standard input.

       -a FILENUM
              print  unpairable  lines  coming from file FILENUM, where FILENUM is 1 or 2, corresponding to
              FILE1 or FILE2

       -e EMPTY
              replace missing input fields with EMPTY

       -i, --ignore-case
              ignore differences in case when comparing fields

       -j FIELD
              equivalent to -1 FIELD -2 FIELD

       -o FORMAT
              obey FORMAT while constructing output line

       -t CHAR
              use CHAR as input and output field separator

       -v FILENUM
              like -a FILENUM, but suppress joined output lines

       -1 FIELD
              join on this FIELD of file 1

       -2 FIELD
              join on this FIELD of file 2

       --help display this help and exit

       --version
              output version information and exit

       Unless -t CHAR is given, leading blanks separate fields and are ignored, else fields  are  separated
       by  CHAR.   Any  FIELD is a field number counted from 1.  FORMAT is one or more comma or blank separated specifications, each being "FILENUM.FIELD" or 0.  Default FORMAT outputs the join field, the
       remaining fields from FILE1, the remaining fields from FILE2, all separated by CHAR.

       Important:  FILE1  and  FILE2 must be sorted on the join fields.  E.g., use sort -k 1b,1 if join
       has no options.

=== link ===

      Call the link function to create a link named FILE2 to an existing FILE1.

       --help display this help and exit

       --version
              output version information and exit

=== ln ===

      In the 1st form, create a link to TARGET with the name LINK_NAME.  In the 2nd form, create a link to
       TARGET in the current directory.  In the 3rd and 4th forms, create links to each  TARGET  in  DIRECTORY.  Create hard links by default, symbolic links with --symbolic.  When creating hard links, each
       TARGET must exist.

       Mandatory arguments to long options are mandatory for short options too.

       --backup[=CONTROL]
              make a backup of each existing destination file

       -b     like --backup but does not accept an argument

       -d, -F, --directory
              allow the superuser to attempt to hard link directories (note: will probably fail due to system restrictions, even for the superuser)

       -f, --force
              remove existing destination files

       -n, --no-dereference
              treat destination that is a symlink to a directory as if it were a normal file

       -i, --interactive
              prompt whether to remove destinations

       -s, --symbolic
              make symbolic links instead of hard links

       -S, --suffix=SUFFIX
              override the usual backup suffix

       -t, --target-directory=DIRECTORY
              specify the DIRECTORY in which to create the links

       -T, --no-target-directory
              treat LINK_NAME as a normal file

       -v, --verbose
              print name of each linked file

       --help display this help and exit

       --version
              output version information and exit

       The  backup  suffix  is  ~, unless set with --suffix or SIMPLE_BACKUP_SUFFIX.  The version control
       method may be selected via the --backup option or through the VERSION_CONTROL environment  variable.
       Here are the values:

       none, off
              never make backups (even if --backup is given)

       numbered, t
              make numbered backups

       existing, nil
              numbered if numbered backups exist, simple otherwise

       simple, never
              always make simple backups

=== logname ===

       Print the name of the current user.

       --help display this help and exit

       --version
              output version information and exit

=== ls ===

Ref dir

=== md5sum ===

       Print or check MD5 (128-bit) checksums.  With no FILE, or when FILE is -, read standard input.

       -b, --binary
              read in binary mode

       -c, --check
              read MD5 sums from the FILEs and check them

       -t, --text
              read in text mode (default)

   The following two options are useful only when verifying checksums:
       --status
              donât output anything, status code shows success

       -w, --warn
              warn about improperly formatted checksum lines

       --help display this help and exit

       --version
              output version information and exit
       The  sums are computed as described in RFC 1321.  When checking, the input should be a former output
       of this program.  The default mode is to print a line with checksum,  a  character  indicating  type
       (`*` for binary, " " for text), and name for each FILE.

=== mkdir ===

       Create the DIRECTORY(ies), if they do not already exist.

       Mandatory arguments to long options are mandatory for short options too.

       -m, --mode=MODE
              set file mode (as in chmod), not a=rwx - umask

       -p, --parents
              no error if existing, make parent directories as needed

       -v, --verbose
              print a message for each created directory

       -Z, --context=CTX
              set the SELinux security context of each created directory to CTX

       --help display this help and exit

       --version
              output version information and exit

=== mkfifo ===

       Create named pipes (FIFOs) with the given NAMEs.

       -Z, --context=CTX
              set the SELinux security context of each NAME to CTX

       Mandatory arguments to long options are mandatory for short options too.

       -m, --mode=MODE
              set file permission bits to MODE, not a=rw - umask

       --help display this help and exit

       --version
              output version information and exit


=== mknod ===

       Create the special file NAME of the given TYPE.

       -Z, --context=CTX
              set the SELinux security context of NAME to CTX

       Mandatory arguments to long options are mandatory for short options too.

       -m, --mode=MODE
              set file permission bits to MODE, not a=rw - umask

       --help display this help and exit

       --version
              output version information and exit

       Both  MAJOR  and MINOR must be specified when TYPE is b, c, or u, and they must be omitted when TYPE
       is p.  If MAJOR or MINOR begins with 0x or 0X, it is interpreted as hexadecimal;  otherwise,  if  it
       begins with 0, as octal; otherwise, as decimal.  TYPE may be:

       b      create a block (buffered) special file

       c, u   create a character (unbuffered) special file

       p      create a FIFO

=== mv ===
      Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.

       Mandatory arguments to long options are mandatory for short options too.

       --backup[=CONTROL]
              make a backup of each existing destination file

       -b     like --backup but does not accept an argument

       -f, --force
              do not prompt before overwriting

       -i, --interactive
              prompt before overwrite

       --strip-trailing-slashes
              remove any trailing slashes from each SOURCE argument

       -S, --suffix=SUFFIX
              override the usual backup suffix

       -t, --target-directory=DIRECTORY
       -T, --no-target-directory
              treat DEST as a normal file

       -u, --update
              move  only  when  the  SOURCE file is newer than the destination file or when the destination
              file is missing

       -v, --verbose
              explain what is being done

       --help display this help and exit

       --version
              output version information and exit

       The backup suffix is ~, unless set with --suffix or  SIMPLE_BACKUP_SUFFIX.   The  version  control
       method  may be selected via the --backup option or through the VERSION_CONTROL environment variable.
       Here are the values:

       none, off
              never make backups (even if --backup is given)

       numbered, t
              make numbered backups

       existing, nil
              numbered if numbered backups exist, simple otherwise

       simple, never
              always make simple backups


=== nice ===

       Run COMMAND with an adjusted niceness, which affects process scheduling.  With no COMMAND, print the
       current niceness.  Nicenesses range from -20 (most favorable scheduling) to 19 (least favorable).

       -n, --adjustment=N
              add integer N to the niceness (default 10)

       --help display this help and exit

       --version
              output version information and exit

       NOTE: your shell may have its own version of nice, which usually supersedes  the  version  described
       here.  Please refer to your shell's documentation for details about the options it supports.

=== nl ===

       Write  each FILE to standard output, with line numbers added.  With no FILE, or when FILE is -, read
       standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -b, --body-numbering=STYLE
              use STYLE for numbering body lines

       -d, --section-delimiter=CC
              use CC for separating logical pages

       -f, --footer-numbering=STYLE
              use STYLE for numbering footer lines

       -h, --header-numbering=STYLE
              use STYLE for numbering header lines

       -i, --page-increment=NUMBER
              line number increment at each line

       -l, --join-blank-lines=NUMBER
              group of NUMBER empty lines counted as one

       -n, --number-format=FORMAT
              insert line numbers according to FORMAT

       -p, --no-renumber
              do not reset line numbers at logical pages

       -s, --number-separator=STRING
              add STRING after (possible) line number

       -v, --first-page=NUMBER
              first line number on each logical page

       -w, --number-width=NUMBER
              use NUMBER columns for line numbers

       --help display this help and exit

       --version
              output version information and exit

       By default, selects -v1 -i1 -l1 -sTAB -w6 -nrn -hn -bt -fn.  CC are  two  delimiter  characters  for
       separating logical pages, a missing second character implies :.  Type \\ for \.  STYLE is one of:

       a      number all lines

       t      number only nonempty lines

       n      number no lines

       pBRE   number only lines that contain a match for the basic regular expression, BRE

       FORMAT is one of:

       ln     left justified, no leading zeros

       rn     right justified, no leading zeros

       rz     right justified, leading zeros


=== nohup ===

       Run COMMAND, ignoring hangup signals.

       --help display this help and exit

       --version
              output version information and exit

       If  standard  input  is  a  terminal, redirect it from /dev/null.  If standard output is a terminal,
       append output to "nohup.out" if possible, "$HOME/nohup.out" otherwise.  If standard error is a  terminal, redirect it to standard output.  To save output to FILE, use "nohup COMMAND > FILE".

       NOTE:  your  shell may have its own version of nohup, which usually supersedes the version described
       here.  Please refer to your shell's documentation for details about the options it supports.

=== od ===

       Write  an unambiguous representation, octal bytes by default, of FILE to standard output.  With more
       than one FILE argument, concatenate them in the listed order to form the input.  With  no  FILE,  or
       when FILE is -, read standard input.

       All arguments to long options are mandatory for short options.

       -A, --address-radix=RADIX
              decide how file offsets are printed

       -j, --skip-bytes=BYTES
              skip BYTES input bytes first

       -N, --read-bytes=BYTES
              limit dump to BYTES input bytes

       -S, --strings[=BYTES]
              output strings of at least BYTES graphic chars

       -t, --format=TYPE
              select output format or formats

       -v, --output-duplicates
             do not use `*` to mark line suppression

       -w, --width[=BYTES]
              output BYTES bytes per output line

       --traditional
              accept arguments in traditional form

       --help display this help and exit

       --version
              output version information and exit

   Traditional format specifications may be intermixed; they accumulate:
       -a     same as -t a,  select named characters, ignoring high-order bit

       -b     same as -t o1, select octal bytes

       -c     same as -t c,  select ASCII characters or backslash escapes

       -d     same as -t u2, select unsigned decimal 2-byte units

       -f     same as -t fF, select floats

       -i     same as -t dI, select decimal ints

       -l     same as -t dL, select decimal longs

       -o     same as -t o2, select octal 2-byte units

       -s     same as -t d2, select decimal 2-byte units

       -x     same as -t x2, select hexadecimal 2-byte units

       If first and second call formats both apply, the second format is assumed if the last operand begins
       with + or (if there are 2 operands) a digit.  An OFFSET operand  means  -j  OFFSET.   LABEL  is  the
       pseudo-address at first byte printed, incremented when dump is progressing.  For OFFSET and LABEL, a
       0x or 0X prefix indicates hexadecimal; suffixes may be . for octal and b for multiply by 512.

       TYPE is made up of one or more of these specifications:

       a      named character, ignoring high-order bit

       c      ASCII character or backslash escape

       d[SIZE]
              signed decimal, SIZE bytes per integer

       f[SIZE]
              floating point, SIZE bytes per integer

       o[SIZE]
              octal, SIZE bytes per integer

       u[SIZE]
              unsigned decimal, SIZE bytes per integer

       x[SIZE]
              hexadecimal, SIZE bytes per integer

       SIZE is a number.  For TYPE in doux, SIZE may also be C for sizeof(char), S for sizeof(short), I for
       sizeof(int)  or  L  for  sizeof(long).   If  TYPE  is f, SIZE may also be F for sizeof(float), D for
       sizeof(double) or L for sizeof(long double).

       RADIX is d for decimal, o for octal, x for hexadecimal or n for none.  BYTES is hexadecimal with  0x
       or  0X  prefix, and may have a multiplier suffix: b 512, kB 1000, K 1024, `MB 1000*1000, M 1024*1024,`
       `GB 1000*1000*1000, G 1024*1024*1024`, and so on for T, P, E, Z, Y.  Adding a z  suffix  to  any  type
       displays  printable characters at the end of each output line.  --string without a number implies 3.
       --width without a number implies 32.  By default, od uses -A o -t d2 -w16.

=== paste ===

       Write lines consisting of the sequentially corresponding lines from each FILE, separated by TABs, to
       standard output.  With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -d, --delimiters=LIST
              reuse characters from LIST instead of TABs

       -s, --serial
              paste one file at a time instead of in parallel

       --help display this help and exit

       --version
              output version information and exit

=== pathchk ===

       Diagnose unportable constructs in NAME.

       -p     check for most POSIX systems

       -P     check for empty names and leading "-"

       --portability
              check for all POSIX systems (equivalent to -p -P)

       --help display this help and exit

       --version
              output version information and exit


=== pinky ===

       -l     produce long format output for the specified USERs

       -b     omit the user's home directory and shell in long format

       -h     omit the user's project file in long format

       -p     omit the user's plan file in long format

       -s     do short format output, this is the default

       -f     omit the line of column headings in short format

       -w     omit the user's full name in short format

       -i     omit the user's full name and remote host in short format

       -q     omit the user's full name, remote host and idle time in short format

       --help display this help and exit

       --version
              output version information and exit

       A lightweight "finger" program;  print user information.  The utmp file will be /var/run/utmp.

=== pr ===

       Paginate or columnate FILE(s) for printing.

       Mandatory arguments to long options are mandatory for short options too.

       +FIRST_PAGE[:`LAST_PAGE]`, --pages=FIRST_PAGE`[:LAST_PAGE]`
              begin `[stop]` printing with page FIRST`_[LAST_]PAGE`

       -COLUMN, --columns=COLUMN
              output  COLUMN  columns and print columns down, unless -a is used. Balance number of lines in
              the columns on each page.

       -a, --across
              print columns across rather than down, used together with -COLUMN

       -c, --show-control-chars
              use hat notation (^G) and octal backslash notation

       -d, --double-space
              double space the output

       -D, --date-format=FORMAT
              use FORMAT for the header date

       -e`[CHAR[WIDTH]], --expand-tabs[=CHAR[WIDTH]]`
              expand input CHARs (TABs) to tab WIDTH (8)

       -F, -f, --form-feed
              use form feeds instead of newlines to separate pages (by a 3-line page header with  -F  or  a
              5-line header and trailer without -F)

       -h HEADER, --header=HEADER
              use  a  centered  HEADER instead of filename in page header, -h "" prints a blank line, don't
              use -h""

       -i`[CHAR[WIDTH]], --output-tabs[=CHAR[WIDTH]]`
              replace spaces with CHARs (TABs) to tab WIDTH (8)

       -J, --join-lines
              merge full lines, turns off -W line truncation, no  column  alignment,  --sep-string[=STRING]
              sets separators

       -l PAGE_LENGTH, --length=PAGE_LENGTH
              set  the  page length to PAGE_LENGTH (66) lines (default number of lines of text 56, and with
              -F 63)

       -m, --merge
              print all files in parallel, one in each column, truncate  lines,  but  join  lines  of  full
              length with -J

       -n`[SEP[DIGITS]], --number-lines[=SEP[DIGITS]]`
              number lines, use DIGITS (5) digits, then SEP (TAB), default counting starts with 1st line of
              input file

       -N NUMBER, --first-line-number=NUMBER
              start counting with NUMBER at 1st line of first page printed (see +FIRST_PAGE)
       -o MARGIN, --indent=MARGIN
              offset each line with MARGIN (zero) spaces, do not affect -w or -W, MARGIN will be  added  to
              PAGE_WIDTH

       -r, --no-file-warnings
              omit warning when a file cannot be opened

       -s`[CHAR],--separator[=CHAR]`
              separate  columns  by  a single character, default for CHAR is the <TAB> character without -w
              and "no char" with -w -s[CHAR] turns off line truncation of all 3 column options  (-COLUMN|-a
              -COLUMN|-m) except -w is set

       -SSTRING, --sep-string`[=STRING]`
              separate columns by STRING, without -S: Default separator `<TAB>` with -J and `<space>` otherwise
              (same as -S" "), no effect on column options

       -t, --omit-header
              omit page headers and trailers

       -T, --omit-pagination
              omit page headers and trailers, eliminate any pagination by form feeds set in input files

       -v, --show-nonprinting
              use octal backslash notation

       -w `PAGE_WIDTH, --width=PAGE_WIDTH`
              set page width to `PAGE_WIDTH` (72) characters for multiple text-column output  only,  -s`[char]`
              turns off (72)

       -W `PAGE_WIDTH, --page-width=PAGE_WIDTH`
              set page width to PAGE_WIDTH (72) characters always, truncate lines, except -J option is set,
              no interference with -S or -s

       --help display this help and exit

       --version
              output version information and exit

       -t is implied if `PAGE_LENGTH <= 10.  With no FILE, or when FILE is -, read standard input.

=== printenv ===

      print all or part of environment
      If no environment VARIABLE specified, print them all.

       --help display this help and exit

       --version
              output version information and exit

       NOTE:  your  shell  may  have  its  own  version  of  printenv, which usually supersedes the version
       described here.  Please refer to your shell's documentation for details about the  options  it  supports.

=== printf ===

      Print ARGUMENT(s) according to FORMAT, or execute according to OPTION:

       --help display this help and exit

       --version
              output version information and exit

       FORMAT controls the output as in C printf.  Interpreted sequences are:

       \"     double quote

       \NNN   character with octal value NNN (1 to 3 digits)

       \\     backslash

       \a     alert (BEL)

       \b     backspace

       \c     produce no further output

       \f     form feed

       \n     new line

       \r     carriage return

       \t     horizontal tab

       \v     vertical tab

       \xHH   byte with hexadecimal value HH (1 to 2 digits)

       \uHHHH Unicode (ISO/IEC 10646) character with hex value HHHH (4 digits)

       \UHHHHHHHH
              Unicode character with hex value HHHHHHHH (8 digits)

       %%     a single %

       %b     ARGUMENT  as a string with \ escapes interpreted, except that octal escapes are of the form
              \0 or \0NNN

       and all C format specifications ending with one of diouxXfeEgGcs, with ARGUMENTs converted to proper
       type first.  Variable widths are handled.

       NOTE:  your shell may have its own version of printf, which usually supersedes the version described
       here.  Please refer to your shell's documentation for details about the options it supports.


=== ptx ===

       Output a permuted index, including context, of the words in the input files.

       Mandatory arguments to long options are mandatory for short options too.

       -A, --auto-reference
              output automatically generated references

       -G, --traditional
              behave more like System V âptxâ

       -F, --flag-truncation=STRING
              use STRING for flagging line truncations

       -M, --macro-name=STRING
              macro name to use instead of âxxâ

       -O, --format=roff
              generate output as roff directives

       -R, --right-side-refs
              put references at right, not counted in -w

       -S, --sentence-regexp=REGEXP

       -T, --format=tex
              generate output as TeX directives

       -W, --word-regexp=REGEXP
              use REGEXP to match each keyword

       -b, --break-file=FILE
              word break characters in this FILE

       -f, --ignore-case
              fold lower case to upper case for sorting

       -g, --gap-size=NUMBER
              gap size in columns between output fields

       -i, --ignore-file=FILE
              read ignore word list from FILE

       -o, --only-file=FILE
              read only word list from this FILE

       -r, --references
              first field of each line is a reference

       -t, --typeset-mode               - not implemented -

       -w, --width=NUMBER
              output width in columns, reference excluded

       --help display this help and exit

       --version
              output version information and exit

       With no FILE or if FILE is -, read Standard Input.  -F / by default.

=== pwd ===

      Print the full filename of the current working directory.

       --help display this help and exit

       --version
              output version information and exit

       NOTE:  your  shell  may  have its own version of pwd, which usually supersedes the version described
       here.  Please refer to your shell's documentation for details about the options it supports.

=== readlink ===

       Display value of a symbolic link on standard output.

       -f, --canonicalize
              canonicalize by following every symlink in every component of the given name recursively; all
              but the last component must exist

       -e, --canonicalize-existing
              canonicalize by following every symlink in every component of the given name recursively, all
              components must exist

       -m, --canonicalize-missing
              canonicalize  by  following  every  symlink in every component of the given name recursively,
              without requirements on components existence

       -n, --no-newline
              do not output the trailing newline

       -q, --quiet,

       -s, --silent
              suppress most error messages

       -v, --verbose
              report error messages

       --help display this help and exit

       --version
              output version information and exit


=== rm ===

       Remove (unlink) the FILE(s).

       -f, --force
              ignore nonexistent files, never prompt

       -i     prompt before every removal

       -I     prompt once before removing more than three files, or when removing recursively.  Less intrusive than -i, while still giving protection against most mistakes

       --interactive[=WHEN]
              prompt according to WHEN: never, once (-I), or always (-i).  Without WHEN, prompt always

       --one-file-system
              when  removing a hierarchy recursively, skip any directory that is on a file system different
              from that of the corresponding command line argument

       --no-preserve-root
              do not treat / specially

       --preserve-root
              do not remove / (default)

       -r, -R, --recursive
              remove directories and their contents recursively

       -v, --verbose
              explain what is being done

       --help display this help and exit

       --version
              output version information and exit

       By default, rm does not remove directories.  Use the --recursive (-r or -R) option  to  remove  each
       listed directory, too, along with all of its contents.

       To remove a file whose name starts with a -, for example -foo, use one of these commands:

              rm -- -foo

              rm ./-foo

       Note  that  if  you  use rm to remove a file, it is usually possible to recover the contents of that
       file.  If you want more assurance that the contents are truly unrecoverable, consider using shred.

=== rmdir ===

      Remove the DIRECTORY(ies), if they are empty.

       --ignore-fail-on-non-empty

              ignore each failure that is solely because a directory is non-empty

       -p, --parents
              Remove  DIRECTORY  and  its ancestors.  E.g., rmdir -p a/b/c is similar to rmdir a/b/c a/b
              a.

       -v, --verbose
              output a diagnostic for every directory processed

       --help display this help and exit

       --version
              output version information and exit

=== sha1sum ===

       Print or check SHA1 (160-bit) checksums.  With no FILE, or when FILE is -, read standard input.

       -b, --binary
              read in binary mode

       -c, --check
              read SHA1 sums from the FILEs and check them

       -t, --text
              read in text mode (default)

   The following two options are useful only when verifying checksums:
       --status
              donât output anything, status code shows success

       -w, --warn
              warn about improperly formatted checksum lines

       --help display this help and exit

       --version
              output version information and exit

       The  sums are computed as described in FIPS-180-1.  When checking, the input should be a former output of this program.  The default mode is to print a line with checksum, a character indicating type
       (`*` for binary, " " for text), and name for each FILE.

=== seq ===

       Print numbers from FIRST to LAST, in steps of INCREMENT.

       -f, --format=FORMAT
              use printf style floating-point FORMAT

       -s, --separator=STRING
              use STRING to separate numbers (default: \n)

       -w, --equal-width
              equalize width by padding with leading zeroes

       --help display this help and exit

       --version
              output version information and exit

       If  FIRST  or  INCREMENT  is omitted, it defaults to 1.  That is, an omitted INCREMENT defaults to 1
       even when LAST is smaller than FIRST.  FIRST, INCREMENT, and LAST are interpreted as floating  point
       values.  INCREMENT is usually positive if FIRST is smaller than LAST, and INCREMENT is usually negative if FIRST is greater than LAST.  FORMAT must be suitable for printing one argument of type double;  it defaults to %.PRECf if FIRST, INCREMENT, and LAST are all fixed point decimal numbers with
       maximum precision PREC, and to %g otherwise.

=== shred ===

       Overwrite the specified FILE(s) repeatedly, in order to make it harder for even very expensive hardâ
       ware probing to recover the data.

       Mandatory arguments to long options are mandatory for short options too.

       -f, --force
              change permissions to allow writing if necessary

       -n, --iterations=N
              Overwrite N times instead of the default (25)

       --random-source=FILE
              get random bytes from FILE (default /dev/urandom)

       -s, --size=N
              shred this many bytes (suffixes like K, M, G accepted)

       -u, --remove
              truncate and remove file after overwriting

       -v, --verbose
              show progress

       -x, --exact
              do not round file sizes up to the next full block;

              this is the default for non-regular files

       -z, --zero
              add a final overwrite with zeros to hide shredding

       --help display this help and exit

       --version
              output version information and exit

       If FILE is -, shred standard output.

       Delete FILE(s) if --remove (-u) is specified.  The default is not to remove the files because it  is
       common  to  operate  on  device  files like /dev/hda, and those files usually should not be removed.
       When operating on regular files, most people use the --remove option.

       CAUTION: Note that shred relies on a very important assumption: that the file system overwrites data
       in place.  This is the traditional way to do things, but many modern file system designs do not satisfy this assumption.  The following are examples of file systems on which shred is  not  effective,
       or is not guaranteed to be effective in all file system modes:

       `*`  log-structured  or  journaled file systems, such as those supplied with AIX and Solaris (and JFS,
       ReiserFS, XFS, Ext3, etc.)

       `*` file systems that write redundant data and carry on even if some writes fail, such  as  RAID-based
       file systems

       `*` file systems that make snapshots, such as Network Appliance's NFS server

       `*` file systems that cache in temporary locations, such as NFS version 3 clients

       `*` compressed file systems

       In  the case of ext3 file systems, the above disclaimer applies (and shred is thus of limited effectiveness) only in data=journal mode, which journals file data in addition to just metadata.  In both
       the  data=ordered  (default)  and data=writeback modes, shred works as usual.  Ext3 journaling modes
       can be changed by adding the data=something option to the mount options for a particular file system
       in the /etc/fstab file, as documented in the mount man page (man mount).

       In  addition,  file  system backups and remote mirrors may contain copies of the file that cannot be
       removed, and that will allow a shredded file to be recovered later.


=== sleep ===

       Pause  for  NUMBER  seconds.   SUFFIX may be s for seconds (the default), m for minutes, h for
       hours or d for days.  Unlike most implementations that require NUMBER be an integer,  here  NUMBER
       may  be  an  arbitrary  floating point number.  Given two or more arguments, pause for the amount of
       time specified by the sum of their values.

       --help display this help and exit

       --version
              output version information and exit


=== sort ===
       Write sorted concatenation of all FILE(s) to standard output.

       Mandatory arguments to long options are mandatory for short options too.  Ordering options:

       -b, --ignore-leading-blanks
              ignore leading blanks

       -d, --dictionary-order
              consider only blanks and alphanumeric characters

       -f, --ignore-case
              fold lower case to upper case characters

       -g, --general-numeric-sort
              compare according to general numerical value

       -i, --ignore-nonprinting
              consider only printable characters

       -M, --month-sort
              compare (unknown) < JAN < ... < DEC

       -n, --numeric-sort
              compare according to string numerical value

       -R, --random-sort
              sort by random hash of keys

       --random-source=FILE
              get random bytes from FILE (default /dev/urandom)

       -r, --reverse
              reverse the result of comparisons

       Other options:

       -c, --check, --check=diagnose-first
              check for sorted input; do not sort

       -C, --check=quiet, --check=silent
              like -c, but do not report first bad line

       --compress-program=PROG
              compress temporaries with PROG; decompress them with PROG -d

       -k, --key=POS1[,POS2]
              start a key at POS1, end it at POS2 (origin 1)

       -m, --merge
              merge already sorted files; do not sort

       -o, --output=FILE
              write result to FILE instead of standard output

       -s, --stable
              stabilize sort by disabling last-resort comparison

       -S, --buffer-size=SIZE
              use SIZE for main memory buffer

       -t, --field-separator=SEP
              use SEP instead of non-blank to blank transition

       -T, --temporary-directory=DIR
              use DIR for temporaries, not $TMPDIR or /tmp; multiple options specify multiple directories

       -u, --unique
              with -c, check for strict ordering; without -c, output only the first of an equal run

       -z, --zero-terminated
              end lines with 0 byte, not newline

       --help display this help and exit

       --version
              output version information and exit

       POS  is F[.C][OPTS], where F is the field number and C the character position in the field; both are
       origin 1.  If neither -t nor -b is in effect, characters in a field are counted from  the  beginning
       of  the  preceding  whitespace.   OPTS is one or more single-letter ordering options, which override
       global ordering options for that key.  If no key is given, use the entire line as the key.

       SIZE may be followed by the following  multiplicative  suffixes:  %  1%  of  memory,  b  1,  K  1024
       (default), and so on for M, G, T, P, E, Z, Y.

       With no FILE, or when FILE is -, read standard input.

       `*** WARNING ***` The locale specified by the environment affects sort order.  Set LC`_`ALL=C to get the
       traditional sort order that uses native byte values.


=== split ===

      Output  fixed-size  pieces  of  INPUT  to  PREFIXaa,  PREFIXab, ...; default size is 1000 lines, and
       default PREFIX is âxâ.  With no INPUT, or when INPUT is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --suffix-length=N
              use suffixes of length N (default 2)

       -b, --bytes=SIZE
              put SIZE bytes per output file

       -C, --line-bytes=SIZE
              put at most SIZE bytes of lines per output file

       -d, --numeric-suffixes
              use numeric suffixes instead of alphabetic

       -l, --lines=NUMBER
              put NUMBER lines per output file

       --verbose
              print a diagnostic to standard error just before each output file is opened

       --help display this help and exit

       --version
              output version information and exit

       `SIZE may have a multiplier  suffix:  b  512,  kB  1000,  K  1024,  MB  1000*1000,  M  1024*1024,  GB 1000*1000*1000, G 1024*1024*1024`, and so on for T, P, E, Z, Y.


=== stat ===

       Display file or file system status.

       -L, --dereference
              follow links

       -f, --file-system
              display file system status instead of file status

       -c  --format=FORMAT
              use the specified FORMAT instead of the default; output a newline after each use of FORMAT

       --printf=FORMAT
              like  --format,  but interpret backslash escapes, and do not output a mandatory trailing newline.  If you want a newline, include \n in FORMAT.

       -t, --terse
              print the information in terse form

       --help display this help and exit

       --version
              output version information and exit

       The valid format sequences for files (without --file-system):

       %a     Access rights in octal

       %A     Access rights in human readable form

       %b     Number of blocks allocated (see %B)

       %B     The size in bytes of each block reported by %b

       %C     SELinux security context string

       %d     Device number in decimal

       %D     Device number in hex

       %f     Raw mode in hex

       %F     File type

       %g     Group ID of owner

       %G     Group name of owner

       %h     Number of hard links

       %i     Inode number

       %n     File name

       %N     Quoted file name with dereference if symbolic link

       %o     I/O block size

       %s     Total size, in bytes

       %t     Major device type in hex

       %T     Minor device type in hex

       %u     User ID of owner

       %U     User name of owner

       %x     Time of last access

       %X     Time of last access as seconds since Epoch

       %y     Time of last modification

       %Y     Time of last modification as seconds since Epoch

       %z     Time of last change

       %Z     Time of last change as seconds since Epoch

       Valid format sequences for file systems:

       %a     Free blocks available to non-superuser

       %b     Total data blocks in file system

       %c     Total file nodes in file system

       %d     Free file nodes in file system

       %f     Free blocks in file system

       %C     SELinux security context string

       %i     File System ID in hex

       %l     Maximum length of filenames

       %n     File name

       %s     Block size (for faster transfers)

       %S     Fundamental block size (for block counts)

       %t     Type in hex

       %T     Type in human readable form

       NOTE: your shell may have its own version of stat, which usually supersedes  the  version  described
       here.  Please refer to your shell's documentation for details about the options it supports.

=== stty ===

      Print or change terminal characteristics.

       -a, --all
              print all current settings in human-readable form

       -g, --save
              print all current settings in a stty-readable form

       -F, --file=DEVICE
              open and use the specified DEVICE instead of stdin

       --help display this help and exit

       --version
              output version information and exit

       Optional - before SETTING indicates negation.  An `*` marks non-POSIX settings.  The underlying system
       defines which settings are available.

   Special characters:
       `*` dsusp CHAR
              CHAR will send a terminal stop signal once input flushed

       eof CHAR
              CHAR will send an end of file (terminate the input)

       eol CHAR
              CHAR will end the line

       `*` eol2 CHAR
              alternate CHAR for ending the line

       erase CHAR
              CHAR will erase the last character typed

       intr CHAR
              CHAR will send an interrupt signal

       kill CHAR
              CHAR will erase the current line

       `*` lnext CHAR
              CHAR will enter the next character quoted

       quit CHAR
              CHAR will send a quit signal

       `*` rprnt CHAR
              CHAR will redraw the current line

       start CHAR
              CHAR will restart the output after stopping it

       stop CHAR
              CHAR will stop the output

       susp CHAR
              CHAR will send a terminal stop signal

       `*` swtch CHAR
              CHAR will switch to a different shell layer

       `*` werase CHAR
              CHAR will erase the last word typed

   Special settings:
       N      set the input and output speeds to N bauds

       `*` cols N
              tell the kernel that the terminal has N columns

       `*` columns N
              same as cols N

       ispeed N
              set the input speed to N

       `*` line N
              use line discipline N

       min N  with -icanon, set N characters minimum for a completed read

       ospeed N
              set the output speed to N

       `*` rows N
              tell the kernel that the terminal has N rows

       `*` size print the number of rows and columns according to the kernel

       speed  print the terminal speed

       time N with -icanon, set read timeout of N tenths of a second

   Control settings:
       [-]clocal
              disable modem control signals

       [-]cread
              allow input to be received

       `*` [-]crtscts
              enable RTS/CTS handshaking

       csN    set character size to N bits, N in [5..8]

       [-]cstopb
              use two stop bits per character (one with -)

       [-]hup send a hangup signal when the last process closes the tty

       [-]hupcl
              same as [-]hup

       [-]parenb
              generate parity bit in output and expect parity bit in input

       [-]parodd
              set odd parity (even with â-â)

   Input settings:
       [-]brkint
              breaks cause an interrupt signal

       [-]icrnl
              translate carriage return to newline

       [-]ignbrk
              ignore break characters

       [-]igncr
              ignore carriage return

       [-]ignpar
              ignore characters with parity errors

       `*` [-]imaxbel
              beep and do not flush a full input buffer on a character

       [-]inlcr
              translate newline to carriage return

       [-]inpck
              enable input parity checking

       [-]istrip
              clear high (8th) bit of input characters

       `*` [-]iutf8
             assume input characters are UTF-8 encoded

       `*` [-]iuclc
              translate uppercase characters to lowercase

       `*` [-]ixany
              let any character restart output, not only start character

       [-]ixoff
              enable sending of start/stop characters

       [-]ixon
              enable XON/XOFF flow control

       [-]parmrk
              mark parity errors (with a 255-0-character sequence)

       [-]tandem
              same as [-]ixoff

   Output settings:
       `*` bsN  backspace delay style, N in [0..1]

       `*` crN  carriage return delay style, N in [0..3]

       `*` ffN  form feed delay style, N in [0..1]

       `*` nlN  newline delay style, N in [0..1]

       `*` [-]ocrnl
              translate carriage return to newline

       `*` [-]ofdel
              use delete characters for fill instead of null characters

       `*` [-]ofill
              use fill (padding) characters instead of timing for delays

       `*` [-]olcuc
              translate lowercase characters to uppercase

       `*` [-]onlcr
              translate newline to carriage return-newline

       `*` [-]onlret
              newline performs a carriage return

       `*` [-]onocr
              do not print carriage returns in the first column

       [-]opost
              postprocess output

       `*` tabN horizontal tab delay style, N in [0..3]

       `*` tabs same as tab0

       `*` -tabs
              same as tab3

       `*` vtN  vertical tab delay style, N in [0..1]

   Local settings:
       [-]crterase
              echo erase characters as backspace-space-backspace

       `*` crtkill
              kill all line by obeying the echoprt and echoe settings

       `*` -crtkill
              kill all line by obeying the echoctl and echok settings

       `*` [-]ctlecho
              echo control characters in hat notation (^c)

       [-]echo
              echo input characters

       `*` [-]echoctl
              same as [-]ctlecho

       [-]echoe
              same as [-]crterase

       [-]echok
              echo a newline after a kill character

       `*` [-]echoke
              same as [-]crtkill

       [-]echonl
              echo newline even if not echoing other characters

       `*` [-]echoprt
              echo erased characters backward, between â\â and â/â

       [-]icanon
              enable erase, kill, werase, and rprnt special characters

       [-]iexten
              enable non-POSIX special characters

       [-]isig
              enable interrupt, quit, and suspend special characters

       [-]noflsh
              disable flushing after interrupt and quit special characters

       `*` [-]prterase
              same as [-]echoprt

       `*` [-]tostop
              stop background jobs that try to write to the terminal

       `*` [-]xcase
              with icanon, escape with \ for uppercase characters

   Combination settings:
       `*` [-]LCASE
              same as [-]lcase

       cbreak same as -icanon

       -cbreak
              same as icanon

       cooked same as brkint ignpar istrip icrnl ixon opost isig icanon, eof and eol  characters  to  their
              default values

       -cooked
              same as raw

       crt    same as echoe echoctl echoke

       dec    same as echoe echoctl echoke -ixany intr ^c erase 0177 kill ^u

       `*` [-]decctlq
              same as [-]ixany

       ek     erase and kill characters to their default values

       evenp  same as parenb -parodd cs7

       -evenp same as -parenb cs8

       `*` [-]lcase
              same as xcase iuclc olcuc

       litout same as -parenb -istrip -opost cs8

       -litout
              same as parenb istrip opost cs7

       nl     same as -icrnl -onlcr

       -nl    same as icrnl -inlcr -igncr onlcr -ocrnl -onlret

       oddp   same as parenb parodd cs7

       -oddp  same as -parenb cs8

       [-]parity
              same as [-]evenp

       pass8  same as -parenb -istrip cs8

       -pass8 same as parenb istrip cs7

       raw    same  as  -ignbrk  -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl  -ixon  -ixoff
              -iuclc  -ixany -imaxbel -opost -isig -icanon -xcase min 1 time 0

       -raw   same as cooked

       sane   same as cread -ignbrk brkint -inlcr -igncr icrnl -iutf8 -ixoff -iuclc  -ixany  imaxbel  opost
              -olcuc  -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0 isig icanon iexten
              echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke, all special  characters to their default values.

       Handle  the  tty line connected to standard input.  Without arguments, prints baud rate, line discipline, and deviations from stty sane.  In settings, CHAR is taken literally,  or  coded  as  in  ^c,
       `0x37, 0177 or 127; special values ^- or undef used to disable special characters.`


=== sum ===

       Print checksum and block counts for each FILE.

       -r     defeat -s, use BSD sum algorithm, use 1K blocks

       -s, --sysv
              use System V sum algorithm, use 512 bytes blocks

       --help display this help and exit

       --version
              output version information and exit

       With no FILE, or when FILE is -, read standard input.


=== sync ===

      Force changed blocks to disk, update the super block.

       --help display this help and exit

       --version
              output version information and exit

=== tac ===

      Write each FILE to standard output, last line first.  With no FILE, or when FILE is -, read standard
       input.

       Mandatory arguments to long options are mandatory for short options too.

       -b, --before
              attach the separator before instead of after

       -r, --regex
              interpret the separator as a regular expression

       -s, --separator=STRING
              use STRING as the separator instead of newline

       --help display this help and exit

       --version
              output version information and exit


=== tail ===

      Print the last 10 lines of each FILE to standard output.  With more than one FILE, precede each with
       a header giving the file name.  With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       --retry
              keep trying to open a file even if it is inaccessible when tail starts or if it becomes inaccessible later; useful when following by name, i.e., with --follow=name

       -c, --bytes=N
              output  the last N bytes; alternatively, use +N to output bytes starting with the Nth of each
              file

       -f, --follow[={name|descriptor}]
              output appended data as the file grows; -f, --follow, and --follow=descriptor are equivalent

       -F     same as --follow=name --retry

       -n, --lines=N
              output the last N lines, instead of the last 10; or use +N to output lines starting with  the
              Nth

       --max-unchanged-stats=N
              with  --follow=name,  reopen a FILE which has not changed size after N (default 5) iterations
              to see if it has been unlinked or renamed (this is the usual case of rotated log files)

       --pid=PID
              with -f, terminate after process ID, PID dies

       -q, --quiet, --silent
              never output headers giving file names

       -s, --sleep-interval=S
              with -f, sleep for approximately S seconds (default 1.0) between iterations.

       -v, --verbose
              always output headers giving file names

       --help display this help and exit

       --version
              output version information and exit

       If the first character of N (the number of bytes or lines) is a â+â, print beginning  with  the  Nth
       item  from the start of each file, otherwise, print the last N items in the file.  `N may have a multiplier suffix:  b  512,  kB  1000,  K  1024,  MB  1000*1000,  M  1024*1024,  GB  1000*1000*1000,  G 1024*1024*1024, and so on for T, P, E, Z, Y.`

       With  --follow  (-f),  tail  defaults  to  following the file descriptor, which means that even if a
       tailed file is renamed, tail will continue to track its end.  This default behavior is  not  desirable  when  you really want to track the actual name of the file, not the file descriptor (e.g., log
       rotation).  Use --follow=name in that case.  That causes tail to track the named file  by  reopening
       it periodically to see if it has been removed and recreated by some other program.


=== tee ===

       Copy standard input to each FILE, and also to standard output.

       -a, --append
              append to the given FILEs, do not overwrite

       -i, --ignore-interrupts
              ignore interrupt signals

       --help display this help and exit

       --version
              output version information and exit

       If a FILE is -, copy again to standard output.


=== test ===

       Exit with the status determined by EXPRESSION.

       --help display this help and exit

       --version
              output version information and exit

       An  omitted EXPRESSION defaults to false.  Otherwise, EXPRESSION is true or false and sets exit status.  It is one of:

       ( EXPRESSION )
              EXPRESSION is true

       ! EXPRESSION
              EXPRESSION is false

       EXPRESSION1 -a EXPRESSION2
              both EXPRESSION1 and EXPRESSION2 are true

       EXPRESSION1 -o EXPRESSION2
              either EXPRESSION1 or EXPRESSION2 is true

       -n STRING
              the length of STRING is nonzero

       STRING equivalent to -n STRING

       -z STRING
              the length of STRING is zero

       STRING1 = STRING2
              the strings are equal

       STRING1 != STRING2
              the strings are not equal

       INTEGER1 -eq INTEGER2
              INTEGER1 is equal to INTEGER2

       INTEGER1 -ge INTEGER2
              INTEGER1 is greater than or equal to INTEGER2

       INTEGER1 -gt INTEGER2
              INTEGER1 is greater than INTEGER2

       INTEGER1 -le INTEGER2
              INTEGER1 is less than or equal to INTEGER2

       INTEGER1 -lt INTEGER2
              INTEGER1 is less than INTEGER2

       INTEGER1 -ne INTEGER2
              INTEGER1 is not equal to INTEGER2

       FILE1 -ef FILE2
              FILE1 and FILE2 have the same device and inode numbers

       FILE1 -nt FILE2
              FILE1 is newer (modification date) than FILE2

       FILE1 -ot FILE2
              FILE1 is older than FILE2

       -b FILE
              FILE exists and is block special

       -c FILE
              FILE exists and is character special

       -d FILE
              FILE exists and is a directory

       -e FILE
              FILE exists

       -f FILE
              FILE exists and is a regular file

       -g FILE
              FILE exists and is set-group-ID

       -G FILE
              FILE exists and is owned by the effective group ID

       -h FILE
              FILE exists and is a symbolic link (same as -L)

       -k FILE
              FILE exists and has its sticky bit set

       -L FILE
              FILE exists and is a symbolic link (same as -h)

       -O FILE
              FILE exists and is owned by the effective user ID

       -p FILE
              FILE exists and is a named pipe

       -r FILE
              FILE exists and read permission is granted

       -s FILE
              FILE exists and has a size greater than zero

       -S FILE
              FILE exists and is a socket

       -t FD  file descriptor FD is opened on a terminal

       -u FILE
              FILE exists and its set-user-ID bit is set

       -w FILE
              FILE exists and write permission is granted

       -x FILE
              FILE exists and execute (or search) permission is granted

       Except for -h and -L, all FILE-related tests dereference symbolic links.   Beware  that  parentheses
       need  to  be escaped (e.g., by backslashes) for shells.  INTEGER may also be -l STRING, which evaluates to the length of STRING.

       NOTE: [ honors the --help and --version options, but test does not.  test treats each of those as it
       treats any other nonempty STRING.

       NOTE:  your  shell  may  have its own version of test and/or [, which usually supersedes the version
       described here.  Please refer to your shell's documentation for details about the  options  it  supports.


=== touch ===

       Update the access and modification times of each FILE to the current time.

       A FILE argument that does not exist is created empty.

       A  FILE  argument  string of - is handled specially and causes touch to change the times of the file
       associated with standard output.

       Mandatory arguments to long options are mandatory for short options too.

       -a     change only the access time

       -c, --no-create
              do not create any files

       -d, --date=STRING
              parse STRING and use it instead of current time

       -f     (ignored)

       -m     change only the modification time

       -r, --reference=FILE
              use this file's times instead of current time

       -t STAMP
              use [[CC]YY]MMDDhhmm[.ss] instead of current time

       --time=WORD
              change the specified time: WORD is access, atime, or use: equivalent to -a WORD is modify  or
              mtime: equivalent to -m

       --help display this help and exit

       --version
              output version information and exit

       Note that the -d and -t options accept different time-date formats.

=== tr ===

       Translate, squeeze, and/or delete characters from standard input, writing to standard output.

       -c, -C, --complement
              first complement SET1

       -d, --delete
              delete characters in SET1, do not translate

       -s, --squeeze-repeats
              replace  each  input  sequence  of  a repeated character that is listed in SET1 with a single
              occurrence of that character

       -t, --truncate-set1
              first truncate SET1 to length of SET2

       --help display this help and exit

       --version
              output version information and exit

       SETs are specified as strings of characters.  Most represent themselves.  Interpreted sequences are:

       \NNN   character with octal value NNN (1 to 3 octal digits)

       \\     backslash

       \a     audible BEL

       \b     backspace

       \f     form feed

       \n     new line

       \r     return

       \t     horizontal tab

       \v     vertical tab

       CHAR1-CHAR2
              all characters from CHAR1 to CHAR2 in ascending order

       [CHAR*]
              in SET2, copies of CHAR until length of SET1

       [CHAR*REPEAT]
              REPEAT copies of CHAR, REPEAT octal if starting with 0

       [:alnum:]
              all letters and digits

       [:alpha:]
              all letters

       [:blank:]
              all horizontal whitespace

       [:cntrl:]
              all control characters

       [:digit:]
              all digits

       [:graph:]
              all printable characters, not including space

       [:lower:]
              all lower case letters

       [:print:]
              all printable characters, including space

       [:punct:]
              all punctuation characters

       [:space:]
              all horizontal or vertical whitespace

       [:upper:]
              all upper case letters

       [:xdigit:]
              all hexadecimal digits

       [=CHAR=]
              all characters which are equivalent to CHAR

       Translation  occurs  if  -d  is  not  given and both SET1 and SET2 appear.  -t may be used only when
       translating.  SET2 is extended to length of SET1 by  repeating  its  last  character  as  necessary.
       Excess  characters  of  SET2  are ignored.  Only [:lower:] and [:upper:] are guaranteed to expand in
       ascending order; used in SET2 while translating, they may only be used in pairs to specify case conversion.   -s  uses  SET1 if not translating nor deleting; else squeezing uses SET2 and occurs after
       translation or deletion.


=== true ===

       Exit with a status code indicating success.

       --help display this help and exit

       --version
              output version information and exit

       NOTE:  your  shell  may have its own version of true, which usually supersedes the version described
       here.  Please refer to your shell's documentation for details about the options it supports.


=== tsort ===

      Write totally ordered list consistent with the partial ordering in FILE.  With no FILE, or when FILE
       is -, read standard input.

       --help display this help and exit

       --version
              output version information and exit


=== tty ===

       Print the file name of the terminal connected to standard input.

       -s, --silent, --quiet
              print nothing, only return an exit status

       --help display this help and exit

       --version
              output version information and exit


=== uname ===

       Print certain system information.  With no OPTION, same as -s.

       -a, --all
              print all information, in the following order, except omit -p and -i if unknown:

       -s, --kernel-name
              print the kernel name

       -n, --nodename
              print the network node hostname

       -r, --kernel-release
              print the kernel release

       -v, --kernel-version
              print the kernel version

       -m, --machine
              print the machine hardware name

       -p, --processor
              print the processor type or "unknown"

       -i, --hardware-platform
              print the hardware platform or "unknown"

       -o, --operating-system
              print the operating system

       --help display this help and exit

       --version
              output version information and exit


=== unexpand ===

      Convert  blanks  in each FILE to tabs, writing to standard output.  With no FILE, or when FILE is -,
       read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              convert all blanks, instead of just initial blanks

       --first-only
              convert only leading sequences of blanks (overrides -a)

       -t, --tabs=N
              have tabs N characters apart instead of 8 (enables -a)

       -t, --tabs=LIST
              use comma separated LIST of tab positions (enables -a)

       --help display this help and exit

       --version
              output version information and exit


=== uniq ===

SCRIPTION
       Discard  all but one of successive identical lines from INPUT (or standard input), writing to OUTPUT
       (or standard output).

       Mandatory arguments to long options are mandatory for short options too.

       -c, --count
              prefix lines by the number of occurrences

       -d, --repeated
              only print duplicate lines

       -D, --all-repeated[=delimit-method]
              print all duplicate lines delimit-method={none(default),prepend,separate} Delimiting is  done
              with blank lines.

       -f, --skip-fields=N
              avoid comparing the first N fields

       -i, --ignore-case
              ignore differences in case when comparing

       -s, --skip-chars=N
              avoid comparing the first N characters

       -u, --unique
              only print unique lines

       -z, --zero-terminated
              end lines with 0 byte, not newline

       -w, --check-chars=N
              compare no more than N characters in lines

       --help display this help and exit

       --version
              output version information and exit

       A field is a run of whitespace, then non-whitespace characters.  Fields are skipped before chars.

       Note:  uniq  does  not  detect  repeated lines unless they are adjacent.  You may want to sort the
       input first, or use "sort -u" without uniq.


=== unlink ===

       Call the unlink function to remove the specified FILE.

       --help display this help and exit

       --version
              output version information and exit


=== users ===

      Output  who  is currently logged in according to FILE.  If FILE is not specified, use /var/run/utmp.
       /var/log/wtmp as FILE is common.

       --help display this help and exit

       --version
              output version information and exit


=== vdir ===

       List information about the FILEs (the current directory by default).  Sort entries alphabetically if
       none of -cftuvSUX nor --sort.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author
              with -l, print the author of each file

       -b, --escape
              print octal escapes for nongraphic characters

       --block-size=SIZE
              use SIZE-byte blocks

       -B, --ignore-backups
              do not list implied entries ending with ~

       -c     with -lt: sort by, and show, ctime (time of last modification  of  file  status  information)
              with -l: show ctime and sort by name otherwise: sort by ctime

       -C     list entries by columns

       --color[=WHEN]
              control  whether  color is used to distinguish file types.  WHEN may be never, always, or
              auto

       -d, --directory
              list directory entries instead of contents, and do not dereference symbolic links

       -D, --dired
              generate output designed for Emacsâ dired mode

       -f     do not sort, enable -aU, disable -ls --color

       -F, --classify
              append indicator (one of `*/=>@|`) to entries

       --file-type
              likewise, except do not append `*`

       --format=WORD
              across -x, commas -m, horizontal -x, long -l, single-column -1, verbose -l, vertical -C

       --full-time
              like -l --time-style=full-iso

       -g     like -l, but do not list owner

       --group-directories-first
              group directories before files

       -G, --no-group
              in a long listing, donât print group names

       -h, --human-readable
              with -l, print sizes in human readable format (e.g., 1K 234M 2G)

       --si   likewise, but use powers of 1000 not 1024

       -H, --dereference-command-line
              follow symbolic links listed on the command line

       --dereference-command-line-symlink-to-dir
              follow each command line symbolic link that points to a directory

       --hide=PATTERN
              do not list implied entries matching shell PATTERN (overridden by -a or -A)

       --indicator-style=WORD
              append indicator with style WORD to  entry  names:  none  (default),  slash  (-p),  file-type
              (--file-type), classify (-F)

       -i, --inode
              print the index number of each file

       -I, --ignore=PATTERN
              do not list implied entries matching shell PATTERN

       -k     like --block-size=1K

       -l     use a long listing format

       -L, --dereference
              when  showing  file  information  for a symbolic link, show information for the file the link
              references rather than for the link itself

       -m     fill width with a comma separated list of entries

       -n, --numeric-uid-gid
              like -l, but list numeric user and group IDs

       -N, --literal
              print raw entry names (donât treat e.g. control characters specially)

       -o     like -l, but do not list group information

       -p, --indicator-style=slash
              append / indicator to directories

       -q, --hide-control-chars
              print ? instead of non graphic characters

       --show-control-chars
              show non graphic characters as-is (default unless program is âlsâ and output is a terminal)

       -Q, --quote-name
              enclose entry names in double quotes

       --quoting-style=WORD
              use quoting style WORD for entry names: literal, locale, shell, shell-always, c, escape

       -r, --reverse
              reverse order while sorting

       -R, --recursive
              list subdirectories recursively

       -s, --size
              print the size of each file, in blocks

       -S     sort by file size

       --sort=WORD
              sort by WORD instead of name: none -U, extension -X, size -S, time -t, version -v

       --time=WORD
              with -l, show time as WORD instead of modification time: atime -u, access -u, use  -u,  ctime
              -c, or status -c; use specified time as sort key if --sort=time

       --time-style=STYLE
              with  -l,  show times using style STYLE: full-iso, long-iso, iso, locale, +FORMAT.  FORMAT is
              interpreted like âdateâ; if FORMAT is FORMAT1<newline>FORMAT2, FORMAT1 applies to  non-recent
              files  and  FORMAT2  to  recent files; if STYLE is prefixed with posix-, STYLE takes effect
              only outside the POSIX locale

       -t     sort by modification time

       -T, --tabsize=COLS
              assume tab stops at each COLS instead of 8

       -u     with -lt: sort by, and show, access time with -l: show access time and sort  by  name  otherwise: sort by access time

       -U     do not sort; list entries in directory order

       -v     sort by version

       -w, --width=COLS
              assume screen width instead of current value

       -x     list entries by lines instead of by columns

       -X     sort alphabetically by entry extension

       -Z, --context
              print any SELinux security context of each file

       -1     list one file per line

       --help display this help and exit

       --version
              output version information and exit

       SIZE  may  be  (or  may  be an integer optionally followed by) one of following: `kB 1000, K 1024, MB 1000*1000, M 1024*1024, and so on for G, T, P, E, Z, Y.`

       By default, color is not  used  to  distinguish  types  of  files.   That  is  equivalent  to  using
       --color=none.   Using  the  --color option without the optional WHEN argument is equivalent to using
       --color=always.  With --color=auto, color codes are output only if standard output is connected to a
       terminal  (tty).  The environment variable LS_COLORS can influence the colors, and can be set easily
       by the dircolors command.

       Exit status is 0 if OK, 1 if minor problems, 2 if serious trouble.


=== wc ===

       Print newline, word, and byte counts for each FILE, and a total line if more than one FILE is speciâ
       fied.  With no FILE, or when FILE is -, read standard input.

       -c, --bytes
              print the byte counts

       -m, --chars
              print the character counts

       -l, --lines
              print the newline counts

       --files0-from=F
              read input from the files specified by NUL-terminated names in file F

       -L, --max-line-length
              print the length of the longest line

       -w, --words
              print the word counts

       --help display this help and exit

       --version
              output version information and exit


=== who ===

             print active processes spawned by init

       -q, --count
              all login names and number of users logged on

       -r, --runlevel
              print current runlevel

       -s, --short
              print only name, line, and time (default)

       -t, --time
              print last system clock change

       -T, -w, --mesg
              add userâs message status as +, - or ?

       -u, --users
              list users logged in

       --message
              same as -T

       --writable
              same as -T

       --help display this help and exit

       --version
              output version information and exit

       If FILE is not specified, use /var/run/utmp.  /var/log/wtmp as FILE is common.  If ARG1 ARG2  given,
-m presumed: am i or mom likes are usual.

=== whoami ===

      Print the user name associated with the current effective user ID.  Same as id -un.

       --help display this help and exit

       --version
              output version information and exit


=== yes ===

       Repeatedly output a line with all specified STRING(s), or y.

       --help display this help and exit

       --version
              output version information and exit


== Disk Utils ==

=== parted ===

      parted  is  a  disk  partitioning and partition resizing program.  It allows you to create, destroy,
       resize, move and copy ext2, ext3, linux-swap, FAT, FAT32, and reiserfs partitions.  It  can  create,
       resize, and move Macintosh HFS partitions, as well as detect jfs, ntfs, ufs, and xfs partitions.  It
       is useful for creating space for new operating systems, reorganising disk usage, and copying data to
       new hard disks.

       This  manual  page documents parted briefly.  Complete documentation is distributed with the package
       in GNU Info format; see near the bottom.

OPTIONS
       -h, --help
              displays a help message

       -i, --interactive
              prompts for user intervention

       -l, --list
              lists partition layout on all block devices

       -m, --machine
              displays machine parseable output

       -s, --script
              never prompts for user intervention

       -v, --version
              displays the version

COMMANDS
       [device]
              The block device to be used.  When none is given, parted will use the first block  device  it
              finds.

       [command [options]]
              Specifies  the command to be executed.  If no command is given, parted will present a command
              prompt.  Possible commands are:

              check partition
                     Do a simple check on partition.

              cp [source-device] source dest
                     Copy the source partition's filesystem on source-device (or the current device  if  no
                     other device was specified) to the dest partition on the current device.

              help [command]
                     Print general help, or help on command if specified.

              mkfs partition fs-type
                     Make  a  filesystem  fs-type  on  partition.  fs-type  can be one of "fat16", "fat32",
                     "ext2", "linux-swap", or "reiserfs".

              mklabel label-type
                     Create a new disklabel (partition table) of label-type.  label-type should be  one  of
                     "bsd", "dvh", "gpt", "loop", "mac", "msdos", "pc98", or "sun".

              mkpart part-type [fs-type] start end
                     Make  a part-type partition with filesystem fs-type (if specified), beginning at start
                     and ending at end (by default in megabytes).  fs-type can be one of "fat16",  "fat32",
                     "ext2", "HFS", "linux-swap", "NTFS", "reiserfs", or "ufs".  part-type should be one of
                     "primary", "logical", or "extended".

              mkpartfs part-type fs-type start end
                     Make a part-type partition with filesystem fs-type beginning at start  and  ending  at
                     end (by default in megabytes).

              move partition start end
                     Move  partition  so that it begins at start and ends at end.  Note: move never changes
                     the minor number.

              name partition name
                     Set the name of partition to name. This option  works  only  on  Mac,  PC98,  and  GPT
                     disklabels. The name can be placed in quotes, if necessary.

              print  Display the partition table.

              quit   Exit from parted.

              rescue start end
                     Rescue a lost partition that was located somewhere between start and end.  If a partition is found, parted will ask if you want to create an entry for it in the  partition
                     table.

              resize partition start end
                     Resize  the  filesystem  on  partition  so that it begins at start and ends at end (by
                     default in megabytes).

              rm partition
                     Delete partition.

              select device
                     Choose device as the current device to edit. device should usually  be  a  Linux  hard
                     disk device, but it can be a partition, software raid device, or an LVM logical volume
                     if necessary.

              set partition flag state
                     Change the state of the flag on partition to  state.   Supported  flags  are:  "boot",
                     "root",  "swap",  "hidden",  "raid", "lvm", "lba", and "palo".  state should be either
                     "on" or "off".

              unit unit
                     Set unit as the unit to use when displaying locations and sizes, and for  interpreting
                     those  given  by the user when not suffixed with an explicit unit.  unit can be one of
                     "s" (sectors), "B" (bytes), "kB", "MB", "GB", "TB", "%" (percentage of  device  size),
                     "cyl"  (cylinders),  "chs"  (cylinders,  heads,  sectors), or "compact" (megabytes for
                     input, and a human-friendly form for output).

              version
                     Display version information and a copyright message.

KNOWN ISSUES
       ext3 filesystem resizing does not currently work, please use resize2fs(8) instead.

       Resizing partitions with an ext3 filesystem will not generally work because of the above issue.  Use
       resize2fs(8)  to resize the filesystem and resize the partition manually using fdisk(8) or a similar
       tool.  For LVM situations, you will need to use the LVM commands to resize the LVM elements.

== e2fsprogs ==
The ext2, ext3 and ext4 file systems are successors of the original ext
 ("extended") file system. They are the main file system types used for
 hard disks on Debian and other Linux systems.
 .
 This package contains programs for creating, checking, and maintaining
 ext-based file systems, and the generic fsck wrapper.

=== badblocks ===

      badblocks  is  used  to search for bad blocks on a device (usually a disk partition).  device is the
       special file corresponding to the device (e.g /dev/hdc1).   last-block  is  the  last  block  to  be
       checked;  if it is not specified, the last block on the device is used as a default.  first-block is
       an optional parameter specifying the starting block number for the test, which allows the testing to
       start  in  the  middle of the disk.  If it is not specified the first block on the disk is used as a
       default.

       Important note: If the output of badblocks is going to be fed to the e2fsck or mke2fs  programs,  it
       is  important that the block size is properly specified, since the block numbers which are generated
       are very dependent on the block size in use by the filesystem.  For this reason, it is strongly recommended  that  users  not  run  badblocks  directly, but rather use the -c option of the e2fsck and
       mke2fs programs.

OPTIONS
       -b block-size
              Specify the size of blocks in bytes.  The default is 1024.

       -c number of blocks
              is the number of blocks which are tested at a time.  The default is 64.

       -e max bad block count
              Specify a maximum number of bad blocks before aborting the test.  The default is  0,  meaning
              the test will continue until the end of the test range is reached.

       -d read delay factor
              This parameter, if passed and non-zero, will cause bad blocks to sleep between reads if there
              were no errors encountered in the read operation; the delay will be calculated as a  percentage  of  the  time it took for the read operation to be performed. In other words, a value of
              100 will cause each read to be delayed by the amount the previous read took, and a  value  of
              200 by twice the amount.

       -f     Normally,  badblocks  will  refuse  to  do a read/write or a non-destructive test on a device
              which is mounted, since either can cause the system to potentially crash  and/or  damage  the
              filesystem  even  if  it is mounted read-only.  This can be overridden using the -f flag, but
              should almost never be used --- if you think you're smarter than the badblocks  program,  you
              almost  certainly  aren't.   The  only  time  when this option might be safe to use is if the
              /etc/mtab file is incorrect, and the device really isn't mounted.

       -i input`_`file
              Read a list of already existing known bad blocks.  Badblocks will skip testing  these  blocks
              since  they  are  known  to be bad.  If input`_`file is specified as "-", the list will be read
              from the standard input.  Blocks listed in this list will be omitted from the list of new bad
              blocks  produced  on the standard output or in the output file.  The -b option of dumpe2fs(8)
              can be used to retrieve the list of blocks currently marked bad on an existing filesystem, in
              a format suitable for use with this option.

       -o output`_`file
              Write  the list of bad blocks to the specified file.  Without this option, badblocks displays
              the list on its standard output.  The format of this file is  suitable  for  use  by  the  -l
              option in e2fsck(8) or mke2fs(8).

       -p num`_`passes
              Repeat  scanning  the disk until there are no new blocks discovered in num`_`passes consecutive
              scans of the disk.  Default is 0, meaning badblocks will exit after the first pass.

       -t test`_`pattern
              Specify a test pattern to be read (and written) to disk blocks.   The test`_`pattern may either
              be a numeric value between 0 and ULONG`_`MAX-1 inclusive, or the word "random", which specifies
              that the block should be filled with a random bit pattern.   For  read/write  (-w)  and  non-
              destructive  (-n)  modes,  one  or  more  test patterns may be specified by specifying the -t
              option for each test pattern desired.  For read-only mode only a single pattern may be specified and it may not be "random".  Read-only testing with a pattern assumes that the specified
              pattern has previously been written to the disk - if not, large numbers of blocks  will  fail
              verification.   If  multiple  patterns  are specified then all blocks will be tested with one
              pattern before proceeding to the next pattern.

       -n     Use non-destructive read-write mode.  By default only a  non-destructive  read-only  test  is
              done.  This option must not be combined with the -w option, as they are mutually exclusive.

       -s     Show the progress of the scan by writing out the block numbers as they are checked.

       -v     Verbose mode.

       -w     Use  write-mode  test.  With this option, badblocks scans for bad blocks by writing some patterns (0xaa, 0x55, 0xff, 0x00) on every block of the device, reading every block and  comparing  the  contents.  This option may not be combined with the -n option, as they are mutually
              exclusive.

       -X     Internal flag only to be used by e2fsck(8) and mke2fs(8).  It bypasses the exclusive mode in-
              use device safety check.

WARNING
       Never  use  the  -w option on a device containing an existing file system.  This option erases data!
       If you want to do write-mode testing on an existing file system, use the -n option instead.   It  is
       slower, but it will preserve your data.

       The  -e option will cause badblocks to output a possibly incomplete list of bad blocks. Therefore it
 is recommended to use it only when one wants to know if there are any  bad  blocks  at  all  on  the
       device, and not when the list of bad blocks is wanted.


=== blkid  ===
      The blkid program is the command-line interface to working with libblkid(3) library.  It can  determine  the type of content (e.g. filesystem, swap) a block device holds, and also attributes (tokens,
       NAME=value pairs) from the content metadata (e.g. LABEL or UUID fields).

       blkid has two main forms of operation: either searching for a  device  with  a  specific  NAME=value
       pair, or displaying NAME=value pairs for one or more devices.


=== e2fsck ===

      -c cachefile
              Read  from  cachefile  instead of reading from the default cache file /etc/blkid.tab.  If you
              want to start with a clean cache (i.e. don't report devices previously scanned but not necessarily available at this time), specify /dev/null.

       -g     Perform a garbage collection pass on the blkid cache to remove devices which no longer exist.

       -h     Display a usage message and exit.

       -l     Look up one device that matches the search parameter specified using the -t option.  If there
              are  multiple  devices  that  match  the specified search parameter, then the device with the
              highest priority is returned, and/or the first device found  at  a  given  priority.   Device
              types  in  order of decreasing priority are Device Mapper, EVMS, LVM, MD, and finally regular
              block devices.  If this option is not specified, blkid will print all  of  the  devices  that
              match the search parameter.

       -o format
              Display  blkid's  output  using  the specified format.  The format parameter may be full (the
              default), value (only print the value of the tags),  list  (print  the  devices  in  a  user-
              friendly format), or device (only print the device name).

       -L     Print the devices in a user-friendly list format.  This is the equivalent of using the option
              -o list.

       -s tag For each (specified) device, show only the tags that match tag.  It is  possible  to  specify
              multiple  -s  options.  If no tag is specified, then all tokens are shown for all (specified)
              devices.  In order to just refresh the cache without showing any tokens, use -s none with  no
              other options.

       -t NAME=value
              Search  for  block  devices with tokens named NAME that have the value value, and display any
              devices which are found.  Common values for NAME include TYPE, LABEL, and UUID.  If there are
              no  devices specified on the command line, all block devices will be searched; otherwise only
              the specified devices are searched.

       -v     Display version number and exit.

       -w writecachefile
              Write the device cache to writecachefile instead of writing it  to  the  default  cache  file
              /etc/blkid.tab.   If you don't want to save the cache to the default file, specify /dev/null.
              If not specified it will be the same file as that given by the -c option.

       device Display tokens from only the specified device.   It  is  possible  to  give  multiple  device
              options  on the command line.  If none is given, all devices which appear in /proc/partitions
              are shown, if they are recognized.
RETURN CODE
       If the specified token was found, or if any tags were shown from (specified) devices, 0 is returned.
       If the specified token was not found, or no (specified) devices could be identified, an exit code of
       2 is returned.  For usage or other errors, an exit code of 4 is returned.


=== mke2fs ===

      mke2fs is used to create an ext2/ext3 filesystem (usually in a disk partition).  device is the  special  file corresponding to the device (e.g /dev/hdXX).  blocks-count is the number of blocks on the
       device.  If omitted, mke2fs automagically figures the file system size.  If called  as  mkfs.ext3  a
       journal is created as if the -j option was specified.

       -b block-size
              Specify  the  size of blocks in bytes.  Valid block-size values are 1024, 2048 and 4096 bytes
              per block.  If omitted, block-size is heuristically determined by the filesystem size and the
              expected usage of the filesystem (see the -T option).  If block-size is negative, then mke2fs
              will use heuristics to determine the appropriate block size, with  the  constraint  that  the
              block  size  will  be at least block-size bytes.  This is useful for certain hardware devices
              which require that the blocksize be a multiple of 2k.

       -c     Check the device for bad blocks before creating the file system.  If this option is specified
              twice, then a slower read-write test is used instead of a fast read-only test.

       -E extended-options
              Set  extended options for the filesystem.  Extended options are comma separated, and may take
              an argument using the equals (=) sign.  The -E option used to be -R in earlier versions  of
              mke2fs.   The  -R  option  is  still  accepted  for  backwards compatibility.   The following
              extended options are supported:

                   stride=stride-size
                          Configure the filesystem for a RAID array  with  stride-size  filesystem  blocks.
                          This  is  the  number of blocks read or written to disk before moving to the next
                          disk, which is sometimes referred to as the  chunk  size.   This  mostly  affects
                          placement  of  filesystem  metadata  like bitmaps at mke2fs time to avoid placing
                          them on a single disk, which can hurt performance.  It may also be  used  by  the
                          block allocator.

                   stripe-width=stripe-width
                          Configure the filesystem for a RAID array with stripe-width filesystem blocks per
                          stripe. This is typically stride-size `*` N, where N is the number of  data-bearing
                          disks  in  the  RAID  (e.g. for RAID 5 there is one parity disk, so N will be the
                          number of disks in the array minus 1).  This allows the block allocator  to  prevent  read-modify-write  of the parity in a RAID stripe if possible when the data
                          is written.

                   resize=max-online-resize
                          Reserve enough space so that the block group descriptor table can grow to support
                          a filesystem that has max-online-resize blocks.

                   `lazy_itable_init`[= <0 to disable, 1 to enable>]
                          If  enabled  and  the  uninit`_`bg  feature is enabled, the inode table will not be
                          fully initialized by mke2fs.  This speeds up  filesystem  initialization  noticeably,  but  it  requires  the kernel to finish initializing the filesystem in the
                          background when the filesystem is first mounted.  If the option value is omitted,
                          it defaults to 1 to enable lazy inode table initialization.


                   test`_`fs
                          Set  a  flag in the filesystem superblock indicating that it may be mounted using
                          experimental kernel code, such as the ext4dev filesystem.

       -f fragment-size
              Specify the size of fragments in bytes.

       -F     Force mke2fs to create a filesystem, even if the specified device is not  a  partition  on  a
              block  special device, or if other parameters do not make sense.  In order to force mke2fs to
              create a filesystem even if the filesystem appears to be in use or is mounted (a  truly  dangerous thing to do), this option must be specified twice.

       -g blocks-per-group
              Specify  the number of blocks in a block group.  There is generally no reason for the user to
              ever set this parameter, as the default is optimal for the filesystem.   (For  administrators
              who  are creating filesystems on RAID arrays, it is preferable to use the stride RAID parameter as part of the -E option rather than manipulating the number of blocks per group.)   This
              option is generally used by developers who are developing test cases.

       -G number-of-groups
              Specify  the  number of block groups that will be packed together to create one large virtual
              block group on an ext4 filesystem.  This improves meta-data locality and performance on meta-
              data heavy workloads.  The number of groups must be a power of 2 and may only be specified if
              the flex`_`bg filesystem feature is enabled.

       -i bytes-per-inode
              Specify the bytes/inode ratio.  mke2fs creates an inode for every  bytes-per-inode  bytes  of
              space  on  the disk.  The larger the bytes-per-inode ratio, the fewer inodes will be created.
              This value generally shouldn't be smaller than the blocksize of the filesystem, since in that
              case  more  inodes would be made than can ever be used.  Be warned that it is not possible to
              expand the number of inodes on a filesystem after it is created, so be careful  deciding  the
              correct value for this parameter.

       -I inode-size
              Specify the size of each inode in bytes.  mke2fs creates 256-byte inodes by default.  In kernels after 2.6.10 and some earlier vendor kernels it is possible  to  utilize  inodes  larger
              than  128  bytes to store extended attributes for improved performance.  The inode-size value
              must be a power of 2 larger or equal to 128.  The larger the inode-size the  more  space  the
              inode  table  will  consume, and this reduces the usable space in the filesystem and can also
              negatively impact performance.  Extended attributes stored in large inodes  are  not  visible
              with  older  kernels, and such filesystems will not be mountable with 2.4 kernels at all.  It
              is not possible to change this value after the filesystem is created.

       -j     Create the filesystem with an ext3 journal.  If the -J option is not specified,  the  default
              journal  parameters  will be used to create an appropriately sized journal (given the size of
              the filesystem) stored within the filesystem.  Note that you must be using a kernel which has
              ext3 support in order to actually make use of the journal.

       -J journal-options
              Create  the  ext3  journal  using options specified on the command-line.  Journal options are
              comma separated, and may take an argument using the equals (`=`)  sign.  The following  journal options are supported:

                   size=journal-size
                          Create  an internal journal (i.e., stored inside the filesystem) of size journal-
                          size megabytes.  The size of the journal must be at least 1024 filesystem  blocks
                          (i.e.,  1MB if using 1k blocks, 4MB if using 4k blocks, etc.)  and may be no more
                          than 102,400 filesystem blocks.

                   device=external-journal
                          Attach the filesystem to the journal block device  located  on  external-journal.
                          The external journal must already have been created using the command

                          mke2fs -O journal`_`dev external-journal

                          Note that external-journal must have been created with the same block size as the
                          new filesystem.  In addition, while  there  is  support  for  attaching  multiple
                          filesystems  to  a single external journal, the Linux kernel and e2fsck(8) do not
                          currently support shared external journals yet.

                          Instead of specifying a device name directly, external-journal can also be specified  by either LABEL=label or UUID=UUID to locate the external journal by either
                          the volume label or UUID stored in the ext2 superblock at the start of the  journal.   Use  dumpe2fs(8) to display a journal device's volume label and UUID.  See
                          also the -L option of tune2fs(8).

              Only one of the size or device options can be given for a filesystem.

       -l filename
              Read the bad blocks list from filename.  Note that the block numbers in the  bad  block  list
              must be generated using the same block size as used by mke2fs.  As a result, the -c option to
              mke2fs is a much simpler and less error-prone method of checking a disk for bad blocks before
              formatting it, as mke2fs will automatically pass the correct parameters to the badblocks program.

       -L new-volume-label
              Set the volume label for the filesystem to new-volume-label.  The maximum length of the  volume label is 16 bytes.

       -m reserved-blocks-percentage
              Specify  the  percentage  of  the filesystem blocks reserved for the super-user.  This avoids
              fragmentation, and allows root-owned daemons, such as syslogd(8),  to  continue  to  function
              correctly  after  non-privileged processes are prevented from writing to the filesystem.  The
              default percentage is 5%.

       -M last-mounted-directory
              Set the last mounted directory for the filesystem.  This might be  useful  for  the  sake  of
              utilities that key off of the last mounted directory to determine where the filesystem should
              be mounted.

       -n     Causes mke2fs to not actually create a filesystem, but display what it would do if it were to
              create  a  filesystem.   This can be used to determine the location of the backup superblocks
              for a particular filesystem, so long as the mke2fs  parameters  that  were  passed  when  the
              filesystem was originally created are used again.  (With the -n option added, of course!)

       -N number-of-inodes
              Overrides  the  default  calculation  of the number of inodes that should be reserved for the
              filesystem (which is based on the number of blocks  and  the  bytes-per-inode  ratio).   This
              allows the user to specify the number of desired inodes directly.

       -o creator-os
              Overrides  the  default value of the "creator operating system" field of the filesystem.  The
              creator field is set by default to the name of the OS the mke2fs executable was compiled for.

       -O feature[,...]
              Create  a  filesystem  with  the  given features (filesystem options), overriding the default
              filesystem options.  The features that are enabled by default are specified by the  base`-`features  relation, either in the [defaults] section in the /etc/mke2fs.conf configuration file,
              or in the [fs`_`types] subsections for the usage types as specified by the -T  option,  further
              modified  by the features relation found in the [fs`_`types] subsections for the filesystem and
              usage types.  See the mke2fs.conf(5) manual page for more details.  The filesystem  type-specific  configuration setting found in the [fs`_`types] section will override the global default
              found in [defaults].

              The filesystem feature set will be further edited using either the feature set  specified  by
              this  option,  or  if  this  option  is  not  given, by the default`_`features relation for the
              filesystem type being created, or in the [defaults] section of the configuration file.


              The filesystem feature set is comprised of a list of features, separated by commas, that  are
              to  be  enabled.   To  disable  a feature, simply prefix the feature name with a  caret (`^`)
              character.  The pseudo-filesystem feature "none" will clear all filesystem features.

                   `large_file`
                          Filesystem can contain files that are greater than 2GB.  (Modern kernels set this
                          feature automatically when a file > 2GB is created.)

                   `dir_index`
                          Use hashed b-trees to speed up lookups in large directories.

                   filetype
                          Store file type information in directory entries.

                   `flex_bg`
                          Allow  bitmaps  and  inode  tables for a block group to be placed anywhere on the
                          storage media (use with -G option to group meta-data in order to create  a  large
                          virtual block group).

                   `has_journal`
                          Create an ext3 journal (as if using the -j option).

                   `journal_dev`
                          Create  an  external  ext3  journal on the given device instead of a regular ext2
                          filesystem.  Note that external-journal must be created with the same block  size
                          as the filesystems that will be using it.

                   extent Instead  of  using  the  indirect  block  scheme for storing the location of data
                          blocks in an inode, use extents instead.  This is a much more efficient  encoding
                          which speeds up filesystem access, especially for large files.

                   `uninit_bg`
                          Create  a  filesystem without initializing all of the block groups.  This feature
                          also enables checksums and  highest-inode-used  statistics  in  each  blockgroup.
                          This   feature   can   speed   up   filesystem   creation   time  noticeably  (if
                          `lazy_itable_init` is enabled), and can also reduce e2fsck time  dramatically.   It
                          is only supported by the ext4 filesystem in recent Linux kernels.

                   `resize_inode`
                          Reserve space so the block group descriptor table may grow in the future.  Useful
                          for online resizing using resize2fs.  By default mke2fs will attempt  to  reserve
                          enough  space  so  that  the  filesystem may grow to 1024 times its initial size.
                          This can be changed using the resize extended option.

                   `sparse_super`
                          Create a filesystem with fewer superblock backup copies  (saves  space  on  large
                          filesystems).

       -q     Quiet execution.  Useful if mke2fs is run in a script.

       -r revision
              Set the filesystem revision for the new filesystem.  Note that 1.2 kernels only support revision 0 filesystems.  The default is to create revision 1 filesystems.

       -S     Write superblock and group descriptors only.  This is useful if all  of  the  superblock  and
              backup  superblocks  are  corrupted,  and a last-ditch recovery method is desired.  It causes
              mke2fs to reinitialize the superblock and group descriptors, while not touching the inode table and the block and inode bitmaps.  The e2fsck program should be run immediately after this
              option is used, and there is no guarantee that any data will be salvageable.  It is  critical
              to  specify the correct filesystem blocksize when using this option, or there is no chance of
              recovery.

       -t fs-type
              Specify the filesystem type (i.e., ext2, ext3, ext4, etc.) that is to be  created.   If  this
              option  is  not specified, mke2fs will pick a default either via how the command was run (for
              example, using a name of the form mkfs.ext2, mkfs.ext3, etc.) or via a default as defined  by
              the  /etc/mke2fs.conf(5)  file.    This  option controls which filesystem options are used by
              default, based on the fstypes configuration stanza in /etc/mke2fs.conf(5).

              If the -O option is used to explicitly add or remove filesystem options that should be set in
              the  newly created filesystem, the resulting filesystem may not be supported by the requested
              fs-type.  (e.g., "mke2fs -t ext3 -O extents /dev/sdXX" will create a filesystem that  is  not
              supported  by  the  ext3  implementation as found in the Linux kernel; and "mke2fs -t ext3 -O
              `^has_journal` /dev/hdXX" will create a filesystem that does not have a journal and hence  will
              not be supported by the ext3 filesystem code in the Linux kernel.)

       -T usage-type[,...]
              Specify  how the filesystem is going to be used, so that mke2fs can choose optimal filesystem
              parameters for that use.  The usage types that are supported are defined in the configuration
              file  /etc/mke2fs.conf(5).   The user may specify one or more usage types using a comma separated list.

              If this option is is not specified, mke2fs will pick a single default usage type based on the
              size  of  the  filesystem  to  be created.  If the filesystem size is less than or equal to 3
              megabytes, mke2fs will use the filesystem type floppy.  If the  filesystem  size  is  greater
              than  3  but  less  than  or equal to 512 megabytes, mke2fs(8) will use the filesystem small.
              Otherwise, mke2fs(8) will use the default filesystem type default.

       -v     Verbose execution.

       -V     Print the version number of mke2fs and exit.


=== resize2fs ===

       The resize2fs program will resize ext2 or ext3 file systems.  It can be used to enlarge or shrink an
       unmounted file system located on device.  If the filesystem is mounted, it can be used to expand the
       size of the mounted filesystem, assuming the kernel supports on-line resizing.  (As of this writing,
       the Linux 2.6 kernel supports on-line resize for filesystems mounted using ext3 only.).

       The size parameter specifies the requested new size of the filesystem.  If no units  are  specified,
       the  units  of  the size parameter shall be the filesystem blocksize of the filesystem.  Optionally,
       the size parameter may be suffixed by one of the following the units designators: s, K, M,  or
       G,  for  512  byte  sectors,  kilobytes,  megabytes,  or gigabytes, respectively.  The size of the
       filesystem may never be larger than the size of the partition.  If size parameter is not  specified,
       it will default to the size of the partition.

       The resize2fs program does not manipulate the size of partitions.  If you wish to enlarge a filesystem, you must make sure you can expand the size of the underlying partition first.  This can be done
       using  fdisk(8) by deleting the partition and recreating it with a larger size or using lvextend(8),
       if you're using the logical volume manager lvm(8).  When recreating the  partition,  make  sure  you
       create it with the same starting disk cylinder as before!  Otherwise, the resize operation will certainly not work, and you may lose your entire filesystem.  After running fdisk(8), run resize2fs  to
       resize the ext2 filesystem to use all of the space in the newly enlarged partition.

       If you wish to shrink an ext2 partition, first use resize2fs to shrink the size of filesystem.  Then
       you may use fdisk(8) to shrink the size of the partition.  When shrinking the size of the partition,
       make sure you do not make it smaller than the new size of the ext2 filesystem!
      -d debug-flags
              Turns  on  various  resize2fs debugging features, if they have been compiled into the binary.
              debug-flags should be computed by adding the numbers of the desired features from the following list:
                   2    - Debug block relocations
                   4    - Debug inode relocations
                   8    - Debug moving the inode table

       -f     Forces  resize2fs  to  proceed  with  the filesystem resize operation, overriding some safety
              checks which resize2fs normally enforces.

       -F     Flush the filesystem device's buffer caches before beginning.  Only really useful  for  doing
              resize2fs time trials.

       -M     Shrink the filesystem to the minimum size.

       -p     Prints  out  a  percentage completion bars for each resize2fs operation, so that the user can
              keep track of what the program is doing.

       -P     Print the minimum size of the filesystem and exit.

       -S RAID-stride
              The resize2fs program will heuristically determine the RAID stride that  was  specified  when
              the  filesystem was created.  This option allows the user to explicitly specify a RAID stride
              setting to be used by resize2fs instead.

KNOWN BUGS
       The minimum size of the filesystem as estimated  by  resize2fs  may  be  incorrect,  especially  for
       filesystems with 1k and 2k blocksizes.

=== tune2fs ===

      tune2fs  allows  the  system  administrator to adjust various tunable filesystem parameters on Linux
       ext2/ext3 filesystems.

      -c max-mount-counts
              Adjust the number of mounts after which the filesystem will be checked by e2fsck(8).  If max-
              mount-counts is 0 or -1, the number of times the filesystem is mounted will be disregarded by
              e2fsck(8) and the kernel.

              Staggering the mount-counts at which filesystems are forcibly checked will avoid all filesystems being checked at one time when using journaled filesystems.

              You  should  strongly  consider  the consequences of disabling mount-count-dependent checking
              entirely.  Bad disk drives, cables, memory, and kernel bugs could all  corrupt  a  filesystem
              without  marking  the  filesystem  dirty  or  in  error.  If you are using journaling on your
              filesystem, your filesystem will never be marked dirty, so it will not normally  be  checked.
              A filesystem error detected by the kernel will still force an fsck on the next reboot, but it
              may already be too late to prevent data loss at that point.

              See also the -i option for time-dependent checking.

       -C mount-count
              Set the number of times the filesystem has been mounted.  If set to a greater value than  the
              max-mount-counts  parameter  set by the -c option, e2fsck(8) will check the filesystem at the
              next reboot.

       -e error-behavior
              Change the behavior of the kernel code when errors are detected.  In all cases, a  filesystem
              error  will  cause e2fsck(8) to check the filesystem on the next boot.  error-behavior can be
              one of the following:

                   continue    Continue normal execution.

                   remount-ro  Remount filesystem read-only.

                   panic       Cause a kernel panic.

       -E extended-options
              Set extended options for the filesystem.  Extended options are comma separated, and may  take
              an argument using the equals (=) sign.  The following extended options are supported:

                   stride=stride-size
                          Configure  the  filesystem  for  a RAID array with stride-size filesystem blocks.
                          This is the number of blocks read or written to disk before moving to next  disk.
                          This  mostly  affects  placement of filesystem metadata like bitmaps at mke2fs(2)
                          time to avoid placing them on a single disk, which can hurt the performance.   It
                          may also be used by block allocator.

                   `stripe_width=stripe-width`
                          Configure the filesystem for a RAID array with stripe-width filesystem blocks per
                          stripe. This is typically be stride-size `*` N, where N is the number of data disks
                          in  the  RAID  (e.g. RAID 5 N+1, RAID 6 N+2).  This allows the block allocator to
                          prevent read-modify-write of the parity in a RAID stripe  if  possible  when  the
                          data is written.

                   `hash_alg=hash-alg`
                          Set  the  default hash algorithm used for filesystems with hashed b-tree directories.  Valid algorithms accepted are: legacy, `half_md4`, and tea.

                   `test_fs`
                          Set a flag in the filesystem superblock indicating that it may be  mounted  using
                          experimental kernel code, such as the ext4dev filesystem.

                   `^test_fs`
                          Clear  the  `test_fs`  flag, indicating the filesystem should only be mounted using
                          production-level filesystem code.

       -f     Force the tune2fs operation to complete even in the face of errors.  This  option  is  useful
              when  removing  the  `has_journal`  filesystem  feature from a filesystem which has an external
              journal (or is corrupted such that it appears to have an external journal), but that external
              journal is not available.

              WARNING: Removing an external journal from a filesystem which was not cleanly unmounted without first replaying the external journal can result in severe data loss and  filesystem  corruption.

       -g group
              Set  the  group  which  can use the reserved filesystem blocks.  The group parameter can be a
              numerical gid or a group name.  If a group name is given, it is converted to a numerical  gid
              before it is stored in the superblock.

       -i  interval-between-checks[d|m|w]
              Adjust  the maximal time between two filesystem checks.  No postfix or d result in days, m in
              months, and w in weeks.  A value of zero will disable the time-dependent checking.

              It is strongly recommended that either  -c  (mount-count-dependent)  or  -i  (time-dependent)
              checking  be enabled to force periodic full e2fsck(8) checking of the filesystem.  Failure to
              do so may lead to filesystem corruption (due to bad disks, cables, memory,  or  kernel  bugs)
              going unnoticed, ultimately resulting in data loss or corruption.

       -j     Add  an ext3 journal to the filesystem.  If the -J option is not specified, the default journal parameters will be used to create an appropriately sized journal (given the size  of  the
              filesystem)  stored  within  the  filesystem.  Note that you must be using a kernel which has
              ext3 support in order to actually make use of the journal.

              If this option is used to create a journal on a mounted filesystem, an immutable file, .journal, will be created in the top-level directory of the filesystem, as it is the only safe way
              to create the journal inode while the filesystem is mounted.  While the ext3 journal is visible, it is not safe to delete it, or modify it while the filesystem is mounted; for this reason the file is marked immutable.  While checking unmounted filesystems, e2fsck(8) will automatically  move .journal files to the invisible, reserved journal inode.  For all filesystems
              except for the root filesystem,  this should happen automatically and  naturally  during  the
              next  reboot  cycle.   Since  the root filesystem is mounted read-only, e2fsck(8) must be run
              from a rescue floppy in order to effect this transition.

              On some distributions, such as Debian, if an initial ramdisk is used, the initrd scripts will
              automatically  convert  an  ext2 root filesystem to ext3 if the /etc/fstab file specifies the
              ext3 filesystem for the root filesystem in order to avoid  requiring  the  use  of  a  rescue
              floppy to add an ext3 journal to the root filesystem.

       -J journal-options
              Override  the  default  ext3 journal parameters. Journal options are comma separated, and may
              take an argument using the equals (=)  sign.  The following journal options are supported:

                   size=journal-size
                          Create a journal stored in the filesystem of size journal-size  megabytes.    The
                          size  of  the journal must be at least 1024 filesystem blocks (i.e., 1MB if using
                          1k blocks, 4MB if using 4k blocks,  etc.)   and  may  be  no  more  than  102,400
                          filesystem blocks.  There must be enough free space in the filesystem to create a
                          journal of that size.

                   device=external-journal
                          Attach the filesystem to the journal block device  located  on  external-journal.
                          The external journal must have been already created using the command

                          mke2fs -O `journal_dev` external-journal

                          Note that external-journal must be formatted with the same block size as filesystems which will be using it.  In addition, while there is support  for  attaching
                          multiple filesystems to a single external journal, the Linux kernel and e2fsck(8)
                          do not currently support shared external journals yet.

                          Instead of specifying a device name directly, external-journal can also be specified  by either LABEL=label or UUID=UUID to locate the external journal by either
                          the volume label or UUID stored in the ext2 superblock at the start of the  journal.   Use  dumpe2fs(8) to display a journal device's volume label and UUID.  See
                          also the -L option of tune2fs(8).

              Only one of the size or device options can be given for a filesystem.

       -l     List the contents of the filesystem superblock.

       -L volume-label
              Set the volume label of the filesystem.  Ext2 filesystem labels can be at most 16  characters
              long;  if  volume-label  is  longer  than 16 characters, tune2fs will truncate it and print a
              warning.  The volume label can be used by mount(8), fsck(8), and /etc/fstab(5) (and  possibly
              others)  by  specifying  LABEL=`volume_label`  instead  of  a  block  special  device name like
              /dev/hda5.

       -m reserved-blocks-percentage
              Set the percentage of the filesystem which may only be  allocated  by  privileged  processes.
              Reserving  some  number of filesystem blocks for use by privileged processes is done to avoid
              filesystem fragmentation, and to allow system daemons, such as  syslogd(8),  to  continue  to
              function  correctly after non-privileged processes are prevented from writing to the filesystem.  Normally, the default percentage of reserved blocks is 5%.

       -M last-mounted-directory
              Set the last-mounted directory for the filesystem.

       -o [^]mount-option[,...]
              Set or clear the indicated default mount options in the filesystem.   Default  mount  options
              can  be  overridden by mount options specified either in /etc/fstab(5) or on the command line
              arguments to mount(8).  Older kernels may not support this feature;  in  particular,  kernels
              which  predate  2.4.20  will  almost  certainly ignore the default mount options field in the
              superblock.

              More than one mount option can be cleared or set by separating features with  commas.   Mount
              options prefixed with a caret character (^) will be cleared in the filesystem's superblock;
              mount options without a prefix character or prefixed with a  plus  character  (+)  will  be
              added to the filesystem.

              The following mount options can be set or cleared using tune2fs:

                   debug  Enable debugging code for this filesystem.

                   bsdgroups
                          Emulate BSD behaviour when creating new files: they will take the group-id of the
                          directory in which they were created.  The standard System  V  behaviour  is  the
                          default,  where  newly  created  files  take on the fsgid of the current process,
                          unless the directory has the setgid bit set, in which case it takes the gid  from
                          the  parent  directory,  and  also  gets  the setgid bit set if it is a directory
                          itself.

                   `user_xattr`
                          Enable user-specified extended attributes.

                   acl    Enable Posix Access Control Lists.

                   uid16  Disables 32-bit UIDs and GIDs.  This is for interoperability with  older  kernels
                          which only store and expect 16-bit values.

                   `journal_data`
                          When the filesystem is mounted with journalling enabled, all data (not just metadata) is committed into the journal prior to being written into the main filesystem.

                   `journal_data_ordered`
                          When  the  filesystem  is  mounted  with  journalling enabled, all data is forced
                          directly out to the main file system prior to its metadata being committed to the
                          journal.

                   `journal_data_writeback`
                          When the filesystem is mounted with journalling enabled, data may be written into
                          the main filesystem after its metadata has been committed to the  journal.   This
                          may  increase throughput, however, it may allow old data to appear in files after
                          a crash and journal recovery.

       -O [^]feature[,...]
              Set or clear the indicated filesystem features (options) in the filesystem.   More  than  one
              filesystem feature can be cleared or set by separating features with commas.  Filesystem features prefixed with a caret character (^) will be cleared in the  filesystem's  superblock;
              filesystem  features  without a prefix character or prefixed with a plus character (+) will
              be added to the filesystem.

              The following filesystem features can be set or cleared using tune2fs:

                   `large_file`
                          Filesystem can contain files that are greater than 2GB.  (Modern kernels set this
                          feature automatically when a file > 2GB is created.)

                   `dir_index`
                          Use hashed b-trees to speed up lookups in large directories.

                   filetype
                          Store file type information in directory entries.

                   `has_journal`
                          Use  a  journal  to  ensure filesystem consistency even across unclean shutdowns.
                          Setting the filesystem feature is equivalent to using the -j option.

                   `sparse_super`
                          Limit the number of backup superblocks to save space on large filesystems.

                   `resize_inode`
                          Reserve space so the block  group  descriptor  table  may  grow  in  the  future.
                          Tune2fs only supports clearing this filesystem feature.

                   `uninit_bg`
                          Allow the kernel to initialize bitmaps and inode tables and keep a high watermark
                          for the unused inodes in a filesystem, to  reduce  e2fsck(8)  time.   This  first
                          e2fsck  run  after  enabling this feature will take the full time, but subsequent
                          e2fsck runs will take only a fraction of the original time, depending on how full
                          the file system is.

              After  setting or clearing `sparse_super, uninit_bg`, filetype, or `resize_inode` filesystem features, e2fsck(8) must be run on the filesystem to  return  the  filesystem  to  a  consistent
              state.   Tune2fs  will print a message requesting that the system administrator run e2fsck(8)
              if necessary.  After setting the `dir_index` feature, e2fsck -D can be run to convert  existing
              directories  to  the  hashed B-tree format.  Enabling certain filesystem features may prevent
              the filesystem from being mounted by kernels which do not support those features.  In particular the `uninit_bg and flex_bg` features are only supported by the ext4 filesystem.

       -r reserved-blocks-count
              Set the number of reserved filesystem blocks.

       -T time-last-checked
              Set the time the filesystem was last checked using e2fsck.  The time is interpreted using the
              current (local) timezone.  This can be useful in scripts which use a Logical  Volume  Manager
              to make a consistent snapshot of a filesystem, and then check the filesystem during off hours
              to make sure it hasn't been corrupted due to hardware problems, etc.  If the  filesystem  was
              clean,  then this option can be used to set the last checked time on the original filesystem.
              The format of time-last-checked is the international date format, with an optional time specifier, i.e.  YYYYMMDD[HH[MM[SS]]].   The keyword now is also accepted, in which case the last
              checked time will be set to the current time.

       -u user
              Set the user who can use the reserved filesystem blocks.  user can be a numerical  uid  or  a
              user  name.   If a user name is given, it is converted to a numerical uid before it is stored
              in the superblock.

       -U UUID
              Set the universally unique identifier (UUID) of the filesystem to UUID.  The  format  of  the
              UUID    is    a    series    of    hex    digits    separated    by   hyphens,   like   this:
              "c1b9d5a2-f162-11cf-9ece-0020afc76f16".  The UUID parameter may also be one of the following:

                   clear  clear the filesystem UUID

                   random generate a new randomly-generated UUID

                   time   generate a new time-based UUID

              The  UUID may be used by mount(8), fsck(8), and /etc/fstab(5) (and possibly others) by specifying UUID=uuid instead of a block special device name like /dev/hda1.

              See uuidgen(8) for more information.  If the system does not have a good random number generator  such  as  /dev/random or /dev/urandom, tune2fs will automatically use a time-based UUID
              instead of a randomly-generated UUID.


=== debugfs ===

       The debugfs program is an interactive file system debugger. It can be used to examine and change the
       state of an ext2 file system.
       device  is  the  special  file  corresponding  to  the  device  containing the ext2 file system (e.g
       /dev/hdXX).

       -w     Specifies that the file system should be opened in read-write mode.  Without this option, the
              file system is opened in read-only mode.

       -c     Specifies  that the file system should be opened in catastrophic mode, in which the inode and
              group bitmaps are not read initially.  This can be useful for  filesystems  with  significant
              corruption,  but  because of this, catastrophic mode forces the filesystem to be opened read-
              only.

       -i     Specifies that device represents an ext2 image file created by the  e2image  program.   Since
              the  ext2  image  file  only contains the superblock, block group descriptor, block and inode
              allocation bitmaps, and the inode table, many debugfs commands will  not  function  properly.
              Warning:  no safety checks are in place, and debugfs may fail in interesting ways if commands
              such as ls, dump, etc. are tried without  specifying  the  `data_source_device`  using  the  -d
              option.  debugfs is a debugging tool.  It has rough edges!

       -d data_source_device
              Used with the -i option, specifies that data_source_device should be used when reading blocks
              not found in the ext2 image file.  This includes data, directory, and indirect blocks.

       -b blocksize
              Forces the use of the given block size for the file system, rather than detecting the correct
              block size as normal.

       -s superblock
              Causes  the  file  system superblock to be read from the given block number, instead of using
              the primary superblock (located at an offset of 1024 bytes from the beginning of the filesystem).   If  you  specify the -s option, you must also provide the blocksize of the filesystem
              via the -b option.

       -f cmd_file
              Causes debugfs to read in commands from cmd_file, and execute them.  When debugfs is finished
              executing those commands, it will exit.

       -R request
              Causes debugfs to execute the single command request, and then exit.

       -V     print the version number of debugfs and exit.

SPECIFYING FILES
       Many  debugfs commands take a filespec as an argument to specify an inode (as opposed to a pathname)
       in the filesystem which is currently opened by debugfs.  The filespec argument may be  specified  in
       two  forms.   The first form is an inode number surrounded by angle brackets, e.g., `<2>`.  The second
       form is a pathname; if the pathname is prefixed by a forward slash (/),  then  it  is  interpreted
       relative  to  the root of the filesystem which is currently opened by debugfs.  If not, the pathname
       is interpreted relative to the current working directory as maintained by debugfs.  This may be modified by using the debugfs command cd.

COMMANDS
       This is a list of the commands which debugfs supports.

       bmap filespec `logical_block`
              Print  the  physical  block number corresponding to the logical block number `logical_block` in
              the inode filespec.

       cat filespec
              Dump the contents of the inode filespec to stdout.

       cd filespec
              Change the current working directory to filespec.

       chroot filespec
              Change the root directory to be the directory filespec.

       close  Close the currently open file system.


       icheck block
              Print a listing of the inodes which use the one or more blocks specified on the command line.

       imap filespec
              Print the location of the inode data structure (in the inode table) of the inode filespec.

       `init_filesys device blocksize`
              Create an ext2 file system on device with device size blocksize.  Note  that  this  does  not
              fully  initialize all of the data structures; to do this, use the mke2fs(8) program.  This is
              just a call to the low-level library, which sets up the superblock and block descriptors.

       `kill_file filespec`
              Deallocate the inode filespec and its blocks.  Note that this does not remove  any  directory
              entries (if any) to this inode.  See the rm(1) command if you wish to unlink a file.

       lcd directory
              Change  the  current  working  directory  of  the  debugfs process to directory on the native
              filesystem.

       ln filespec dest_file
              Create a link named dest_file which is a link to filespec.  Note this  does  not  adjust  the
              inode reference counts.

       logdump [-acs] [-b<block>] [-i<filespec>] [-f<journal_file>] [output_file]
              Dump  the  contents  of  the ext3 journal.  By default, the journal inode as specified in the
              superblock.  However, this can be overridden with the -i option, which uses an  inode  specifier  to  specify  the  journal  to be used.  A file containing journal data can be specified
              using the -f option.   Finally,  the  -s  option  utilizes  the  backup  information  in  the
              superblock to locate the journal.

             The  -a  option  causes  the  logdump  program to print the contents of all of the descriptor
              blocks.  The -b option causes logdump to print all journal records  that  are  refer  to  the
              specified  block.   The  -c  option  will  print  out  the contents of all of the data blocks
              selected by the -a and -b options.

       ls [-l] [-d] [-p] filespec
              Print a listing of the files in the directory filespec.  The -l flag will list files using  a
              more  verbose  format.   The -d flag will list deleted entries in the directory.  The -p flag
              will list the files in a format which is more easily parsable by scripts, as well  as  making
              it more clear when there are spaces or other non-printing characters at the end of filenames.

       `modify_inode` filespec
              Modify the contents of the inode structure in the inode filespec.

       mkdir filespec
              Make a directory.

       mknod filespec [p|[[c|b] major minor]]
              Create a special device file (a named pipe, character or block device).  If  a  character  or
              block device is to be made, the major and minor device numbers must be specified.

       ncheck `inode_num ...`
              Take the requested list of inode numbers, and print a listing of pathnames to those inodes.

       open [-w] [-e] [-f] [-i] [-c] [-b blocksize] [-s superblock] device
              Open  a filesystem for editing.  The -f flag forces the filesystem to be opened even if there
              are some unknown or  incompatible  filesystem  features  which  would  normally  prevent  the
              filesystem  from  being  opened.  The -e flag causes the filesystem to be opened in exclusive
              mode.  The -b, -c, -i, -s, and -w options behave the same  as  the  command-line  options  to
              debugfs.

       pwd    Print the current working directory.
       quit   Quit debugfs

       rdump directory destination
              Recursively dump directory and all its contents (including regular files, symbolic links, and
              other directories) into the named destination which should be an existing  directory  on  the
              native filesystem.

       rm pathname
              Unlink  pathname.   If  this  causes the inode pointed to by pathname to have no other references, deallocate the file.  This command functions as the unlink() system call.

       rmdir filespec
              Remove the directory filespec.

       setb block [count]
              Mark the block number block as allocated.  If the optional argument count  is  present,  then
              count blocks starting at block number block will be marked as allocated.

       `set_block_group` bgnum field value
              Modify the block group descriptor specified by bgnum so that the block group descriptor field
              field has value value.

       seti filespec
              Mark inode filespec as in use in the inode bitmap.

       `set_inode_field` filespec field value
              Modify the inode specified by filespec so that the inode field field has  value  value.   The
              list  of  valid  inode fields which can be set via this command can be displayed by using the
              command: `set_inode_field` -l

       `set_super_value field` value
              Set the superblock field field to value.  The list of valid superblock fields  which  can  be
              set via this command can be displayed by using the command: `set_super_value` -l

       `show_super_stats` [-h]
              List  the  contents  of  the  super block and the block group descriptors.  If the -h flag is
              given, only print out the superblock contents.

       stat filespec
              Display the contents of the inode structure of the inode filespec.

       testb block [count]
              Test if the block number block is marked as allocated in the block bitmap.  If  the  optional
              argument count is present, then count blocks starting at block number block will be tested.

       testi filespec
              Test if the inode filespec is marked as allocated in the inode bitmap.

       undel '<inode num>' [pathname]
              Undelete  the  specified inode number (which must be surrounded by angle brackets) so that it
              and its blocks are marked in use, and optionally link the recovered inode  to  the  specified
              pathname.   The  e2fsck command should always be run after using the undel command to recover
              deleted files.

              Note that if you are recovering a large number of deleted  files,  linking  the  inode  to  a
              directory  may  require  the  directory to be expanded, which could allocate a block that had
              been used by one of the yet-to-be-undeleted files.  So it is safer to  undelete  all  of  the
              inodes  without  specifying  a  destination  pathname,  and  then in a separate pass, use the
              debugfs link command to link the inode to the destination pathname, or use  e2fsck  to  check
              the filesystem and link all of the recovered inodes to the lost+found directory.

       unlink pathname
              Remove  the link specified by pathname to an inode.  Note this does not adjust the inode reference counts.

      `write source_file out_file`
              Create a file in the filesystem named `out_file`, and copy the contents of `source_file` into the
              destination file.

ENVIRONMENT VARIABLES
       `DEBUGFS_PAGER`, PAGER
              The  debugfs(8) program always pipes the output of the some commands through a pager program.
              These    commands     include:     `show_super_stats,     list_directory,     show_inode_info`,
              list_deleted_inodes,  and  htree_dump`.   The  specific  pager can explicitly specified by the
              `DEBUGFS_PAGER environment variable, and if it is not set, by the PAGER environment  variable.

              Note  that  since  a pager is always used, the less(1) pager is not particularly appropriate,
              since it clears the screen before displaying the output of the command and clears the  output
              the  screen  when  the  pager is exited.  Many users prefer to use the less(1) pager for most
              purposes, which is why the `DEBUGFS_PAGER` environment variable is available  to  override  the
              more general PAGER environment variable.


=== e2undo ===

      e2undo will replay the undo log undo_log for an ext2/ext3/ext4 filesystem found on device.  This can
       be used to undo a failed operation by an e2fsprogs program.

       -f     Normally, e2undo will check the filesystem UUID and last modified time to make sure the  undo
              log  matches  with the filesystem on the device.  If they do not match, e2undo will refuse to
              apply the undo log as a safety mechanism.  The -f option disables this safety mechanism.


=== findfs ===

     findfs will search the disks in the system looking for a filesystem which has a label matching label
       or a UUID equal to uuid.  If the filesystem is found, the device name for  the  filesystem  will  be
       printed on stdout.


=== chattr ===

      chattr changes the file attributes on a Linux second extended file system.

       The format of a symbolic mode is +-=[ASacDdIijsTtu].

       The operator + causes the selected attributes to be added to the existing attributes of the files;
       - causes them to be removed; and = causes them to be the only attributes that the files have.

       The letters acdijsuADST select the new attributes for the files: append only (a), compressed  (c),
       no  dump  (d),  immutable  (i),  data  journalling  (j),  secure  deletion (s), no tail-merging (t),
       undeletable (u), no atime updates (A), synchronous directory updates (D), synchronous  updates  (S),
       and top of directory hierarchy (T).

       -R     Recursively change attributes of directories and their contents.

       -V     Be verbose with chattr's output and print the program version.

       -f     Suppress most error messages.

       -v version
              Set the file's version/generation number.

ATTRIBUTES
       When a file with the A attribute set is accessed, its atime record is not modified.  This avoids a
       certain amount of disk I/O for laptop systems.

       A file with the a attribute set can only be open in append mode for writing.  Only  the  superuser
       or a process possessing the `CAP_LINUX_IMMUTABLE` capability can set or clear this attribute.

       A  file  with  the  c attribute set is automatically compressed on the disk by the kernel.  A read
       from this file returns uncompressed data.  A write to this file compresses data before storing  them
       on  the  disk.   Note:  please make sure to read the bugs and limitations section at the end of this
       document.

       When a directory with the D attribute set is modified, the changes are  written  synchronously  on
       the disk; this is equivalent to the dirsync mount option applied to a subset of the files.

       A file with the d attribute set is not candidate for backup when the dump(8) program is run.

       The E attribute is used by the experimental compression patches to indicate that a compressed file
       has a compression error.  It may not be set or reset using chattr(1), although it can  be  displayed
       by lsattr(1).

       The  e  attribute indicates that the file is using extents for mapping the blocks on disk.  It may
       not be set or reset using chattr(1), although it can be displayed by lsattr(1).

       The I attribute is used by the htree code to indicate that a  directory  is  being  indexed  using
       hashed  trees.   It  may  not  be  set  or  reset  using  chattr(1), although it can be displayed by
       lsattr(1).

       The H attribute indicates the file is storing its blocks in  units  of  the  filesystem  blocksize
       instead of in units of sectors, and means that the file is (or at one time was) larger than 2TB.  It
       may not be set or reset using chattr(1), although it can be displayed by lsattr(1).

       A file with the i attribute cannot be modified: it cannot be deleted or renamed, no  link  can  be
       created  to  this file and no data can be written to the file.  Only the superuser or a process possessing the CAP_LINUX_IMMUTABLE capability can set or clear this attribute.

       A file with the j attribute has all of its data written to the ext3 journal before  being  written
       to  the  file  itself,  if  the  filesystem  is  mounted with the "data=ordered" or "data=writeback"
       options.  When the filesystem is mounted with the "data=journal" option all  file  data  is  already
       journalled  and  this  attribute  has  no  effect.   Only  the superuser or a process possessing the
       `CAP_SYS_RESOURCE` capability can set or clear this attribute.

       When a file with the s attribute set is deleted, its blocks are zeroed and  written  back  to  the
       disk.   Note: please make sure to read the bugs and limitations section at the end of this document.

       When a file with the S attribute set is modified, the changes are  written  synchronously  on  the
       disk; this is equivalent to the sync mount option applied to a subset of the files.

       A  directory  with  the  T attribute will be deemed to be the top of directory hierarchies for the
       purposes of the Orlov block allocator (which is used in on systems with Linux 2.5.46 or later).

       A file with the t attribute will not have a partial block fragment at the end of the  file  merged
       with other files (for those filesystems which support tail-merging).  This is necessary for applications such as LILO which read the filesystem directly, and which don't understand tail-merged files.
       Note:  As  of  this  writing,  the ext2 or ext3 filesystems do not (yet, except in very experimental
       patches) support tail-merging.

       When a file with the u attribute set is deleted, its contents are saved.  This allows the user  to
       ask  for its undeletion.  Note: please make sure to read the bugs and limitations section at the end
       of this document.

       The X attribute is used by the experimental compression patches to indicate that a raw contents of
       a  compressed  file can be accessed directly.  It currently may not be set or reset using chattr(1),
       although it can be displayed by lsattr(1).

       The Z attribute is used by the experimental compression patches to indicate a compressed  file  is
       dirty.  It may not be set or reset using chattr(1), although it can be displayed by lsattr(1).

BUGS AND LIMITATIONS
       The c, s,  and u attributes are not honored by the ext2 and ext3 filesystems as implemented in
       the current mainline Linux kernels.    These attributes may be implemented in future versions of the
       ext2 and ext3 filesystems.

       The j option is only useful if the filesystem is mounted as ext3.

       The D option is only useful on Linux kernel 2.5.19 and later.


=== lsattr ===

      lsattr  lists the file attributes on a second extended file system.  See chattr(1) for a description
       of the attributes and what they mean.

      -R     Recursively list attributes of directories and their contents.

       -V     Display the program version.

       -a     List all files in directories, including files that start with '.".

       -d     List directories like other files, rather than listing their contents.

       -v     List the file's version/generation number.


=== filefrag ===
     filefrag  reports on how badly fragmented a particular file might be.  It makes allowances for indirect blocks for ext2 and ext3 filesystems, but can be used on files for any filesystem.

      -v     Be verbose when checking for file fragmentation.


=== mklost+found ===

       mklost+found  is  used  to create a lost+found directory in the current working directory on a Linux
       second extended file system.  There is normally a lost+found directory in the root directory of each
       filesystem.

       mklost+found  pre-allocates  disk blocks to the lost+found directory so that when e2fsck(8) is being
       run to recover a filesystem, it does not need to allocate blocks in the filesystem to store a  large
       number  of  unlinked  files.   This ensures that e2fsck will not have to allocate data blocks in the
       filesystem during recovery.

This utility has no options


== dosfstools ==

utilities for making and checking MS-DOS FAT filesystems
 The dosfstools package includes the mkdosfs (aka mkfs.dos and mkfs.vfat) and
 dosfsck (aka fsck.msdos and fsck.vfat) utilities, which respectively make and
 check MS-DOS FAT filesystems on hard drives or on floppies.
 .
 This version uses the enhanced boot sector/superblock format of DOS 3.3+ as
 well as provides a default dummy boot sector code.

=== mkdosfs ===

      mkdosfs is used to create an MS-DOS file system under Linux on a device (usually a disk  partition).
       device  is  the special file corresponding to the device (e.g /dev/hdXX).  block-count is the number
       of blocks on the device.  If omitted, mkdosfs automatically determines the file system size.

       -A     Use Atari variation of the MS-DOS file system. This is default if mkdosfs is run on an Atari,
              then  this option turns off Atari format. There are some differences when using Atari format:
              If not directed otherwise by the user, mkdosfs will always use 2 sectors per  cluster,  since
              GEMDOS  doesn't like other values very much.  It will also obey the maximum number of sectors
              GEMDOS can handle.  Larger file systems are managed  by  raising  the  logical  sector  size.
              Under Atari format, an Atari-compatible serial number for the file system is generated, and a
              12 bit FAT is used only for file systems that have one of the usual floppy sizes (720k, 1.2M,
              1.44M,  2.88M),  a  16 bit FAT otherwise. This can be overridden with the -F option. Some PC-
              specific boot sector fields aren't written, and a boot message (option -m) is ignored.

       -b sector-of-backup
              Selects the location of the backup boot sector  for  FAT32.  Default  depends  on  number  of
              reserved  sectors,  but  usually is sector 6. The backup must be within the range of reserved
              sectors.

       -c     Check the device for bad blocks before creating the file system.

       -C     Create the file given as device on the command line, and write the to-be-created file  system
              to  it. This can be used to create the new file system in a file instead of on a real device,
              and to avoid using dd in advance to create a file of appropriate size. With this option,  the
              block-count must be given, because otherwise the intended size of the file system wouldn't be
              known. The file created is a sparse file, which actually only contains  the  meta-data  areas
              (boot  sector,  FATs, and root directory). The data portions won't be stored on the disk, but
              the file nevertheless will have the correct size. The resulting file can be copied later to a
              floppy disk or other device, or mounted through a loop device.

       -f number-of-FATs
              Specify  the  number  of  file allocation tables in the file system.  The default is 2.  Currently the Linux MS-DOS file system does not support more than 2 FATs.

       -F FAT-size
              Specifies the type of file allocation tables used (12, 16 or 32 bit).  If nothing  is  specified,  mkdosfs  will automatically select between 12, 16 and 32 bit, whatever fits better for
              the file system size.

       -h number-of-hidden-sectors
              Select the number of hidden sectors in the volume. Apparently some digital cameras get  indigestion  if  you  feed  them a CF card without such hidden sectors, this option allows you to
              satisfy them. Assumes ´0´ if no value is given on the command line.

       -i  volume-id
              Sets the volume ID of the newly created file system; volume-id is a 32-bit hexadecimal number
              (for  example,  2e24ec82).  The default is a number which depends on the file system creation
              time.

       -I     It is typical for fixed disk devices to be partitioned so, by default, you are not  permitted
              to  create a filesystem across the entire device.  mkdosfs will complain and tell you that it
              refuses to work.  This is different when using MO disks.  One doesn't always need  partitions
              on  MO  disks.   The file system can go directly to the whole disk.  Under other OSes this is
              known as the superfloppy format.

              This switch will force mkdosfs to work properly.

       -l filename
              Read the bad blocks list from filename.

       -m message-file
              Sets the message the user receives on attempts to boot this file system without having  properly  installed  an  operating  system.  The message file must not exceed 418 bytes once line
              feeds have been converted to carriage return-line  feed  combinations,  and  tabs  have  been
              expanded.  If the filename is a hyphen (-), the text is taken from standard input.

       -n volume-name
              Sets  the volume name (label) of the file system.  The volume name can be up to 11 characters
              long.  The default is no label.

       -r root-dir-entries
              Select the number of entries available in the root directory.  The default is 112 or 224  for
              floppies and 512 for hard disks.

       -R number-of-reserved-sectors
              Select  the  number  of  reserved  sectors. With FAT32 format at least 2 reserved sectors are
              needed, the default is 32. Otherwise the default is 1 (only the boot sector).

       -s sectors-per-cluster
              Specify the number of disk sectors per cluster.  Must be a power of 2, i.e. 1, 2, 4,  8,  ...
              128.

      -S logical-sector-size
              Specify  the  number  of  bytes per logical sector.  Must be a power of 2 and greater than or
              equal to 512, i.e. 512, 1024, 2048, 4096, 8192, 16384, or 32768.

       -v     Verbose execution.

BUGS
       mkdosfs can not create boot-able file systems.
 
=== dosfslabel ===

      dosfslabel  set  or  gets  a MS-DOS filesystem label from a given device.  If label is omitted, then
       the label name of the specified device is written on the standard output.

       label can't be longer than 11 characters.

      -h,--help
              Displays a help message.

       -V,--version
              Shows version.


=== dosfsck ===

      dosfsck  verifies  the  consistency  of MS-DOS file systems and optionally tries to repair them. The
       following file system problems can be corrected (in this order):

       -      FAT contains invalid cluster numbers. Cluster is changed to EOF.
       -      File's cluster chain contains a loop. The loop is broken.
       -      Bad clusters (read errors). The clusters are marked bad and they are removed from files  owning them. This check is optional.
       -      Directories  with  a  large  number  of  bad entries (probably corrupt). The directory can be
              deleted.
       -      Files . and .. are non-directories. They can be deleted or renamed.
       -      Directories . and .. in root directory. They are deleted.
       -      Bad file names. They can be renamed.
       -      Duplicate directory entries. They can be deleted or renamed.
       -      Directories with non-zero size field. Size is set to zero.
       -      Directory . does not point to parent directory. The start pointer is adjusted.
       -      Directory .. does not point to parent of parent directory. The start pointer is adjusted.
       -      Start cluster number of a file is invalid. The file is truncated.
       -      File contains bad or free clusters. The file is truncated.
       -      File's cluster chain is longer than indicated by the size fields. The file is truncated.
       -      Two or more files share the same cluster(s). All but one of the files are truncated.  If  the
       -       file being truncated is a directory file that has already been read, the file system check is
              restarted after truncation.
       -      File's cluster chain is shorter than indicated by the size fields. The file is truncated.
       -      Clusters are marked as used but are not owned by a file. They are marked as free.

       Additionally, the following problems are detected, but not repaired:

       -      Invalid parameters in boot sector.
       -      Absence of . and .. entries in non-root directories

       When dosfsck checks a file system, it accumulates all changes in memory and performs them only after
       all checks are complete. This can be disabled with the -w option.

      -a     Automatically  repair  the file system. No user intervention is necessary.  Whenever there is
              more than one method to solve a problem, the least destructive approach is used.

       -A     Use Atari variation of the MS-DOS filesystem. This is default if dosfsck is run on an  Atari,
              then  this  option  turns off Atari format. There are some minor differences in Atari format:
              Some boot sector fields are interpreted slightly different, and the special FAT  entries  for
              end-of-file  and  bad cluster can be different. Under MS-DOS 0xfff8 is used for EOF and Atari
              employs 0xffff by default, but both systems recognize all values from 0xfff8...0xffff as end-
              of-file.  MS-DOS uses only 0xfff7 for bad clusters, where on Atari values 0xfff0...0xfff7 are
              for this purpose (but the standard value is still 0xfff7).

       -d     Delete the specified file. If more that one file with that name  exists,  the  first  one  is
              deleted.

       -f     Salvage  unused  cluster  chains  to files. By default, unused clusters are added to the free
              disk space except in auto mode (-a).

       -l     List path names of files being processed.

       -n     No-operation mode: non-interactively check for  errors,  but  don't  write  anything  to  the
              filesystem.

      -r     Interactively  repair  the  file  system. The user is asked for advice whenever there is more
              than one approach to fix an inconsistency.

       -t     Mark unreadable clusters as bad.

       -u     Try to undelete the specified file. dosfsck tries to allocate a chain of  contiguous  unallocated clusters beginning with the start cluster of the undeleted file.

       -v     Verbose mode. Generates slightly more output.

       -V     Perform  a verification pass. The file system check is repeated after the first run. The second pass should never report any fixable errors. It may take  considerably  longer  than  the
              first pass, because the first pass may have generated long list of modifications that have to
              be scanned for each disk read.

       -w     Write changes to disk immediately.

       -y     Same as -a (automatically repair filesystem) for compatibility with other fsck tools.

       If -a and -r are absent, the file system is only checked, but not repaired.

EXIT STATUS
       0      No recoverable errors have been detected.

       1      Recoverable errors have been detected or dosfsck has discovered an internal inconsistency.

       2      Usage error. dosfsck did not access the file system.

FILES
       fsck0000.rec, fsck0001.rec, ...
              When recovering from a corrupted file system, dosfsck dumps recovered data into  files  named
              fsckNNNN.rec in the top level directory of the file system.

BUGS
       Does  not  create . and .. files where necessary. Does not remove entirely empty directories. Should
       give more diagnostic messages. Undeleting files should use a more sophisticated algorithm.


=== fsck.msdos === 
=== mkfs.vfat === 
=== fsck.vfat === 
=== mkfs.msdos ===

 * ntfsprogs
 * hfsprogs 
 * mtd-utils, genromfs. ocfs2-tools, nilfs2-tools 

== Compression tools ==
=== Anti Virus=== 
=== SPAM Filters ===
=== File Management tools ===
=== Archiving===
=== Backups===
=== Time snapshots of disk===
=== Disk Management tools ===```