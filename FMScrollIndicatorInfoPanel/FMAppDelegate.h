//
//  FMAppDelegate.h
//  FMScrollIndicatorInfoPanel
//
//  Created by Mielke Florian on 06.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMInfoPanelViewController;

@interface FMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FMInfoPanelViewController *viewController;

@end
