import 'dart:convert';
import 'package:cat_breeds/domain/entities/cat_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CatService {
  Future list() async {
    final url = dotenv.get('URL');
    Uri fullUrl = Uri.parse(url);
    
    final response = await http.get(
      fullUrl, 
      headers: {
        'x-api-key': dotenv.get('KEY'),
      }
    );
    
    List<Cat> tempCats = [];
    jsonDecode(response.body).forEach((element){
      if(element["imageCat"] != "") {
        element["imageCat"] = '${dotenv.get('IMG')}/${element['reference_image_id']}.jpg';
      }
      tempCats.add(Cat.fromJson(element));
    });

    return tempCats;
  }
}