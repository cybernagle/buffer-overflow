0000000000400da0 <getbuf>:
  400da0:	55                   	push   %rbp
  400da1:	48 89 e5             	mov    %rsp,%rbp
  400da4:	48 83 ec 30          	sub    $0x30,%rsp
  400da8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  400dac:	e8 ff fe ff ff       	callq  400cb0 <Gets>
  400db1:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  400db8:	cc cc cc 
  400dbb:	48 89 c1             	mov    %rax,%rcx
  400dbe:	48 f7 e2             	mul    %rdx
  400dc1:	48 c1 ea 05          	shr    $0x5,%rdx
  400dc5:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  400dc9:	48 89 ca             	mov    %rcx,%rdx
  400dcc:	48 c1 e0 03          	shl    $0x3,%rax
  400dd0:	48 29 c2             	sub    %rax,%rdx
  400dd3:	b8 24 00 00 00       	mov    $0x24,%eax
  400dd8:	48 83 fa 24          	cmp    $0x24,%rdx
  400ddc:	48 0f 43 c2          	cmovae %rdx,%rax
  400de0:	31 c9                	xor    %ecx,%ecx
  400de2:	48 83 c0 1e          	add    $0x1e,%rax
  400de6:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  400dea:	48 29 c4             	sub    %rax,%rsp
  400ded:	4c 8d 44 24 0f       	lea    0xf(%rsp),%r8
  400df2:	49 83 e0 f0          	and    $0xfffffffffffffff0,%r8
  400df6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400dfd:	00 00 00 
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
  400f0c:	48 39 d3             	cmp    %rdx,%rbx
  400f0f:	75 1f                	jne    400f30 <test+0x60>
  400f11:	48 3b 05 08 14 20 00 	cmp    0x201408(%rip),%rax        # 602320 <cookie>
  400f18:	48 89 c6             	mov    %rax,%rsi
  400f1b:	74 33                	je     400f50 <test+0x80>
  400f1d:	bf 08 13 40 00       	mov    $0x401308,%edi
  400f22:	31 c0                	xor    %eax,%eax
  400f24:	e8 c7 f8 ff ff       	callq  4007f0 <printf@plt>
  400f29:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  400f2d:	c9                   	leaveq 
  400f2e:	c3                   	retq   
  400f2f:	90                   	nop
  400f30:	bf f8 14 40 00       	mov    $0x4014f8,%edi
  400f35:	e8 a6 f8 ff ff       	callq  4007e0 <puts@plt>
  400f3a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  400f3e:	c9                   	leaveq 
  400f3f:	c3                   	retq   
  400f40:	48 8d 50 1e          	lea    0x1e(%rax),%rdx
  400f44:	48 83 e2 f0          	and    $0xfffffffffffffff0,%rdx
  400f48:	48 29 d4             	sub    %rdx,%rsp
  400f4b:	eb ac                	jmp    400ef9 <test+0x29>
  400f4d:	0f 1f 00             	nopl   (%rax)
  400f50:	31 c0                	xor    %eax,%eax
  400f52:	bf 28 15 40 00       	mov    $0x401528,%edi
  400f57:	e8 94 f8 ff ff       	callq  4007f0 <printf@plt>
  400f5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400f60:	48 39 d8             	cmp    %rbx,%rax
  400f63:	74 0a                	je     400f6f <test+0x9f>
  400f65:	bf f8 14 40 00       	mov    $0x4014f8,%edi
  400f6a:	e8 71 f8 ff ff       	callq  4007e0 <puts@plt>
  400f6f:	bf 03 00 00 00       	mov    $0x3,%edi
  400f74:	e8 b7 fe ff ff       	callq  400e30 <validate>
  400f79:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  400f7d:	c9                   	leaveq 
  400f7e:	c3                   	retq   
  400f7f:	90                   	nop

0000000000401070 <fizz>:
  401070:	48 83 ec 08          	sub    $0x8,%rsp
  401074:	c7 05 32 12 20 00 01 	movl   $0x1,0x201232(%rip)        # 6022b0 <check_level>
  40107b:	00 00 00 
  40107e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  401083:	48 3b 35 96 12 20 00 	cmp    0x201296(%rip),%rsi        # 602320 <cookie>
  40108a:	74 13                	je     40109f <fizz+0x2f>
  40108c:	bf b0 15 40 00       	mov    $0x4015b0,%edi
  401091:	31 c0                	xor    %eax,%eax
  401093:	e8 58 f7 ff ff       	callq  4007f0 <printf@plt>
  401098:	31 ff                	xor    %edi,%edi
  40109a:	e8 21 f8 ff ff       	callq  4008c0 <exit@plt>
  40109f:	bf 90 15 40 00       	mov    $0x401590,%edi
  4010a4:	31 c0                	xor    %eax,%eax
  4010a6:	e8 45 f7 ff ff       	callq  4007f0 <printf@plt>
  4010ab:	bf 01 00 00 00       	mov    $0x1,%edi
  4010b0:	e8 7b fd ff ff       	callq  400e30 <validate>
  4010b5:	eb e1                	jmp    401098 <fizz+0x28>
  4010b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4010be:	00 00 

