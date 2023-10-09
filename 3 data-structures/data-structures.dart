void main() {
	List<int> listNum = [1, 2, 3,4,5];
  List<Object> listObj = [1, 'two', 3,'four'];
  List<String> listStr = ['One', 'two', 'three'];
  List<List<Object> > listList = [listNum,listObj,listStr];
  Set<String> setStr = {'One', 'two', 'three'};
  Map<String,int> mapStr = {'One':1,'Two':2,'Three':3};
    

  // Printing the variables
  print('List numbers: $listNum');
  print('List objects: $listObj');
  print('List strings: $listStr');
  print('List List objects: $listList');
  print('Set string: $setStr');
  print('Map string,int: $mapStr');
}