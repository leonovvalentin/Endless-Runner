//
//  ERGPlayer.m
//  Endless Runner
//
//  Created by DmitryVolevodz on 26.10.13.
//  Copyright (c) 2013 Dmitry Volevodz. All rights reserved.
//

#import "ERGPlayer.h"

@implementation ERGPlayer

-(instancetype)init
{
    self = [super initWithImageNamed:@"character.png"];
    {
        self.name = playerName;
        self.zPosition = 10;
    }
    return self;
}

@end
