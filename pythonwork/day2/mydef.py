import random as rnd
def mystar(num):
    for n in range(1,num+1):
        for i in range(1,n+1):
            print("★",end=" ")
        print()
    print("="*40) 
# mystar(5)
#turtle값을 인자로 받아서 색상과 크기를 랜덤하게 만드는 함수
def showturtle(tt):
    tt.penup()#펜을 들어서 이동하기 위한 동작
    tt.shape("turtle")# 거북이 모양 변경
    r=rnd.randint(1,255)
    g=rnd.randint(1,255)
    b=rnd.randint(1,255)
    ts=rnd.randint(1,30)

    tt.color(r,g,b)#거북이 색상 변경
    tt.turtlesize(ts)#거북이 크기 변경

    #위치랜덤
    x=rnd.randint(-200,200)
    y=rnd.randint(-200,200)
    tt.goto(x,y)
