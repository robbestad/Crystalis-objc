//
//  FloatScore.m
//  wiper
//
//  Created by Sven Anders Robbestad on 14.05.12.
//  Copyright (c) 2012 Sven Anders Robbestad. All rights reserved.
//

#import "FloatScore.h"
#import "cocos2d.h"

@implementation FloatScore

+(void) createExplosionX: (float) x y: (float) y localScore: (int) localScore  inParent: (CCNode*) parentNode
{
	CCLabelTTF *scoreText;
    NSString *temp = 
    [[NSString alloc] initWithFormat:@"%d",localScore];
    CGSize s = [[CCDirector sharedDirector] winSize]; 
    int menuOffset=20,menuPosition=s.height-(menuOffset-1);
    int menuXmultiplier=1,fontsize=14,scorevalueXpos=275;
if([[UIDevice currentDevice].model hasPrefix:@"iPad"]){
        
    menuPosition=s.height-(menuOffset-1);
    menuXmultiplier=2; 
    fontsize=20;
    scorevalueXpos=340;
    } else {
    }
    
    
    scoreText = [CCLabelTTF labelWithString:temp fontName:@"American Typewriter" fontSize:fontsize];
    //int localTag=random()%10000;
    scoreText.position = ccp(x+20,y+20);
    //scoreText.tag=localTag;
    scoreText.color=ccc3(119,119,119); 
    [parentNode addChild:scoreText z:50  ];
    /*
     CCAction * action =  [CCSequence actions:[CCFadeTo actionWithDuration:1.0f opacity:0], 
                         [CCCallFuncN actionWithTarget:self selector:@selector(removeText:)], nil];
    [scoreText runAction:action];
    */
    CCAction * action =  [CCSequence actions:
                         [CCMoveTo actionWithDuration:1.5f position:ccp(scorevalueXpos*menuXmultiplier, menuPosition)],
                          [CCFadeTo actionWithDuration:0.5f opacity:0],
                          [CCCallFuncND actionWithTarget:parentNode selector:@selector(removeText:) data:(void*)YES],
                         nil];
    [scoreText runAction:action];

    /**
     FOR SPRITES: id remove = [CCCallFuncND actionWithTarget:self selector:@selector(removeSprite:data:) data:tag];
     
     and 
     
     -(void) removeSprite:(id)sender data:(int)data {
     [self removeChildByTag:data cleanup:YES];
     }
     ***/
}



@end