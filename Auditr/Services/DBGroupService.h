//
//  DBGroupService.h
//  Auditr
//
//  Created by Daniel Bennett on 11/12/2013.
//  Copyright (c) 2013 Daniel Bennett. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Group;
@class Area;
@protocol DBGroupRepository;

@protocol DBGroupService <NSObject>

@required
- (id) initWithGroupRepository: (id<DBGroupRepository>) groupRepository;
- (void) addArea: (Area *) area toGroup: (Group *) group;
- (Group *) createBlankGroup;
- (NSArray *) getAll;
- (NSArray *) getAllActive;
- (void) saveGroup: (Group *) group toPush: (BOOL) toPush withCompletion: (void (^)(BOOL success, NSError *error)) completion;

@end

@interface DBGroupService : NSObject

- (id) initWithGroupRepository: (id<DBGroupRepository>) groupRepository;
- (void) addArea: (Area *) area toGroup: (Group *) group;
- (Group *) createBlankGroup;
- (NSArray *) getAll;
- (NSArray *) getAllActive;
- (void) saveGroup: (Group *) group toPush: (BOOL) toPush withCompletion: (void (^)(BOOL success, NSError *error)) completion;

@end
