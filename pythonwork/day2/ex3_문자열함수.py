s1="Have a Nice Day"
s2="HappyDay"
print(s1.startswith("Have"))#True
print(s1.startswith("Happy"))#False
print(s2.endswith("Day"))#True
s3=s1.replace(" ","*")#공백을 *로 변경
print(s3)
print(s1.count("a"))#s1 에서 a 갯수 
print(s1.lower(),s1.upper())#소문자변환 대문자 변환
print('/'.join(s1))#모든글자 사이에 / 넣기
print(s2.isalpha())#모두 알파벳인 경우 True
print(s2.isdigit())#모두 숫자인 경우 True

