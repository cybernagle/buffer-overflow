# cse-buffer-overflow

Buffer overflow lab address: https://courses.cs.washington.edu/courses/cse351/17sp/lab-3.html

## 基本知识

https://github.com/NagleZhang/Binary-Bomb.git

## 实验目的

了解栈的工作方式

## 实验条件

1. https://github.com/NagleZhang/cse-buffer-overflow
2. git 
3. gdb
4. objdump
5. linux

## 实验本身

我们要做什么？

1. 阅读 bufbomb.c, 理解调用逻辑。
2. 将 bufbomb 反汇编。了解在堆栈中程序的状态。
3. hack 正在运行的程序， 通过堆栈溢出的方式，做一些原程序意愿的事情.



## 路径解释

答案分别在各自 level 的文件夹当中. 细则如下:

- bytes , 二进制转换成 ascii 的结果, 也是被 bufbomb 直接消费的内容.

- text, 答案本身. 需要通过 sendstring 转换成 ascii, 才能够被 bufbomb 消费.

- core.S, 各个关卡中 bufbomb 所使用的函数汇编码. 

- 其他关卡本身需要的东西不一一列举. 

-   

### 第零关 test $\rightarrow$ smoke 栈溢出攻击

第零关的二进制程序叫做 bufbomb 
我们可以阅读 bufbomb.c 这个程序，会发现里面有几个函数。test() / smoke() / getbuf().

test 会调用 getbuf。然后进行返回。 
我们的目的是， 在getbuf 完成后，不返回test，而是直接跳转到 smoke()



## 第一关 test() $\rightarrow$ fizz() 覆盖参数

这一关卡和第二关本身无太大区别, 多了几个参数, 所以解决方案也一致. 无非是在 stack 当把参数也进行覆盖操作. 

## 第二关 test() $\rightarrow$ bang() 在栈上执行代码

这一关卡, 试验者将试图把汇编代码放入到栈当中, 再通过第 0/1 关学习到的覆盖 rip 的内容的手段, 把返回地址覆盖为栈地址. 

从而执行自定义的汇编代码(修改 global_value), 并且再次返回到 bang() 函数. 通过其对比逻辑. 

比较有用的命令: `x \20i $address` 可以用来验证自己写入到栈当中的代码是否正确. 



## 实验工具

| 文件名称       | 描述                                                                                                 |
| ---------- | -------------------------------------------------------------------------------------------------- |
| makecookie | Generates a "cookie" based on some string (which will be your username) 基于字符串生成一个 “cookie” (用你的姓名) |
| bufbomb    | 你需要进行攻击的二进制文件                                                                                      |
| bufbomb.c  | 二进制文件的源码                                                                                           |
| sendstring | 将 hex 转换成 ascii                                                                                    |
| Makefile   | 测试是否通过                                                                                             |

#### sendstring

>  sendstring 的作用是将地址转换成string类型。
> 为什么要有这个东西的存在呢？ 是因为我们程序在跳转的过程当中， 寄存器会存储各种地址，而我们如果将目的地址解析成各种字符串，然后再去写答案会非常的不方便，所以这个工具也就应运而生。

> 打个比方说，我们的一个地址是 0x41414141, 如果我们在写答案的时候，需要将其转换成 string 类型，那么我们必须要把地址拆成 41 41 41 41，然后我们去找到 ascii 码表，一个一个的对应，这样我们会花去很多的时间。
> 而使用 sendstring ，我们就很方便了，直接在答案里面填写41 41 41 41(比如说写到 result.txt的文件当中),然后再使用命令 `cat result.txt | sendstring` 这样我们就会得到 `AAAA`，这一串字符了。
