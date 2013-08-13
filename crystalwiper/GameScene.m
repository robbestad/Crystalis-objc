//
//  GameScene.m

#import "GameScene.h"
#import "GameLogicLayer.h"
#import "CCScrollLayer.h"
#import "CCParallaxNode-Extras.h"

@implementation GameScene

- (id) init {
    self = [super init];
    if (self != nil) {
        isGameScene=YES;
        CGSize s = [[CCDirector sharedDirector] winSize];
		delegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        CCLayer *layer = [GameLogicLayer node];
		[self addChild:layer z:1];
        
        background4 = [CCSprite spriteWithFile:@"wiper.jpg"];
        background4.position = ccp(s.width/2,s.height/2);
    
        
        //IPHONE
        
        CCLOG(@"model %@",[UIDevice currentDevice].model);
        if([[UIDevice currentDevice].model hasPrefix:@"iPad"]){
            //IPAD
            CCLOG(@"Dette er en IPAD!");
            winY=s.height*0.76;
            //winX=200;
            brickSize=72;
            winXoffset=-25;
           // [self addChild:background4 z:-2];

            
        } else {
            CCLOG(@"Dette er en IPHONE/IPOD!");
            //winY=390;
            winY=s.height*0.81;
            winX=200;
            brickSize=36;
            winXoffset=20;
            
            background5 = [CCSprite spriteWithFile:@"transparent.png"];
            background5.position = ccp(160,272);
            //background5.position = ccp(s.width/2,s.height/1.8);
           // [self addChild:background4 z:-2];
           //  [self addChild:background5 z:-1];

            
        }
        //CCLOG(@"winY:%i",winY);
        
         
        CCSprite *temp=[CCSprite spriteWithFile:@"blackpixel.png"];
        temp.position=ccp(s.width/2,s.height/2);
        [self addChild:temp z:50000];    //set as most top layer
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2){
            temp.scaleX=s.width*2;
            temp.scaleY=s.height*2;
        } else {
            temp.scaleX=s.width;
            temp.scaleY=s.height;
        }
        temp.opacity=255; // this will cover whole screen with black color
        [temp runAction:[CCFadeTo actionWithDuration:1 opacity:0]];  //255 to 0
        
        
        
        // 1) Create the CCParallaxNode
        _backgroundNode = [CCParallaxNode node];
        [self addChild:_backgroundNode z:-1];
        
        // 2) Create the sprites we'll add to the CCParallaxNode
        //space:bg_front_spacedust.png
        //_spacedust1 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];

        
        _spacedust1 = [CCSprite spriteWithFile:@"wave.jpg"];
        _spacedust2 = [CCSprite spriteWithFile:@"wave.jpg"];
        //_spacedust1 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];
        //_spacedust2 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];
        _planetsunrise = [CCSprite spriteWithFile:@"bg_planetsunrise.png"];
        _galaxy = [CCSprite spriteWithFile:@"bg_galaxy.png"];
        _spacialanomaly = [CCSprite spriteWithFile:@"bg_spacialanomaly.png"];
        _spacialanomaly2 = [CCSprite spriteWithFile:@"bg_spacialanomaly2.png"];
        
        // 3) Determine relative movement speeds for space dust and background
        CGPoint dustSpeed = ccp(0.1, 0.1);
        CGPoint bgSpeed = ccp(0.05, 0.05);
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // 4) Add children to CCParallaxNode
        [_backgroundNode addChild:_spacedust1 z:0 parallaxRatio:dustSpeed positionOffset:ccp(0,winSize.height/2)];
        [_backgroundNode addChild:_spacedust2 z:0 parallaxRatio:dustSpeed positionOffset:ccp(_spacedust1.contentSize.width,winSize.height/2)];
        
         [_backgroundNode addChild:_galaxy z:-1 parallaxRatio:bgSpeed positionOffset:ccp(0,winSize.height * 0.7)];
        [_backgroundNode addChild:_planetsunrise z:-1 parallaxRatio:bgSpeed positionOffset:ccp(600,winSize.height * 0)];
        [_backgroundNode addChild:_spacialanomaly z:-1 parallaxRatio:bgSpeed positionOffset:ccp(900,winSize.height * 0.3)];
        [_backgroundNode addChild:_spacialanomaly2 z:-1 parallaxRatio:bgSpeed positionOffset:ccp(1500,winSize.height * 0.9)];
        
        
        
        [self scheduleUpdate];
        
    }
    return self;
}

- (void)update:(ccTime)dt {
    
    CGPoint backgroundScrollVel = ccp(-300, 0);
    _backgroundNode.position = ccpAdd(_backgroundNode.position, ccpMult(backgroundScrollVel, dt));

    NSArray *spaceDusts = [NSArray arrayWithObjects:_spacedust1, _spacedust2, nil];
    for (CCSprite *spaceDust in spaceDusts) {
        if ([_backgroundNode convertToWorldSpace:spaceDust.position].x < -spaceDust.contentSize.width+240) {
            [_backgroundNode incrementOffset:ccp(2*spaceDust.contentSize.width,0) forChild:spaceDust];
        }
    }
    
    NSArray *backgrounds = [NSArray arrayWithObjects:_planetsunrise, _galaxy, _spacialanomaly, _spacialanomaly2, nil];
    for (CCSprite *background in backgrounds) {
        if ([_backgroundNode convertToWorldSpace:background.position].x < -background.contentSize.width) {
            [_backgroundNode incrementOffset:ccp(2000,0) forChild:background];
        }
    }
}

-(void)bgScroll{
    //clouds
    //create both sprite to handle background
    clouds = [CCSprite spriteWithFile:@"clouds2.png"];
    clouds2 = [CCSprite spriteWithFile:@"clouds2.png"];
    
    //one the screen and second just next to it
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    clouds.position  =ccp(winSize.width/2, winSize.height/2);
    clouds2.position = ccp(winSize.width/2, -winSize.height/2);
    
    //add schedule to move backgrounds
    [self schedule:@selector(scroll:)];
    
    //ofc add them to main layer
    [self addChild:clouds];
    [self addChild:clouds2];
    
}

-(void) scroll:(ccTime)dt{
    
	BOOL flg=FALSE;
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
	//reset position when they are off from view.
    if (clouds.position.y - clouds.contentSize.height/2 >= winSize.height ) {
        clouds.position = ccp(winSize.width/2, -winSize.height/2);
		clouds2.position = ccp(winSize.width/2, winSize.height/2);
		flg =TRUE;
    }
    
	if (clouds2.position.y - clouds2.contentSize.height/2>= winSize.height) {
        clouds2.position = ccp(winSize.width/2, -winSize.height/2);
		clouds.position = ccp(winSize.width/2, winSize.height/2);
		flg =TRUE;
    }
    
    //reset position when they are off from view.
    if (clouds.position.x - clouds.contentSize.width/2 >= winSize.width ) {
        clouds.position = ccp(winSize.width/2, -winSize.height/2);
		clouds2.position = ccp(winSize.width/2, winSize.height/2);
		flg =TRUE;
    }
    
	if (clouds2.position.x - clouds2.contentSize.width/2>= winSize.width) {
        clouds2.position = ccp(winSize.width/2, -winSize.height/2);
		clouds.position = ccp(winSize.width/2, winSize.height/2);
		flg =TRUE;
    }
    
	if (!flg) {
		//move them 100*dt pixels to left
		clouds.position = ccp( clouds.position.x+ 220*dt  , clouds.position.y );
		clouds2.position = ccp( clouds2.position.x + 220*dt, clouds2.position.y );
	}
    
}


- (void) dealloc {
//	[self removeAllChildrenWithCleanup:YES];
	
}

@end
