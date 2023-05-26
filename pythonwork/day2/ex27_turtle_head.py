import turtle as t

ws=t.Screen()
ws.colormode(255)
t.shape("turtle")
t.turtlesize(5)
t.width(5)

t.color(255,155,44)
t.setheading(90)#위
t.fd(100)

t.setheading(360)#우
t.fd(100)

t.setheading(270)#아래
t.fd(100)

t.setheading(180)#좌
t.fd(100)

t.exitonclick()