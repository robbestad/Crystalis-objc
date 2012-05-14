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
    
    scoreText = [CCLabelTTF labelWithString:temp fontName:@"LCD" fontSize:14];
    //int localTag=random()%10000;
    scoreText.position = ccp(x+20,y+20);
    //scoreText.tag=localTag;
    scoreText.color=ccc3(119,119,119); 
    [parentNode addChild:scoreText z:200  ];
    /*
     CCAction * action =  [CCSequence actions:[CCFadeTo actionWithDuration:1.0f opacity:0], 
                         [CCCallFuncN actionWithTarget:self selector:@selector(removeText:)], nil];
    [scoreText runAction:action];
    */
    CCAction * action =  [CCSequence actions:
                         [CCMoveTo actionWithDuration:1.0f position:ccp(275, 459)],
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