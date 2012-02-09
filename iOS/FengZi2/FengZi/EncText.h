//
//  EncText.h
//  FengZi
//

//  Copyright (c) 2011年 iTotemStudio. All rights reserved.
//

#import "ITTBaseModelObject.h"

@interface EncText : ITTBaseModelObject{
    NSString* _content;
	NSString* _encContent;
	NSString* _key;	
	
	//标示身份的id，用作记录传递
	NSString* _logId;
}
@property (retain, nonatomic) NSString *content;
@property (retain, nonatomic) NSString *encContent;
@property (retain, nonatomic) NSString *key;
@property (retain, nonatomic) NSString *logId;
@end
