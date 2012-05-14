//
//  FloatScore.h
//  wiper
//
//  Created by Sven Anders Robbestad on 14.05.12.
//  Copyright (c) 2012 Sven Anders Robbestad. All rights reserved.
//


#import "cocos2d.h"

@interface FloatScore : NSObject {
}

+ (void)createExplosionX:(float)x y:(float)y localScore:(int)localScore inParent:(CCNode*)parentNode;

@end


