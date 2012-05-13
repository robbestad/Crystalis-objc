//
//  HelloWorldLayer.h
//  crystalwiper
//
//  Created by Sven Anders Robbestad on 08.05.12.
//  Copyright SOL 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    BOOL audioInit;
    UITextField *textfield;
    UILabel *label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
