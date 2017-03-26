int main()
{
    int end, size = 0;
    char * tmp, tmp_old = malloc(sizeof(char)); // arrays to build words
    char ** words, words_old; // arrays to hold built words

    while (!end)
    {
        int c, c_old;
        int iteration = 0;
        do {
            c = fgetc(stdin); // ref: http://www.tutorialspoint.com/c_standard_library/c_function_fgetc.htm

            /* special cases */
            if (ferror(stdin))
            {
                fprintf(stderr, "Read error");
                exit(1); // exit program with error code
            }
            if (c == '\n')
            {
                tmp[iteration] = '\n';
                break; // newline char marks end of word
            }
            if (c == EOF)
            {
                if (tmp[iteration-1] != '\n')
                    tmp[iteration] = '\n'; // append a newline if the string doesn't end with one
                end = 1;
                break;
            }

            tmp[iteration] = c;
            tmp_old = tmp;
            tmp = realloc(tmp_old, sizeof(char)*(iteration+1));

            if (!tmp)
            {
                fprintf(stderr, "Memory allocation error");
                exit(1);
            }

            iteration++;

        } while (1);

        words = realloc(words_old, sizeof(char*) * (size+1));

        if (words == NULL)
        {
            fprintf(stderr, "Memory allocation error");
            exit(1);
        }

        words[size] = tmp;
        size++;
        tmp = malloc(sizeof(char) * MAX_WORD_LENGTH);

        if (tmp == NULL)
        {
            fprintf(stderr, "Memory allocation error");
            exit(1);
        }

        words_old = words;
    }

    qsort(words, size, sizeof(char **), rot13cmp);

    /* print sorted words */
    int i, j;

    for (i = 0; i < size; i++)
    {
        j = 0;
        while (words[i][j] != '\n')
        {
            printf(words[i][j]);
            j++;
        }
    }

    /* free memory */
    for (i = 0; i < size; i++)
    {
        free(words[i]);
    }
    free(words);

    exit(0);
}
