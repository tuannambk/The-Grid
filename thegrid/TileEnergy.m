//
//  TileEnergy.m
//  thegrid
//
//  Created by Bart Vandendriessche on 07/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TileEnergy.h"
#import "EnergyType.h"

@implementation TileEnergy

@synthesize scoreCoal = _scoreCoal;
@synthesize scoreOil = _scoreOil;
@synthesize scoreGas = _scoreGas;
@synthesize scoreNuclear = _scoreNuclear;

@synthesize scoreWind = _scoreWind;
@synthesize scoreSun = _scoreSun;
@synthesize scoreGeo = _scoreGeo;
@synthesize scoreWater = _scoreWater;

@synthesize energy = _energy;

+ (id)tileWithRandomPropertiesAt:(HexPoint)point {
    return [[[TileEnergy alloc] initWithRandomPropertiesAt:point]autorelease];
}

- (id)initWithRandomPropertiesAt:(HexPoint)point {
    if ((self = [super initWithRadius:74.0f position:point spriteName:[NSString stringWithFormat:@"energy_tile_background_%i.png", arc4random() % 3]])) {
        self.scoreCoal = (arc4random() % 10) * 2 * 20;
        self.scoreOil = (arc4random() % 10) * 4 * 20;
        self.scoreGas = (arc4random() % 10) * 3 * 20;
        self.scoreNuclear = (arc4random() % 10) * 2 * 20;
        
        self.scoreWind = arc4random() % 11;
        self.scoreSun = arc4random() % 11;
        self.scoreGeo = arc4random() % 11;
        self.scoreWater = arc4random() % 11;
    }
    return self;
}

- (void)deplete {
    if (!_energy) return;
    [_energy deplete:self];
}

- (int)yield:(Environment*)environment {
    if (!_energy) {
        return 0;
    }
    
    [_energy deplete:self];
    
    return [_energy yield:self environment:environment];
}

- (void)setEnergy:(EnergyType *)energy {
    if(energy.sprite) {
        self.overlay = energy.sprite;
        _overlay.position = _sprite.position;
        [self addChild:_overlay];
        
        [_overlay runAction:[CCSequence actions:
                             [CCScaleTo actionWithDuration:0.0f scale:0.0f],
                             [CCDelayTime actionWithDuration:4.0f],
                             [CCScaleTo actionWithDuration:0.0f scale:1.0f],
                             [CCFadeIn actionWithDuration:2.0f],
                             nil]];
    }
    [_energy release], _energy = nil;
    _energy = [energy retain];
}

- (void)dealloc {
    [_energy release], _energy = nil;
    [super dealloc];
}

@end
