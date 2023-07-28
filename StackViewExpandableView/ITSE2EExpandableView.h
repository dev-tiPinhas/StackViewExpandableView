//
//  ITSE2EExpandableView.h
//  StackViewExpandableView
//
//  Created by Tiago Pinheiro on 12/05/2020.
//  Copyright © 2020 Tiago Pinheiro. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ITSE2EExpandableDelegate;

@interface ITSE2EExpandableView : UIView

@property (nonatomic, weak) id<ITSE2EExpandableDelegate> delegate;
@property (nonatomic, assign) BOOL expanded;
@property (nonatomic, assign) BOOL isDocuments;

@end

@protocol ITSE2EExpandableDelegate <NSObject>

- (void)ITSExpendableViewDidChangeHeight:(ITSE2EExpandableView *)control height:(CGFloat)height;

@end
