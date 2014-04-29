object-c基础（本人主页：http://amswf.com ）
==================
## 调试函数
<br/>NSLog(@"hello world!");
<br/>NSLog(@"%@",name);	//打印字符串
<br/>NSLog(@"%c",a);   	//打印单个字符
<br/>NSLog(@"%i",isTrue);//打印布尔值
<br/>NSLog(@"%i",i);		//打印整形变量
<br/>NSLog(@"%f",f);		//打印单精度浮点数
<br/>NSLog(@"%.2f",f);	//打印单精度浮点数,且只保留两位小数
<br/>NSLog(@"%e",f);		//打印科学技术法
<br/>NSLog(@"i＝%i,f=%f",i,f);//同时打印两个整数

## 变量

#### 变量分类

object-c中变量分成三种：基本数据类型,对象类型,id类型。
<br/>
* 基本数据类型有：int,float,double,char类型和BOOL（YES NO）。
* 对象类型就是类或协议所声明的指针类型：NSString *str = @"我是字符串";
* id类型可以表示任何类型，一般只是表示对象类型，不表示基本数据类型。
* nil

#### 变量定义
<br/>int a ＝ 2;
<br/>NSString *str = @"我是字符串";
<br/>定义规则：变量类型在前，变量名在后。

## 类

在XCode中选择File->New->File...->Cocoa Touch->Object-c Class->填上类名和继承关系后，XCode就会生成想要的新类。新类会产生两个新文件，一个是.h结尾，一个是.m结尾。
<br/>.h文件用来描述类，类的属性和方法
<br/>.m文件用来实现.h中定义的属性和方法。

////////////////////Calculator.h////////////////////

<code>   
 #import \<Foundation/Foundation.h\>
@interface Calculator : NSObject
{
    int numerator;//分子
    int denominator;//分母
}
-(void)print;
-(void)setNumerator:(int)n ;
-(void)setDenominator:(int)d;
@end 
</code>

////////////////////Calculator.m////////////////////

<code>      
 #import "Calculator.h"
<br/>@implementation Calculator
<br/>-(void)print{
<br/>    NSLog(@"numerator=%i,denominator=%i",numerator,denominator);
<br/>}
<br/>-(void)setNumerator:(int)n{
<br/>numerator = n;
<br/>}
<br/>-(void)setDenominator:(int)d{
<br/>    denominator = d;
<br/>}
<br/>@end     
</code>

<br/>在类的定义中-表示类的实例方法，+表示类方法

## 循环和条件语句
#### 循环
<code> 
int num;
<br/>num = 0;
<br/>for (int n =0; n <5; n++) {
<br/>    num += n;
<br/>    NSLog(@"%i",num);
<br/>} 
 </code>
#### 条件语句
<code> 
if(){
<br/>    
<br/>}else if(){
<br/>   
<br/>}else{
<br/>   
<br/>} 
 </code>
#### switch语句
<code> 
switch(){
<br/>     case :
<br/>     break;
<br/>     case :
<br/>     break;
<br/>     case :
<br/>     break;
<br/>     default:
<br/>     break;
<br/>} 
</code>

## 存取方法
<br/>在.h文件中用@property定义变量
<br/>在.m文件中使用@synthesize指令

//////////////////////Calculator.h/////////////////////

<code> 
 #import \<Foundation/Foundation.h\>
<br/>@interface Calculator : NSObject
<br/>{
<br/>    int numerator;//分子
<br/>    int denominator;//分母
<br/>}
<br/>//存取方法
<br/>@property int numerator,denominator;
<br/>-(void)print;
<br/>-(void)setNumerator:(int)n ;
<br/>-(void)setDenominator:(int)d;
<br/>@end 
</code> 

////////////////////Calculator.m////////////////////

<code> 
 #import "Calculator.h"
<br/>@implementation Calculator
<br/>@synthesize numerator,denominator;
<br/>-(void)print{
<br/>    NSLog(@"numerator=%i,denominator=%i",numerator,denominator);
<br/>}
<br/>-(void)setNumerator:(int)n{
<br/>    numerator = n;
<br/>}
<br/>-(void)setDenominator:(int)d{
<br/>    denominator = d;
<br/>}
<br/>@end 
</code> 

## 多参数方法
#### 带参数名的方法
<br/>.h中
<br/>-(void)setDenominator:(int)d setNumerator:(int)n;
<br/>.m中

<code> 
 -(void)setDenominator:(int)d setNumerator:(int)n{
<br/>    numerator = n;
<br/>    denominator = d;
<br/>} 
</code> 

#### 不带参数名的方法
<br/>.h中
<br/>-(void)set:(int)d :(int)n;
<br/>.m中

<code> 
 -(void)set:(int)d:(int)n{
<br/>    numerator = n;
<br/>    denominator = d;
<br/>} 
</code> 

<br/>调用：
<br/>[calc set:1:3];

#### 局部变量
<br/>在函数内部声明的变量为局部变量。
<br/>在函数中声明的变量前加上static后，局部变量可以保存多次方法调用所得的值。
<br/>@class XYPoint方法可以让编译器不使用import 'XYPoint.h'的情况下把XYPoint当成类来使用

## objc中的hasOwnPreotry方法
@selector


## 处理异常
<code>
 @try{
<br/>    
<br/>}
<br/>@catch(NSException *err){
<br/>    
<br/>} 
</code>

## 分类
<br/>分类可以为已有的类添加新的方法，并且可以分散实现
<br/>为NSString添加新方法

<code>
 #import \<Foundation/Foundation.h\>
<br/>@interface NSString (NewString)
<br/>-(int)toNumber;
<br/>@end 
</code>


<code>
 #import "NSString+NewString.h"
<br/>@implementation NSString (NewString)
<br/>-(int)toNumber{
<br/>    return 123;
<br/>}
<br/>@end
</code>

## 协议
<br/>协议相当于as中的接口：多个类共享的方法列表

<code>
 #import \<Foundation/Foundation.h\>
<br/>@protocol ICar <NSObject>
<br/>-(void)run;
<br/>@end 
</code>

实现协议

<code>
 #import \<Foundation/Foundation.h\>
<br/>#import "ICar.h"
<br/>
<br/>@interface Car : NSObject <ICar>
<br/>-(void)run;
<br/>@end 
</code>

Object-c2.0增加两个协议修饰符@optional和@required

<code>
 #import \<Foundation/Foundation.h\>
<br/>@protocol ICar <NSObject>
<br/>-(void)run;
<br/>@optional
<br/>-(void)start;
<br/>@required
<br/>-(void)swing;
<br/>@end 
</code>

这个协议里面有两个必须实现的方法run和swing，有一个选择实现的方法start


## 静态属性和方法
#### 静态属性
在Object C的语法中声明后的static静态变量在其他类中是不能通过类名直接访问的，它的作用域只能是在声明的这个.m文件中。
static 属性只能定义在implementation中，而不能定义在interface中，而且写在implementation之外或者方法之中。

<code>
 #import "Person.h"
<br/>static int count;
<br/>@implementation Person
<br/>@synthesize age;
<br/>@synthesize name;
<br/>-(void) write{    
<br/>	NSLog(@"姓名:%@  年龄:%i",name,age);
<br/>}
<br/>+(void) hello{    
<br/>	count++;    
<br/>	NSLog(@"static = %i",count);
<br/>}
<br/>@end 
</code>

#### 静态方法
静态方法 就是将 "-" 改为 "+" 即可。
<br/>　　+(void) hello; 在interface中定义如上方法签名，而在implementation中实现这个方法。 
