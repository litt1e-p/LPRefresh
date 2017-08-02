// The MIT License (MIT)
//
// Copyright (c) 2017-2018 litt1e-p ( https://github.com/litt1e-p )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "UIScrollView+RefreshControl.h"
#import <objc/runtime.h>

typedef void (^RefreshHandler)(UIScrollView * _Nullable scrollView);

@implementation UIScrollView (RefreshControl)

/**
 AddRefreshControlWithHandler
 
 @param handler handler closure
 */
- (void)addRefreshControlWithHandler:(void(^_Nullable)(UIScrollView * _Nullable scrollView))handler
{
    self.refreshHandler        = [handler copy];
    self.refreshControl        = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControlEvent:) forControlEvents:UIControlEventValueChanged];
    self.refreshControlEnabled = YES;
}

- (void)refreshControlEvent:(UIRefreshControl *)refreshControl
{
    if (self.refreshHandler) {
        self.refreshHandler(self);
    }
}

/**
 Begin refresh with trigger automatically
 */
- (void)beginRefresh
{
    UIScrollView *scrollView = (UIScrollView *)self;
    if (scrollView) {
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y - self.frame.size.height) animated:YES];
    }
    [self.refreshControl layoutIfNeeded];
    [self.refreshControl beginRefreshing];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
}

/**
 Finish Refresh animations with a handler
 
 @param handler a completion closure handler called when animation finished
 */
- (void)finishRefreshWithCompletion:(nullable void(^)(UIScrollView * _Nullable scrollView))handler
{
    [self finishRefresh];
    if (handler) {
        handler(self);
    }
}

/**
 Finish infinite scroll animations
 */
- (void)finishRefresh
{
    [self.refreshControl endRefreshing];
}

- (void)setRefreshControlEnabled:(BOOL)enabled {
    if (enabled) {
        if (self.refreshControl.superview) { return; }
        [self addSubview:self.refreshControl];
    } else {
        [self.refreshControl removeFromSuperview];
    }
}

- (BOOL)refreshControlEnabled {
    return self.refreshControl.superview != nil;
}

#pragma mark - Accessors
- (void)setRefreshHandler:(RefreshHandler)handler
{
    objc_setAssociatedObject(self, @selector(refreshHandler), handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RefreshHandler)refreshHandler
{
    return objc_getAssociatedObject(self, @selector(refreshHandler));
}

@end
