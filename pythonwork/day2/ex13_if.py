"""
점수 입력후 0~100 이 아니면 다시 입력
점수에 따른 평가 출력
"""
while True:
    score=int(input("점수입력:(종료:999):"))

    if score==999:
        break
    if score<0 or score>100:
        print("0~100 사이의 값으로 다시 입력해주세요")
        continue
    print("입력한 점수는 {} 점 입니다.".format(score))
    if score>=90:
        pungga="참 잘했어요"
    elif score>=80:
        pungga="노력하세요"
    else:
        pungga="재시험입니다"
    print("{}점 : {}".format(score,pungga))
print("프로그램 종료!")