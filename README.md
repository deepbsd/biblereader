## BIBLEREADER

This is a little bash script that helps you read the Catholic bible in a year.  I'm almost always on a Linux machine
so I wanted a simple bash script.  Eventually I'll use whiptail to make it more friendly, but for now I just wanted
something to help me get the work done and know where I am and whether I'm on schedule.

# Status:

The program asks whether you want to delete the old file if it exists.  Otherwise the program appends
another printout to the end of the file.

It asks if you want to start from today or whether you want to start from another date.

It then asks what book of the bible you want to start from, and then what chapter.  Otherwise it will
start from genesis 1.

All input is lowercase or numeric.  

I should output the book names as they are indicated in the internal hash for easier spelling.  Some of
the bible books have weird spelling that is easy to get wrong and thereby screw up the program.

REMINDER: There's a problem with the start date:  it always winds up being June 2022.  Have to find and fix that
problem.
