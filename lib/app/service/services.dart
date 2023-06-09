import 'dart:convert';
import 'dart:developer';

import 'package:game_hive/app/model/platform_response.dart';
import 'package:http/http.dart' as http;

class AllServices {
  static String mainURL = 'https://api.igdb.com/v4';
  var platformListURL = '$mainURL/platforms';
  final String clientID = 'l5deuz26zvrjjk2wle7lhx0j6wkwx6';
  final String authorization = 'Bearer 3yonzgspmkdfwqdkjvxfez5gkbgnwd';
  static int limit = 10;

  Future<PlatformResponse> getPlatform() async {
    var response = await http.post(Uri.parse(platformListURL),
        headers: {
          'Client-ID': clientID,
          'Authorization': authorization,
          "Accept": "application/json,",
        },
        body:
            "fields abbreviation,alternative_name,category,checksum,created_at,generation,name,platform_family.*,platform_logo.*,slug,summary,updated_at,url,versions.*,versions.platform_logo.*,versions.companies.*,versions.companies.company.*,versions.companies.company.logo.*,versions.companies.company.parent.*,versions.companies.company.websites.*,websites.*;limit $limit;");
    if (response.statusCode == 200) {
      log(response.body);
      log(response.statusCode.toString());
      return PlatformResponse.fromJson(jsonDecode(response.body));
    } else {
      log(response.body);
      log(response.statusCode.toString());
      return PlatformResponse.withError('Error');
    }
  }
}
