#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSString *copyA = [a  copy];
    NSString *copyB = [b copy];
    int counterA = 0, counterB = 0, counterMatches = 0, counterUpperCase = 0;;
    for (counterB; counterB < [copyB length]; counterB++) {
        for (counterA; counterA < [copyA length]; counterA++) {
            if (counterMatches >= 1 && ([copyA characterAtIndex:counterA] >= 65 && [copyA characterAtIndex:counterA] <= 90) && [copyB characterAtIndex:counterB] != [copyA characterAtIndex:counterA]) {
                counterUpperCase++;
                break;
            }
            if ([copyB characterAtIndex:counterB] == [copyA characterAtIndex:counterA] || [copyB characterAtIndex:counterB] == ([copyA characterAtIndex:counterA] - 32)) {
                counterMatches++;
                counterA++;
                break;
            }
        }
    }
    if (counterMatches == [copyB length] && counterUpperCase == 0)
        return @"YES";
    else
        return @"NO";
}
@end
