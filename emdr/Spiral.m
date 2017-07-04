// #import "Spiral.h"

@implementation Spiral

+ (void) initialize {

    instance = 0;                       
    size = 1.0;                         
    direction = 1;                  // counter | clockwise
    cycles = 2.0;                   // rotations
    points = [[NSMutableArray alloc] initWithCapacity:0];
}

- (id) initWithSize: (float)spiralsize {

    self = [super init];
    if (self != nil) {
        instance++;
        size = spiralsize;                         
    }    

    return self;
}

- (id) makeWithPoints: (int)number clockwise:(Boolean)clockwise {

    // populate
    // cycles = turns around the center
        
    for (float i = 0; i < number; i+=1.0) {

        CGPoint p;
        CGFloat radian = mapValueWithRange(i, 0.0, number, 0.0, (2 * PI) * cycles);
        if (clockwise) radian*=-1; 

        float x = i * size * cos(radian);
        float y = i * size * sin(radian);
        p.x = x;
        p.y = y;

        [points addObject: [NSValue valueWithPoint:p]];
    }

    return self;
}

- (NSMutableArray*) points {

    return points;
}

- (int) size {

    return size;
}

- (int) direction {

    // default clockwise (in init)

    return direction;
}

- (int) cycles {

    return cycles;
}

- (void) debug {

    NSLog(@"instance : %d", instance);
    NSLog(@"size : %d", size);
    NSLog(@"direction : %d", direction);
    NSLog(@"cycles : %d", cycles);
    NSLog(@"points : %@", points);
    NSLog(@"points count : %d", [points count]);
}

@end
