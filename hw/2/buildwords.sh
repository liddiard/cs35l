#!/bin/bash

# get everything inside of <td>s (including the <td>)
grep -o '<td>.*</td>' | \

# remove all backslashes
sed 's/\///g' | \

# remove all <td>s
sed 's/<td>//g' | \

# remove empty lines
sed '/^$/d' | \

# get only even lines
awk 'NR % 2 == 0' | \

# remove <u>s
sed 's/<u>//g' | \

# replace backticks with single quotes
sed "s/\`/'/g" | \

# lowercase everything
tr 'A-Z' 'a-z' | \

# remove commas
sed 's/,//g' | \

# replace whitespace characters with newlines
sed 's/ /\n/g' | \

# remove all lines that don't contain Hawaiian characters
grep -v "[^pk'mnwlhaeiou]" | \

# sort alphabetically, remove duplicates
sort -u
