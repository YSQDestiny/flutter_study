import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_study/model/UserInfo.dart';

class DataUtils {

  static final String SP_AC_TOKEN = "accessToken";
  static final String SP_RE_TOKEN = "refreshToken";
  static final String SP_UID = "uid";
  static final String SP_IS_LOGIN = "isLogin";
  static final String SP_EXPIRES_IN = "expiresIn";
  static final String SP_TOKEN_TYPE = "tokenType";

  static final String SP_USER_NAME = "name";
  static final String SP_USER_ID = "id";
  static final String SP_USER_LOC = "location";
  static final String SP_USER_GENDER = "gender";
  static final String SP_USER_AVATAR = "avatar";
  static final String SP_USER_EMAIL = "email";
  static final String SP_USER_URL = "url";

  //保存用户登陆信息，data中包含了token等信息
  static saveLoginInfo(Map data) async {
   if(data != null){
     SharedPreferences sp = await SharedPreferences.getInstance();
     String accessToken = data['access_token'];
     await sp.setString(SP_AC_TOKEN, accessToken);
     String refreshToken = data['refresh_token'];
      await sp.setString(SP_RE_TOKEN, refreshToken);
      num uid = data['uid'];
      await sp.setInt(SP_UID, uid);
      String tokenType = data['tokenType'];
      await sp.setString(SP_TOKEN_TYPE, tokenType);
      num expiresIn = data['expires_in'];
      await sp.setInt(SP_EXPIRES_IN, expiresIn);

      await sp.setBool(SP_IS_LOGIN, true);
   } 
  }

}