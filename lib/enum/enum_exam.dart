/// Enum : 어떤 값들을 구분할 때 사용함.
enum Animal {
  /// 기본 셋팅
  dog,
  cat,
  bird,
  lion
}

enum Nation {
  ///서버에서 korea를 0, japan을 1 china를 2로 보낸다면 아래
  korea(0),
  japan(1),
  china(2);

  /// 서버에서 보내는 1의 value 생성
  final int value;
  const Nation(this.value);
}
