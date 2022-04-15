///**
/**
Categoties
Created by: Tom.Liu on 2021/1/4
Github : https://github.com/lyleLH

 	 * ⣿⣿⣿⣿⣿⣿⢟⣡⣴⣶⣶⣦⣌⡛⠟⣋⣩⣬⣭⣭⡛⢿⣿⣿⣿⣿
	 * ⣿⣿⣿⣿⠋⢰⣿⣿⠿⣛⣛⣙⣛⠻⢆⢻⣿⠿⠿⠿⣿⡄⠻⣿⣿⣿ 
	 * ⣿⣿⣿⠃⢠⣿⣿⣶⣿⣿⡿⠿⢟⣛⣒⠐⠲⣶⡶⠿⠶⠶⠦⠄⠙⢿ 
	 * ⣿⠋⣠⠄⣿⣿⣿⠟⡛⢅⣠⡵⡐⠲⣶⣶⣥⡠⣤⣵⠆⠄⠰⣦⣤⡀ 
	 * ⠇⣰⣿⣼⣿⣿⣧⣤⡸⢿⣿⡀⠂⠁⣸⣿⣿⣿⣿⣇⠄⠈⢀⣿⣿⠿ 
	 * ⣰⣿⣿⣿⣿⣿⣿⣿⣷⣤⣈⣙⠶⢾⠭⢉⣁⣴⢯⣭⣵⣶⠾⠓⢀⣴
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣉⣤⣴⣾⣿⣿⣦⣄⣤⣤⣄⠄⢿⣿
	 * ⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⢿
	 * ⣿⣿⣿⣿⣿⣿⡟⣰⣞⣛⡒⢒⠤⠦⢬⣉⣉⣉⣉⣉⣉⣉⡥⠴⠂⢸
	 * ⠻⣿⣿⣿⣿⣏⠻⢌⣉⣉⣩⣉⡛⣛⠒⠶⠶⠶⠶⠶⠶⠶⠶⠂⣸⣿
	 * ⣥⣈⠙⡻⠿⠿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠿⠛⢉⣠⣶⣶⣿⣿
	 * ⣿⣿⣿⣶⣬⣅⣒⣒⡂⠈⠭⠭⠭⠭⠭⢉⣁⣄⡀⢾⣿⣿⣿⣿⣿⣿

*/

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////
//MARK:-
//MARK:允许你添加 SEL 方法而不需要额外的成员变量的便利方法，SEL 方法比 block 安全，并且 SEL 方法比 block 容易阅读
//MARK:-
////////////////////////////////////////////////////////////////

NS_ASSUME_NONNULL_BEGIN

@interface MTSelector : NSObject
@property (nonatomic,weak) id target;
@property (nonatomic) SEL action;
- (void)perform:(id)obj id:(NSString *)identifier;
@end


@interface NSObject (MTExtension)
/// 添加一个SEL方法，默认 identifier 为 NSStringFromSlector(sel)
- (void)mt_addTarget:(id)target sel:(SEL)sel;
/// 添加一个SEL方法，identifier 为 identifier
- (void)mt_addTarget:(id)target sel:(SEL)sel identifier:(NSString *)identifer;
/// 通过 identifier 取出一个 sel
- (MTSelector *)mt_target:(NSString *)identifier;
/// 删除 sel
- (void)mt_removeTarget:(NSString *)identifier;
/// 调用sel
- (void)mt_callSel:(NSString *)identifier obj:(id)obj;



////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 函数的同步异步执行
//MARK:-
////////////////////////////////////////////////////////////////

- (void)mt_performAsyncBlockInBackground:(void (^)(void))pBlock;
- (void)mt_performSyncBlockInBackground:(void (^)(void))pBlock;

- (void)mt_performAsyncBlockOnMainThread:(void (^)(void))pBlock;
- (void)mt_performSyncBlockOnMainThread:(void (^)(void))pBlock;

////////////////////////////////////////////////////////////////
//MARK:-
//MARK: 归档和解档   类中必须要两个方法 <-encodeWithCoder:>和<-initWithCoder:>
//MARK:-
////////////////////////////////////////////////////////////////
///归档 必须在对象中实现 <-encodeWithCoder:>中手动调用此方法
- (void)mt_encodeObjectWithCoder:(NSCoder *)aCoder;

///解档 必须在对象中实现 <-initWithCoder:>中手动调用此方法
- (void)mt_decodeObjectCoder:(NSCoder *)aDecoder;

@end

NS_ASSUME_NONNULL_END
