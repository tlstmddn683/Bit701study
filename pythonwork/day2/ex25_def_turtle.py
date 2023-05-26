import turtle
import random as rnd

def showturtle(tt):
    tt.penup()
    tt.shape("turtle")
    r = rnd.randint(1, 255)
    g = rnd.randint(1, 255)
    b = rnd.randint(1, 255)
    ts = rnd.randint(1, 10)

    tt.color(r, g, b)
    tt.turtlesize(ts)

    x = rnd.randint(-200, 200)
    y = rnd.randint(-200, 200)
    tt.goto(x, y)

ws = turtle.Screen()
ws.colormode(255)

turtles = []

for _ in range(30):
    new_turtle = turtle.Turtle()
    turtles.append(new_turtle)

for t in turtles:
    showturtle(t)

turtle.exitonclick()

# 결과를 list로 출력
print(turtles)
