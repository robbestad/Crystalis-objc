//
//  AdViewController.m


#import "AdViewController.h"
#import "AppDelegate.h"
#import "GameScene.h"
#import "GameLogicLayer.h"


@implementation AdViewController

- (id)init
{
    self = [super init];
    if (self) {
        delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    //[[CCDirector sharedDirector] startAnimation];
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    // DEPRECATED: CCGLView *CCGLView = [[CCDirector sharedDirector] openGLView];
   
    CCGLView *ccglView = (CCGLView *)[[CCDirector sharedDirector] view]; 
    [self.view addSubview:ccglView]; 
    //CGSize s = [[CCDirector sharedDirector] winSize];
    //bool isIPAD = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    bool isIPAD=NO;
    
    
    if ([self iAdIsAvailable]) {
        adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        //adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        
        
        // position the guy off the screen
        if (isIPAD) {
            adView.frame = CGRectMake(0, 768, adView.frame.size.width, adView.frame.size.height);
        }
        else
        {
        adView.frame = CGRectMake(0, 480, adView.frame.size.width, adView.frame.size.height);
        }
        adView.delegate = self;
        [self.view addSubview:adView];
        currentView = adView;
    }
    
}

// iAd Stuff
#pragma mark iAd Stuff

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    BOOL shouldExecuteAction = YES;
    
    if (!willLeave && shouldExecuteAction)
    {
        //[delegate pause];
        [[CCDirector sharedDirector] stopAnimation];
        
    }
    return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    [[CCDirector sharedDirector] startAnimation];
	
    //[delegate resume];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    adIsLoaded = YES;
//if ([delegate isGameScene]) {
    [self showBanner];
//   }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    adIsLoaded = NO;
    [self hideBanner];
}

#pragma mark animations

-(void)showBanner
{
    bannerShouldShow = YES; //SET THIS TO YES TO SHOW AD BANNER
    if(bannerShouldShow){
    if (bannerIsVisible || !adIsLoaded) {
        return;
    }
    [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
    currentView.frame = CGRectOffset(currentView.frame, 0, -currentView.frame.size.height);
    [UIView commitAnimations];
    bannerIsVisible = YES;
    }
}

-(void)hideBanner
{
    bannerShouldShow = NO;
    if (!bannerIsVisible) {
        return;
    }
    [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
    currentView.frame = CGRectOffset(currentView.frame, 0, currentView.frame.size.height);
    [UIView commitAnimations];
    bannerIsVisible = NO;
}

-(float) getAdHeight{
    return [self getAdHeight];
}



-(bool)iAdIsAvailable
{
    // Check for presence of GKLocalPlayer API.
    Class gcClass = (NSClassFromString(@"ADBannerView"));
	
    // The device must be running running iOS 4.1 or later.
    bool isIPAD = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    NSString *reqSysVer = (isIPAD) ? @"4.2" : @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
	
    return (gcClass && osVersionSupported);
}

- (void)dealloc
{
  
}

@end
