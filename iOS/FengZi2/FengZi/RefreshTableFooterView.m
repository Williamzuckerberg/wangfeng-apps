#define  RefreshViewHight 50.0f
#import "RefreshTableFooterView.h"
#define TEXT_COLOR     [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f

@interface RefreshTableFooterView (Private)
- (void)setState:(FOOTERPullRefreshState)aState;
@end

@implementation RefreshTableFooterView

@synthesize delegate=_delegate;


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, RefreshViewHight - 30.0f, self.frame.size.width, 20.0f)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont systemFontOfSize:12.0f];
        label.textColor = TEXT_COLOR;
        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        [self addSubview:label];
        _lastUpdatedLabel=label;
        [label release];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, RefreshViewHight - 30.0f, self.frame.size.width, 20.0f)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont boldSystemFontOfSize:13.0f];
        label.textColor = TEXT_COLOR;
        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        [self addSubview:label];
        _statusLabel=label;
        [label release];
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(25.0f, RefreshViewHight - RefreshViewHight, 30.0f, 55.0f);
        layer.contentsGravity = kCAGravityResizeAspect;
        layer.contents = (id)[UIImage imageNamed:@"blueArrow.png"].CGImage;
        
        #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
            layer.contentsScale = [[UIScreen mainScreen] scale];
        }
        #endif
        
        [[self layer] addSublayer:layer];
        _arrowImage=layer;
        
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        view.frame = CGRectMake(80.0f, RefreshViewHight - 30.0f, 20.0f, 20.0f);
        [self addSubview:view];
        _activityView = view;
        [view release];
        
        
        [self setState:FOOTERPullRefreshNormal];
        
    }
    
    return self;
    
}

#pragma mark -
#pragma mark Setters

- (void)refreshLastUpdatedDate {
    
    if ([_delegate respondsToSelector:@selector(footerRefreshTableHeaderDataSourceLastUpdated:)]) {
        
        NSDate *date = [_delegate footerRefreshTableHeaderDataSourceLastUpdated:self];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setAMSymbol:@"上午"];
        [formatter setPMSymbol:@"下午"];
        [formatter setDateFormat:@"yyyy/MM/dd hh:mm:a"];
        _lastUpdatedLabel.text = [NSString stringWithFormat:@"最后更新: %@", [formatter stringFromDate:date]];
        
        [[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text forKey:@"FOOTERRefreshTableView_LastRefresh"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [formatter release];
        
    } else {
        
        _lastUpdatedLabel.text = nil;
        
    }
}

- (void)setState:(FOOTERPullRefreshState)aState{
    
    switch (aState) {
        case FOOTERPullRefreshPulling:
            _statusLabel.text = NSLocalizedString(@"松开即可加载更多...", @"松开即可加载更多...");
            [CATransaction begin];
            [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
            _arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
            [CATransaction commit];
            break;
        case FOOTERPullRefreshNormal:
            if (_state == FOOTERPullRefreshPulling) {
                [CATransaction begin];
                [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
                _arrowImage.transform = CATransform3DIdentity;
                [CATransaction commit];
            }
            
            _statusLabel.text = NSLocalizedString(@"上拉即可加载更多...", @"上拉即可加载更多...");
            [_activityView stopAnimating];
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
            _arrowImage.hidden = NO;
            _arrowImage.transform = CATransform3DIdentity;
            [CATransaction commit];
            
            [self refreshLastUpdatedDate];
            
            break;
        case FOOTERPullRefreshLoading:
            
            _statusLabel.text = NSLocalizedString(@"加载中...", @"加载中...");
            [_activityView startAnimating];
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
            _arrowImage.hidden = YES;
            [CATransaction commit];
            
            break;
        default:
            break;
    }
    
    _state = aState;
}


#pragma mark -
#pragma mark ScrollView Methods

//手指屏幕上不断拖动调用此方法
- (void)footerRefreshScrollViewDidScroll:(UIScrollView *)scrollView {    
    
    if (_state == FOOTERPullRefreshLoading) {
        
//        CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
//        offset = MIN(offset, 60);
        scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0f, RefreshViewHight, 0.0f);
        
    } else if (scrollView.isDragging) {
        
        BOOL _loading = NO;
        if ([_delegate respondsToSelector:@selector(footerRefreshTableHeaderDataSourceIsLoading:)]) {
            _loading = [_delegate footerRefreshTableHeaderDataSourceIsLoading:self];
        }
        
        if (_state == FOOTERPullRefreshPulling && scrollView.contentOffset.y + (scrollView.frame.size.height) < scrollView.contentSize.height + RefreshViewHight && scrollView.contentOffset.y > 0.0f && !_loading) {
            [self setState:FOOTERPullRefreshNormal];
        } else if (_state == FOOTERPullRefreshNormal && scrollView.contentOffset.y + (scrollView.frame.size.height) > scrollView.contentSize.height + RefreshViewHight  && !_loading) {
            [self setState:FOOTERPullRefreshPulling];
        }
        if (scrollView.contentInset.bottom != 0) {
            scrollView.contentInset = UIEdgeInsetsZero;
        }
        
    }
    
}

//当用户停止拖动，并且手指从屏幕中拿开的的时候调用此方法
- (void)footerRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
    
    BOOL _loading = NO;
    if ([_delegate respondsToSelector:@selector(footerRefreshTableHeaderDataSourceIsLoading:)]) {
        _loading = [_delegate footerRefreshTableHeaderDataSourceIsLoading:self];
    }
    
    if (scrollView.contentOffset.y + (scrollView.frame.size.height) > scrollView.contentSize.height + RefreshViewHight && !_loading) {
        
        if ([_delegate respondsToSelector:@selector(footerRefreshTableHeaderDidTriggerRefresh:)]) {
            [_delegate footerRefreshTableHeaderDidTriggerRefresh:self];
        }
        [self setState:FOOTERPullRefreshLoading];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, RefreshViewHight, 0.0f);
        [UIView commitAnimations];
        
    }else{
        [self setState:FOOTERPullRefreshNormal];
    }
    
}

//当开发者页面页面刷新完毕调用此方法，[delegate footerRefreshScrollViewDataSourceDidFinishedLoading: scrollView];
- (void)footerRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    [scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [UIView commitAnimations];
    
    [self setState:FOOTERPullRefreshNormal];
    
}


#pragma mark -
#pragma mark Dealloc
- (void)dealloc {
    _delegate=nil;
    _activityView = nil;
    _statusLabel = nil;
    _arrowImage = nil;
    _lastUpdatedLabel = nil;
    [super dealloc];
}
@end
