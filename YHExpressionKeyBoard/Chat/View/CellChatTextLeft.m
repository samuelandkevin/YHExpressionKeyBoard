//
//  CellChatLeft.m
//  samuelandkevin github:https://github.com/samuelandkevin/YHChat
//
//  Created by samuelandkevin on 17/2/17.
//  Copyright © 2017年 samuelandkevin. All rights reserved.
//

#import "CellChatTextLeft.h"
#import "Masonry.h"
#import "YHChatModel.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"

@interface CellChatTextLeft()

@property (nonatomic,strong) UIImageView *imgvBubble;
@property (nonatomic,strong) UILabel *lbContent;

@end


@implementation CellChatTextLeft

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}

- (void)setupUI{

    _imgvBubble = [UIImageView new];
    UIImage *imgBubble = [UIImage imageNamed:@"chat_bubbleLeft"];
    imgBubble = [imgBubble resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 15) resizingMode:UIImageResizingModeStretch];

    _imgvBubble.image = imgBubble;
    [self.contentView addSubview:_imgvBubble];
    
    _lbContent = [UILabel new];

    
    //-5-AvatarWidth-10-15-5-10-AvatarWidth
    _lbContent.preferredMaxLayoutWidth = SCREEN_WIDTH - 133;
    _lbContent.textColor = [UIColor blackColor];
    _lbContent.textAlignment = NSTextAlignmentLeft;
    _lbContent.numberOfLines = 0;


    [self.contentView addSubview:_lbContent];
    
    [self layoutUI];
}

- (void)layoutUI{
    WeakSelf
    [self layoutCommonUI];

    [self.lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imgvAvatar.mas_right).offset(10);
    }];

    [self.imgvAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btnCheckBox.mas_right).offset(5);
    }];
    
    
    [_imgvBubble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imgvAvatar.mas_right).offset(5);
        make.top.equalTo(weakSelf.lbName.mas_bottom).offset(5);
        make.right.equalTo(weakSelf.lbContent.mas_right).offset(5);
    }];
    
    [_lbContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imgvBubble.mas_left).offset(15);
        make.top.equalTo(weakSelf.imgvBubble.mas_top).offset(5);
        make.bottom.equalTo(weakSelf.imgvBubble.mas_bottom).offset(-5);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH - 133);
    }];
    
    self.hyb_lastViewInCell = _imgvBubble;
    self.hyb_bottomOffsetToCell = 10;
}

#pragma mark - Super

- (void)onAvatarGesture:(UIGestureRecognizer *)aRec{
    [super onAvatarGesture:aRec];
    if (aRec.state == UIGestureRecognizerStateEnded) {
       
    }
}

- (void)setupModel:(YHChatModel *)model{
    [super setupModel:model];
    
    _lbContent.text        = model.msgContent;
    self.lbName.text       = self.model.speakerName;
    self.lbTime.text       = self.model.createTime;
     self.lbContent.text   = self.model.msgContent;
    self.imgvAvatar.image  = [UIImage imageNamed:@"chat_defaultAvatar"];
}

#pragma mark - Life
- (void)dealloc{
    //DDLog(@"%s dealloc",__func__);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
