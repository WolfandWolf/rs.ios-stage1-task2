#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    if (([hours intValue] < 0 || [hours intValue] > 24) || ([minutes intValue] < 0 || [minutes intValue] > 60))
        return @"";
    NSMutableDictionary *hoursDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"one", @1, @"two", @2, @"three", @3, @"four", @4, @"five", @5, @"six", @6, @"seven", @7, @"eight", @8, @"nine", @9, @"ten", @10, @"eleven", @11, @"twelve", @12, @"thirteen", @13, @"fourteen", @14, @"fifteen", @15, @"sixteen", @16, @"seventeen", @17, @"eighteen", @18, @"nineteen", @19, @"twenty", @20, @"twenty one", @21, @"twenty two", @22, @"twenty three", @23, @"twenty for", @24, @"twenty five", @25, @"twenty six", @26, @"twenty seven", @27, @"twenty eight", @28, @"twenty nine", @29,  nil];
    if ([minutes intValue] == 0) {
        NSString *result = [NSString stringWithFormat:@"%@ o' clock", [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] < 10) {
        NSString *result = [NSString stringWithFormat:@"%@ minutes past %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[minutes intValue]]], [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] == 10) {
        NSString *result = [NSString stringWithFormat:@"ten minutes past %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] < 15) {
        NSString *result = [NSString stringWithFormat:@"%@ minutes past %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[minutes intValue]]], [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] == 15) {
        NSString *result = [NSString stringWithFormat:@"quarter past %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] < 30) {
        NSString *result = [NSString stringWithFormat:@"%@ minutes past %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[minutes intValue]]], [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] == 30) {
        NSString *result = [NSString stringWithFormat:@"half past %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[hours intValue]]]];
        return result;
    }
    else if ([minutes intValue] < 45 && [minutes intValue] > 30) {
        NSNumber *restMinutes = [NSNumber numberWithInt:(60 - [minutes intValue])];
        NSString *result = [NSString stringWithFormat:@"%@ minutes to %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[restMinutes intValue]]], [hoursDictionary objectForKey: [NSNumber numberWithInt:([hours intValue] + 1)]]];
        return result;
    }
    else if ([minutes intValue] == 45) {
        NSString *result = [NSString stringWithFormat:@"quarter to %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:([hours intValue] + 1)]]];
        return result;
    }
    else if ([minutes intValue] < 60 && [minutes intValue] > 30) {
        NSNumber *restMinutes = [NSNumber numberWithInt:(60 - [minutes intValue])];
        NSString *result = [NSString stringWithFormat:@"%@ minutes to %@", [hoursDictionary objectForKey: [NSNumber numberWithInt:[restMinutes intValue]]], [hoursDictionary objectForKey: [NSNumber numberWithInt:([hours intValue] + 1)]]];
        return result;
    }
    return @"";}
@end
