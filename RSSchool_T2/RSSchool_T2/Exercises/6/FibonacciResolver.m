#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray *fibonacci = [NSMutableArray arrayWithObjects:@0, @1, nil];
    int counter = 0;
    while (YES) {
        if (([fibonacci[counter] intValue] * [fibonacci[counter + 1] intValue]) <= [number intValue]) {
            if (([fibonacci[counter] intValue] * [fibonacci[counter + 1] intValue]) == [number intValue]) {
                return @[fibonacci[counter], fibonacci[counter + 1], @1];
            }
            if (([fibonacci[counter] intValue] * [fibonacci[counter + 1] intValue]) < [number intValue]) {
                [fibonacci addObject:[NSNumber numberWithInt:([fibonacci[counter] intValue] + [fibonacci[counter + 1] intValue])]];
                counter++;
            }
        }
        if (([fibonacci[counter] intValue] * [fibonacci[counter + 1] intValue]) > [number intValue]) {
            return @[fibonacci[counter], fibonacci[counter + 1], @0];
        }
        
    }
    return @[];
}
@end
