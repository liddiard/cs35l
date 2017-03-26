int main()
{
  //Initializing variables
  char *tempString = malloc( sizeof(char) );    //Holds the string of the current word being read in
  char *oldTempString = NULL;                   //For realloc purposes
  char **listOfPtrsToWords = NULL;              //Array of pointers to character arrays, and this is the array being sorted
  char **oldListOfPtrsToWords = NULL;           //For realloc purposes
  unsigned int currentSize = 0;                 //Size of the array of pointers to character arrays
  int i, j;                                     //Loop iteration variables
  int lastWordFlag = 0;                         //Flag for the last word, if ==1, done reading from stdin
  int count = 0;                                //Size of the current word being read in from stdin


  //Loop for reading in all the words from stdin
  while (lastWordFlag == 0)
    {
      count = 0;
      while (1)
        {
        int charHold = fgetc(stdin);

        if( charHold == EOF )
          {
            lastWordFlag = 1;
            if (ferror (stdin))
              fprintf(stderr, "Error reading from standard input\n");
            if (tempString[count - 1] != '\n')
              tempString[count] = '\n';
            break;
          }
        if ( charHold == '\n' )
          {
            tempString[count] = '\n';
            break;
          }

        tempString[count] = charHold;
        count++;
        oldTempString = tempString;
        tempString = realloc ( oldTempString,sizeof(char) * (count + 1));
        //This only happens if memory cannot be allocated
        if (tempString == NULL)
          {
          fprintf(stderr, "Errors when allocating memory, exiting the program.");
          return 1;
          }
        }
      listOfPtrsToWords =  realloc (oldListOfPtrsToWords, sizeof(char**) * (currentSize + 1));

      //This only happens if memory cannot be allocated
      if (listOfPtrsToWords == NULL)
        {
          fprintf(stderr, "Errors when allocating memory, exiting the program.");
          return 1;
        }

      listOfPtrsToWords[currentSize] = tempString;
      tempString =  malloc(sizeof(char) * 50);
      currentSize++;
      oldListOfPtrsToWords = listOfPtrsToWords;


    }

  //Using built in quick sort function to sort out the array of pointers to strings
  //Using my own comparison function
  qsort( listOfPtrsToWords, currentSize, sizeof(char **), rot13cmp);

  //Printing out all the strings from listOfPtrsToWords
  //They should be in the correct lexicographically sorted order
  //Also I'm freeing the memory holding the cstrings at the same time
  for (i = 0; i < currentSize; i++)
    {
      for (j = 0; listOfPtrsToWords[i][j] != '\n'; j++)
        printf("%c", listOfPtrsToWords[i][j] );
      printf("%c", listOfPtrsToWords[i][j] );
      free (listOfPtrsToWords[i]);
      listOfPtrsToWords[i] = NULL;
    }
  //Last but not least, freeing memory holding the array of pointers
  //pointing to cstrings. Almost forgot about it!
  free (listOfPtrsToWords);

  return 0;
}
