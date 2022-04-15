//
//  MTRouterUrlParser.h
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MTRouterUrlParser;


@interface MTRouterUrlParser : NSObject<NSCopying>
@property (nonatomic,readonly) NSString *url;  ///< url
@property (nonatomic,readonly) NSDictionary<NSString *, NSString*> *queryparamaters;  ///< query parameters
@property (nonatomic,readonly) NSString *fragment;  ///< fragment
@property (nonatomic,readonly) NSString *urlParttern;  ///< urlParttern

+ (instancetype)ykParserUrl:(NSString *)url parameter:(NSDictionary * __nullable)parameter;
- (NSArray<NSString *> *)ykUrlSeperateResult;
@end

NS_ASSUME_NONNULL_END
