//
//  FMInfoPanelViewController.h
//  Created by Florian Mielke (@FlorianMielke) on 06.12.11.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface FMInfoPanelViewController : UIViewController <UIScrollViewDelegate>
{
	UIScrollView *scrollView;
	UIView *infoPanel;
	CGSize initialSizeOfInfoPanel;
	CGFloat initialHeightOfScrollIndicator;
}
@end