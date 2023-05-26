let a=12;
let b=23.0;
let c =12.6;

console.log(a+"는 정수인가요?"+Number.isInteger(a));
console.log(b+"는 정수인가요?"+Number.isInteger(b));
console.log(c+"는 정수인가요?"+Number.isInteger(c));

//isNaN:NaN이 나올때 만 true
console.log(12/'a');//NaN:수식에 오류가 있을 경우 NaN이라고 표시

let a1="NaN";
let b1=NaN;
let c1="안녕?";
let d1=12;

console.log("es5 의 isNaN");//숫자가 아닐 경우 모두 true
console.log("a1="+isNaN(a1));//t
console.log("b1="+isNaN(b1));//t
console.log("c1="+isNaN(c1));//t
console.log("d1="+isNaN(d1));//f

console.log("es6 의 Number.isNaN");//NaN일 경우에만 true
console.log("a1="+Number.isNaN(a1));//f
console.log("b1="+Number.isNaN(b1));//t
console.log("c1="+Number.isNaN(c1));//f
console.log("d1="+Number.isNaN(d1));//f

//반복함수
console.log("반복함수 repeat");
console.log("사랑해".repeat(20));
console.log("=".repeat(20));




