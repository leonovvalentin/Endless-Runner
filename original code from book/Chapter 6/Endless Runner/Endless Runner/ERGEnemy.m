//
//  ERGEnemy.m
//  Endless Runner
//
//  Created by Dmitry Volevodz on 02.11.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import "ERGEnemy.h"

@implementation ERGEnemy

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup
{
    self.emitter = [NSKeyedUnarchiver unarchiveObjectWithFile:
                    [[NSBundle mainBundle] pathForResource:@"enemy" ofType:@"sks"]];
    self.emitter.name = @"enemyEmitter";
    self.emitter.zPosition = 50;
    [self addChild:self.emitter];
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:10];
    self.physicsBody.contactTestBitMask = playerBitmask;
    self.physicsBody.categoryBitMask = enemyBitmask;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.affectedByGravity = NO;
}




@end
