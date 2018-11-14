= PBS qsub wrapper =

This script performs some checks on PBS job scripts to reject jobs with known errors or jobs which break site policy.

It contains site-specific settings and so is more suitable as a basis for implementing your own solution than as an out-of-the-box solution.

Requirements:
1. Drop-in replacement for the standard qsub command (either behave as expected or reject the job with a non-zero exit code).
2. Error or warning messages are always sent to standard error.

The idea for a script like this one will normally be phrased something like:
 "We just need to write a simple wrapper which checks the user's job script and passes it to the actual qsub command"
On the surface this seems an eminently sensible idea which will be very easy to implement.
when writing the wrapper it will soon become apparent that there are lots of things which need to be considered.
These include but are not limited to:
1. You have to replicate the parsing of every possible command line option to find the ones that you're actually interested in.
2. Job scripts can be submitted as a file, on the standard input or as an argument passed on the command line.
3. Options can be passed on the command line or inside the job script (command line outranks job script directives).
4. There are multiple ways of specifying resources or units.
5. There is an option for qsub to block and wait for the job to finish before returning.
6. Check that the filters don't break if people submit job scripts in Windows text format.
