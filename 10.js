function validate(){
    var at=document.getElementById("email").nodeValue.indexOf("@");
    var age=document.getElementById("age").nodeValue;
    var fname=document.getElementById("fname").nodeValue;
    submitOk="true";

    if(fname.length>10){
        alert("The name may have no more than 10 characters");
        submitOk="false";
    }
    if(isNaN(age) || age<1 || age>100){
        alert("age must be a number between 1 to 100");
        submitOk="false";
    }
    if(at==-1){
        alert("Not a valid e-mail");
        submitOk="false";
    }
    if(submitOk=="false"){
        return false;
    }
}