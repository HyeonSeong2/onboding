import 'package:flutter/material.dart';

enum ListEnum { header, footer, item1, item2, item3 }

abstract class ListParent {
  ListEnum listEnum;

  ListParent(this.listEnum);
}

class ListChild extends ListParent {
  Widget child;

  ListChild(this.child, super.listEnum);
}
