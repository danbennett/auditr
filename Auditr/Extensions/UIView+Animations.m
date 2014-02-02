//
//  UIView+Animations.m
//  Auditr
//
//  Created by Daniel Bennett on 31/01/2014.
//  Copyright (c) 2014 Daniel Bennett. All rights reserved.
//

#import "UIView+Animations.h"
#import <ReactiveCocoa/RACEXTScope.h>

@implementation UIView (Animations)

- (void) animateToPosition: (CGPoint) position withDuration: (NSTimeInterval) duration withEase: (UIViewAnimationOptions) ease
{
	@weakify(self);
	[UIView animateWithDuration: duration delay:0.0 options: ease animations:^{
	
		@strongify(self);
		self.frame = ({
			CGRect frame = self.frame;
			frame.origin = position;
			frame;
		});
	} completion: NULL];
}

- (void) animateToOpacity: (CGFloat) alpha withDuration: (NSTimeInterval) duration
{
	@weakify(self);
	[UIView animateWithDuration: duration animations:^{
	
		@strongify(self);
		self.alpha = alpha;
		
	}];
}

@end
