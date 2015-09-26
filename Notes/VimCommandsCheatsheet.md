**vi keystrokes:**

a - enter insert mode, append after cursor
A - enter insert mode, append at the end of the line
b - move the cursor to the beginning of the previous word
B - move the cursor to the beginning of the previous word, ignoring punctuation
cc - change line
c - change the following
C - change line
dd - delete line
d - delete the following
D - delete line
e - move the cursor to the end of the current word, or next word, if it is already at the end
E - move the cursor to the end of the current or next word, ignoring punctuation
f - move the cursor to the next occurrence of the following character on the current line
F - move the cursor to the last occurrence of the following character on the current line
ga - print the ASCII value of the character under the cursor; if encoding is set to a different character set, show the value in that character set
gd - go to the first occurrence of the word under the cursor in the function
gD - go the the first occurrence of the word under the cursor in the file (same as gd except in curly bracket language source files)
ge - move the cursor to the end of the previous word
gE - move the cursor to the end of the previous word, ignoring punctuation
gf - edit the file whose name is under the cursor (if in an Explore, Sexplore, or Vexplore window)
gh - enter select mode
gm - move the cursor to the middle column on the screen
go - move the cursor to the preceding byte in the file buffer
gR- enter vreplace mode
G - move the cursor to the last line of the document, or to the line of the preceding number
h - move the cursor left one character
H - move to home position
i - enter insert mode, insert before the cursor
I - enter insert mode, insert at the beginning of the line
j - move the cursor down one line
J - join the current line with the next
k - move the cursor up one line
K - unused
l - move the cursor right one character
L - move the cursor to the last line on the screen
m - mark the current position with the following character
M - move the cursor to the middle line on the screen
n - repeat last search, go to the next occurrence of the pattern
N - repeat last search, go to the previous occurrence of the pattern
o - open a new line below the current one and enter insert mode
O - open a new line above the current one and enter insert mode
p - put the contents of the specified buffer after the cursor
P - put the contents of the specified buffer before the cursor
q - record keystrokes into the following buffer to be executed with @
q: - show ex command history
Q - exit vi mode and enter ex mode
r - replace a single character
R - enter replace mode, overwrite text
s - substitute a single character
S - substitute the current line
t - move the cursor forward to one character before the following character
T - move the cursor backward to one character after the following character
u - undo last change
U - undo all unwritten changes to the current line
v - enter visual mode 
V - enter visual line mode
w - move the cursor to the beginning of the next word
W - move the cursor to the beginning of the next word, ignoring punctuation
x - delete the character under the cursor
X - delete the character to the left of the cursor
yy - yank the current line
y - yank the following
Y - yank the current line
z<enter> - reposition the current line to the top of the screen
z. - reposition the current line to the middle of the screen
z- - reposition the current line to the bottom of the screen
ZQ - exit the current file unconditionally
ZZ - write any unsaved changes and quit
^A - increment the number under the cursor
^B - move up one screen
^C - kill vi
^D - move down half a screen
^E - move the screen down one line
^F - move down one screen
^G - display document information at the bottom of the screen
^H - move the cursor back one character
^I - unused
^J - move the cursor down one line
^K - unused
^L - redraw screen
^M - carriage return
^N - move the cursor down one line
^O - go back to the previous session
^P - move the cursor up one line
^Q - unused
^R - redo last change
^S - unused
^T - go back in the tag stack
^U - move up half a screen
^V - enter visual block mode
^Wb - go to bottom window
^Wf - split the current window and edit the file under the cursor (works in an Explore window)
^Wr - rotate windows
^Ws - split the current window horizontally
^Wt - go to top window
^Wv - split the current window vertically
^W^W - move to the next window
^W+ - increase the current window height the preceding number of lines
^W- - decrease the current window height the preceding number of lines
^W< - decrease the current window width the preceding number of columns
^W> - increase the current window width the preceding number of columns
^W_ - set the current window's height to the preceding number of lines
^W| - set the current window's width to the preceding number of columns
^X - decrement the number under the cursor
^Y - move the screen up one line
^Z - suspend vi
` - move the cursor to the following marker
`` - move the cursor back to the previous position
`. - move the cursor to the most recently modified character
~ - toggle the case of the character under the cursor
!! - print the output of the following Unix command to the file buffer
!}fmt - wrap the current line
@ - execute the key sequence stored in the following buffer
# - search for the last occurrence of the word under the cursor
$ - move the cursor to the end of the current line
% - move the cursor to the matching paretheses, brace or brackets
^ - move the cursor to the first nonblank character on the current line
& - repeat the last substitution (:s) command
* - search for the next occurrence of the word under the cursor
( - move the cursor to the beginning of the current of last sentence
) - move the cursor to the beginning of the next sentence
- - move the cursor to the beginning of the previous line
+ - move the cursor to the beginning of the next line
{ - move to the last blank line
} - move to the next blank line
[' - move the cursor to the last marker
]' - move the cursor to the next marker
[[ - move to the beginning of the current section
]] - move to the end of the current section
| - move to the column with the preceding number
; - repeat last f or F command
' - move the cursor to the line marked by the following marker
'' - move the cursor back to the line of the previous position
'. - move the cursor to the most recently modified line
" - do something with the following buffer
<< - tab the current line to the left
>> - tab the current line to the right
, - repeat the last f, F, t, or T command
. - repeat last editing command
/ - search forwards for the following pattern
? - search backwards for the following pattern
<esc> - go into command mode
<del> - same as h
<enter> - carriage return, same as ^M and +
<space> - same as l

**ex commands:**

:ab - show abbreviations, or abbreviate the following command
:ar[gs] - show the argument list (list of open files)
:arga[dd] - add a file to the argument list
:argd[elete] - delete a file from the argument list
:argdo - execute the following command on all files in the argument list
:arge[dit] - add a file to the argument list and edit it
:as[cii] - print the ASCII value of the character under the cursor
:bn[ext] - go to the next buffer in the argument list
:bp[revious] - go to the previous buffer in the argument list
:buffers - list all file buffers
:cm[ap] - map a command in command line mode
:co[py] - copy the preceding lines after the following line
:colo[rscheme] - load the following color scheme
:ctags - create a tags file mapping the subroutines of the following files
:d[elete] - delete the preceding lines
:display - list all character buffers
:Explore - show a list of files in your working directory or in the following directory in the current window
:file - show or set the name of the current file
:g/pattern/ - execute the following command on all lines containing pattern
:hardcopy - send the file to the printer
:help - view built in documentation for vi
:imap - map the following key for insert mode
:iunmap - unmap the following key for insert mode
:l - display the preceding lines with carriage returns marked by $ and tabs marked by ^I
:ls - list all file buffers
:m[ove] - move the preceding lines after the following line
:map - show mapped keys, or map the following key
:map! - map the following key for insert mode, same as :imap
:mapclear - clear all mappings
:marks - show all markers
:n - move to the next open file
:n! - move to the next open file without writing changes to this one
:nu[mber] - display the preceding lines and their numbers
:only - close all other windows
:p[rint] - display the preceding lines
:ptag - preview the following tag
:q[uit] - quit vi
:q[uit]! - quit vi without writing changes
:qa[ll] - close all windows
:qa[ll]! - close all windows without writing changes
:r[ead] - read the contents of the following file into the current file file buffer
:redr[aw] - redraw the screen, same as ^L
:rew - go to the first open file
:rew! - go to the first open file 
:s/old/new - replace old with new on the preceding lines
:sa[rgument] - split the current window and open the specified file in the argument list in the new window
:sal[l] - open a new window for each file in the argument list
:sav[eas] - save the current file under the following filename
:Sexplore - split the current window and list files in the new window
:sh[ell] - start a Unix subshell
:so[urce] - run the following ex script
:split - split the current window vertically, same as ^Ws
:sv[iew] - open a new window with the current file in read-only mode
:syntax on - turn on syntax highlighting
:syntax off - turn off syntax highlighting
:tag - jump to the file containing the following subroutine
:una - unabbreviate the following command
:unmap - unmap the following key
:unmap! - unmap the following key in insert mode, same as :iunmap
:v/pattern/ - execute the following command on all lines not containing pattern
:verbose - do the following command with the preceding verbose setting
:ve[rsion] - display the version number of vi
:Vexplore - split the current window vertically and list files in the new window
:vi[sual] - exit ex mode and go into vi mode
:vie[w] - edit a file in read-only mode
:w[rite] - write the file buffer to the current file
:wa[ll] - write all buffers
:wq - write any changes and quit
:wqa - write all buffers and then quit
:w! - exit read-only mode
:x - quit vi, writing any unsaved changes
:z - display the preceding lines with the following number of lines above or below (syntax: m,nz[+,-,=]q)
:& - repeat the last substitution command
:= - print the last line number


**Settings:**

:set - show settings
:set autoindent - automatically indent new lines
:set noautoindent - don't automatically indent new lines
:set compatible - make vim vi compatible
:set nocompatible - vim is not vi compatible
:set encoding=c - set the character encoding that vim uses
:set exrc - allow execution of vi scripts
:set noexrc - don't allow execution of vi scripts
:set flash - screen flashes when vi encounters and error
:set noflash - screen doesn't flash
:set ignorecase - searches are not case sensitive
:set noignorecase - searches are case sensitive
:set insertmode - inset mode is the default (never use this command)
:set noinsert mode - insert mode is not the default mode
:set isfname=<list> - set the characters included in filenames, used in regular expressions
:set isident=<list> - set identifier characters, used in regular expressions
:set iskeyword=<list> - set keyword characters, used in regular expressions
:set isprint=<list> - listed characters are displayed directly on the screen
:set lisp - enter lisp friendly mode
:set nolisp - exit lisp friendly mode
:set list - show whitespace characters
:set nolist - don't show whitespace characters
:set mesg - allow messages to be displayed while editing
:set nomesg - don't allow messages to be displayed while editing
:set number - number lines
:set nonumber - don't number lines
:set path=<list> - set the directories to be searched with the :find command or ^Wf
:set printfont=f - set the typeface that will be used when sending the file to the printer
:set readonly - set the current file(s) to read-only
:set noreadonly - current file(s) is/are writeable, same as :w!
:set scroll=n - ^U and ^D scroll the n lines up or down
:set sections=s - specify the nroff macros that will be used as section delimiters
:set shell - display the name of the shell, or specify which shell to use for the :sh and !! commands
:set shiftwidth=n - lines move n columns when shifted
:set showmatch - when the cursor is on a parenthesis or bracket, show the matching parethesis or bracket
:set noshowmatch - don't show the matching parenthesis or bracket
:set showmode - display mode at the bottom of the screen
:set noshowmode - don't display mode at the bottom of the screen
:set syntax=<file> - set the syntax to use for syntax highlighting
:set tabstop=n - tabs are shown as n spaces
:set term - display the terminal type
:set timeout - limit macros to 1 second
:set notimeout - don't limit macros to 1 second
:set verbose=n - if set to a number greater than 0, messages will be displayed for certain actions
:set warn - display an error message when you try to quit without writing changes
:set nowarn - don't display an error message
:set wrap - wrap lines
:set nowrap - don't wrap lines
