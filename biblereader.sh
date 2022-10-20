##   Working from New American Bible (Catholic Edition)

external_file="~/bibleplan_in_a_year.txt"

version="New American Bible Revised Edition (Catholic Edition)"

##  Find a way to change this programmatically
start_date='2022-06-01'   #  YYYY-MM-DD format
end_date='2023-06-01'
today=$start_date   ## at first these two are equal

current_book="genesis"
current_chapter=1
chaps_per_day=4

declare -a books=( genesis exodus leviticus numbers deuteronomy joshua judges
ruth i_samuel ii_samuel i_kings ii_kings i_chronicles ii_chronicles ezra 
nehemiah tobit judith esther i_maccabees ii_maccabees job psalms proverbs 
ecclesiastes song_of_songs wisdom ben_sira isaiah jeremiah lamentations baruch 
ezekiel daniel hosea joel amos obadiah jonah micah nahum habakkuk zephaniah 
haggai zechariah malachi matthew mark luke john acts romans i_corinthians 
ii_corinthians galatians ephesians philippians colossians i_thessalonians 
ii_thessalonians i_timothy ii_timothy titus philemon hebrews james i_peter 
ii_peter i_john ii_john iii_john jude revelation ) 

declare -A chapters=( [genesis]=50 [exodus]=40 [leviticus]=27 [numbers]=36 [deuteronomy]=34 
[joshua]=24 [judges]=21 [ruth]=4 [i_samuel]=31 [ii_samuel]=24 [i_kings]=22
[ii_kings]=25 [i_chronicles]=29 [ii_chronicles]=36 [ezra]=10 [nehemiah]=13
[tobit]=14 [judith]=16 [esther]=10 [i_maccabees]=16 [ii_maccabees]=15
[job]=42 [psalms]=150 [proverbs]=31 [ecclesiastes]=12 [song_of_songs]=8
[wisdom]=19 [ben_sira]=51 [isaiah]=66 [jeremiah]=52 [lamentations]=5
[baruch]=6 [ezekiel]=48 [daniel]=14 [hosea]=14 [joel]=4 [amos]=9 [obadiah]=1
[jonah]=4 [micah]=7 [nahum]=3 [habakkuk]=3 [zephaniah]=3 [haggai]=2
[zechariah]=14 [malachi]=3 
[matthew]=28 [mark]=16 [luke]=24 [john]=21 [acts]=28 [romans]=16
[i_corinthians]=16 [ii_corinthians]=13 [galatians]=6 [ephesians]=6
[philippians]=4 [colossians]=4 [i_thessalonians]=5 [ii_thessalonians]=3
[i_timothy]=6 [ii_timothy]=4 [titus]=3 [philemon]=1 [hebrews]=13
[james]=5 [i_peter]=5 [ii_peter]=3 [i_john]=5 [ii_john]=1 [iii_john]=1
[jude]=1 [revelation]=22
)

## Everything depends on picking a start date
start=$(date -d $start_date +"%Y%m%d")
end=$( date -d $end_date +"%Y%m%d")


##  Bible Version
#echo $version


####  FUNCTIONS

## Everything happens within the dates for loop
generate_dates(){

    while [[ $today -le $end ]];
    do
    
        ## Start through the books of the bible

        ##  !!!   Need to change to iterate through indexes as needed
        #for name in ${books[@]}; do
    
    
        #  ::: Bookname ==> Total Chapters
        echo
        echo "::: $current_book ==> ${chapters[$current_book]} chapters in book"
    
        ## For each book iterate through the chapters
        #for (( c=1; c<=${chapters[$name]}; c++ ))
        #do


        echo
        #echo $(date -d $today +"%A %m-%d-%Y") " => $name  Chapter $c"

        echo $(date -d $today +"%A %m-%d-%Y") " ====> "
        
        ## n is number of chapters to read each day
        eval chaps_per_day=$chaps_per_day
        #while [[ $n -le $chaps_per_day ]] ; do
        for ((n=1; n<=$chaps_per_day; n++)); do

            # This should update from global variable after each global update
            book="$current_book"; chapter="$current_chapter"
            print_books_chaps "$book" "$chapter" 
            n=$((n+1))


        done

       

    
        ###  call print book and chapter function in here
    
        # update the date
        #today=$(date -d"$today + 1 day" +"%Y%m%d"  )
    
    
        #done
        echo $(date -d $today +"%A %m-%d-%Y")
        today=$(date -d"$today + 1 day" +"%Y%m%d"  )


    done 

}

####  abstract out the printing of bible books and chapters
print_books_chaps(){
    book=$1; chapter=$2
    echo "print_books_chaps -- book: $book chapter: $chapter"

    #if $( not_last_book "$current_book" "$current_chapter" ); then
    if $( not_last_book "$book" "$chapter" ); then
        echo "### $book $chapter"
        advance_chapter
    else
        # increment book
        new_book=$(advance_book "$book")

        ## not sure if I want to go recursive here.  Does this create a problem for future?
        export current_book="$new_book"   # update global variable
        export current_chapter=1        # update global variable
        echo "print_books_chaps else stmt: "; #print_books_chaps "$new_book" $current_chapter
    fi

}

####  when we run out of chapters in one book, advance to the next book of the bible
advance_book(){
    book=$1
    new_book_index=$(( $(index_of "$book") + 1 ))
    #current_book="${books[ $new_book_index ]}"
    echo "advance_book:  ${books[ $new_book_index ]}"
}

## advance the chapter
advance_chapter(){
    next_chapter=$((current_chapter+1))
    export current_chapter=$next_chapter
}


### Need to be able to get index value of book in books array
index_of(){
    ##  This will return the index value of the book in the books array
    book=$1
    for i in "${!books[@]}"; do
        if [[ "${books[$i]}" = "$book" ]] ; then
            echo "${i}" 
        fi
    done
}



###  Figure out if we're at the last chapter in the book yet
not_last_book(){

    book=$1; chapter=$2
    #echo "not_last_book --- Book is: $book  Chapter is: $chapter"

    if  [[ $chapter -le ${chapters[$book]}  ]] ; then 
        # increment chapter
        current_chapter=$((current_chapter+1))
        return 0
    else
        current_chapter=1
        return 1
    fi
}

get_chaps_per_day(){
    echo "How many chapters per day?"; read chaps_per_day
    #export $chaps_per_day
}




#####  Not sure what to do with this right now...
#for name in ${chapters[@]}}; do
#    #echo "$name ==> ${chapters[$name]}"
#    ((total+=${chapters[$name]}))
#done



######  Also not sure what to do with this currently....
#current_chapter=1
#for name in ${books[@]}; do
#    echo "::: $name ==> ${chapters[$name]}"
#    
#    todays_reading="$name Chapters $current_chapter - $((current_chapter+3))"
#    ((current_chapter+=4))
#
#    for (( c=1; c<=${chapters[$name]}; c++ ))
#    do
#        echo "$name  Chapter $c"
#    done
#    current_chapter=1
#done



#############################################3
####                 MAIN
#############################################3

get_chaps_per_day
generate_dates
