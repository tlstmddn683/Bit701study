while True:
    number = int(input("숫자를 입력하세요 (2~9, 0 종료): "))

    if number == 0:
        print("프로그램 끝")
        break
    elif 2 <= number <= 9:
        for i in range(1, 10):
            print("{} x {} = {}".format(number, i, number * i))
        print("="*20)
    else:
        print("다시 입력해주세요.")
