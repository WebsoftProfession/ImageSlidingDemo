//
//  ViewController.m
//  ImageSlidingDemo
//
//  Created by WebsoftProfession on 4/6/16.
//   WebsoftProfession. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *photoArray;
    int currentIndex;
    int previousIndex;
    
    
    
    NSInteger prev_arr_index;
    NSInteger curr_arr_index;
    NSInteger initial_arr_count;
    UISwipeGestureRecognizer *swipe;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //[slideCollectionView selectItemAtIndexPath:0 animated:YES scrollPosition:UICollectionViewScrollPositionRight];
    photoArray=[[NSMutableArray alloc] initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg", nil];
    slidePageControl.currentPage=currentIndex;
    slidePageControl.numberOfPages=photoArray.count;
    previousIndex=currentIndex;
    
    initial_arr_count=photoArray.count;
    NSArray *temp=[NSArray arrayWithArray:photoArray];
    for (NSString *str in temp) {
        
        [photoArray addObject:str];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photoArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"imageCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    UIImageView *cellImageView = (UIImageView*)[cell viewWithTag:101];
    
    cellImageView.image=[UIImage imageNamed:[photoArray objectAtIndex:indexPath.row]];
    //[slidePageControl updateCurrentPageDisplay];
    slidePageControl.currentPage=indexPath.row;
    
//    currentIndex=indexPath.row;
//    [self setPreviousIndex:currentIndex];
    
    //[collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    return cell;
}

-(void)setPreviousIndex:(int)current
{
    
    if (current>0 && current<5) {
        
        previousIndex=current;
        slidePageControl.currentPage=current;
    }
}

-(CGSize) collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //return self.view.frame.size;
    
    CGSize cellSize=CGSizeMake(self.view.frame.size.width, 200);
    
    return cellSize;
}



-(BOOL)collectionView:(UICollectionView *)collectionView canFocusItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    currentIndex=indexPath.row;
//    NSIndexPath *indexP=[NSIndexPath indexPathWithIndex:currentIndex-1];
//    [collectionView selectItemAtIndexPath:indexP animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    //slidePageControl.currentPage=currentIndex;
    
//    if (currentIndex!=previousIndex) {
//        
//        slidePageControl.currentPage=indexPath.row;
//    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"%f",scrollView.decelerationRate);
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    
    NSArray *indexPathArray=[collectionView indexPathsForVisibleItems];
    NSIndexPath *currentIndexPath=[indexPathArray objectAtIndex:0];
    slidePageControl.currentPage=currentIndexPath.row;
    
    curr_arr_index=currentIndexPath.row;
    prev_arr_index=curr_arr_index-1;
    
    if (indexPath.row==photoArray.count-1) {
        
        slideCollectionView.scrollEnabled=false;
        UIImageView *imgView=[cell viewWithTag:101];
        swipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeCalled:)];
        swipe.direction=UISwipeGestureRecognizerDirectionLeft;
        [imgView addGestureRecognizer:swipe];
    }
    
//    if (curr_arr_index==initial_arr_count) {
//        curr_arr_index=0;
//        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
//        NSLog(@"now we can reload items.");
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [slideCollectionView reloadData];
//        });
//    }


}


-(void)leftSwipeCalled:(UISwipeGestureRecognizer *)swp
{
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)collectionView:(UICollectionView *)collectionView didUpdateFocusInContext:(UICollectionViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator

{
    
}



-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout*)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);   //t,l,b,r
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
