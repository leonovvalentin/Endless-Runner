//
//  ERGMyScene.h
//  Endless Runner
//
//
//  Copyright (c) 2014 Valentin Leonov. All rights reserved.
//



#import "ERGBackground.h"



@class ERGBackground;



@interface ERGMyScene : SKScene

@property (strong, nonatomic) ERGBackground *currentBackground;
@property (assign) CFTimeInterval lastUpdateTimeInterval;

@end
