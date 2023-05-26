for n in range(1,10,2): #1~9 까지 2씩 증가
    print(n,end=" ")
print()

for n in range(10,100,10): #10~99까지 10씩증가 
    print(n,end=" ")
print()


for n in ["apple","banana","orange"]:
    print(n,end=" ")
print()

list=["red","blue","green","yello"]
for n in list:
    print(list.index(n),":",n)#0 : red 이런식으로 출력
print()

myBook={"책이름":"모두의 파이썬","출판사":"가메출판사","가격":20000}
for n in myBook:
    print(n,":",myBook.get(n))#책이름 : 모두의파이썬 이런식으로 출력

    