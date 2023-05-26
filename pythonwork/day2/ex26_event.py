import turtle as t
def mywrite(msg):
    t.write(msg,align="center",font=("Impact",24,"bold"))
def key_up():
    t.clear()#그래픽 전체 지우기
    mywrite("Up Key!!")
def key_down():
    t.clear()#그래픽 전체 지우기
    mywrite("Down Key!!")
def key_left():
    t.clear()#그래픽 전체 지우기
    mywrite("Left Key!!")
def key_right():
    t.clear()#그래픽 전체 지우기
    mywrite("Right Key!!")
def key_sp():
    t.clear()#그래픽 전체 지우기
    mywrite("Space Key!!")

#이벤트 발생
t.onkeypress(key_up,"Up")#호출할함수명,키값(첫글자 무조건 대문자)
t.onkeypress(key_down,"Down")#호출할함수명,키값(첫글자 무조건 대문자)
t.onkeypress(key_left,"Left")#호출할함수명,키값(첫글자 무조건 대문자)
t.onkeypress(key_right,"Right")#호출할함수명,키값(첫글자 무조건 대문자)
t.onkeypress(key_sp,"space")#호출할함수명,키값(소문자)

t.listen()#키를 받을 수 있도록 포커스를 그래픽창으로 주는 것

t.exitonclick()