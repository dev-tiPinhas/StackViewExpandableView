//
//  ViewController.m
//  StackViewExpandableView
//
//  Created by Tiago Pinheiro on 12/05/2020.
//  Copyright © 2020 Tiago Pinheiro. All rights reserved.
//

#import "ViewController.h"
#import "ITSE2EExpandableView.h"

@interface ViewController () <ITSE2EExpandableDelegate>

@property (nonatomic, weak) IBOutlet UIStackView *stackView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 8; i++) {
        ITSE2EExpandableView *expandableView = [[ITSE2EExpandableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 90.0f)];
        expandableView.delegate = self;
        [self.stackView addArrangedSubview:expandableView];
    }
    
    ITSE2EExpandableView *expandableViewDocuments = [[ITSE2EExpandableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 90.0f)];
    expandableViewDocuments.isDocuments = YES;
    expandableViewDocuments.delegate = self;
    [self.stackView addArrangedSubview:expandableViewDocuments];
}

- (void)ITSExpendableViewDidChangeHeight:(ITSE2EExpandableView *)control height:(CGFloat)height {
    for (ITSE2EExpandableView *expandableView in self.stackView.arrangedSubviews) {
        if ([expandableView isKindOfClass:[ITSE2EExpandableView class]] && expandableView != control) {
            expandableView.expanded = NO;
            expandableView.frame =  CGRectMake(CGRectGetMinX(expandableView.frame), CGRectGetMinY(expandableView.frame), CGRectGetWidth(expandableView.frame), 90.0f);
        }
    }
    
    [self.view layoutIfNeeded];
    control.frame = CGRectMake(CGRectGetMinX(control.frame), CGRectGetMinY(control.frame), CGRectGetWidth(control.frame), height);
    
    if (CGRectGetMinY(control.frame) + height > [UIScreen mainScreen].bounds.size.height) {
        CGFloat diff = [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(control.frame);
        if (CGRectGetHeight(control.frame) > [UIScreen mainScreen].bounds.size.height) {
            [self.scrollView setContentOffset:CGPointMake(0.0f, CGRectGetMinY(control.frame) - 10.0f) animated:YES];
        } else {
            [self.scrollView setContentOffset:CGPointMake(0.0f, fabs(diff)) animated:YES];
        }
        
    }
}

@end
