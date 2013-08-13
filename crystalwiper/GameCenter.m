//
//  GameCenter.m
//  wiper
//
//  Created by Sven Anders Robbestad on 14.05.12.
//  Copyright (c) 2012 Sven Anders Robbestad. All rights reserved.
//

#import "GameCenter.h"

@implementation GameCenter
@synthesize gameCenterAvailable;

#pragma mark Initialization

static GameCenter *sharedHelper = nil;
+ (GameCenter *) sharedInstance {
    if (!sharedHelper) {
        sharedHelper = [[GameCenter alloc] init];
    }
    return sharedHelper;
}
- (BOOL)isGameCenterAvailable {
    // check for presence of GKLocalPlayer API
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    // check if the device is running iOS 4.1 or later
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer     
                                           options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
}

- (id)init {
    if ((self = [super init])) {
        gameCenterAvailable = [self isGameCenterAvailable];
        if (gameCenterAvailable) {
            NSNotificationCenter *nc = 
            [NSNotificationCenter defaultCenter];
            [nc addObserver:self 
                   selector:@selector(authenticationChanged) 
                       name:GKPlayerAuthenticationDidChangeNotificationName 
                     object:nil];
        }
    }
    return self;
}

- (void)authenticationChanged {    
    
    if ([GKLocalPlayer localPlayer].isAuthenticated && 
        !userAuthenticated) {
        NSLog(@"Authentication changed: player authenticated.");
        NSString *playerName= [GKLocalPlayer localPlayer].alias;
        NSLog(@"GAMECENTER singleton*** playername: %@",playerName);
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:playerName forKey:@"kLocalUser"];
        [defaults synchronize];
        userAuthenticated = TRUE;           
    } else if (![GKLocalPlayer localPlayer].isAuthenticated && 
               userAuthenticated) {
        NSLog(@"Authentication changed: player not authenticated");
        userAuthenticated = FALSE;
    }
    
}
#pragma mark User functions

- (void)authenticateLocalUser { 
    
    if (!gameCenterAvailable) return;
  
    
    NSLog(@"Authenticating local user...");
    if ([GKLocalPlayer localPlayer].authenticated == NO) {     
        [[GKLocalPlayer localPlayer] 
         authenticateWithCompletionHandler:nil]; 
        
        
    } else {
        NSLog(@"Already authenticated!");
        NSString *playerName= [GKLocalPlayer localPlayer].alias;
        NSLog(@"GAMECENTER singleton 2*** playername: %@",playerName);
        
       
    }
[self retrieveTopTenScores];
}



- (void) retrieveTopTenScores
{
    GKLeaderboard *leaderboardRequest = [[GKLeaderboard alloc] init];
    NSLog(@"topten start");
    
    if (leaderboardRequest != nil)
    {
        NSLog(@"topten NOT NIL!");
        
        leaderboardRequest.playerScope = GKLeaderboardPlayerScopeGlobal;
        leaderboardRequest.timeScope = GKLeaderboardTimeScopeAllTime;
        leaderboardRequest.range = NSMakeRange(1,10);
        [leaderboardRequest loadScoresWithCompletionHandler: ^(NSArray *scores, NSError *error) {
            if (error != nil)
            {
                // handle the error.
                NSLog(@"topten error: %@",error);
            }
            if (scores != nil)
            {
                // process the score information.
                NSLog(@"TOPTEN SCORESCOUNT: %i",scores.count);
                for(int i=0;i<scores.count;i++){
                    NSArray *scorA= [scores objectAtIndex:i];
                    NSLog(@"TOPTEN scorearr: %@",scorA);
                    
                }
                
            }
        }];
    }
}

@end
