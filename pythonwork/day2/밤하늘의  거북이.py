import turtle
import random as rnd

def show_star(star):
    star.penup()
    star.shape("turtle")
    star.color("white")
    star.shapesize(0.5)

    x = rnd.randint(-200, 200)
    y = rnd.randint(-200, 200)
    star.goto(x, y)

ws = turtle.Screen()
ws.bgcolor("black")

stars = []

for _ in range(100):
    new_star = turtle.Turtle()
    stars.append(new_star)

for star in stars:
    show_star(star)

turtle.done()
