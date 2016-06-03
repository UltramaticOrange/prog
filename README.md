# prog
## About prog:
`prog` is a shell script written to output a progress bar onto the current command line interface.

## Examples:
### Single prameter input:
`prog` takes one, or two numbers. When one number is given, `prog` assumes it is a percentage and displays it accordingly.

```
user@linux$ ./prog 10; echo
[10%===>......................................................................]
```

### Two paramater input:
When two numbers are given, it assumes that the first number represents how much work as been done, and the second is how much total work there is to do. If I have been tasked with eatiing 72 popcicles and I've eaten 10 so far, my command would look like the following.
```
user@linux$ ./prog 10 72; echo
[13%======>...................................................................]
```

Note that we're using an `echo` at the end of each execution. `prog` is written with the intention of being used within a loop and if it was allowed to print a newline, the CLI would soon fill up with progress bars. So, instead of printing a newline, `prog` returns to the begining of the line so it can overwrite the old progress bar with the new one. The result is that the user must manually `echo` out a newline once processing has completed. If you command prompt sits on top of the progress bar at the end of execution, it's because you forgot to do the final `echo`.

### Two parameter input in a loop:
```
#!/bin/bash

let current=0
let end=132

while [ $current -le $end ]
do
  # "current" is the amount of work we've done.
  # "end" is how much there is to do (or 132)
  ./prog $current $end

  # This is where you'd do some work. 
  # `sleep` is being used to emulate a task that takes a small amount of time.
  let current=$current+1
  sleep 0.5
done
echo # the final echo needed to put the command prompt on a new line.
```

See `example.sh` which reads a sample log file (example.in) for an example that is more real-world.
