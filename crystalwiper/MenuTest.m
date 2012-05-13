//
// Menu Demo
// a cocos2d example
// http://www.cocos2d-iphone.org
//

#import "SimpleAudioEngine.h"
#import "MenuTest.h"
#import "GameScene.h"


enum {
	kTagMenu = 1,
	kTagMenu0 = 0,
	kTagMenu1 = 1,
};

#pragma mark - MainMenu

@implementation LayerMainMenu
-(id) init
{
	if( (self=[super init])) {
        
        //PRELOAD SOUNDS
        [self preloadSounds];
        
        // BACKGROUND
        background4 = [CCSprite spriteWithFile:@"seigmenn.jpg"];
        background4.position = ccp(160,240);
        [self addChild:background4 z:0];
        
        //HAVE ANIMATION START AND INIT AUDIO
        [[CCDirector sharedDirector] startAnimation];
        audioInit=NO;    
        
        //GAME NAME
        NSString *gname=NSLocalizedString(@"GameName", @"");
        
#ifdef __CC_PLATFORM_IOS
        self.isTouchEnabled = YES;
#endif
		
     
        // Font Item
		CCMenuItemFont *item1 = [CCMenuItemFont itemWithString: gname block:^(id sender) {
			// IMPORTANT: It is safe to use "self" because CCMenuItem#cleanup will break any possible circular reference.
			self->disabledItem.isEnabled = ~self->disabledItem.isEnabled;
		}];
        
		[item1 setFontSize:48];
        [item1 setColor:ccc3(0,0,255)];
		[item1 setFontName:@"LCD"];
        
        // Font Item
        /*
		CCSprite *spriteNormal = [CCSprite spriteWithFile:@"menuitemsprite.png" rect:CGRectMake(0,23*2,115,23)];
		CCSprite *spriteSelected = [CCSprite spriteWithFile:@"menuitemsprite.png" rect:CGRectMake(0,23*1,115,23)];
		CCSprite *spriteDisabled = [CCSprite spriteWithFile:@"menuitemsprite.png" rect:CGRectMake(0,23*0,115,23)];
		CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:spriteNormal selectedSprite:spriteSelected disabledSprite:spriteDisabled block:^(id sender) {
            [[CCDirector  sharedDirector] replaceScene:[GameScene node]];

            
		}];
       
		// Image Item
		CCMenuItem *item2 = [CCMenuItemImage itemWithNormalImage:@"SendScoreButton.png" selectedImage:@"SendScoreButtonPressed.png" block:^(id sender) {
				CCScene *scene = [CCScene node];
				[scene addChild:[Layer3 node]];
				[[CCDirector sharedDirector] replaceScene:scene];
		}];

		// Label Item (LabelAtlas)
		CCLabelAtlas *labelAtlas = [CCLabelAtlas labelWithString:@"0123456789" charMapFile:@"fps_images.png" itemWidth:12 itemHeight:32 startCharMap:'.'];
		CCMenuItemLabel *item3 = [CCMenuItemLabel itemWithLabel:labelAtlas block:^(id sender) {
			// hijack all touch events for 5 seconds
			CCDirector *director = [CCDirector sharedDirector];
#ifdef __CC_PLATFORM_IOS
			[[director touchDispatcher] setPriority:kCCMenuHandlerPriority-1 forDelegate:self];
			[self schedule:@selector(allowTouches) interval:5.0f repeat:0 delay:0];
#elif defined(__CC_PLATFORM_MAC)
			[[director eventDispatcher] addMouseDelegate:self priority:kCCMenuHandlerPriority-1];
			[self schedule:@selector(allowTouches) interval:5.0f];
#endif
				NSLog(@"TOUCHES DISABLED FOR 5 SECONDS");
		}];

		item3.disabledColor = ccc3(32,32,64);
		item3.color = ccc3(200,200,255);
         */

        NSString *playnow=NSLocalizedString(@"Play", @"");
        
		// Font Item
		CCMenuItemFont *item2 = [CCMenuItemFont itemWithString: playnow block:^(id sender) {
			// IMPORTANT: It is safe to use "self" because CCMenuItem#cleanup will break any possible circular reference.
			//self->disabledItem.isEnabled = ~self->disabledItem.isEnabled;
            [[CCDirector  sharedDirector] replaceScene:[GameScene node]];
            
		}];

		[item2 setFontSize:32];
		[item2 setFontName:@"LCD"];
        
        
        // UTFORDRINGER
        NSString *utfordringer=NSLocalizedString(@"utfordringer", @"");
        
		CCMenuItemFont *item3 = [CCMenuItemFont itemWithString: utfordringer block:^(id sender) {
			// IMPORTANT: It is safe to use "self" because CCMenuItem#cleanup will break any possible circular reference.
			//self->disabledItem.isEnabled = ~self->disabledItem.isEnabled;
            [[CCDirector  sharedDirector] replaceScene:[GameScene node]];
            
		}];
        
		[item3 setFontSize:32];
		[item3 setFontName:@"LCD"];
        
        // MARATON
        NSString *marathonmode=NSLocalizedString(@"Marathon", @"");
        
		CCMenuItemFont *item4 = [CCMenuItemFont itemWithString: marathonmode block:^(id sender) {
			// IMPORTANT: It is safe to use "self" because CCMenuItem#cleanup will break any possible circular reference.
			//self->disabledItem.isEnabled = ~self->disabledItem.isEnabled;
            [[CCDirector  sharedDirector] replaceScene:[GameScene node]];
            
		}];
        
		[item4 setFontSize:32];
		[item4 setFontName:@"LCD"];
        

        
        // OM SPILLET
        NSString *aboutgame=NSLocalizedString(@"About", @"");
        
		CCMenuItemFont *item5 = [CCMenuItemFont itemWithString: aboutgame block:^(id sender) {
			// IMPORTANT: It is safe to use "self" because CCMenuItem#cleanup will break any possible circular reference.
			//self->disabledItem.isEnabled = ~self->disabledItem.isEnabled;
            [[CCDirector  sharedDirector] replaceScene:[GameScene node]];
            
		}];
        
		[item5 setFontSize:32];
		[item5 setFontName:@"LCD"];
        
        

		// Label Item (CCLabelBMFont)
        /*
		CCLabelBMFont *label = [CCLabelBMFont labelWithString:playnow fntFile:@"bitmapFontTest3.fnt"];
		CCMenuItemLabel *item5 = [CCMenuItemLabel itemWithLabel:label block:^(id sender) {
			[[CCDirector  sharedDirector] replaceScene:[GameScene node]];
        }];

		// Testing issue #500
		item5.scale = 0.8f;

		// Events
		[CCMenuItemFont setFontName: @"Marker Felt"];
		CCMenuItemFont *item6 = [CCMenuItemFont itemWithString:@"Priority Test" block:^(id sender) {
			CCScene *scene = [CCScene node];
			[scene addChild:[LayerPriorityTest node]];
			[[CCDirector sharedDirector] pushScene:scene];			
		}];
		
		// Font Item
		[CCMenuItemFont setFontSize:30];
		[CCMenuItemFont setFontName: @"LCD"];
		CCMenuItemFont *item7 = [CCMenuItemFont itemWithString: @"Quit" block:^(id sender){
			CC_DIRECTOR_END();
		}];

		id color_action = [CCTintBy actionWithDuration:0.5f red:0 green:-255 blue:-255];
		id color_back = [color_action reverse];
		id seq = [CCSequence actions:color_action, color_back, nil];
		[item7 runAction:[CCRepeatForever actionWithAction:seq]];
         */
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, item4, item5, nil];
		[menu alignItemsVertically];


		// elastic effect
		CGSize s = [[CCDirector sharedDirector] winSize];
		int i=0;
		for( CCNode *child in [menu children] ) {
			CGPoint dstPoint = child.position;
			int offset = s.width/2 + 50;
			if( i % 2 == 0)
				offset = -offset;
			child.position = ccp( dstPoint.x + offset, dstPoint.y);
			[child runAction:
			 [CCEaseElasticOut actionWithAction:
			  [CCMoveBy actionWithDuration:2 position:ccp(dstPoint.x - offset,0)]
										 period: 0.35f]
			];
			i++;
		}

		
		[self addChild: menu];
		//[menu setPosition:ccp(s.width/2, s.height/2)];
        [menu setPosition:ccp(s.width/2, (s.height/2)+50)];
        
	}

	return self;
}

#ifdef __CC_PLATFORM_IOS
-(void) registerWithTouchDispatcher
{
	CCDirector *director = [CCDirector sharedDirector];
	[[director touchDispatcher] addTargetedDelegate:self priority:kCCMenuHandlerPriority+1 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	return YES;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
}

#elif defined(__CC_PLATFORM_MAC)
-(BOOL) ccMouseDown:(NSEvent *)event
{
	return YES;
}
-(BOOL) ccMouseUp:(NSEvent *)event
{
	return YES;
}

-(BOOL) ccMouseMoved:(NSEvent *)event
{
	return YES;
}
-(BOOL) ccMouseDragged:(NSEvent *)event
{
	return YES;
}
#endif // __CC_PLATFORM_MAC

-(void) dealloc
{

}

-(void) allowTouches
{
	CCDirector *director = [CCDirector sharedDirector];
#ifdef __CC_PLATFORM_IOS
    [[director touchDispatcher] setPriority:kCCMenuHandlerPriority+1 forDelegate:self];
    [self unscheduleAllSelectors];

#elif defined(__CC_PLATFORM_MAC)
    [[director eventDispatcher] removeMouseDelegate:self];
#endif

	NSLog(@"TOUCHES ALLOWED AGAIN");
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

@end

#pragma mark - StartMenu

@implementation Layer2

-(void) alignMenusH
{
	for(int i=0;i<2;i++) {
		CCMenu *menu = (CCMenu*)[self getChildByTag:100+i];
		menu.position = centeredMenu;
		if(i==0) {
			// TIP: if no padding, padding = 5
			[menu alignItemsHorizontally];
			CGPoint p = menu.position;
			menu.position = ccpAdd(p, ccp(0,30));

		} else {
			// TIP: but padding is configurable
			[menu alignItemsHorizontallyWithPadding:40];
			CGPoint p = menu.position;
			menu.position = ccpSub(p, ccp(0,30));
		}
	}
}

-(void) alignMenusV
{
	for(int i=0;i<2;i++) {
		CCMenu *menu = (CCMenu*)[self getChildByTag:100+i];
		menu.position = centeredMenu;
		if(i==0) {
			// TIP: if no padding, padding = 5
			[menu alignItemsVertically];
			CGPoint p = menu.position;
			menu.position = ccpAdd(p, ccp(100,0));
		} else {
			// TIP: but padding is configurable
			[menu alignItemsVerticallyWithPadding:40];
			CGPoint p = menu.position;
			menu.position = ccpSub(p, ccp(100,0));
		}
	}
}

-(id) init
{
	if( (self=[super init]) ) {

	}

	return self;
}

// Testing issue #1018 and #1021
-(void) onEnter
{
	[super onEnter];

	// remove previously added children
	[self removeAllChildrenWithCleanup:YES];

	for( int i=0;i < 2;i++ ) {
		CCMenuItemImage *item1 = [CCMenuItemImage itemWithNormalImage:@"btn-play-normal.png" selectedImage:@"btn-play-selected.png" target:self selector:@selector(menuCallbackBack:)];
		CCMenuItemImage *item2 = [CCMenuItemImage itemWithNormalImage:@"btn-highscores-normal.png" selectedImage:@"btn-highscores-selected.png" target:self selector:@selector(menuCallbackOpacity:)];
		CCMenuItemImage *item3 = [CCMenuItemImage itemWithNormalImage:@"btn-about-normal.png" selectedImage:@"btn-about-selected.png" target:self selector:@selector(menuCallbackAlign:)];

		item1.scaleX = 1.5f;
		item2.scaleY = 0.5f;
		item3.scaleX = 0.5f;

		CCMenu *menu = [CCMenu menuWithItems:item1, item2, item3, nil];

		CGSize s = [[CCDirector sharedDirector] winSize];
		[menu setPosition:ccp(s.width/2, s.height/2)];

		menu.tag = kTagMenu;

		[self addChild:menu z:0 tag:100+i];
		centeredMenu = menu.position;
	}

	alignedH = YES;
	[self alignMenusH];
}

-(void) dealloc
{
	
}

-(void) menuCallbackBack: (id) sender
{
	CCScene *scene = [CCScene node];
	[scene addChild:[LayerMainMenu node]];
	[[CCDirector sharedDirector] replaceScene:scene];
}

-(void) menuCallbackOpacity: (id) sender
{
	CCMenu *menu = (CCMenu*) [sender parent];
	GLubyte opacity = [menu opacity];
	if( opacity == 128 )
		[menu setOpacity: 255];
	else
		[menu setOpacity: 128];
}

-(void) menuCallbackAlign: (id) sender
{
	alignedH = ! alignedH;

	if( alignedH )
		[self alignMenusH];
	else
		[self alignMenusV];
}


@end

#pragma mark - SendScores

@implementation Layer3
-(id) init
{
	if( (self=[super init]) ) {
		[CCMenuItemFont setFontName: @"Marker Felt"];
		[CCMenuItemFont setFontSize:28];

		CCLabelBMFont *label = [CCLabelBMFont labelWithString:@"Enable AtlasItem" fntFile:@"bitmapFontTest3.fnt"];
		CCMenuItemLabel *item1 = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(menuCallback2:)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemWithString: @"--- Go Back ---" target:self selector:@selector(menuCallback:)];

		CCSprite *spriteNormal = [CCSprite spriteWithFile:@"menuitemsprite.png" rect:CGRectMake(0,23*2,115,23)];
		CCSprite *spriteSelected = [CCSprite spriteWithFile:@"menuitemsprite.png" rect:CGRectMake(0,23*1,115,23)];
		CCSprite *spriteDisabled = [CCSprite spriteWithFile:@"menuitemsprite.png" rect:CGRectMake(0,23*0,115,23)];

		CCMenuItemSprite *item3 = [CCMenuItemSprite itemWithNormalSprite:spriteNormal selectedSprite:spriteSelected disabledSprite:spriteDisabled target:self selector:@selector(menuCallback3:)];
		disabledItem = item3;
		disabledItem.isEnabled = NO;

		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];

		CGSize s = [[CCDirector sharedDirector] winSize];

		item1.position = ccp(s.width/2 - 150, s.height/2);
		item2.position = ccp(s.width/2 - 200, s.height/2);
		item3.position = ccp(s.width/2, s.height/2 - 100);

		id jump = [CCJumpBy actionWithDuration:3 position:ccp(400,0) height:50 jumps:4];
		[item2 runAction: [CCRepeatForever actionWithAction:
					 [CCSequence actions: jump, [jump reverse], nil]
									   ]
		 ];
		id spin1 = [CCRotateBy actionWithDuration:3 angle:360];
		id spin2 = [spin1 copy];
		id spin3 = [spin1 copy];

		[item1 runAction: [CCRepeatForever actionWithAction:spin1]];
		[item2 runAction: [CCRepeatForever actionWithAction:spin2]];
		[item3 runAction: [CCRepeatForever actionWithAction:spin3]];

		[self addChild: menu];
		[menu setPosition:ccp(0,0)];

	}

	return self;
}

- (void) dealloc
{
	
}

-(void) menuCallback: (id) sender
{
	CCScene *scene = [CCScene node];
	[scene addChild:[LayerMainMenu node]];
	[[CCDirector sharedDirector] replaceScene:scene];
}

-(void) menuCallback2: (id) sender
{
	NSLog(@"Label clicked. Toogling Sprite");
	disabledItem.isEnabled = ~disabledItem.isEnabled;
	[disabledItem stopAllActions];
}
-(void) menuCallback3:(id) sender
{
	NSLog(@"MenuItemSprite clicked");
}

@end

#pragma mark - Layer4

@implementation Layer4
-(id) init
{
	if( (self = [super init] ) ) {

		[CCMenuItemFont setFontName: @"American Typewriter"];
		[CCMenuItemFont setFontSize:18];
		CCMenuItemFont *title1 = [CCMenuItemFont itemWithString: @"Sound"];
		[title1 setIsEnabled:NO];
		[CCMenuItemFont setFontName: @"Marker Felt"];
		[CCMenuItemFont setFontSize:34];
		CCMenuItemToggle *item1 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
								 [CCMenuItemFont itemWithString: @"On"],
								 [CCMenuItemFont itemWithString: @"Off"],
								 nil];

		[CCMenuItemFont setFontName: @"American Typewriter"];
		[CCMenuItemFont setFontSize:18];
		CCMenuItemFont *title2 = [CCMenuItemFont itemWithString: @"Music"];
		[title2 setIsEnabled:NO];
		[CCMenuItemFont setFontName: @"Marker Felt"];
		[CCMenuItemFont setFontSize:34];
		CCMenuItemToggle *item2 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
								 [CCMenuItemFont itemWithString: @"On"],
								 [CCMenuItemFont itemWithString: @"Off"],
								 nil];

		[CCMenuItemFont setFontName: @"American Typewriter"];
		[CCMenuItemFont setFontSize:18];
		CCMenuItemFont *title3 = [CCMenuItemFont itemWithString: @"Quality"];
		[title3 setIsEnabled:NO];
		[CCMenuItemFont setFontName: @"Marker Felt"];
		[CCMenuItemFont setFontSize:34];
		CCMenuItemToggle *item3 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
								 [CCMenuItemFont itemWithString: @"High"],
								 [CCMenuItemFont itemWithString: @"Low"],
								 nil];

		[CCMenuItemFont setFontName: @"American Typewriter"];
		[CCMenuItemFont setFontSize:18];
		CCMenuItemFont *title4 = [CCMenuItemFont itemWithString: @"Orientation"];
		[title4 setIsEnabled:NO];
		[CCMenuItemFont setFontName: @"Marker Felt"];
		[CCMenuItemFont setFontSize:34];
		CCMenuItemToggle *item4 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
								 [CCMenuItemFont itemWithString: @"Off"], nil];

		NSArray *more_items = [NSArray arrayWithObjects:
								 [CCMenuItemFont itemWithString: @"33%"],
								 [CCMenuItemFont itemWithString: @"66%"],
								 [CCMenuItemFont itemWithString: @"100%"],
								 nil];
		// TIP: you can manipulate the items like any other NSMutableArray
		[item4.subItems addObjectsFromArray: more_items];

		// you can change the one of the items by doing this
		item4.selectedIndex = 2;

		[CCMenuItemFont setFontName: @"Marker Felt"];
		[CCMenuItemFont setFontSize:34];

		CCLabelBMFont *label = [CCLabelBMFont labelWithString:@"go back" fntFile:@"bitmapFontTest3.fnt"];
		CCMenuItemLabel *back = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(backCallback:)];

		CCMenu *menu = [CCMenu menuWithItems:
					  title1, title2,
					  item1, item2,
					  title3, title4,
					  item3, item4,
					  back, nil]; // 9 items.
		[menu alignItemsInColumns:
		 [NSNumber numberWithUnsignedInt:2],
		 [NSNumber numberWithUnsignedInt:2],
		 [NSNumber numberWithUnsignedInt:2],
		 [NSNumber numberWithUnsignedInt:2],
		 [NSNumber numberWithUnsignedInt:1],
		 nil
		]; // 2 + 2 + 2 + 2 + 1 = total count of 9.

		[self addChild: menu];
		CGSize s = [[CCDirector sharedDirector] winSize];
		[menu setPosition:ccp(s.width/2, s.height/2)];
	}

	return self;
}

- (void) dealloc
{
	
}

-(void) menuCallback: (id) sender
{
	NSLog(@"selected item: %@ index:%u", [sender selectedItem], (unsigned int) [sender selectedIndex] );
}

-(void) backCallback: (id) sender
{
	CCScene *scene = [CCScene node];
	[scene addChild:[LayerMainMenu node]];
	[[CCDirector sharedDirector] replaceScene:scene];
}

@end

#pragma mark - LayerPriorityTest

@implementation LayerPriorityTest
-(id) init
{
	if( (self = [super init] ) ) {
		
		// Testing empty menu
		CCMenu *menu1 = [CCMenu node];
		CCMenu *menu2 = [CCMenu node];
		
		
		// Menu 1
		[CCMenuItemFont setFontName:@"Marker Felt"];
		[CCMenuItemFont setFontSize:18];
		CCMenuItemFont *item1 = [CCMenuItemFont itemWithString:@"Return to Main Menu" block:^(id sender) {
			[[CCDirector sharedDirector] popScene];
		}];

		CCMenuItemFont *item2 = [CCMenuItemFont itemWithString:@"Disable menu for 5 seconds" block:^(id sender) {
			[menu1 setEnabled:NO];
			CCDelayTime *wait = [CCDelayTime actionWithDuration:5];
			CCCallBlockO *enable = [CCCallBlockO actionWithBlock:^(id object) {
				[object setEnabled:YES];
			}object:menu1];
			CCSequence *seq = [CCSequence actions:wait, enable, nil];
			[menu1 runAction:seq];
		}];

		
		[menu1 addChild:item1];
		[menu1 addChild:item2];
		
		[menu1 alignItemsVerticallyWithPadding:2];
		
		[self addChild:menu1];
		
		
		// Menu 2
		static BOOL priority = 1;
		[CCMenuItemFont setFontSize:48];
		item1 = [CCMenuItemFont itemWithString:@"Toggle priority" block:^(id sender) {
			if( priority == 1) {
				[menu2 setHandlerPriority:kCCMenuHandlerPriority + 20];
				priority = 0;
			} else {
				[menu2 setHandlerPriority:kCCMenuHandlerPriority - 20];
				priority = 1;
			}
		}];
		[item1 setColor:ccc3(0,0,255)];
		[menu2 addChild:item1];
		[self addChild:menu2];
	}
	
	return self;
}

- (void) dealloc
{
	
}

@end




