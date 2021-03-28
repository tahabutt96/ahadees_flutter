import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{
  static final _databaseName = 'Ahadees.db';
  static final _databseVersion = 1;
  static final table_bukhari = 'tbl_Bukhari';
  static final table_muslim = 'tbl_Muslim';
  static final table_tirmizi = 'tbl_Tirmazi';
  static final table_abudawood = 'tbl_AbuDawood';
  static final table_nasai = 'tbl_Nasai';
  static final table_ibnemaja = 'tbl_IbneMaja';
  static final table_musnad = 'tbl_Musnad';
  static final table_mishkat = 'tbl_Mishkat';
  static final table_sahiha = 'tbl_Sahiha';
  static final column_hadeesnumber = 'hadees_number';
  static final column_bookurdu= 'BookUR';
  static final column_baabeng = 'Baab_Eng';
  static final column_kitabeng = 'Kitab_Eng';
  static final column_baab = 'Baab';
  static final column_kitab = 'Kitab';
  static final column_arabic = 'Arabic';
  static final column_ravi = 'Ravi';
  static final column_urdu = 'Urdu';
  static final column_english = 'English';
  static final column_volume = 'Volume';
  static final column_bookeng = 'BookEng';
 // static final column_baabid = 'Baab_ID';
  static final column_kitabid = 'Kitab_ID';
  static final column_takhreej = 'Takhreej';
  static final column_wazahat = 'Wazahat';
  static final column_status = 'Status';
  static final column_statsusref = 'Status_Ref';
  static final column_englishref = 'English_Ref';
  static final column_bookno = 'BookNo';
  static final column_sahihzaeef = 'Sahih_Zaeef';
  static final column_isbookmarket = 'is_bookmarked';
  static final column_withoutaeraab = 'without_aeraab';
  static final column_internationalnumber = 'internationalNumber';

  DatabaseConnection._privateConstructor();
  static final DatabaseConnection instance = DatabaseConnection._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabse();
    return _database;
  }

  _initDatabse() async{
    var databasePath = await getDatabasesPath();
    String path = join(databasePath,_databaseName);

    var exists = await databaseExists(path);
    if(!exists)
      {
        print("Copy database start");
        //if not exists
        try{
          await Directory(dirname(path)).create(recursive: true);
        }catch (_){}

        //Copy
        ByteData data = await rootBundle.load(join("assets",_databaseName));
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

        await File(path).writeAsBytes(bytes,flush: true);
      }else{
      print("Opening Existing Database");
    }
    return await openDatabase(path,version: _databseVersion);
  }

  Future<List> getbukharichapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Bukhari');
    return result.toList();
  }

  Future<List> getalmuslimchapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Muslim');
    return result.toList();
  }

  Future<List> gettirmazichapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Tirmazi');
    return result.toList();
  }

  Future<List> getabudawoodchapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_AbuDawood');
    return result.toList();
  }

  Future<List> getalnasaichapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Nasai');
    return result.toList();
  }

  Future<List> getibnemajachapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_IbneMaja');
    return result.toList();
  }

  Future<List> getmusnadchapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Musnad');
    return result.toList();
  }

  Future<List> getmishkatchapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Mishkat');
    return result.toList();
  }

  Future<List> getsahihachapterList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT DISTINCT BookUR, BookEng, Kitab_Eng, Kitab, Kitab_ID FROM tbl_Sahiha');
    return result.toList();
  }


  Future<List> getbukhariinnerList(int ID) async{
    var db = await database;
    var result = await db.rawQuery('SELECT hadees_number, BookUR, Baab_Eng, Kitab_Eng, Baab, Kitab, Arabic, Ravi, Urdu , English, COALESCE(Volume,"") Volume, BookEng, Kitab_ID, COALESCE(Takhreej,"") Takhreej,COALESCE(Wazahat,"") Wazahat, COALESCE(Status ,"") Status, COALESCE(Status_Ref,"") Status_Ref, COALESCE(English_Ref,"") English_Ref, BookNo, Sahih_Zaeef, COALESCE(is_bookmarked,"") is_bookmarked, without_aeraab, internationalNumber FROM tbl_Bukhari where Kitab_ID = $ID');
    return result.toList();
  }

  Future<List> getmuslimList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT hadees_number, BookUR, Baab_Eng, Kitab_Eng, Baab, Kitab, Arabic, Ravi, Urdu , English, COALESCE(Volume,"") Volume, BookEng, Kitab_ID, COALESCE(Takhreej,"") Takhreej,COALESCE(Wazahat,"") Wazahat, COALESCE(Status ,"") Status, COALESCE(Status_Ref,"") Status_Ref, COALESCE(English_Ref,"") English_Ref, BookNo, Sahih_Zaeef, COALESCE(is_bookmarked,"") is_bookmarked, without_aeraab, internationalNumber FROM tbl_Muslim');
    return result.toList();
  }
  Future<List> getmaktoobList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where subject = "maktob"');
    return result.toList();
  }
  Future<List> gethikmatList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where subject = "hekmat"');
    return result.toList();
  }
  Future<List> getfavHitkmatList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where fav = 1 AND subject = "hekmat"');
    return result.toList();
  }
  Future<List> getfavMaktoobList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where fav = 1 AND subject = "maktob"');
    return result.toList();
  }
  Future<List> getfavKhutbeList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where fav = 1 AND subject = "khotbe"');
    return result.toList();
  }
  // Future<int> update(Category category) async{
  //   var db = await instance.database;
  //   return await db.update(table, category.toMap(), where: '$ID = ?',whereArgs: [category.id]);
  // }


///////////////////////////////////////////////////////////

               //Favourite wala kaam

//////////////////////////////////////////////////////////
//
//   Future<int> setbukharifavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_bukhari}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setmuslimfavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_bukhari}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setabudawoodfavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_abudawood}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setibnemajafavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_ibnemaja}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setmishkatfavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_mishkat}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setsahihafavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_sahiha}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> settirmizifavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_tirmizi}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setnasaifavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_nasai}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }
//
//   Future<int> setmusnadfavourite(isbookmark,id) async{
//     var db = await database;
//     return await db.rawUpdate('''
//     UPDATE ${DatabaseConnection.table_musnad}
//     SET ${DatabaseConnection.column_isbookmarket} = ?
//     WHERE ${DatabaseConnection.column_hadeesnumber} = ?
//     ''', [isbookmark,id]);
//   }


  Future close() async{
    var db = await database;
    db.close();
  }


////////////////////////////////////////////////////////////

  // Future<List> getfavouriteList() async{
  //   Database db = await instance.database;
  //   var result = await db.rawQuery('SELECT * FROM nahjulBalagha where subject = "khotbe"');
  //   return result.toList();
  // }
}