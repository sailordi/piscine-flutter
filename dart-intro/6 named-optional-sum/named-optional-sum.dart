int namedOptionalSum({int? first, int? second, int? third}) {
  return (first ?? 0) + (second ?? 0) + (third ?? 0);
}

void main() {
  var result = namedOptionalSum(first:1,second: 2);
  print(result);
}