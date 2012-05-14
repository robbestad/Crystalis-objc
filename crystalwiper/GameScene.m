//
//  GameScene.m

#import "GameScene.h"
#import "GameLogicLayer.h"

@implementation GameScene

- (id) init {
    self = [super init];
    if (self != nil) {
        isGameScene=YES;
       
        delegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        CCLayer *layer = [GameLogicLayer node];
		[self addChild:layer z:1];
        
        background4 = [CCSprite spriteWithFile:@"wiper.jpg"];
        background4.position = ccp(160,240);
        background5 = [CCSprite spriteWithFile:@"transparent.png"];
        background5.position = ccp(160,272);
        
        
        
        //adding them to the main layer
        [self addChild:background4 z:-2];
        [self addChild:background5 z:-1];
    
        
        
         
        CGSize s = [[CCDirector sharedDirector] winSizeInPixels]; 
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
        
    }
    return self;
}





- (void) dealloc {
//	[self removeAllChildrenWithCleanup:YES];
	
}

@end
