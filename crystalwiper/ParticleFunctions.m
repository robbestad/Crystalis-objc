//
//  ParticleFunctions.m
//  Bombtris
//
//  Created by Sven Anders Robbestad on 19.04.12.
//  Copyright (c) 2012 SOL. All rights reserved.
//



#import "ParticleFunctions.h"
#import "cocos2d.h"

@implementation ParticleFunctions

+(void) createExplosionX: (float) x y: (float) y inParent: (CCNode*) parentNode
{
	CCParticleSystem *emitter;
	emitter = [[CCParticleFireworks alloc] init];
	emitter.texture = [[CCTextureCache sharedTextureCache] addImage:@"dot.png"];
    emitter.position = ccp(x+16,y);
	emitter.duration = 0.1;
    emitter.totalParticles=2;
 	emitter.autoRemoveOnFinish = YES; // this removes/deallocs the emitter after its animation
	[parentNode addChild:emitter z:50];
}

@end