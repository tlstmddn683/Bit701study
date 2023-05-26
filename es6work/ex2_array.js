let arr=[3,5,7];

let f1=(a,b)=>console.log(a,b);

f1(arr[0],arr[1]);
f1(...arr);//...:펼침연산자

let arr1=[1,2];
let arr2=[33,44,55];
let arr3=[5,6,...arr1,...arr2];

console.log(arr3.length);//7개
console.log(arr3);

let sum=0;
// for(let a of arr3){
    //of:배열 값이 넘어옴
//     // console.log(a);
//     sum+=a;
// }
sum=0;
for(let i in arr3){
    //in:배열의 인덱스가 넘어옴
    // console.log(a);
    sum+=arr3[i];
}

console.log("sum="+sum);