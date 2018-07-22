//
//  MASConstraint+CollapsibleConstraints.m
//  MasonryCollapsed
//
//  Created by dadameng on 2018/7/23.
//  Copyright © 2018年 dadameng. All rights reserved.
//

#import "MASConstraint+CollapsibleConstraints.h"

@implementation MASConstraint (CollapsibleConstraints)

- (MASConstraint *)collapsibleConstaints;
{
    NSString *constraintString = [NSString stringWithFormat:@"Collapsed_%@",self.description];
    return [self key](constraintString);
}
@end
