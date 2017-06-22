//
//  CellChatRight.m
//  samuelandkevin github:https://github.com/samuelandkevin/YHChat
//
//  Created by samuelandkevin on 17/2/17.
//  Copyright © 2017年 samuelandkevin. All rights reserved.
//

#import "CellChatTextRight.h"
#import "Masonry.h"
#import "YHChatModel.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"

@interface CellChatTextRight()

@property (nonatomic,strong) UIImageView *imgvBubble;
@property (nonatomic,strong) UILabel *lbContent;

@end


@implementation CellChatTextRight

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
    UIImage *imgBubble = [UIImage imageNamed:@"chat_bubbleRight"];
    imgBubble = [imgBubble resizableImageWithCapInsets:UIEdgeInsetsMake(30, 15, 30, 30) resizingMode:UIImageResizingModeStretch];
    
    _imgvBubble.image = imgBubble;
    [self.contentView addSubview:_imgvBubble];
    
    _lbContent = [UILabel new];
 
    //-5-AvatarWidth-10-15-5-10-AvatarWidth
    _lbContent.preferredMaxLayoutWidth = SCREEN_WIDTH - 133;
    _lbContent.textColor = [UIColor blackColor];
    _lbContent.numberOfLines = 0;


    [self.contentView addSubview:_lbContent];
    
    
    [self layoutUI];
}

- (void)layoutUI{
    __weak typeof(self) weakSelf = self;
    [self layoutCommonUI];

    
    [self.lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.imgvAvatar.mas_left).offset(-10);
    }];
    
    [self.imgvAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView).offset(-5);
    }];
    
    [_imgvBubble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lbContent.mas_left).offset(-5);
        make.top.equalTo(weakSelf.lbName.mas_bottom).offset(5);
        make.right.equalTo(weakSelf.imgvAvatar.mas_left).offset(-5);
    }];
    

    [_lbContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imgvBubble.mas_top).offset(5);
        make.right.equalTo(weakSelf.imgvBubble.mas_right).offset(-15);
        make.bottom.equalTo(weakSelf.imgvBubble.mas_bottom).offset(-5);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH - 133);
    }];
    
    [self.activityV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.imgvBubble.mas_centerY);
        make.right.equalTo(weakSelf.imgvBubble.mas_left).offset(-5);
        make.width.height.mas_equalTo(20);
    }];
    
    [self.imgvSendMsgFail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.imgvBubble.mas_centerY);
        make.right.equalTo(weakSelf.imgvBubble.mas_left).offset(-5);
        make.width.height.mas_equalTo(20);
    }];
    
    self.hyb_lastViewInCell = _imgvBubble;
    self.hyb_bottomOffsetToCell = 5;
}


#pragma mark - Super

- (void)onAvatarGesture:(UIGestureRecognizer *)aRec{
    [super onAvatarGesture:aRec];
    if (aRec.state == UIGestureRecognizerStateEnded) {
       
    }
}

- (void)onImgSendMsgFailGesture:(UIGestureRecognizer *)aRec{
    [super onImgSendMsgFailGesture:aRec];
    if (aRec.state == UIGestureRecognizerStateEnded) {
       
    }
}

- (void)setupModel:(YHChatModel *)model{
    [super setupModel:model];

    self.lbName.text      = self.model.speakerName;
    self.lbTime.text      = self.model.createTime;
    self.lbContent.text   = self.model.msgContent;
    self.imgvAvatar.image = [UIImage imageNamed:@"chat_defaultAvatar"];
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
