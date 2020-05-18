import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/utils/alert.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }
}

_body() {
  Future<List<Carro>> future = CarrosApi.getCarros();

  return FutureBuilder(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text(
            "Não foi possível buscar os carros ${snapshot.error.toString()}.",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        );
      }

      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      List<Carro> carros = snapshot.data;
      return _listView(carros);
    },
  );
}

Container _listView(List<Carro> carros) {
  return Container(
    padding: EdgeInsets.all(16),
    child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Card(
            color: Colors.grey[200],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Descrição...",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      FlatButton(
                        child: const Text('SHARE'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
  );
}
