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

### 第一关 test -> smoke
第一关的二进制程序叫做 bufbomb 
我们可以阅读 bufbomb.c 这个程序，会发现里面有几个函数。test() / smoke() / getbuf().
```
void test()
{
  unsigned long long val;
  volatile unsigned long long local = 0xdeadbeef;
  char* variable_length;
  entry_check(3);  /* Make sure entered this function properly */
  val = getbuf();
  if (val <= 40) {
    variable_length = alloca(val);
  }
  entry_check(3);
  /* Check for corrupted stack */
  if (local != 0xdeadbeef) {
    printf("Sabotaged!: the stack has been corrupted\n");
  }
  else if (val == cookie) {
    printf("Boom!: getbuf returned 0x%llx\n", val);
    if (local != 0xdeadbeef) {
      printf("Sabotaged!: the stack has been corrupted\n");
    }
    validate(3);
  }
  else {
    printf("Dud: getbuf returned 0x%llx\n", val);
  }
}
unsigned long long getbuf()
{
  char buf[36];
  volatile char* variable_length;
  int i;
  unsigned long long val = (unsigned long long)Gets(buf);
  variable_length = alloca((val % 40) < 36 ? 36 : val % 40);
  for(i = 0; i < 36; i++)
  {
	variable_length[i] = buf[i];
  }
  return val % 40;
}
void smoke()
{
  entry_check(0);  /* Make sure entered this function properly */
  printf("Smoke!: You called smoke()\n");
  validate(0);
  exit(0);
}
```

test 会调用 getbuf。然后进行返回。 
我们的目的是， 在getbuf 完成后，不返回test，而是直接跳转到 smoke()

## 实验工具
1. sendstring
sendstring 的作用是将地址转换成string类型。
为什么要有这个东西的存在呢？ 是因为我们程序在跳转的过程当中， 寄存器会存储各种地址，而我们如果将目的地址解析成各种字符串，然后再去写答案会非常的不方便，所以这个工具也就应运而生。

打个比方说，我们的一个地址是 0x41414141, 如果我们在写答案的时候，需要将其转换成 string 类型，那么我们必须要把地址拆成 41 41 41 41，然后我们去找到 ascii 码表，一个一个的对应，这样我们会花去很多的时间。
而使用 sendstring ，我们就很方便了，直接在答案里面填写41 41 41 41(比如说写到 result.txt的文件当中),然后再使用命令 `cat result.txt | sendstring` 这样我们就会得到 `AAAA`，这一串字符了。

2. gdb
3. objdump
