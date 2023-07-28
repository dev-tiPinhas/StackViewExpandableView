//
//  ITSE2EExpandableView.m
//  StackViewExpandableView
//
//  Created by Tiago Pinheiro on 12/05/2020.
//  Copyright © 2020 Tiago Pinheiro. All rights reserved.
//

#import "ITSE2EExpandableView.h"
#import "ITSE2ECardDetailsListBulletView.h"
#import "ITSE2ECardDetailsDocumentsView.h"

@interface ITSE2EExpandableView ()

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UIStackView *stackView;
@property (nonatomic, weak) IBOutlet UIImageView *headerImageView;
@property (nonatomic, weak) IBOutlet UILabel *headerLabel;
@property (nonatomic, weak) IBOutlet UIButton *headerButton;

@property (nonatomic, strong) UIView *nibView;

@end

@implementation ITSE2EExpandableView

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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(expandableViewButtonClicked:)];
    [self.headerView setUserInteractionEnabled:YES];
    [self.headerView addGestureRecognizer:tapGesture];
    
    self.stackView.hidden = YES;
    self.containerView.layer.cornerRadius = 10.0f;
    self.containerView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.containerView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.containerView.layer.shadowRadius = 15.0f;
    self.containerView.layer.shadowOpacity = 0.05f;
    self.containerView.layer.masksToBounds = NO;
    
    if (!self.isDocuments) {
        for (int i = 0; i < 15; i++) {
            ITSE2ECardDetailsListBulletView *bulletView = [[ITSE2ECardDetailsListBulletView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 0.0f)];
            bulletView.frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [bulletView getHeight]);
            [self.stackView addArrangedSubview:bulletView];
        }
    } 
}

- (void)expandableViewButtonClicked:(id)sender {
    self.expanded = !self.expanded;
       
    if (self.delegate && [self.delegate respondsToSelector:@selector(ITSExpendableViewDidChangeHeight:height:)]) {
        [self.delegate ITSExpendableViewDidChangeHeight:self height:CGRectGetMaxY(self.containerView.frame) + 15.0f];
    }
}

- (void)setExpanded:(BOOL)expanded {
    _expanded = expanded;
    self.stackView.hidden = !expanded;
    [self layoutIfNeeded];
}

- (void)setIsDocuments:(BOOL)isDocuments {
    _isDocuments = isDocuments;
    for (int i = 0; i < 3; i++) {
    ITSE2ECardDetailsDocumentsView *documentsView = [[ITSE2ECardDetailsDocumentsView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 60.0f)];
    [self.stackView addArrangedSubview:documentsView];
    }
}
    
@end
