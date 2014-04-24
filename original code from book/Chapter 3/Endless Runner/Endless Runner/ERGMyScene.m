//
//  ERGMyScene.m
//  Endless Runner
//
//  Created by DmitryVolevodz on 25.10.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import "ERGMyScene.h"
#import "ERGBackground.h"
#import "Common.h"
#import "ERGPlayer.h"


@implementation ERGMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.currentBackground = [ERGBackground generateNewBackground];
        [self addChild:self.currentBackground];
        
        ERGPlayer *player = [[ERGPlayer alloc] init];
        player.position = CGPointMake(100, 68);
        [self addChild:player];
        
        self.score = 0;
        self.scoreLabel = [[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"];
        self.scoreLabel.fontSize = 15;
        self.scoreLabel.color = [UIColor whiteColor];
        self.scoreLabel.position = CGPointMake(20, 300);
        self.scoreLabel.zPosition = 100;
        
        [self addChild:self.scoreLabel];
        
        SKAction *tempAction = [SKAction runBlock:^{
            self.scoreLabel.text = [NSString stringWithFormat:@"%3.0f", self.score];
        }];
        
        SKAction *waitAction = [SKAction waitForDuration:0.2];
        [self.scoreLabel runAction:[SKAction repeatActionForever:[SKAction sequence:@[tempAction, waitAction]]]];
        
//        self.manager = [[CMMotionManager alloc] init];
//        self.manager.accelerometerUpdateInterval = 0.1;
//        [self.manager startAccelerometerUpdates];
//        [self performSelector:@selector(adjustBaseline) withObject:nil afterDelay:0.1];
//        

        self.physicsWorld.gravity = CGVectorMake(0, globalGravity);
    
    }
    return self;
}
- (void) adjustBaseline
{
    self.baseline = self.manager.accelerometerData.acceleration.x;
}

- (void) didMoveToView:(SKView *)view
{
    UILongPressGestureRecognizer *tapper = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tappedScreen:)];
    tapper.minimumPressDuration = 0.1;
    [view addGestureRecognizer:tapper];
}


-(void)willMoveFromView:(SKView *)view
{
    for (UIGestureRecognizer *recognizer in view.gestureRecognizers) {
        [view removeGestureRecognizer:recognizer];
    }
}

//- (void) handleSwipeRight:(UIGestureRecognizer *)recognizer
//{
//    if (recognizer.state == UIGestureRecognizerStateRecognized) {
//        backgroundMoveSpeed += 50;
//    }
//    
//    NSLog(@"right");
//}
//
//- (void) handleSwipeLeft:(UIGestureRecognizer *)recognizer
//{
//    if (recognizer.state == UIGestureRecognizerStateRecognized && backgroundMoveSpeed > 50) {
//        backgroundMoveSpeed -= 50;
//    }
//    NSLog(@"left");
//}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//
//    UITouch *touch = [touches anyObject];
//    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:[touch locationInNode:self]];
//    
//    if (touchedNode.name == playerName) {
//        ERGPlayer *player = (ERGPlayer *) touchedNode;
//        player.selected = YES;
//        return;
//    }
//    
//    ERGPlayer *player = (ERGPlayer *)[self childNodeWithName:playerName];
//
//    // we are creating action to move the node that runs it by vector
//    // of x and y components with duration in seconds
//    SKAction *moveUp = [SKAction moveBy:CGVectorMake(0, 100) duration:0.8];
//    
//    // same as before, but it is opposite vector to go down, an it is a bit
//    // faster, since gravity accelerates you
//    SKAction *moveDown = [SKAction moveBy:CGVectorMake(0, -100) duration:0.6];
//    
//    // sequence action allows you to compound few actions into one
//    SKAction *seq = [SKAction sequence:@[moveUp, moveDown]];
//    
//    // childNodeWithName: method allows you to find any node in hierarchy with
//    // certain name. This is useful if you don't want to store things
//    // as instance variables or properties
//    
//    [player runAction:seq];
//    // after creating all actions we tell character to execute them
//}

//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    
//    ERGPlayer *player = (ERGPlayer *)[self childNodeWithName:playerName];
//    if (player.selected) {
//
//    player.position = [touch locationInNode:self];
//    }
//}
//
//- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    ERGPlayer *player = (ERGPlayer *)[self childNodeWithName:playerName];
//    if (player.selected) {
//        player.selected = NO;
//    }
//}
//
- (void) tappedScreen:(UITapGestureRecognizer *)recognizer
{
    ERGPlayer *player = (ERGPlayer *)[self childNodeWithName:@"player"];
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        player.accelerating = YES;
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        player.accelerating = NO;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    [self enumerateChildNodesWithName:backgroundName usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(node.position.x - backgroundMoveSpeed * timeSinceLast, node.position.y);
        if (node.position.x < - (node.frame.size.width + 100)) {
            // if the node went completely off screen (with some extra pixels)
            // remove it
            [node removeFromParent];
        }}];
    if (self.currentBackground.position.x < -500) {
        // we create new background node and set it as current node
        ERGBackground *temp = [ERGBackground generateNewBackground];
        temp.position = CGPointMake(self.currentBackground.position.x + self.currentBackground.frame.size.width, 0);
        [self addChild:temp];
        self.currentBackground = temp;
    }

    self.score = self.score + (backgroundMoveSpeed * timeSinceLast / 100);
    
    [self enumerateChildNodesWithName:@"player" usingBlock:^(SKNode *node, BOOL *stop) {
        ERGPlayer *player = (ERGPlayer *)node;
        if (player.accelerating) {
            [player.physicsBody applyForce:CGVectorMake(0, playerJumpForce * timeSinceLast)];
        }
    }];
    
//    ERGPlayer *player = (ERGPlayer *) [self childNodeWithName:playerName];
//    player.position = CGPointMake(player.position.x, player.position.y - (self.manager.accelerometerData.acceleration.x - self.baseline) * accelerometerMultiplier);
//    
//    if (player.position.y < 68) {
//        player.position = CGPointMake(player.position.x, 68);
//    }
//    if (player.position.y > 252) {
//        player.position = CGPointMake(player.position.x, 252);
//    }
    
}

@end
