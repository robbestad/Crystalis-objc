//
//  HelloWorldLayer.m
//  crystalwiper
//
//  Created by Sven Anders Robbestad on 08.05.12.
//  Copyright SOL 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "MainMenu.h"
#import "GameScene.h"
#import "SimpleAudioEngine.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		/*
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// Achievement Menu Item using blocks
		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
			
			
			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
			achivementViewController.achievementDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:achivementViewController animated:YES];
			
	
        }
									   ];

		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
			
			
			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
			
		}
									   ];
		
		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];
        */
        audioInit=NO;
        NSString *gname=NSLocalizedString(@"GameName", @"");
        
        CCLabelTTF *stitle = [CCLabelTTF labelWithString:gname fontName:@"LCD" fontSize:42];
        CCLabelTTF *title = [CCLabelTTF labelWithString:gname fontName:@"LCD" fontSize:42];
        title.position =  ccp(160, 400);
        stitle.position =  ccp(161, 401);
        title.color=ccc3(0,0,0);
        stitle.color=ccc3(217,123,100);
        
        [self addChild: title];
        [self addChild: stitle];
        
        [CCMenuItemFont setFontName:@"LCD"]; 
        [CCMenuItemFont setFontSize:36];
        NSString *playnow=NSLocalizedString(@"Play", @"");
        
        CCMenuItem *Play = [CCMenuItemFont itemFromString:playnow target:self selector:@selector(startGame:)]; 
        
        
        CCMenu *menuPlay = [CCMenu menuWithItems: Play, nil]; 
        menuPlay.position = ccp(160,300);
        menuPlay.color=ccc3(0,0,0);
        [menuPlay alignItemsVerticallyWithPadding:10];
        [self addChild:menuPlay]; 
        
        NSString *howto=NSLocalizedString(@"Howtoplay", @"");
        [CCMenuItemFont setFontSize:28];
        
        CCMenuItem *Howtoplay = [CCMenuItemFont itemFromString:howto target:self selector:@selector(showInstructions)]; 
        
        CCMenu *menuHowtoplay = [CCMenu menuWithItems: Howtoplay, nil]; 
        menuHowtoplay.position = ccp(160,260);
        menuHowtoplay.color=ccc3(0,0,0); 
        
        [menuHowtoplay alignItemsVerticallyWithPadding:10];
        [self addChild:menuHowtoplay]; 
        
        
        
        
        NSString *aboutgame=NSLocalizedString(@"Aboutgame", @"");
        [CCMenuItemFont setFontSize:28];
        
        CCMenuItem *aboutGame = [CCMenuItemFont itemFromString:aboutgame target:self selector:@selector(showAbout)]; 
        
        CCMenu *menuaboutGame = [CCMenu menuWithItems: aboutGame, nil]; 
        menuaboutGame.position = ccp(160,220);
        menuaboutGame.color=ccc3(0,0,0);
        
        
        [menuaboutGame alignItemsVerticallyWithPadding:10];
        [self addChild:menuaboutGame]; 
        
        
        
        
        background4 = [CCSprite spriteWithFile:@"bg1.jpg"];
        background4.position = ccp(160,240);
        [self addChild:background4 z:-2];
        [self preloadSounds];

	}
	return self;
}

-(void) setupAudio{
    if(audioInit==YES){
        return;
    }else {
        audioInit=YES;
        NSOperationQueue *queue = [NSOperationQueue new];
        NSInvocationOperation *asyncSetupOperation =
        [[NSInvocationOperation alloc] initWithTarget:self
                                             selector:@selector(initAudioAsync)
                                               object:nil];
        [queue addOperation:asyncSetupOperation];
        
        
    }
    
}

-(void) preloadSounds {
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"button-38.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"button-39.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"funny_loop.mp3"];
}



- (void) startGame: (id) sender
{
    CGSize s = [[CCDirector sharedDirector] winSize]; 
    CCSprite *temp=[CCSprite spriteWithFile:@"blackpixel.png"];
    temp.position=ccp(s.width/2,s.height/2);
    [self addChild:temp z:50000];    //set as most top layer
    temp.scaleX=s.width;
    temp.scaleY=s.height;
    temp.opacity=0;
    [temp runAction:[CCFadeTo actionWithDuration:1 opacity:255]];  //0 to 255
    [[CCDirector sharedDirector] replaceScene:[GameScene node]];
    
}

- (void) showInstructions{
    [self removeChildByTag:994 cleanup:YES];
    
    NSString *instructionsText=NSLocalizedString(@"Instructions1", @"");
    CCLabelTTF *txtInstructions1 = [CCLabelTTF labelWithString:instructionsText fontName:@"LCD" fontSize:20];
    txtInstructions1.position =  ccp( 160, 180 );
    txtInstructions1.tag=991;
    txtInstructions1.color=ccc3(0,0,0);
    
    [self addChild:txtInstructions1 z:30];
    
    instructionsText=NSLocalizedString(@"Instructions2", @"");
    CCLabelTTF *txtInstructions2 = [CCLabelTTF labelWithString:instructionsText fontName:@"LCD" fontSize:20];
    txtInstructions2.position =  ccp( 160, 160 );
    txtInstructions2.tag=992;
    txtInstructions2.color=ccc3(0,0,0);
    [self addChild:txtInstructions2 z:30];
    
    
    instructionsText=NSLocalizedString(@"Instructions3", @"");
    CCLabelTTF *txtInstructions3 = [CCLabelTTF labelWithString:instructionsText fontName:@"LCD" fontSize:20];
    txtInstructions3.position =  ccp( 160, 140 );
    txtInstructions3.tag=993;
    txtInstructions3.color=ccc3(0,0,0);
    
    [self addChild:txtInstructions3 z:30];
}


- (void) showAbout{
    [self removeChildByTag:991 cleanup:YES];
    [self removeChildByTag:992 cleanup:YES];
    [self removeChildByTag:993 cleanup:YES];
    
    
    NSString *aboutStr1=NSLocalizedString(@"About1", @"");
    CCLabelTTF *aboutText1 = [CCLabelTTF labelWithString:aboutStr1 fontName:@"LCD" fontSize:20];
    aboutText1.position =  ccp( 160, 180 );
    aboutText1.tag=994;
    aboutText1.color=ccc3(0,0,0);
    [self addChild:aboutText1 z:30];
    
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
