//
//  GameScene.h

#import "cocos2d.h"

CCSprite *background4, *background5;
CCSprite *button1, *button2, *button3, *buttonleft, *buttonright, *buttoncenter;
int winX,winY,brickSize,winXoffset;

@class AppDelegate;

@interface GameScene : CCScene {
    AppDelegate *delegate;
    
    BOOL isGameScene;
    CCSprite* clouds;
    CCSprite* clouds2;
    CCParallaxNode *_backgroundNode;
    CCSprite *_spacedust1;
    CCSprite *_spacedust2;
    CCSprite *_planetsunrise;
    CCSprite *_galaxy;
    CCSprite *_spacialanomaly;
    CCSprite *_spacialanomaly2;

    
}


@end
