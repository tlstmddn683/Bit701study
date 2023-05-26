"""
list 에 10개 정도 색상 넣고
방향키를 움직일때 마다 랜덤 색상으로 거북이가 해당 방향으로 10씩 이동
스페이스 누르면 원위치
거북이 크기 굵기 자유
"""
import turtle
import random as rnd

# 거북이 색상 리스트
colors = ["red", "blue", "green", "orange", "purple", "yellow", "pink", "cyan", "magenta", "lime"]

def reset_position():
    t.goto(0, 0)

def move_up():
    t.setheading(90)
    t.forward(10)
    # change_color()

def move_down():
    t.setheading(270)
    t.forward(10)
    # change_color()

def move_left():
    t.setheading(180)
    t.forward(10)
    # change_color()

def move_right():
    t.setheading(0)
    t.forward(10)
    # change_color()

def change_color():
    color = rnd.choice(colors)
    t.color(color)

# 화면 설정
ws = turtle.Screen()
ws.title("Turtle Movement")
ws.bgcolor("white")
# 거북이 생성
t = turtle.Turtle()
image="D:/bit701naver/study/pythonwork/1.gif"
turtle.addshape("1.gif")
t.shape("1.gif")
# t.shape("turtle")
t.turtlesize(30)
t.width(30)

# 키 바인딩
ws.onkeypress(move_up, "Up")
ws.onkeypress(move_down, "Down")
ws.onkeypress(move_left, "Left")
ws.onkeypress(move_right, "Right")
ws.onkey(reset_position, "space")
ws.onkey(change_color, "c")
ws.listen()

turtle.done()

