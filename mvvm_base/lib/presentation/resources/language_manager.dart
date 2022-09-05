enum LanguageType{
  ENGLISH,
  MALAYSIA
}

const String ENGLISH = "en";
const String MALAYSIA = "my";

extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch(this){
      case LanguageType.ENGLISH:
        return "en";
      case LanguageType.MALAYSIA:
        return "my";
    }
  }
}