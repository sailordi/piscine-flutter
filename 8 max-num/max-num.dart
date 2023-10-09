int maxNum(int n1,int n2,int n3) {
  var ret = n1;

    if(n2 > ret) {
      ret = n2;
    } 
    if(n3 > ret) {
      ret = n3;
    }
    
    return ret;
}

void main() {
  print(maxNum(1, 2, 3));
  print(maxNum(0, 0, 0));
  print(maxNum(-1, -5, 0));
}
