//
//  UCUpdateNikename.m
//  FengZi
//
//  Created by  on 11-12-31.
//  Copyright (c) 2011年 iTotemStudio. All rights reserved.
//

#import "UCUpdateNikename.h"
#import "Api+eShop.h"

#define TAG_FIELD_BASE     (200300)
#define TAG_FIELD_PASSWD   (TAG_FIELD_BASE + 1) // 密码
#define TAG_FIELD_NKNAME   (TAG_FIELD_BASE + 2) // 昵称
#define TAG_FIELD_REALNAME (TAG_FIELD_BASE + 3) // 真实姓名
#define TAG_FIELD_SEX      (TAG_FIELD_BASE + 4) // 性别
#define TAG_FIELD_EMAIL    (TAG_FIELD_BASE + 5) // 邮箱地址
#define TAG_FIELD_BIRTHDAY (TAG_FIELD_BASE + 6) // 生日
#define TAG_FIELD_IDNUMBER (TAG_FIELD_BASE + 7) // 身份证号码
#define TAG_FIELD_ADDRESS  (TAG_FIELD_BASE + 8) // 通信地址
#define TAG_FIELD_POSTCODE (TAG_FIELD_BASE + 9) // 邮编
#define TAG_FIELD_ISOPEN   (TAG_FIELD_BASE + 10) // 是否公开
#define TAG_FIELD_WEIBO    (TAG_FIELD_BASE + 11) // 微博
#define TAG_FIELD_QQ       (TAG_FIELD_BASE + 12) // QQ号码
#define TAG_FIELD_CONTACT  (TAG_FIELD_BASE + 13) // 联系方式

#define ALERT_TITLE @"个人空间 提示"

@implementation UCUpdateNikename

@synthesize idDest;
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.idDest = -1;
        ucInfo = nil;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// 确认, 提交信息
- (void)doSave {
    //NSString *uid = [[userId text] trim];
    //NSString *pwd = [[passwd text] trim];
    NSString *nkm = [nikename.text trim];
    NSString *sRealName = [realname.text trim];
    NSString *sSex = (sex.isOn == YES ? @"1" : @"0");
    NSString *sEmail = [email.text trim];
    NSString *sBirthday = [birthday.text trim];
    NSString *sIdNumber = [idNumber.text trim];
    NSString *sAddress = [address.text trim];
    NSString *sPostCode = [postCode.text trim];
    NSString *sLikes = [likes.text trim];
    NSString *sIsopen = (isopen.isOn ? @"1":@"0");
    NSString *sWeibo = [weibo.text trim];
    NSString *sQQ = [QQ.text trim];
    NSString *sContact = [contact.text trim];
    /*
    // 密码长度判断
    if (pwd.length < 6 || pwd.length > 18) {
        [iOSApi Alert:ALERT_TITLE message:@"密码必须是6～18位的数字字母。"];
        [passwd becomeFirstResponder];
        return;
    }
    
    // 昵称长度判断
    if (nkm.length < 6 || nkm.length > 18) {
        [iOSApi Alert:ALERT_TITLE message:@"昵称必须是6～18位的文字。"];
        [passwd becomeFirstResponder];
        return;
    }
    */
    [iOSApi showAlert:@"正在提交信息..."];
    //ApiResult *iRet = [Api updateNikename:pwd nikename:nkm];
    ApiResult *iRet = [Api uc_userinfo_set:sRealName sex:sSex email:sEmail birthday:sBirthday idNumber:sIdNumber address:sAddress postCode:sPostCode likes:sLikes isopen:sIsopen weibo:sWeibo QQ:sQQ contact:sContact];
    [iOSApi closeAlert];
    NSString *msg = nil;
    if (iRet.status == API_USERCENTET_SUCCESS) {
        [Api setNikeName:nkm];
        msg = @"修改成功";
    } else {
        msg = iRet.message;
    }
    [iOSApi Alert:ALERT_TITLE message:msg];
}

#pragma mark - View lifecycle

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *image = [UIImage imageNamed:@"navigation_bg.png"];
    Class ios5Class = (NSClassFromString(@"CIImage"));
    if (nil != ios5Class) {
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    } else {
        self.navigationController.navigationBar.layer.contents = (id)[UIImage imageNamed:@"navigation_bg.png"].CGImage;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 140, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont fontWithName:@"黑体" size:60];
    label.textColor = [UIColor blackColor];
    label.text= @"个人信息";
    self.navigationItem.titleView = label;
    [label release];
    
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = CGRectMake(0, 0, 60, 32);
    [backbtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backbtn setImage:[UIImage imageNamed:@"back_tap.png"] forState:UIControlStateHighlighted];
    [backbtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backitem = [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = backitem;
    [backitem release];
    
    UIButton *_btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnRight.frame = CGRectMake(0, 0, 60, 32);
    [_btnRight setImage:[UIImage imageNamed:@"uc-save.png"] forState:UIControlStateNormal];
    [_btnRight setImage:[UIImage imageNamed:@"uc-save.png"] forState:UIControlStateHighlighted];
    [_btnRight addTarget:self action:@selector(doSave) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_btnRight];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    // 设定UITableViewCell格式
    _borderStyle = UITextBorderStyleRoundedRect;
    font = [UIFont systemFontOfSize:13.0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	// the user pressed the "Done" button, so dismiss the keyboard
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)switchShouldReturn:(UISwitch *)field
{
	//
	return YES;
}

// 文本框变动的时候
- (void)textUpdate:(id)sender {
	if ([sender isKindOfClass: [UITextField class]]) {
        UITextField *field = sender;
        
        NSString *msg = [field.text trim];
        int tag = [field tag];
        if (tag == TAG_FIELD_NKNAME && ![iOSApi regexpMatch:msg withPattern:@"[0-9]+"]) {
            //
        }
	} else {
		[self switchShouldReturn: sender];
	}
}


// 恢复数据到文本框
- (void)textRestore:(UITextField *)textField {
    //[textField becomeFirstResponder];
    [textField resignFirstResponder];
    NSTimeInterval animationDuration = 0.3;
    CGRect frame = _tableView.frame;
    frame.size.height = 369;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _tableView.frame = frame;
    [UIView commitAnimations];
}

- (void)editBegin:(UITextField *)textField event:(UIEvent *)event{
    NSTimeInterval animationDuration = 0.3;
    CGRect frame = _tableView.frame;
    frame.size.height = 160;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _tableView.frame = frame;
    [UIView commitAnimations];
    int row = textField.tag;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [iOSApi showAlert:@"正在获取用户信息..."];
    int userId = [Api userId];
    BOOL bEdit = YES;
    if (idDest >= 0) {
        bEdit = NO;
        //[self.navigationItem.rightBarButtonItem setEnabled:NO];
        self.navigationItem.rightBarButtonItem = nil;
        userId = idDest;
    }
    //IOSAPI_RELEASE(ucInfo);
    ucInfo = [[Api uc_userinfo_get:userId] retain];
    [iOSApi closeAlert];
    if (ucInfo.status != API_USERCENTET_SUCCESS) {
        [iOSApi Alert:ALERT_TITLE message:ucInfo.message];
        [ucInfo release];
        idDest = -1;
        return;
    }
    if ([items count] == 0) {
        // 预加载项
        CGRect frame = CGRectMake(90.f, 5.0f, 200, 25);
        iOSInput *input = nil;
        items = [[NSMutableArray alloc] initWithCapacity:0];
        
        if (bEdit) {
            // 昵称
            input = [[iOSInput new] autorelease];
            [input setName:@"昵称"];
            [input setTag:TAG_FIELD_NKNAME];
            nikename = [[UITextField alloc] initWithFrame:frame];
            nikename.text = ucInfo.nicname;
            nikename.tag = input.tag;
            nikename.returnKeyType = UIReturnKeyDone;
            if(bEdit) nikename.borderStyle = _borderStyle;
            nikename.placeholder = @"输入昵称";
            nikename.font = font;
            [nikename setEnabled:bEdit];
            // 绑定事件
            [nikename addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [nikename addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: nikename];
            [items addObject: input];
        }
        // 帐户名
        input = [[iOSInput new] autorelease];
        [input setName:@"账号名"];
        [input setTag:TAG_FIELD_CONTACT];
        UILabel *ac = [[UILabel alloc] initWithFrame:frame];
        if(bEdit) {
            ac.text = [Api userPhone];
        } else {
            ac.text = ucInfo.contact;
        }
        ac.tag = input.tag;
		ac.font = font;
        [ac setEnabled:bEdit];
		[input setObject: ac];
        [items addObject: input];
        
        CGRect swFrame = frame;
        swFrame.origin.y = 3;
        
        if (bEdit) {
            input = [[iOSInput new] autorelease];
            [input setName:@"是否公开"];
            [input setTag:TAG_FIELD_ISOPEN];
            
            isopen = [[UISwitch alloc] initWithFrame:swFrame];
            isopen.tag = input.tag;
            [isopen setOn:ucInfo.isopen];
            [isopen setEnabled:bEdit];
            [input setObject: isopen];
            [items addObject: input];
        }
        if (bEdit || ucInfo.isopen) {
            // 姓名
            input = [[iOSInput new] autorelease];
            [input setName:@"姓名"];
            [input setTag:TAG_FIELD_REALNAME];
            realname = [[UITextField alloc] initWithFrame:frame];
            realname.text = ucInfo.realname;
            realname.tag = input.tag;
            realname.returnKeyType = UIReturnKeyDone;
            realname.borderStyle = _borderStyle;
            if(bEdit) realname.placeholder = @"输入姓名";
            realname.font = font;
            [realname setEnabled:bEdit];
            // 绑定事件
            [realname addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [realname addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [realname addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: realname];
            [items addObject: input];
            
            // 性别
            input = [[iOSInput new] autorelease];
            [input setName:@"性别(男)"];
            [input setTag:TAG_FIELD_SEX];
            swFrame = frame;
            swFrame.origin.y = 3;
            sex = [[UISwitch alloc] initWithFrame:swFrame];
            sex.tag = input.tag;
            [sex setOn:ucInfo.sex];
            [sex setEnabled:bEdit];
            [input setObject: sex];
            [items addObject: input];
            
            // 出生日期
            input = [[iOSInput new] autorelease];
            [input setName:@"出生日期"];
            [input setTag:TAG_FIELD_BIRTHDAY];
            birthday = [[UITextField alloc] initWithFrame:frame];
            birthday.text = ucInfo.realname;
            birthday.tag = input.tag;
            birthday.keyboardType = UIKeyboardTypeDefault;
            birthday.returnKeyType = UIReturnKeyDone;
            birthday.borderStyle = _borderStyle;
            if(bEdit) birthday.placeholder = @"输入年月日";
            birthday.font = font;
            [birthday setEnabled:bEdit];
            // 绑定事件
            [birthday addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [birthday addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [birthday addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: birthday];
            [items addObject: input];
            
            // 联系方式
            input = [[iOSInput new] autorelease];
            [input setName:@"联系方式"];
            [input setTag:TAG_FIELD_CONTACT];
            contact = [[UITextField alloc] initWithFrame:frame];
            contact.text = ucInfo.contact;
            contact.tag = input.tag;
            contact.returnKeyType = UIReturnKeyDone;
            contact.borderStyle = _borderStyle;
            if(bEdit) contact.placeholder = @"输入联系方式";
            contact.font = font;
            [contact setEnabled:bEdit];
            // 绑定事件
            [contact addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [contact addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [contact addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: contact];
            [items addObject: input];
            
            // 联系地址
            input = [[iOSInput new] autorelease];
            [input setName:@"联系地址"];
            [input setTag:TAG_FIELD_ADDRESS];
            address = [[UITextField alloc] initWithFrame:frame];
            address.text = ucInfo.address;
            address.tag = input.tag;
            address.returnKeyType = UIReturnKeyDone;
            address.borderStyle = _borderStyle;
            if(bEdit) address.placeholder = @"输入联系地址";
            address.font = font;
            [address setEnabled:bEdit];
            // 绑定事件
            [address addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [address addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [address addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: address];
            [items addObject: input];
            
            // 邮政编码
            input = [[iOSInput new] autorelease];
            [input setName:@"邮政编码"];
            [input setTag:TAG_FIELD_POSTCODE];
            postCode = [[UITextField alloc] initWithFrame:frame];
            postCode.text = ucInfo.postCode;
            postCode.tag = input.tag;
            postCode.keyboardType = UIKeyboardTypeNumberPad;
            postCode.returnKeyType = UIReturnKeyDone;
            postCode.borderStyle = _borderStyle;
            if(bEdit) postCode.placeholder = @"输入邮政编码";
            postCode.font = font;
            [postCode setEnabled:bEdit];
            // 绑定事件
            [postCode addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [postCode addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [postCode addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: postCode];
            [items addObject: input];
            
            // 电子邮箱
            input = [[iOSInput new] autorelease];
            [input setName:@"电子邮箱"];
            [input setTag:TAG_FIELD_EMAIL];
            email = [[UITextField alloc] initWithFrame:frame];
            email.text = ucInfo.email;
            email.tag = input.tag;
            email.returnKeyType = UIReturnKeyDone;
            email.keyboardType = UIKeyboardTypeEmailAddress;
            email.borderStyle = _borderStyle;
            if(bEdit) email.placeholder = @"输入邮箱地址";
            email.font = font;
            [email setEnabled:bEdit];
            // 绑定事件
            [email addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [email addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [email addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: email];
            [items addObject: input];
            
            // 微博
            input = [[iOSInput new] autorelease];
            [input setName:@"微博"];
            [input setTag:TAG_FIELD_WEIBO];
            weibo = [[UITextField alloc] initWithFrame:frame];
            weibo.text = ucInfo.weibo;
            weibo.tag = input.tag;
            weibo.keyboardType = UIKeyboardTypeURL;
            weibo.returnKeyType = UIReturnKeyDone;
            weibo.borderStyle = _borderStyle;
            if(bEdit) weibo.placeholder = @"输入微博地址";
            weibo.font = font;
            [weibo setEnabled:bEdit];
            // 绑定事件
            [weibo addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            
            [weibo addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [weibo addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: weibo];
            [items addObject: input];
            
            // 身份证号码
            input = [[iOSInput new] autorelease];
            [input setName:@"身份证号码"];
            [input setTag:TAG_FIELD_IDNUMBER];
            idNumber = [[UITextField alloc] initWithFrame:frame];
            idNumber.text = ucInfo.idNumber;
            idNumber.tag = input.tag;
            idNumber.keyboardType = UIKeyboardTypeNumberPad;
            idNumber.returnKeyType = UIReturnKeyDone;
            idNumber.borderStyle = _borderStyle;
            if(bEdit) idNumber.placeholder = @"输入身份证号码";
            idNumber.font = font;
            [idNumber setEnabled:bEdit];
            // 绑定事件
            [idNumber addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            [idNumber addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [idNumber addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: idNumber];
            [items addObject: input];
            
            // QQ
            input = [[iOSInput new] autorelease];
            [input setName:@"QQ号码"];
            [input setTag:TAG_FIELD_QQ];
            QQ = [[UITextField alloc] initWithFrame:frame];
            QQ.text = [NSString valueOf:ucInfo.QQ];
            QQ.tag = input.tag;
            QQ.keyboardType = UIKeyboardTypeNumberPad;
            QQ.returnKeyType = UIReturnKeyDone;
            QQ.borderStyle = _borderStyle;
            if(bEdit) QQ.placeholder = @"输入QQ号码";
            QQ.font = font;
            [QQ setEnabled:bEdit];
            [QQ addTarget:self action:@selector(editBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
            // 绑定事件
            [QQ addTarget:self action:@selector(textRestore:) forControlEvents:UIControlEventEditingDidEndOnExit];
            [QQ addTarget:self action:@selector(textUpdate:) forControlEvents:UIControlEventEditingChanged];
            [input setObject: QQ];
            [items addObject: input];
        }
               
        // 处理所有文本输入框的被键盘挡住问题
        //[super unregisterForKeyboardNotifications];
    }
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return 2;
    int count = [items count];
    if (idDest > 0) {
        count += 1;
    }
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int xHeight = 36;
    if (idDest > 0 && indexPath.row == 0) {
        xHeight = 90;
    }
	return xHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    for (UIView *view in [cell.contentView subviews]) {
        [view removeFromSuperview];
    }
    
    // Configure the cell.
    int pos = [indexPath row];
    //if (pos >= [items count]) {
    if (pos >= [tableView numberOfRowsInSection:0]) {
        //[cell release];
        return nil;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (idDest > 0 && pos == 0) {
        // 加载照片
        NSString *photoName = [Api uc_photo_name:idDest];
        if (![Api fileIsExists:photoName]) {
            // 如果照片不存在, 进行下载
            [Api uc_photo_down:idDest];
        }
        UIImage *im = nil;
        CGRect frame = CGRectMake(0.00f, 5.00f, 80, 80);
        cell.imageView.frame = frame;
        if ([Api fileIsExists:photoName]) {
            
            NSString *filePath = [iOSFile path:[Api filePath:photoName]];
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            if (data.length > 0) {
                 im = [UIImage imageWithData:data];
            } else {
                im = [UIImage imageNamed:@"usercenter_userinfo_image_default.png"];
            }
        } else {
            im = [UIImage imageNamed:@"usercenter_userinfo_image_default.png"];
        }
        [cell.imageView loadImage:im];
        
        
        // 增加统计信息
        ucToal *total = [[Api uc_total_get:idDest] retain];
        cell.textLabel.text = ucInfo.nicname;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"个人码：%d\r\n访问数：%d", total.codeCount, total.totalCount];
        [total release];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(250.00f, 5.00f, 40, 40);
        [btn setImage:[UIImage imageNamed:@"nav-edit@2x.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"nav-edit@2x.png"] forState:UIControlStateHighlighted];
        btn.backgroundColor = [UIColor purpleColor];
        [btn addTarget:self action:@selector(doSay:event:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
        return cell;
    }
    if (idDest > 0) {
        pos = pos - 1;
    }
    iOSInput *obj = [items objectAtIndex: pos];
    // 设定标题
    cell.textLabel.text = [NSString stringWithFormat:@"%-20@", [obj name]];
    cell.textLabel.font = font;
    cell.accessoryType = UITableViewCellAccessoryNone;
    [obj.object setTag:indexPath.row];
    [cell.contentView addSubview:[obj object]];
    return cell;
}

- (void)doSay:(id)sender event:(id)event {
    UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle: @"说点什么吧"
						  message:[NSString stringWithFormat:@"\n\n"]
						  delegate:self
						  cancelButtonTitle:@"取消"
						  otherButtonTitles:@"发表", nil];
    content = [[UITextField alloc] initWithFrame:CGRectMake(12, 60, 260, 25)];
	[content setTag:1001];
	CGAffineTransform mytrans = CGAffineTransformMakeTranslation(-0, -150);
	[alert setTransform:mytrans];
	[content setBackgroundColor:[UIColor whiteColor]];
	[alert addSubview:content];
	[alert show];
	[alert release];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger) buttonIndex{
    if (buttonIndex == 1) {
        NSString *msg = [content.text trim];
        if (msg.length < 1) {
            [iOSApi Alert:ALERT_TITLE message:@"内容不能为空"];
            return;
        } else {
            ApiResult *iRet = [[Api uc_comment_add:idDest content:msg] retain];
            [iOSApi Alert:ALERT_TITLE message:iRet.message];
            [iRet release];
        }
    }
}

@end