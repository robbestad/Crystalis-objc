#import "cocos2d.h"
#import "CCUIViewWrapper.h"
@class CCMenu;


@interface MainMenu : CCLayer
{
	CCMenuItem	*disabledItem;
    BOOL audioInit;
    
}
@end

@interface menuChallenges: CCLayer
{
    CCMenuItem	*disabledItem;
}
-(void) menuCallback: (id) sender;  
-(void) menuCallback2: (id) sender;
-(void) backCallback: (id) sender;

@end

@interface menuSettings: CCLayer
{
    CCMenuItem	*disabledItem;
}
-(void) menuCallback: (id) sender;  
-(void) menuCallback2: (id) sender;
-(void) backCallback: (id) sender;

@end




@interface Layer2 : CCLayer
{
	CGPoint	centeredMenu;
	BOOL alignedH;
}
-(void) menuCallbackBack: (id) sender;
-(void) menuCallbackOpacity: (id) sender;
-(void) menuCallbackAlign: (id) sender;
@end


@interface LayerPriorityTest : CCLayer
{
    UIButton *button;
	CCUIViewWrapper *wrapper;
    
}
+(id) scene;
@end
