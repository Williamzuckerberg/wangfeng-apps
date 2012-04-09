#import "EXViewController.h"
#import <iOSApi/iOSTabBarController.h>
#import <iOSApi/iOSTab.h>
@implementation EXViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = RGBCOLOR(rand() % 255, rand() % 255, rand() % 255);
}

- (NSString *)iconName {
	return @"encode.png";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

@end
