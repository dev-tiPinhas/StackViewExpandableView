//
//  ITSE2ECardDetailsDocumentsView.m
//  StackViewExpandableView
//
//  Created by Tiago Pinheiro on 12/05/2020.
//  Copyright © 2020 Tiago Pinheiro. All rights reserved.
//

#import "ITSE2ECardDetailsDocumentsView.h"
@interface ITSE2ECardDetailsDocumentsView()

@property (nonatomic, weak) IBOutlet UILabel *documentDescriptionLabel;
@property (nonatomic, weak) IBOutlet UIView *separatorView;

@property (nonatomic, strong) UIView *nibView;

@end

@implementation ITSE2ECardDetailsDocumentsView

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
    
    self.documentDescriptionLabel.text = @"Documentos Lindos";
    self.separatorView.backgroundColor = [UIColor lightGrayColor];
}

@end
