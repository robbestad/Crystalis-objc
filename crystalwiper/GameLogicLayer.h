//
//  GameLogicLayer.h

#import "AdViewController.h"

#import "Brick.h"


@interface GameLogicLayer : CCLayer {
 

    
#define kLastColumn 8
#define kLastRow 8 
 
//#define kLastColumn 11
//#define kLastRow 13 
	// SET UP THE BOARD
	Brick *board[kLastColumn + 1][kLastRow + 1];
	Brick  *brick1, *brick2;
    int GameMode, MaxLevels;
    int reqCrystals,allCrystals,redCrystals,greenCrystals,blueCrystals, yellowCrystals,purpleCrystals,iceCrystals;
    BOOL levelWon, GameOver,playAudio,playSoundFX;
    
    int prevY;
	int frameCount;
	int moveCycleRatio;
    int score, shadowscore;
    BOOL gameIsOver, GameModeChanged;
    float locationX;
    float locationY;
    int rand1,rand2,difficultyLevel;
    int tries;
    int tagtab;
    int shakes;
    int maxbricks;
    int remainingshakes;
	CCLabelTTF *scoreLabel, *scoreValue, *scoreValueShadow;
    CCLabelTTF *logotext, *bobletext, *difficultyText, *Multiplier;
    CCLabelTTF *shakeLabel;
    
    CCLabelTTF *tbutton2, *shaketext;
    
  	int rows, j, i;
   
	
    NSMutableArray *sprites;
    NSMutableArray *tempGrouping;
    NSMutableArray *loopGrouping;
    NSMutableSet *grouping;
    
       
}

- (void) isGameOver;
- (void) restartGame;
- (void) updateBoard:(ccTime)dt;
@end


