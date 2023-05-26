"""
영어단어를 입력하면 리스트 목록에 추가
단, 영어가 아닌글자가 포함시 경고표시후 다시 입력
'q' 입력시 종료

종료후 1. 오름차순 2.내림차순 3.입력순 4.종료
"""
englist=[]
while True:
    eng=input("영어단어 입력바람(종료:q)")
    if eng.lower()=='q':
        print("종료")
        break
    if not eng.isalpha():
        print("경고 알파벳만 입력가능!!")
        continue
    if not eng.islower():
        print("경고 한글 숫자 입력 불가!!")
        continue
    #englist에 추가하기
    englist.append(eng)
list=englist.copy()

while True:
    print("1. 오름차순 2.내림차순 3.입력순 4.종료")
    n=int(input("번호를 입력해주세요"))
    if n==4:
        print("종료합니다")
        break
    if n==1:
        englist.sort()
        print(englist)
    elif n==2:
        englist.sort(reverse=True)
        print(englist)
    elif n==3:
        print(list)
    else:
        print("다시입력해!!!!")
