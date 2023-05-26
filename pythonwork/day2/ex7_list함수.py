#list 타입의 함수 연습
list=["green","blue","yellow","black","white"];
print(list)
print(list.pop())#마지막 데이터 꺼내기
list2=list.copy()#팝으로 꺼낸 데이터를 제외한 나머지 데이터 저장
print(list2)
list2.sort()#정렬
print(list)# 넣은 순서대로 출력
print(list2)# 정렬되서 출력

list.reverse()#반대로
print(list)#반대로 출력

list.insert(1,"gray")# 2번째 자리에 gray 추가
print(list)

list.remove("white")#list에서 white 제거
print(list)

