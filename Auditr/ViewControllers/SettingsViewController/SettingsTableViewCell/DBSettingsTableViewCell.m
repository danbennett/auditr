//
//  DBSettingsTableViewCell.m
//  Auditr
//
//  Created by Daniel Bennett on 12/02/2014.
//  Copyright (c) 2014 Daniel Bennett. All rights reserved.
//

#import "DBSettingsTableViewCell.h"
#import "DBProfileViewModel.h"
#import <ReactiveCocoa/RACEXTScope.h>

@interface DBSettingsTableViewCell()

@property (nonatomic, strong) NSMutableArray *disposables;

@end

@implementation DBSettingsTableViewCell

- (void) awakeFromNib
{
	[super awakeFromNib];
	
	self.disposables = [NSMutableArray array];
	[self styleLabels];
	[self applyBindings];
}

#pragma mark - Style labels.

- (void) styleLabels
{
	UIFont *font = [UIFont fontWithName:@"Museo Sans" size: self.valueLabel.font.pointSize];
	[self.valueLabel setFont: font];
}

#pragma mark - Bindings.

- (void) applyBindings
{
	@weakify(self);
	[[RACObserve(self, viewModel) distinctUntilChanged] subscribeNext:^(DBProfileViewModel *viewModel) {
		
		@strongify(self);
		if (viewModel != nil)
		{
			[self.valueLabel setText: viewModel.profileName];
		
			[self applySettingsBinings];
		}
	}];
}

- (void) applySettingsBinings
{
	@weakify(self);
	
	RACDisposable *nameDisposable = [[RACObserve(self.viewModel, profileName) distinctUntilChanged] subscribeNext:^(NSString *newName) {
		
		@strongify(self);
		self.valueLabel.text = newName;
		
	}];
	[self.disposables addObject: nameDisposable];
}

- (void) prepareForReuse
{
	[super prepareForReuse];
	[self dispose];
}

- (void) dispose
{
	[self.disposables makeObjectsPerformSelector: @selector(dispose)];
	self.disposables = [NSMutableArray array];
}

@end
