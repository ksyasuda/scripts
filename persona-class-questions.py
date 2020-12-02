#!/usr/bin/env python3

import sys

def getInput(isVerbose):
    monthMap = {'JANUARY': 1, 'FEBRUARY': 2, 'MARCH': 3, 'APRIL': 4, 'MAY': 5, 'JUNE': 6, 'JULY': 7, 'AUGUST': 8, 'SEPTEMBER': 9, 'OCTOBER': 10, 'NOVEMBER': 11, 'DECEMBER': 12, 'JAN': 1, 'FEB': 2, 'MAR': 3, 'APR': 4, 'MAY': 5, 'JUN': 6, 'JUL': 7, 'AUG': 8, 'SEP': 9, 'OCT': 10, 'NOV': 11, 'DEC': 12}
    month = input('Which Month? (String or Integer): ')
    if isVerbose:
        print('Getting User Data...')
    # if input is a string then convert it into its numerical equivalent
    if not month.isnumeric():
        month = monthMap[month.upper()]
    day = input('What Day? (Integer): ')
    datestr = str(month) + "/" + str(day)
    if isVerbose:
        print('User input received... generating and returning date string', datestr)
    return datestr

def printData(days, day, isVerbose):
    if isVerbose:
        print('Searching dictionary for date string', day)
    if day in days:
        if isVerbose:
            print(day, 'found in dictionary... getting information about the day')
        for key in days[day]:
            # [Q/A]: [Question/Answer] 
            print(key, days[day][key])
    else:
        print(day, 'is not a day where questions are asked in class')

def main():
    argv = sys.argv
    argc = len(argv)
    isVerbose = False
    if argc > 1 and argv[1] == '-v':
       isVerbose = True 
    with open('/home/sudacode/Documents/P5RClassroomAnswers.txt') as f:
        lines = f.readlines()
        days = {}
        # first line will be date 4/12
        day = {}
        date = lines[0]
        for i in range(len(lines)):
            # first date already set skip
            # don't need empty lines either
            if i == 0 or lines[i] == '\n':
                continue
            parts = lines[i].split(' ')
            if len(parts) == 1:
                # date string
                date = parts[0]
                days[parts[0].rstrip()] = day
                day = {}
                date = ''
                if isVerbose:
                    print('DATE: ', parts[0], 'Q/A', day)
            elif len(parts) == 2 and parts[0] == 'EXAMS':
                # exams date string
                days[parts[1].rstrip()] = day
                date = ''
                day = {}
                if isVerbose:
                    print('DATE: ', parts[1], 'Q/A', day)
            else:
                # append to the day dictionary the entire question/answer
                day[parts[0]] = ' '.join(parts[1:]).rstrip()
        if isVerbose:
            print('Finished loading dictionary... ready for user input')
        chosenDate = getInput(isVerbose)
        printData(days, chosenDate, isVerbose)

if __name__ == '__main__':
    main()
