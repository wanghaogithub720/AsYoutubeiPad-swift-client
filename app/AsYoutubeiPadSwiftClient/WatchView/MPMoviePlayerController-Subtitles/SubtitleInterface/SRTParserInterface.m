#import "SRTParserInterface.h"


@implementation SRTParserInterface {

}

+ (void)searchAndShowSubtitle:(NSMutableDictionary*)subtitlesParts withLabel:(UILabel*)subtitleLabel inTime:(NSTimeInterval) currentPlaybackTime{
    
    // Search for timeInterval
    NSPredicate *initialPredicate = [NSPredicate predicateWithFormat:@"(%@ >= %K) AND (%@ <= %K)",
                                     @(currentPlaybackTime),
                                     kStart,
                                     @(currentPlaybackTime),
                                     kEnd];
    NSArray *objectsFound = [[subtitlesParts allValues] filteredArrayUsingPredicate:initialPredicate];
    NSDictionary *lastFounded = (NSDictionary *)[objectsFound lastObject];
    
    // Show text
    if(lastFounded) {
        
        // Get text
        subtitleLabel.text = [lastFounded objectForKey:kText];
        
        
        // Label position
        CGSize size = [subtitleLabel.text sizeWithFont:subtitleLabel.font
                                          constrainedToSize:CGSizeMake(CGRectGetWidth(subtitleLabel.bounds), CGFLOAT_MAX)];
        subtitleLabel.frame = ({
            CGRect frame = subtitleLabel.frame;
            frame.size.height = size.height;
            frame;
        });
//        subtitleLabel.center = CGPointMake(CGRectGetWidth(view.bounds) / 2.0, CGRectGetHeight(view.bounds) - (CGRectGetHeight(subtitleLabel.bounds) / 2.0) - 15.0);
        
    } else {
        
        subtitleLabel.text = @"";
        
    }

}
@end