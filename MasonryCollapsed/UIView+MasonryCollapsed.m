//
//  UIView+MasonryCollapsed.m
//  IntelligentSeals
//
//  Created by dadameng on 2018/7/22.
//  Copyright © 2018年 dadameng . All rights reserved.
//

#import "UIView+MasonryCollapsed.h"
#import "UIView+FDCollapsibleConstraints.h"
#import <objc/runtime.h>

@implementation UIView (MasonryCollapsed)
- (void)setMc_collapsed:(BOOL)collapsed
{

    NSMutableArray *collapsibleConstraints = [NSMutableArray array];
    NSArray *constraints = self.constraints;
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectsFromArray:constraints];
    [array addObjectsFromArray:self.superview.constraints];
    [array enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[MASLayoutConstraint class]]){
            MASLayoutConstraint *layoutConstraint = (MASLayoutConstraint *)obj;
            if([layoutConstraint.mas_key containsString:@"Collapsed"] && ![self.fd_collapsibleConstraints containsObject:obj]) {
                [collapsibleConstraints addObject:obj];
            }
        }
    }];
    self.fd_collapsibleConstraints = collapsibleConstraints;
    self.fd_collapsed = collapsed;
    objc_setAssociatedObject(self, @selector(mc_collapsed), @(collapsed), OBJC_ASSOCIATION_RETAIN);

}

- (BOOL)mc_collapsed
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
@end
