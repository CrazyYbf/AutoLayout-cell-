//
//  AutoLayoutTableViewController.m
//  AutoLayout动态cell布局
//
//  Created by PiYi on 15/11/5.
//  Copyright © 2015年 PiYi. All rights reserved.
//

#import "AutoLayoutTableViewController.h"
#import "AutoLayoutTableViewCell.h"

#import "CellCollectionViewCell.h"

#import "Masonry.h"
@interface AutoLayoutTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    
    NSArray *textarry;
    
    NSIndexPath *registpath; //区别那个cell上的collectionview
    
}

@end

@implementation AutoLayoutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    textarry = [NSArray arrayWithObjects:@"Masonry是我们实现屏幕适配的重要手段之一",@"本质上是界面约束的语法糖。基本上，我们的做法是：大的页面关系aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ,@"用计算完成；每个小块里面的相对位置关系，用Masonry来做",@"在有些场景下，Masonry有非常大的优势。比如说设置某个View的宽高比",@"[thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {make.top.equalTo(@0);make.left.equalTo(@0);make.width.equalTo(self);make.height.equalTo(thumbImageView.mas_width).multipliedBy(0.8);}];",@"此View的宽度与父View同宽，高度是宽度的0.8,2、设置居中，设置相对边距",nil];
    
    
//    self.tableView.estimatedRowHeight = 320.0f;
//    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    AutoLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textview.text = [textarry objectAtIndex:indexPath.row];
    
    
    
    
    registpath =  [NSIndexPath indexPathForItem:indexPath.row inSection:0];
    
//    
//    [cell.mycollectionview mas_updateConstraints:^(MASConstraintMaker *make) {
//        // 添加大小约束
//        make.size.mas_equalTo(CGSizeMake(50, 50));
//        
//        // 添加左、上边距约束（左、上约束都是20）
//        make.left.and.top.mas_equalTo(20);
//        
//
//    }];
    
    [cell updateConstraints];
    
    
    [cell.mycollectionview registerClass:[CellCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionImagecell"];
    
    
    
  
    
    

    
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AutoLayoutTableViewCell *tablecell = [self.tableView cellForRowAtIndexPath:registpath];
    
    CellCollectionViewCell *cell = [tablecell.mycollectionview dequeueReusableCellWithReuseIdentifier:@"CollectionImagecell" forIndexPath:indexPath];
    [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    
    
    cell.imageview.image = [UIImage imageNamed:@"China"];
    
    
    
    return cell;
    
    
    
}



//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//    return    ;
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(CELLWIDTH, CELLHEIGHT);
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
