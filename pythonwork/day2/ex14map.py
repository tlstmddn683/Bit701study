#키,값 쌍으로 저장하는 데이터 형태
a={0:"zero",1:"one",2:"two",3:"three"}
a2=a.copy()
print(a)
print(a2)

b=a.keys() #키값만 따로 얻기
print(b)

c=a.values()
print(c)

#key 값을 이용해서 value 값을 얻는다
print(a.get(0))
print(a.get(1))
print(a.get(2))
print(a.get(3))

print(a.pop(0)) #0번 값을 꺼냄 *꺼내고 a에서 값을 지움*
print(a.pop(3)) #3번 값을 꺼냄 *꺼내고 a에서 값을 지움*
print(a)
print(a.items())

