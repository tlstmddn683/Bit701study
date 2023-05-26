""" 
숫자를 반복해서 입력 후 양수 인지, 제로인지, 음수인지 등등 출력하기
"""
while True:
    su=int(input("숫자입력(종료:999)"))
    if su==999:
        print("종료합니다")
        break
    if su>0:
        print("{}는 양수 입니다".format(su))
    elif su==0:
        print("%d는 제로 입니다"%(su))
    else:
        print(su,"수는 음수 입니다")
print("-------프로그램종료---------")
              