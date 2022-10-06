// import "package:"

import 'dart:convert';

import 'package:animate/src/models/excuse.dart';
import 'package:dio/dio.dart';

class ExcuseFacade {
  Future<List<Excuse>> getExcuses() async {
    try {
      Response response = await Dio().get(
          'https://s3.ap-south-1.amazonaws.com/idontlikework/wfh-reasons.json');

      // so i guess we do get json in response
      // so we need to make it a list of somethign

      final data = response.data;

//  TODO do type this
      final List<dynamic> json = jsonDecode(response.data);

// TODO and type this too
// but this is not strictly a json that we pass to from json - it is dynamic
      final List<Excuse> excuses = json.map<Excuse>((json) {
        final excuse = Excuse.fromJson(json);

        return excuse;
      }).toList();

      return excuses;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
