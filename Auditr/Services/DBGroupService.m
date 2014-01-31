//
//  DBGroupService.m
//  Auditr
//
//  Created by Daniel Bennett on 11/12/2013.
//  Copyright (c) 2013 Daniel Bennett. All rights reserved.
//

#import "DBGroupService.h"
#import "DBGroupRepository.h"

@interface DBGroupService()

@property (nonatomic, assign) id<DBGroupRepository> groupRepository;

@end

@implementation DBGroupService

- (id) initWithGroupRepository: (id<DBGroupRepository>) groupRepository
{
    self = [super init];
    if (self)
	{
        self.groupRepository = groupRepository;
    }
    return self;
}

- (NSArray *) getAll
{
	return [self.groupRepository getAll];
}

- (NSArray *) getAllActive
{
	return [self.groupRepository getAllByAttribute: @"softDeleted" value: @FALSE];
}

@end