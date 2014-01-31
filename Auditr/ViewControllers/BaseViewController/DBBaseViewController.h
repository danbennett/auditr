//
//  DBBaseViewController.h
//  Auditr
//
//  Created by Daniel Bennett on 11/12/2013.
//  Copyright (c) 2013 Daniel Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const DBBurgerButtonPressedNotification;

@interface DBBaseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *groupTableView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end