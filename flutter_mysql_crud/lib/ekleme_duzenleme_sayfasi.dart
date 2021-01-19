import 'package:flutter/material.dart';
import 'package:flutter_mysql_crud/main.dart';
import 'package:http/http.dart' as http;

class EklemeSayfasi extends StatefulWidget {
  final List list;
  final int index;

  EklemeSayfasi({this.index, this.list});

  @override
  _EklemeSayfasiState createState() => _EklemeSayfasiState();
}

class _EklemeSayfasiState extends State<EklemeSayfasi> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  bool editMode = false;

  eklemeGuncelleme() {
    if (editMode) {
      var url = "http://192.168.1.38:81/flutter_crud/guncelleme.php";
      http.post(url, body: {
        "id": widget.list[widget.index]["id"],
        "firstname": firstName.text,
        "lastname": lastName.text,
        "phone": phone.text,
        "address": address.text,
      });
    } else {
      var url = "http://192.168.1.38:81/flutter_crud/ekleme.php";
      http.post(url, body: {
        "firstname": firstName.text,
        "lastname": lastName.text,
        "phone": phone.text,
        "address": address.text,
      });
    }
  }

  @override
  void initState() {
    firstName = TextEditingController(text: "");
    lastName = TextEditingController(text: "");
    phone = TextEditingController(text: "");
    address = TextEditingController(text: "");

    if (widget.index != null) {
      editMode = true;
      firstName.text = widget.list[widget.index]["firstname"];
      lastName.text = widget.list[widget.index]["lastname"];
      phone.text = widget.list[widget.index]["phone"];
      address.text = widget.list[widget.index]["address"];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? "Güncelleme" : "Ekleme"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: firstName,
              decoration: InputDecoration(
                labelText: "İsmi",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: lastName,
              decoration: InputDecoration(
                labelText: "Soyismi",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(
                labelText: "Telefonu",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: address,
              decoration: InputDecoration(
                labelText: "Adresi",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  eklemeGuncelleme();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnaSayfa()));
                });
              },
              color: Colors.blueGrey,
              child: Text(
                editMode ? "Güncelle" : "Kaydet",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
