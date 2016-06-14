---
layout: post
title: 汇编语言学习1
comments: true
category: 工作
---

# helloword.asm 

`assume cs:code,ds:data		;声明代码段为code segment----code ends，数据段data segment---data ends


data segment
 msg db "hello world",0DH,0AH,24H  ;0DH,0AH,24H for 0DH,0AH回车换行，24H结束
data ends


code segment

start:      ;程序开始执行入口
  mov ax,data
  mov ds,ax    ;将数据段传入ds寄存器
  MOV DX,OFFSET msg ;将msg传如dx寄存器，或者lea dx msg也是可以的

  mov ah,9   ;输出字符串功能，但是必须先把字符串的地址送到DX中
  int 21h
  
  mov ah,4ch   ;MOV AX,4CH与INT 21H连用表示程序结束
  int 21h
      
code ends
end start`