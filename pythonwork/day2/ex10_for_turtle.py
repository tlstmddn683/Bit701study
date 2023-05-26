import turtle as t

t.color("orange")
t.begin_fill()#채우기색 시작
t.pencolor("orange") #펜색상
t.width(5)#펜 굵기
t.speed(10) #0~10 : 0 은 10과 같이 가장 빠른속도(1이 가장 느리다)
t.shape("triangle")#turtle,circle,classic,triangle

n=4
for x in range(n):
    t.fd(70)
    t.lt(360/n)
t.end_fill()#채우기 색 끝
t.exitonclick()
