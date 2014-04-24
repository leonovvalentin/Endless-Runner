//
//  ERGMyScene.h
//  Endless Runner
//

//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//
@import CoreMotion;
@import GameController;
@import AVFoundation;
#import <SpriteKit/SpriteKit.h>

@class ERGBackground, ERGPlayer;
@interface ERGMyScene : SKScene <SKPhysicsContactDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) ERGBackground *currentBackground;
@property (strong, nonatomic) ERGBackground *currentParallax;
@property (assign) CFTimeInterval lastUpdateTimeInterval;
@property (assign) double score;
@property (strong, nonatomic) SKLabelNode *scoreLabel;
@property (strong, nonatomic) CMMotionManager *manager;
@property (assign) float baseline;
@property (strong, nonatomic) UILongPressGestureRecognizer *tapper;
@property (strong, nonatomic) ERGPlayer *player;
@property (strong, nonatomic) SKLabelNode *pauseLabel;
@property (strong, nonatomic) AVAudioPlayer* musicPlayer;


@end
