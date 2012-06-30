//
//  EncryptTools.m
//  FengZi
//
//  Copyright (c) 2011年 fengxiafei.com. All rights reserved.
//

#import "PseudoBase64.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@implementation PseudoBase64

+ (NSString*)Base64EncryptString:(NSString*)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    data = [GTMBase64 encodeData:data];
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
}

+ (NSString*)Base64DecryptString:(NSString*)string{
    NSData *data = [GTMBase64 decodeString:string];
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
}
@end
