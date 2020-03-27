#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    BOOL leapYear = NO;
    if ([month intValue] > 0 && [month intValue] < 13) {
        NSMutableDictionary *listOfMonth = [NSMutableDictionary dictionary];
        NSMutableDictionary *listOfCods = [NSMutableDictionary dictionary];
        NSMutableDictionary *listOfNames = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"января", @"1", @"февраля", @"2", @"марта", @"3", @"апреля", @"4", @"мая", @"5", @"июня", @"6", @"июля", @"7", @"августа", @"8", @"сентября", @"9", @"октября", @"10", @"ноября", @"11", @"декабря", @"12", nil];
        int resultWeekDay;
        if (([year intValue] / 4 == 0) || (([year intValue] / 100 == 0) && ([year intValue] / 400 == 0))) {
            listOfMonth = [NSMutableDictionary dictionaryWithObjectsAndKeys:@31, @"1", @29, @"2", @31, @"3", @30, @"4", @31, @"5", @30, @"6", @31, @"7", @31, @"8", @30, @"9", @31, @"10", @30, @"11", @31, @"12", nil];
        }
        else {
            listOfMonth = [NSMutableDictionary dictionaryWithObjectsAndKeys:@31, @"1", @28, @"2", @31, @"3", @30, @"4", @31, @"5", @30, @"6", @31, @"7", @31, @"8", @30, @"9", @31, @"10", @30, @"11", @31, @"12", nil];
            leapYear = YES;
        }
        if ([day intValue] > 0 && [day intValue] <= [[listOfMonth objectForKey:month] intValue]) {
            listOfCods = [NSMutableDictionary dictionaryWithObjectsAndKeys:@1, @"1", @4, @"2", @4, @"3", @0, @"4", @2, @"5", @5, @"6", @0, @"7", @3, @"8", @6, @"9", @1, @"10", @4, @"11", @6, @"12", nil];
            int lastTwoDigit = [year intValue] % 100;
            if ([year intValue] >= 1900 && [year intValue] <= 1999) {
                resultWeekDay = ([day intValue] + [[listOfCods objectForKey:month] intValue] + (0 + lastTwoDigit + lastTwoDigit / 4)) % 7;
            }
            else if ([year intValue] >= 2000 && [year intValue] <= 2099) {
                resultWeekDay = ([day intValue] + [[listOfCods objectForKey:month] intValue] + (6 + lastTwoDigit + lastTwoDigit / 4)) % 7;
            }
            else if ([year intValue] >= 2100 && [year intValue] <= 2199) {
                resultWeekDay = ([day intValue] + [[listOfCods objectForKey:month] intValue] + (4 + lastTwoDigit + lastTwoDigit / 4)) % 7;
            }
            //            if (leapYear == YES)
            //                resultWeekDay++;
            switch(resultWeekDay) {
                case 0: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, суббота", day, [listOfNames objectForKey:month]];
                    return result;
                }
                case 1: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, воскресенье", day, [listOfNames objectForKey:month]];
                    return result;
                }
                case 2: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, понедельник", day, [listOfNames objectForKey:month]];
                    return result;
                }
                case 3: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, вторник", day, [listOfNames objectForKey:month]];
                    return result;
                }
                case 4: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, среда", day, [listOfNames objectForKey:month]];
                    return result;
                }
                case 5: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, четверг", day, [listOfNames objectForKey:month]];
                    return result;
                }
                case 6: {
                    NSString *result = [NSString stringWithFormat:
                                        @"%@ %@, пятница", day, [listOfNames objectForKey:month]];
                    return result;
                }
            }
        }
        else
            return @"Такого дня не существует";
    }
    else
        return @"Такого дня не существует";
    return @"";
}

@end
