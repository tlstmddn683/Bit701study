# #r,g,b 색상과 반지름을 입력하면 해당 색상으로 채워진 원을 그리시오
# import turtle as t
# ws=t.Screen()
# ws.colormode(255)


# r=int(input("색상의 R값 입력:"))
# g=int(input("색상의 G값 입력:"))
# b=int(input("색상의 B값 입력:"))
# rad=int(input("반지름 입력:"))
# t.color((r,g,b))
# t.begin_fill()
# t.circle(rad)
# t.end_fill()
# t.exitonclick()

# import turtle as t

# # 터틀 스크린 설정
# ws = t.Screen()
# ws.colormode(255)

# # 꽃잎 색상 설정
# petal_color = (255, 0, 0)  # 빨간색

# # 꽃잎 그리기
# t.color(petal_color)
# t.begin_fill()
# for _ in range(36):
#     t.forward(50)
#     t.left(170)
# t.end_fill()

# # 꽃 중앙 그리기
# center_color = (255, 255, 0)  # 노란색
# t.penup()
# t.goto(0, -50)
# t.pendown()
# t.color(center_color)
# t.begin_fill()
# t.circle(10)
# t.end_fill()

# # 터틀 종료
# t.exitonclick()

# import turtle as t
# import random

# # 터틀 스크린 설정
# ws = t.Screen()
# ws.colormode(255)

# # 터틀 초기 설정
# t.speed(0)
# t.shape("turtle")

# # 재미있는 패턴 그리기
# for _ in range(100):
#     # 랜덤한 이동 거리와 각도 설정
#     distance = random.randint(1, 100)
#     angle = random.randint(0, 360)

#     # 랜덤한 색상 설정
#     r = random.randint(0, 255)
#     g = random.randint(0, 255)
#     b = random.randint(0, 255)
#     t.color((r, g, b))

#     # 랜덤한 이동 방향으로 이동
#     random_choice = random.choice(["forward", "backward"])
#     if random_choice == "forward":
#         t.forward(distance)
#     else:
#         t.backward(distance)

#     # 랜덤한 각도로 회전
#     random_choice = random.choice(["left", "right"])
#     if random_choice == "left":
#         t.left(angle)
#     else:
#         t.right(angle)

# # 터틀 종료
# t.exitonclick()
# import turtle as t

# # 터틀 스크린 설정
# ws = t.Screen()
# ws.colormode(255)

# # 모나리자 그리기
# t.speed(0)

# # 얼굴 그리기
# t.penup()
# t.goto(0, -100)
# t.pendown()
# t.color(230, 200, 167)  # 얼굴 색상
# t.begin_fill()
# t.circle(100)
# t.end_fill()

# # 눈 그리기
# t.penup()
# t.goto(-40, 20)
# t.pendown()
# t.color("black")  # 눈 색상
# t.begin_fill()
# t.circle(15)
# t.end_fill()

# t.penup()
# t.goto(40, 20)
# t.pendown()
# t.color("black")  # 눈 색상
# t.begin_fill()
# t.circle(15)
# t.end_fill()

# # 입 그리기
# t.penup()
# t.goto(-60, -30)
# t.pendown()
# t.color("black")  # 입 색상
# t.width(8)
# t.right(90)
# t.circle(60, 180)

# # 머리카락 그리기
# t.penup()
# t.goto(-100, 100)
# t.pendown()
# t.color("black")  # 머리카락 색상
# t.width(2)
# for _ in range(30):
#     t.forward(200)
#     t.right(170)

# # 터틀 종료
# t.exitonclick()
import turtle as t
import random

# 터틀 스크린 설정
ws = t.Screen()
ws.colormode(255)

# 별 그리기
t.speed(0)
t.penup()

for _ in range(50):
    # 랜덤한 위치로 이동
    x = random.randint(-200, 200)
    y = random.randint(-200, 200)
    t.goto(x, y)

    # 랜덤한 크기와 색상 설정
    size = random.randint(1, 5)
    r = random.randint(200, 255)
    g = random.randint(200, 255)
    b = random.randint(200, 255)
    t.pendown()
    t.color((r, g, b))

    # 별 그리기
    t.begin_fill()
    for _ in range(5):
        t.forward(size)
        t.right(144)
    t.end_fill()

# 터틀 종료
t.exitonclick()
