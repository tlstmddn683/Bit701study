class AA{
    constructor(){
        console.log("부모생성자");

    }

}
class BB extends AA{
    constructor(){
        super();//생략불가
        console.log("자식클래스 생성자");

    }
}
let a=new BB();
console.log("=".repeat(30));
///////////////////////
class CC{
    constructor(name){
    this.name=name;

    }
    printA()
    {
        console.log("내이름은"+this.name);
    }
}
class DD extends CC{
    constructor(name,age){
        super(name);
        this.age=age;

    }
    printAll(){
        this.printA();
        console.log("내나이는"+this.age+"세 입니다.");
    }
}

let b=new DD("마이클",34);
b.printAll();