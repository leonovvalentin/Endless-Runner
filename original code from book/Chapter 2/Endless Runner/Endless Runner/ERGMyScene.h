//
//  ERGMyScene.h
//  Endless Runner
//

//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class ERGBackground;
@interface ERGMyScene : SKScene
@property (strong, nonatomic) ERGBackground *currentBackground;
@property (assign) CFTimeInterval lastUpdateTimeInterval;
@property (assign) double score;
@property (strong, nonatomic) SKLabelNode *scoreLabel;

@end
