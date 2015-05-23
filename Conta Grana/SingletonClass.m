//
//  SingletonClass.m
//  Conta Grana
//
//  Created by Caique de Paula Pereira on 22/05/15.
//  Copyright (c) 2015 Caique de Paula Pereira. All rights reserved.
//

#import "SingletonClass.h"

@implementation SingletonClass


@synthesize someProperty;
@synthesize total;
@synthesize totalNotas;
@synthesize totalMoedas;




#pragma mark Singleton Methods

+ (id)sharedManager {
    static SingletonClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
        total=0;
        totalMoedas=0;
        totalNotas=0;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}




@end
