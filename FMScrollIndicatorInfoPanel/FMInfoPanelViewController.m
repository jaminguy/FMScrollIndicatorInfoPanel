//
//  FMInfoPanelViewController.m
//  Created by Florian Mielke (@FlorianMielke) on 06.12.11.
//


#import "FMInfoPanelViewController.h"

@implementation FMInfoPanelViewController



#pragma mark - 
#pragma mark View lifecycle

- (void)viewDidLoad
{
	CGRect viewFrame = [[self view] frame];
	
	scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
	[scrollView setDelegate:self];
	[scrollView setContentSize:CGSizeMake(viewFrame.size.width, viewFrame.size.height * 4)];
	[[self view] addSubview:scrollView];
	
	UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"infoPanel.png"]];
	initialSizeOfInfoPanel = [backgroundImage frame].size;
	
	infoPanel = [[UIView alloc] initWithFrame:CGRectMake(initialSizeOfInfoPanel.width * (-1), 0, initialSizeOfInfoPanel.width, initialSizeOfInfoPanel.height)];
	[infoPanel addSubview:backgroundImage];
	[backgroundImage release], backgroundImage = nil;
}



#pragma mark -
#pragma mark Scroll view delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)aScrollView
{
	if (![infoPanel superview]) 
	{
		UIView *indicator = [[aScrollView subviews] lastObject];
		CGRect indicatorFrame = [indicator frame];
		initialHeightOfScrollIndicator = indicatorFrame.size.height;
		
		[[infoPanel layer] setBackgroundColor:[[indicator layer] backgroundColor]];
		[[indicator layer] addSublayer:[infoPanel layer]];
		
		// Center the info panel
		CGRect infoPanelFrame = [infoPanel frame];
		infoPanelFrame.size = initialSizeOfInfoPanel;
		infoPanelFrame.origin.y = indicatorFrame.size.height / 2 - infoPanelFrame.size.height / 2;
		[infoPanel setFrame:CGRectIntegral(infoPanelFrame)];
	}
}


- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
	UIView *indicator = [[aScrollView subviews] lastObject];
	CGRect indicatorFrame = [indicator frame];
	
	// We are somewhere at the edge (top or bottom)
	if (indicatorFrame.size.height < initialHeightOfScrollIndicator)
	{
		CGRect infoPanelFrame = [infoPanel frame];
		
		// The indicator starts shrinking, so we need to adjust our info panel's y-origin to stays centered
		if (indicatorFrame.size.height > infoPanelFrame.size.height + 2) 
		{
			infoPanelFrame.origin.y = (indicatorFrame.size.height / 2) - (infoPanelFrame.size.height / 2);
		}
		// We are at the bottom of the screen and the indicator is now smaller than our info panel
		else if (indicatorFrame.origin.y > 0)
		{
			infoPanelFrame.origin.y = (infoPanelFrame.size.height - indicatorFrame.size.height) * -1;
		}
		
		[infoPanel setFrame:infoPanelFrame];
	}
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
	[infoPanel removeFromSuperview];
}



#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
	[infoPanel release], infoPanel = nil;
	[scrollView release], scrollView = nil;
	
	[super dealloc];
}

@end