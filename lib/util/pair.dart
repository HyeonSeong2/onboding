class Pair<T,E>{
  T first;
  E second;

  Pair(
    this.first,
    this.second,
);


  //command + n -> ctrl +a -> enter
  @override
  String toString() {
    return 'Pair{first: $first, second: $second}';
  }
}