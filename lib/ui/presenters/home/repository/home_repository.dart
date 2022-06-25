import 'dart:convert';

import 'package:converter/config/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

class HomeRepository {
  Future<String> parsXmlEnglish(BuildContext context) async {
    String allElements = "";

    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final values = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith("assets/values"))
        .toList();

    final valuesEn = values.where((String key) => !key.startsWith("assets/values-it")).toList();

    for (String v in valuesEn) {
      final xmlFile = await rootBundle.loadString(v);

      XmlDocument xml = XmlDocument.parse(xmlFile);

      List<XmlElement> xmlResource = xml.findAllElements("string").toList();

      for (XmlElement element in xmlResource) {

        String text = "";

        if(element.text.contains("%")){

          var textSplit = element.text.split("%");
          
          text += textSplit[0];
          
          for(int i = 1;i<textSplit.length; i++){
            text += textSplit[i].replaceAll("$i"r"$s", "{$i}");
          }

        }else{
          text = element.text;
        }

        allElements += "${element.attributes.first.value} = ${text} \n";
      }
    }

    var file = await writeToFile("English.txt", allElements);

    return file!.path;
  }

  Future<String> parsXmlItalian(BuildContext context) async {
    String allElements = "";

    final manifestJson =
    await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final values = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith("assets/values-it"))
        .toList();

    for (String v in values) {
      final xmlFile = await rootBundle.loadString(v);

      XmlDocument xml = XmlDocument.parse(xmlFile);

      List<XmlElement> xmlResource = xml.findAllElements("string").toList();

      for (XmlElement element in xmlResource) {

        String text = "";

        if(element.text.contains("%")){

          var textSplit = element.text.split("%");

          text += textSplit[0];

          for(int i = 1;i<textSplit.length; i++){
            text += textSplit[i].replaceAll("$i"r"$s", "{$i}");
          }

        }else{
          text = element.text;
        }

        allElements += "${element.attributes.first.value} = ${text} \n";
      }
    }

    var file = await writeToFile("Italian.txt", allElements);

    return file!.path;
  }

}
