function changeSize(){
    document.getElementById("beach").height="200";
    document.getElementById("beach").width="200";
}
var H=100;
var W=100;
function increaseSize(){
    H+=30;
    W+=30;

    
    
   document.getElementById("beach").height="" +H;
   document.getElementById("beach").width=""+W;
  
   
}
function decreaseSize(){
    H-=30;
    W-=30;
    document.getElementById("beach").height=""+H ;
     document.getElementById("beach").width=""+W;
    
    
 }
    