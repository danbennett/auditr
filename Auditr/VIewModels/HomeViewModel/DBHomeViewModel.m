//
//  DBHomeViewModel.m
//  Auditr
//
//  Created by Daniel Bennett on 31/01/2014.
//  Copyright (c) 2014 Daniel Bennett. All rights reserved.
//

#import "DBHomeViewModel.h"
#import "DBGroupService.h"
#import "DBGroupViewModel.h"

@interface DBHomeViewModel()

@property (nonatomic, strong) id<DBGroupService> groupService;
@property (nonatomic, strong, readwrite) NSString *title;

@end

@implementation DBHomeViewModel


- (id) initWithGroupService: (id<DBGroupService>) groupService
{
    self = [super init];
    if (self)
	{
		self.title = @"Home";
		self.groupService = groupService;
    }
    return self;
}

- (DBGroupViewModel *) newGroupViewModel
{
	Group *group = [self.groupService createBlankGroup];
	DBAssembly *factory = (DBAssembly *)[TyphoonAssembly defaultAssembly];
	
	id<DBGroupService> groupService = [factory groupService];
	id<DBAreaService> areaService = [factory areaService];
	
	DBGroupViewModel *viewModel = [[DBGroupViewModel alloc] initWithGroupService: groupService areaService: areaService];
	viewModel.group = group;
	
	return viewModel;
}

@end
