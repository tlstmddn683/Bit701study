import turtle as t
colors=["red","purple","pink","green","orange","yellow","gray"]

t.bgcolor("black")
t.speed(0)#제일 빠른 속도
t.width(3)
length=10

#반복문 while
while length<500:
    t.forward(length)
    t.pencolor(colors[length%7])
    t.right(144)
    length+=5
t.exitonclick()