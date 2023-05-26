import random as r
import turtle as t

# rnd=r.randint(1,100) #1~100 사이 난수 구함
# print("주사위 데굴데굴:",rnd)
ws=t.Screen()
ws.colormode(255)
while True:
    x=int(input("x좌표 입력(999입력시 종료):"))
    if x==999:
        print("종료")
        break
    y=int(input("y좌표 입력:"))

    t.penup()
    t.shape("turtle")
    t.goto(x,y)

    one=r.randint(0,255)
    two=r.randint(0,255)
    three=r.randint(0,255)
    
    t.color(one,two,three)
    t.turtlesize(3)
    t.write("Good!",align="center",font=("Comic Sans MS",30,"bold"))
