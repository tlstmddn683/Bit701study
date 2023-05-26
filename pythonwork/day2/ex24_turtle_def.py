import turtle as t
import random as r
#이동할 거리길이를 입력해서 반환하는 함수(입력을 다이얼로그로 받기)
def inp():
    n=int(t.textinput("이동거리 입력","input number?"))
    return n
list=["red","pink","gray","green","orange"]
t.shape("turtle")
t.width(3)
t.shapesize(3)#크기는 3배
while True:
    n=inp()
    if n==0:
        print("종료합니다")
        break
    idx=r.randint(0,4)
    t.color(list[idx])
    t.fd(n)
    t.setheading(abs(n))
t.exitonclick()