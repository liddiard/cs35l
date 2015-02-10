#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


const int UPPERCASE_MIDPOINT = 77; // midpoint of uppercase chars in ascii table
const int LOWERCASE_MIDPOINT = 109; // midpoint of lowercase chars in ascii table
const int MAX_WORD_LENGTH = 64; // we're assuming words can't be longer than this


int rot13cmp(char const * a, char const * b)
{
    /* make integer representations of the chars */
    int ai = (int)*a;
    int bi = (int)*b;

    if (*a == *b)
        return 0;

    if (isupper(*a) && islower(*b))
        return -1;

    if (islower(*a) && isupper(*b))
        return 1;

    if (isupper(*a) && isupper(*b))
    {
        return comparator(ai, bi, UPPERCASE_MIDPOINT);
    }

    else if (islower(*a) && islower(*b))
    {
        return comparator(ai, bi, LOWERCASE_MIDPOINT);
    }
}

int comparator(int a, int b, int midpoint)
// do comparison on two numbers rotated around a midpoint
{
    if (a > midpoint && b < midpoint)
        return -1;
    else if (a < midpoint && b > midpoint)
        return 1;
    else
        return a > b ? 1 : -1;
}
