//
//  common.h
//  Endless Runner
//
//  Created by DmitryVolevodz on 26.10.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#ifndef Endless_Runner_common_h
#define Endless_Runner_common_h

static NSString *backgroundName = @"background";
static NSString *parallaxName = @"parallax";
static NSInteger parallaxMoveSpeed = 10;
static NSString *playerName = @"player";
static NSInteger backgroundMoveSpeed = 300;
static NSInteger accelerometerMultiplier = 15;
static NSInteger playerMass = 50;
static NSInteger playerCollisionBitmask = 1;
static NSInteger playerJumpForce = 1500000;
static NSInteger globalGravity = -2.8;

typedef enum playerState {
    
    playerStateRunning = 0,
    playerStateJumping,
    playerStateInAir
    
} playerState;

#endif
