//
//  HexNode.h
//  thegrid
//
//  Created by Bart Vandendriessche on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"


struct HexPoint {
    int x;
    int y;
};
typedef struct HexPoint HexPoint;

CG_INLINE HexPoint
HexPointMake(int x, int y){
    HexPoint p; p.x = x; p.y = y; return p;
}

@interface HexNode : CCNode {
    float _radius;
    float _height;
    float _rowHeight;
    float _halfWidth;
    float _width;
    
    ccColor4B _color;
    
    HexPoint _position;
    CCSprite *_sprite;
    CCSprite *_overlay;
    
    CGPoint _leftBottom;
    CGPoint _left;
    CGPoint _leftTop;
    CGPoint _rightTop;
    CGPoint _right;
    CGPoint _rightBottom;
    CGPoint _bottom;
}

@property (nonatomic, assign) float radius;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float rowHeight;
@property (nonatomic, assign) float halfWidth;
@property (nonatomic, assign) float width;

@property (nonatomic, assign) HexPoint pos;
@property (nonatomic, assign) CCSprite *sprite;
@property (nonatomic, assign) CCSprite *overlay;

+ (id)nodeWithRadius:(float)radius position:(HexPoint)position spriteName:(NSString *)spriteName;
- (id)initWithRadius:(float)radius position:(HexPoint)position spriteName:(NSString *)spriteName;
- (CGPoint)origin;
//- (void)randomizeColor;
- (void)addOverlayWithSpriteFrameName:(NSString*)name;
- (void)removeOverlay;
- (BOOL)isTouchForMe:(CGPoint)touch;

@end
