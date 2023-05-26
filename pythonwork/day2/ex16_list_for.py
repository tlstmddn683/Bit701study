import turtle as t
list=["red","yellow","pink","black","orange","gray"]

t.speed(0)

# for count in range(6):#0~5
#     t.begin_fill()
#     t.color(list[count])
#     t.circle(100)
#     t.left(360/6)
#     t.end_fill()

for item in list:
    t.begin_fill()
    t.color(item)
    #print(list.index(item),item) #인덱스값 출력, 색상 출력
    t.circle(100)
    t.left(360/6)
    t.end_fill()
t.exitonclick()