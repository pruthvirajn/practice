class Person{
 name;
 age;
 constructor(n,a){
    this.name=n;
    this.age=a;
 }
 greet(){
    console.log("hello");
 }

}

class Emp extends Person{
    greet(){
        console.log("hi");
    }
}

let v = new Emp();
v.greet();