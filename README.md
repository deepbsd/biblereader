## BIBLEREADER

This is a little bash script that helps you read the Catholic bible in a year.  I'm almost always on a Linux machine
so I wanted a simple bash script.  Eventually I'll use whiptail to make it more friendly, but for now I just wanted
something to help me get the work done and know where I am and whether I'm on schedule.

# Status:

PROBLEM:  If the number of days you choose to read the bible in takes longer than a
year the program doesn't complete all the way until the Bible is completed.  Need to
find out why!

NOTE: Should sanitize all input so it is lowercased and no upper case is allowed.

The program asks whether you want to delete the old file if it exists.  Otherwise the
program appends another printout to the end of the file.

It asks if you want to start from today or whether you want to start from another date.

It then asks what book of the bible you want to start from, and then what chapter.
Otherwise it will start from Genesis 1.

All input is lowercase or numeric.  

I should output the book names as they are indicated in the internal hash for easier
spelling.  Some of the bible books have weird spelling that is easy to get wrong and
thereby screw up the program.

I've been thinking about creating that hash for the reading plan.  Each key is a date
object.  The contents of the record is the reading assignment, which I guess will be a
string with the chapters to be read.  Or should it be a referrence to the chapter?  Not
sure.  Probably just a string will do.


