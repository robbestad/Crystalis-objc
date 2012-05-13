//
//  GameScene.h

#import "cocos2d.h"

CCSprite *background4, *background5;
CCSprite *button1, *button2, *button3, *buttonleft, *buttonright, *buttoncenter;

@class AppDelegate;

@interface GameScene : CCScene {
    AppDelegate *delegate;
    
    BOOL isGameScene;
        
    
}



@end
