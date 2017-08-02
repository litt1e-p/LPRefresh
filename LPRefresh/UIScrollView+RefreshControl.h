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

#import <UIKit/UIKit.h>

@interface UIScrollView (RefreshControl)

/**
 *  Availability of refreshControl. In disable case pull-to-refresh action will be saved.
 */
@property (nonatomic) BOOL refreshControlEnabled;

/**
 AddRefreshControlWithHandler

 @param handler handler closure
 */
- (void)addRefreshControlWithHandler:(void(^_Nullable)(UIScrollView * _Nullable scrollView))handler;

/**
 Begin refresh with trigger automatically
 */
- (void)beginRefresh;

/**
 Finish Refresh animations with a handler
 
 @param handler a completion closure handler called when animation finished
 */
- (void)finishRefreshWithCompletion:(nullable void(^)(UIScrollView * _Nullable scrollView))handler;

/**
 Finish infinite scroll animations
 */
- (void)finishRefresh;

@end

@interface UITableView (RefreshControlInterface)

/**
 AddRefreshControlWithHandler
 
 @param handler handler closure
 */
- (void)addRefreshControlWithHandler:(void(^_Nullable)(UITableView * _Nullable tableView))handler;

/**
 Begin refresh with trigger automatically
 */
- (void)beginRefresh;

/**
 Finish Refresh animations with a handler
 
 @param handler a completion closure handler called when animation finished
 */
- (void)finishRefreshWithCompletion:(nullable void(^)(UITableView * _Nullable tableView))handler;

@end

@interface UICollectionView (RefreshControlInterface)

/**
 AddRefreshControlWithHandler
 
 @param handler handler closure
 */
- (void)addRefreshControlWithHandler:(void(^_Nullable)(UICollectionView * _Nullable collectionView))handler;

/**
 Begin refresh with trigger automatically
 */
- (void)beginRefresh;

/**
 Finish Refresh animations with a handler
 
 @param handler a completion closure handler called when animation finished
 */
- (void)finishRefreshWithCompletion:(nullable void(^)(UICollectionView * _Nullable collectionView))handler;

@end
