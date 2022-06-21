part of 'providers.dart';

class RecomendedProvider extends ChangeNotifier {
  getRecomendet() async {
    String url = "https://bwa-cozy.herokuapp.com/recommended-spaces";

    var respond = await http.get(Uri.tryParse(url));

    if (respond.statusCode == 200) {
      List data = jsonDecode(respond.body);
      List<Recomended> recomended =
          data.map((item) => Recomended.fromJson(item)).toList();
      return recomended;
    } else {
      return <Recomended>[];
    }
  }
}
