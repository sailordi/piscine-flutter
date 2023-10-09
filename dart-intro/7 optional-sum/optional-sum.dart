int optionalSum(int first, int second,{int? third}) {
  if(third == null) {
    return first+second;
  }
  return first+second+third;
}

void main() {
  var result = optionalSum(1,2);
  print(result);
  result = optionalSum(1,2,third:3);
  print(result);
}