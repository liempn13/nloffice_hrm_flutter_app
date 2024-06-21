import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateMD5(String password) {
  return md5.convert(utf8.encode(password)).toString();
}
