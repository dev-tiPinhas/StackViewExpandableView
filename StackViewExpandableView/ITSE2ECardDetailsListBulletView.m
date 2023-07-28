//
//  ITSE2ECardDetailsListBulletView.m
//  StackViewExpandableView
//
//  Created by Tiago Pinheiro on 12/05/2020.
//  Copyright © 2020 Tiago Pinheiro. All rights reserved.
//

#import "ITSE2ECardDetailsListBulletView.h"

@interface ITSE2ECardDetailsListBulletView ()

@property (nonatomic, weak) IBOutlet UILabel *bulletTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *bulletDescriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *bulletImageView;

@property (nonatomic, strong) UIView *nibView;

@end

@implementation ITSE2ECardDetailsListBulletView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.nibView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    [self.nibView setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.nibView];
    
    self.bulletTitleLabel.text = @"sadasdusa asudiasdsad uias dsaiudhasd iuashd";
    self.bulletDescriptionLabel.text = @"saudhs aisudhsad asiudhas dasiud sadiuasd asdiuasd";
}

- (CGFloat)getHeight {
    return CGRectGetMaxY(self.bulletDescriptionLabel.frame);
}

@end
