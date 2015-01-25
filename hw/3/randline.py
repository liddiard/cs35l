#!/usr/bin/python

"""
Output lines selected randomly from a file

Copyright 2005, 2007 Paul Eggert.
Copyright 2010 Darrell Benjamin Carbajal.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Please see <http://www.gnu.org/licenses/> for a copy of the license.

$Id: randline.py,v 1.4 2010/04/05 20:04:43 eggert Exp $
"""

import random, sys
from optparse import OptionParser


class randline:

    def __init__(self, filenames):
        self.lines = []
        for file in filenames:
            f = open(file, 'r')
            lines = f.readlines()
            if lines and lines[-1][-1:] != '\n':
                lines[-1] += '\n' # append newline to the last line of file
            self.lines.extend(lines)
        f.close()

    def chooselines(self, num_lines=1, unique_input=False,
                    unique_output=False):
        output = []
        if unique_input: # remove duplicate lines from the input file
            lines = list(set(self.lines))
        else:
            lines = self.lines
        if unique_output:
            random.shuffle(lines)
            for line in range(num_lines):
                output.append(lines[line]) # will error if less lines in input
                                           # than requested
        else:
            for line in range(num_lines):
                output.append(random.choice(lines))
        return output


def main():
    version_msg = "%prog 2.0"
    usage_msg = """%prog [OPTION]... FILE

Output randomly selected lines from FILE."""

    parser = OptionParser(version=version_msg,
                          usage=usage_msg)
    parser.add_option("-n", "--numlines",
                      action="store", dest="numlines", default=1,
                      help="output NUMLINES lines (default 1)")
    parser.add_option("-u", "--unique",
                      action="store_true", dest="unique_input", default=False,
                      help="De-dupe input file lines before processing "
                      "(default False)")
    parser.add_option("-w", "--without-replacement",
                      action="store_true", dest="unique_output",
                      default=False, help="Display only unique lines in "
                      "output (default False)")
    options, args = parser.parse_args()

    try:
        numlines = int(options.numlines)
    except:
        parser.error("invalid NUMLINES: {0}".
                     format(options.numlines))
    if numlines < 0:
        parser.error("negative count: {0}".
                     format(numlines))
    if len(args) < 1:
        parser.error("wrong number of operands")
    input_files = args

    try:
        generator = randline(input_files)
        lines = generator.chooselines(num_lines=numlines,
                                      unique_input=options.unique_input,
                                      unique_output=options.unique_output)
        for line in lines:
            sys.stdout.write(line)
    except IOError as e:
        parser.error("I/O error({0}): {1}".
                     format(e.errno, e.args[0]))

if __name__ == "__main__":
    main()
