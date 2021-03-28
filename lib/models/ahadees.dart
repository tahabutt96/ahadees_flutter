class Ahadees{
  int hadees_number,Baab_ID,Kitab_ID,BookNo,is_bookmarked,internationalNumber;
  String BookUR, Baab_Eng, Kitab_Eng, Baab, Kitab, Arabic, Ravi,Urdu,English,Volume,BookEng,Takhreej,Wazahat,Status,Status_Ref,English_Ref,Sahih_Zaeef,without_aeraab;

  Ahadees();

  Ahadees.map(dynamic obj){
    this.hadees_number = obj['hadees_number'];
    this.Baab_ID = obj['Baab_ID'];
    this.Kitab_ID = obj['Kitab_ID'];
    this.BookNo = obj['BookNo'];
    this.is_bookmarked = obj['is_bookmarked'];
    this.internationalNumber = obj['internationalNumber'];
    this.BookUR = obj['BookUR'];
    this.Baab_Eng = obj['Baab_Eng'];
    this.Kitab_Eng = obj['Kitab_Eng'];
    this.Baab = obj['Baab'];
    this.Kitab = obj['Kitab'];
    this.Arabic = obj['Arabic'];
    this.Ravi = obj['Ravi'];
    this.Urdu = obj['Urdu'];
    this.English = obj['English'];
    this.Volume = obj['Volume'];
    this.BookEng = obj['BookEng'];
    this.Takhreej = obj['Takhreej'];
    this.Wazahat = obj['Wazahat'];
    this.Status = obj['Status'];
    this.Status_Ref = obj['Status_Ref'];
    this.English_Ref = obj['English_Ref'];
    this.Sahih_Zaeef = obj['Sahih_Zaeef'];
    this.without_aeraab = obj['without_aeraab'];
  }

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['hadees_number'] = this.hadees_number;
    map['Baab_ID'] = this.Baab_ID;
    map['Kitab_ID'] = this.Kitab_ID;
    map['BookNo'] = this.BookNo;
    map['is_bookmarked'] = this.is_bookmarked;
    map['internationalNumber'] = this.internationalNumber;
    map['BookUR'] = this.BookUR;
    map['Baab_Eng'] = this.Baab_Eng;
    map['Kitab_Eng'] = this.Kitab_Eng;
    map['Baab'] = this.Baab;
    map['Kitab'] = this.Kitab;
    map['Arabic'] = this.Arabic;
    map['Ravi'] = this.Ravi;
    map['Urdu'] = this.Urdu;
    map['English'] = this.English;
    map['Volume'] = this.Volume;
    map['BookEng'] = this.BookEng;
    map['Takhreej'] = this.Takhreej;
    map['Wazahat'] = this.Wazahat;
    map['Status'] = this.Status;
    map['Status_Ref'] = this.Status_Ref;
    map['English_Ref'] = this.English_Ref;
    map['Sahih_Zaeef'] = this.Sahih_Zaeef;
    map['without_aeraab'] = this.without_aeraab;
  }
}