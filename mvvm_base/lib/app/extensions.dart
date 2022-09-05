// extension on string

import 'package:mvvm_base/data/mapper/mapper.dart';

extension NonNullSting on String?{
  String orEmpty(){
    if(this == null){
      return EMPTY;
    }else{
      return this!;
    }
  }
}

// extension on string

extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return ZERO;
    }else{
      return this!;
    }
  }
}