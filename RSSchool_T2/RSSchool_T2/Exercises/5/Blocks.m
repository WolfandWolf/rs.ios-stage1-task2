#import "Blocks.h"

@implementation Blocks

NSArray *Array;

- (BlockA)blockA {
    return [^(NSArray *giveArray) {
        Array = [giveArray copy];
    } copy];
}

- (BlockB)blockB {
    return [^(Class type) {
        if (type == [NSNumber class]) {
            int resultSum = 0;
            for (int counter = 0; counter < [Array count]; counter++) {
                if ([Array[counter] isKindOfClass:[NSNumber class]]) {
                    resultSum += [Array[counter] intValue];
                }
            }
            _blockC([NSNumber numberWithInt:resultSum]);
        }
        if (type == [NSString class]) {
            NSMutableString *resultString = [NSMutableString stringWithString:@""];
            for (NSObject *counter in Array) {
                if ([counter isKindOfClass:[NSString class]]) {
                    [resultString appendString:[NSString stringWithFormat:@"%@", counter]];
                }
            }
            _blockC(resultString);
        }
        if (type == [NSDate class]) {
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            NSDateFormatter *resultDate = [[NSDateFormatter alloc] init];
            resultDate.dateFormat = @"dd.MM.yyyy";
            for (int counter = 0; counter < [Array count]; counter++) {
                if ([Array[counter] isKindOfClass:[NSDate class]]) {
                    date = [date laterDate: (NSDate*)Array[counter]];
                }
            }
            _blockC([resultDate stringFromDate:date]);
        }
    } copy];
}
@end

