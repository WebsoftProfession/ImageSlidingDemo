//
//  ViewController.h
//  ImageSlidingDemo
//
//  Created by WebsoftProfession on 4/6/16.
//   WebsoftProfession. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
{
    
    __weak IBOutlet UICollectionView *slideCollectionView;
    __weak IBOutlet UIPageControl *slidePageControl;
}

@end

