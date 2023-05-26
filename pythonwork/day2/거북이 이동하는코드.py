import turtle
import random

def move_turtle(distance):
    turtle.color(random.choice(["red", "blue", "green", "orange", "purple"]))
    turtle.forward(distance)
    turtle.right(random.randint(0, 360))

def within_screen():
    x, y = turtle.position()
    screen_width = turtle.window_width() / 2
    screen_height = turtle.window_height() / 2

    return -screen_width < x < screen_width and -screen_height < y < screen_height

turtle.speed("fastest")
turtle.shape("turtle")

while True:
    number = int(input("이동 횟수를 입력하세요 (0 입력 시 종료): "))
    
    if number == 0:
        break

    for _ in range(number):
        move_turtle(100)
        if not within_screen():
            turtle.undo()  # 이동 취소

turtle.done()
