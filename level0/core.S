0000000000400da0 <getbuf>:
  400da0:	55                   	push   %rbp
  400da1:	48 89 e5             	mov    %rsp,%rbp
  400da4:	48 83 ec 30          	sub    $0x30,%rsp
  400da8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  400dac:	e8 ff fe ff ff       	callq  400cb0 <Gets>
  400db1:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  400db8:	cc cc cc 
  400e00:	0f b6 7c 0d d0       	movzbl -0x30(%rbp,%rcx,1),%edi
  400e05:	49 8d 34 08          	lea    (%r8,%rcx,1),%rsi
  400e09:	48 83 c1 01          	add    $0x1,%rcx
  400e0d:	48 83 f9 24          	cmp    $0x24,%rcx
  400e11:	40 88 3e             	mov    %dil,(%rsi)
  400e14:	75 ea                	jne    400e00 <getbuf+0x60>
  400e16:	48 89 d0             	mov    %rdx,%rax
  400e19:	c9                   	leaveq 
  400e1a:	c3                   	retq   
  400e1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0000000000400ed0 <test>:
  400ed0:	55                   	push   %rbp
  400ed1:	b9 ef be ad de       	mov    $0xdeadbeef,%ecx
  400ed6:	31 c0                	xor    %eax,%eax
  400ed8:	48 89 e5             	mov    %rsp,%rbp
  400edb:	53                   	push   %rbx
  400edc:	48 83 ec 18          	sub    $0x18,%rsp
  400ee0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  400ee4:	c7 05 c2 13 20 00 03 	movl   $0x3,0x2013c2(%rip)        # 6022b0 <check_level>
  400eeb:	00 00 00 
  400eee:	e8 ad fe ff ff       	callq  400da0 <getbuf>
  400ef3:	48 83 f8 28          	cmp    $0x28,%rax
  400ef7:	76 47                	jbe    400f40 <test+0x70>
  400ef9:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
  400efd:	ba ef be ad de       	mov    $0xdeadbeef,%edx
  400f02:	c7 05 a4 13 20 00 03 	movl   $0x3,0x2013a4(%rip)        # 6022b0 <check_level>
  400f09:	00 00 00 
  400f2e:	c3                   	retq   
  400f74:	e8 b7 fe ff ff       	callq  400e30 <validate>
  400f79:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  400f7d:	c9                   	leaveq 
  400f7e:	c3                   	retq   
  400f7f:	90                   	nop
