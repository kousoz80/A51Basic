'a$="192.168.xx.xx:23"
input "address",a$

open "net:"+a$ as #1

' ネゴシエーション

@loop01:
 b=recv(1)
 if b<0 then @loop01

  if b<>255 then @enter1

@loop02:
 c=recv(1)
 if c<0 then @loop02

@loop03:
 d=recv(1)
 if d<0 then @loop03


  if c=253 then c=252

'print b;c;d

send 1,b
send 1,c
send 1,d

 
 goto @loop01

' ターミナルプログラムのメインループ
@loop1:
 if eof(1)=1 then @exit1
 b=recv(1)
@enter1:
 if b>=0 then print chr$(b);:goto @loop1
 
@xxx:
 c=asc(inkey$)
 if c=0 then @loop1
 if c=34 then @exit1
 send 1,c 
 goto @loop1

@exit1:
 print
 close
 end
