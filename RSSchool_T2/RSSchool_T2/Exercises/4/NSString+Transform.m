#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSMutableString *copyString = [self mutableCopy];
    NSMutableArray *counterCharacter = [NSMutableArray arrayWithCapacity:26];
    NSMutableString *resultString = [NSMutableString string];
    int counterUniq = 0;
    for (int counter = 0; counter < 26; counter++) {
        counterCharacter[counter] = [NSNumber numberWithInt:0];
    }
    for (int counterLenght = 0; counterLenght < [copyString length]; counterLenght++) {
        for (int counterAlphabet = 0; counterAlphabet < 26; counterAlphabet++) {
            if ([copyString characterAtIndex:counterLenght] == (97 + counterAlphabet) || [copyString characterAtIndex:counterLenght] == (65 + counterAlphabet)) {
                counterCharacter[counterAlphabet] = [NSNumber numberWithInt:([counterCharacter[counterAlphabet] intValue] + 1)];
            }
        }
    }
    [counterCharacter sortUsingSelector:@selector(compare:)];
    
    if (!([counterCharacter[0] intValue] == 0))  {
        NSMutableArray *arrayOfSubstrings = [NSMutableArray array];
        for (int counter = 0; counter < [copyString length]; counter++) {
            
            int counterHelper = counter;
            int counterConsonants = 0;
            int uniq = 0;
            int strangeSyb = 0;
            while (YES) {
                switch ([copyString characterAtIndex:counterHelper]) {
                    case 'a': {
                        counterConsonants++;
                        [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                        break;
                    }
                    case 'e': {
                        counterConsonants++;
                        [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                        
                        break;
                    }
                    case 'i': {
                        counterConsonants++;
                        [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                        break;
                    }
                    case 'o': {
                        counterConsonants++;
                        [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                        break;
                    }
                    case 'u': {
                        counterConsonants++;
                        [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                        break;
                    }
                    case 'y': {
                        counterConsonants++;
                        [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                        break;
                    }
                    case 'A': {
                        counterConsonants++;
                        break;
                    }
                    case 'E': {
                        counterConsonants++;
                        break;
                    }
                    case 'I': {
                        counterConsonants++;
                        break;
                    }
                    case 'O': {
                        counterConsonants++;
                        break;
                    }
                    case 'U': {
                        counterConsonants++;
                        break;
                    }
                    case 'Y': {
                        counterConsonants++;
                        break;
                    }
                        
                }
                if ([copyString characterAtIndex:counterHelper] == ' ') {
                    strangeSyb++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '-') {
                    counterHelper++;
                    uniq++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '\'') {
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == ',') {
                    counterHelper++;
                    break;
                }
                if ((counterHelper == [copyString length ] - 1) && [copyString characterAtIndex:counterHelper] != '.' && [copyString characterAtIndex:counterHelper] != '!' && [copyString characterAtIndex:counterHelper] != '?') {
                    strangeSyb++;
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '.') {
                    counterHelper++;
                    
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '!') {
                    if (counterHelper != [copyString length] - 1) {
                        counterHelper++;
                        continue;
                    }
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '@') {
                    counterHelper++;
                    uniq++;
                    continue;
                }
                if ([copyString characterAtIndex:counterHelper] == '?') {
                    if (counterHelper != [copyString length] - 1) {
                        counterHelper++;
                        continue;
                    }
                    
                    counterHelper++;
                    break;
                }
                if ([[copyString substringWithRange:NSMakeRange(counterHelper, 1)] isEqualToString:@""]) {
                    counterHelper++;
                    uniq++;
                    counterUniq++;
                    continue;
                }
                if ([[copyString substringWithRange:NSMakeRange(counterHelper, 1)] isEqualToString:@"☁"]) {
                    counterHelper++;
                    uniq++;
                    continue;
                }
                counterHelper++;
            }
            if (counterConsonants != 0 || uniq > 0) {
                [copyString insertString:[NSString stringWithFormat:@"%d", counterConsonants] atIndex:counter];
                int amountOfByte = 1, counterDecade = counterConsonants;
                while(counterDecade != 0) {
                    counterDecade = counterDecade / 10;
                    if (counterDecade != 0)
                        amountOfByte++;
                    uniq--;
                }
                [arrayOfSubstrings addObject:[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:counterConsonants], [NSNumber numberWithInt:counter], [NSNumber numberWithInt:(counterHelper - counter + amountOfByte)], nil]];
                counter = counter + amountOfByte;
            }
            counter+=counterHelper - counter;
            
        }
        
        for (int counter = 0; counter < [arrayOfSubstrings count]; counter++) {
            int maxValue = 0;
            for (int counterMaxValue = 0; counterMaxValue < [arrayOfSubstrings count] - 1; counterMaxValue++) {
                if ([arrayOfSubstrings[maxValue][0] intValue] > [arrayOfSubstrings[counterMaxValue + 1][0] intValue])
                    maxValue = counterMaxValue + 1;
            }
            [resultString appendString:[copyString substringWithRange:NSMakeRange([arrayOfSubstrings[maxValue][1] intValue], [arrayOfSubstrings[maxValue][2] intValue])]];
            if ([arrayOfSubstrings count] != 1)
                [resultString appendString:@" "];
            [arrayOfSubstrings removeObjectAtIndex:maxValue];
            counter--;
        }
        return resultString;
    }
    else {
        
        NSMutableArray *arrayOfSubstrings = [NSMutableArray array];
        for (int counter = 0; counter < [copyString length]; counter++) {
            if ([copyString characterAtIndex:counter] == ' ')
                counter++;
            int counterHelper = counter;
            int counterConsonants = 0;
            int counterSpace = 0;
            int uniq = 0;
            while (YES) {
                
                switch ([copyString characterAtIndex:counterHelper]) {
                    case 'a': {
                        counterHelper++;
                        continue;
                    }
                    case 'e': {
                        counterHelper++;
                        continue;
                    }
                    case 'i': {
                        counterHelper++;
                        continue;
                    }
                    case 'o': {
                        counterHelper++;
                        continue;
                    }
                    case 'u': {
                        counterHelper++;
                        continue;
                    }
                    case 'y': {
                        counterHelper++;
                        continue;
                    }
                    case 'A': {
                        counterHelper++;
                        continue;
                    }
                    case 'E': {
                        counterHelper++;
                        continue;
                    }
                    case 'I': {
                        counterHelper++;
                        continue;
                    }
                    case 'O': {
                        counterHelper++;
                        continue;
                    }
                    case 'U': {
                        counterHelper++;
                        continue;
                    }
                    case 'Y': {
                        counterHelper++;
                        continue;
                    }
                }
                
                if ([copyString characterAtIndex:counterHelper] == ' ') {
                    if (counterHelper != [copyString length] - 1) {
                        if ([copyString characterAtIndex:counterHelper + 1] == ' ') {
                            counterHelper++;
                            counterSpace++;
                            continue;
                        }
                    }
                    uniq++;
                    counterHelper++;
                    break;
                }
                if ((counterHelper == [copyString length ] - 1) && [copyString characterAtIndex:counterHelper] != '.' && [copyString characterAtIndex:counterHelper] != '!' && [copyString characterAtIndex:counterHelper] != '?') {
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '\'') {
                    counterHelper++;
                    continue;
                }
                if ([copyString characterAtIndex:counterHelper] == ',') {
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '\0') {
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '.') {
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '\\') {
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '\r') {
                    counterHelper++;
                    break;
                }
                if ([[copyString substringWithRange:NSMakeRange(counterHelper, 1)] isEqualToString:@""]) {
                    counterUniq++;
                    counterHelper++;
                    continue;
                }
                
                if ([copyString characterAtIndex:counterHelper] == '!') {
                    if (counterHelper != [copyString length] - 1) {
                        counterHelper++;
                        continue;
                    }
                    counterHelper++;
                    break;
                }
                if ([copyString characterAtIndex:counterHelper] == '?') {
                    if (counterHelper != [copyString length] - 1) {
                        counterHelper++;
                        continue;
                    }
                    counterHelper++;
                    break;
                }
                counterConsonants++;
                [copyString replaceCharactersInRange:NSMakeRange(counterHelper,1) withString:[[copyString substringWithRange:NSMakeRange(counterHelper,1)] capitalizedString]];
                counterHelper++;
            }
            
            [copyString insertString:[NSString stringWithFormat:@"%d", counterConsonants] atIndex:counter];
            int amountOfByte = 1, counterDecade = counterConsonants;
            while(counterDecade != 0) {
                counterDecade = counterDecade / 10;
                if (counterDecade != 0)
                    amountOfByte++;
            }
            [arrayOfSubstrings addObject:[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:counterConsonants], [NSNumber numberWithInt:counter], [NSNumber numberWithInt:(counterHelper - counter + amountOfByte - counterSpace - uniq)], nil]];
            counter = counter + amountOfByte;
            counter+=counterHelper - counter;
            
        }
        for (int counter = 0; counter < [arrayOfSubstrings count]; counter++) {
            int maxValue = 0;
            for (int counterMaxValue = 0; counterMaxValue < [arrayOfSubstrings count] - 1; counterMaxValue++) {
                if ([arrayOfSubstrings[maxValue][0] intValue] > [arrayOfSubstrings[counterMaxValue + 1][0] intValue])
                    maxValue = counterMaxValue + 1;
            }
            [resultString appendString:[copyString substringWithRange:NSMakeRange([arrayOfSubstrings[maxValue][1] intValue], [arrayOfSubstrings[maxValue][2] intValue])]];
            if ([arrayOfSubstrings count] != 1)
                [resultString appendString:@" "];
            [arrayOfSubstrings removeObjectAtIndex:maxValue];
            counter--;
        }
        if (([counterCharacter[25] intValue] == 0) &&  counterUniq == 0)
            return @"";
        return resultString;
    }
    return @"";
}

@end
