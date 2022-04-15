//
//  MTRouterMapperNode.h
//  MTRouterComponent
//
//  Created by stephen.chen on 2021/11/5.
//

#import <Foundation/Foundation.h>

#import "MTRouterUrlParser.h"
#import "MTRouterComponentDefines.h"
#import "MTRouterParameter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTRouterMapperNode : NSObject
@property (nonatomic, readonly) NSString *nodeFlag; ///< 节点标识
@property (nonatomic, readonly) NSString *url; ///< url
@property (nonatomic, readonly) NSString *urlParttern; ///< urlParttern
@property (nonatomic, readonly)BOOL urlDeregistedFlag; ///< 节点取消注册的标识
@property(nonatomic, readonly) MTRouterUrlExecuteAction executeAction; ///< url执行事件
@property (nonatomic, readonly) BOOL isNodesEmpty; ///< 路由是否为空
- (BOOL)ykInsertOneNodeWithUrl:(NSString *)url executeAction:(MTRouterUrlExecuteAction)executeAction error:(NSError **)err;
- (MTRouterMapperNode *)ykSearchNodeWithUrl:(NSString *)url absoluteFlag:(BOOL)absolute error:(NSError **)err;
- (void)ykDeregisteNode;
- (void)ykCleanNodes;

# pragma mark - debug methods
- (NSString *)ykRouterMapperJsonString;
- (NSDictionary *)ykRouterMapperDict;
@end

NS_ASSUME_NONNULL_END
