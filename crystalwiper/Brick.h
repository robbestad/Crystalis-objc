//
//  Brick.h

#import "cocos2d.h"
#import "GameScene.h"

@interface Brick : CCSprite {
    
	int boardX, boardY;
	int brickType;
	BOOL disappearing;
}

@property int boardX;
@property int boardY;
@property int brickType;
@property BOOL disappearing;

+ (Brick *) newBrick:(int)difficultyLevel;
- (void) moveDown;

@end

// Macros to define brick position on the screen based on board coordinates
//#define COMPUTE_X(x) (abs(x) * 24)+5
//#define COMPUTE_Y(y) abs(406 - (abs(y) * 24))

//#define COMPUTE_X(x) abs(winXoffset - (abs(x) * brickSize))
//#define COMPUTE_Y(y) abs(winY - (abs(y) * brickSize))
//#define COMPUTE_X_Y(x,y) ccp( COMPUTE_X(x), COMPUTE_Y(y))


#define COMPUTE_X(x,winXoffset,brickSize) abs(winXoffset - (abs(x) * brickSize))
#define COMPUTE_Y(y,winY,brickSize) abs(winY - (abs(y) * brickSize))
#define COMPUTE_X_Y(x,y,winY,winXoffset,brickSize) ccp( COMPUTE_X(x,winXoffset,brickSize), COMPUTE_Y(y,winY,brickSize))

//#define COMPUTE_X(x) abs(20 - (abs(x) * 36))
//#define COMPUTE_Y(y) abs(390 - (abs(y) * 36))
//#define COMPUTE_X_Y(x,y) ccp( COMPUTE_X(x), COMPUTE_Y(y))