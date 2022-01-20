import 'package:flutter/material.dart';
import 'package:scroll/models/activite.dart';

class ActiviteGrid extends StatelessWidget {
  List<Activite> activites;
  ScrollController activiteController;

  ActiviteGrid({Key? key, required this.activites, required this.activiteController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemCount: activites.length,
      controller: activiteController,
      itemBuilder: (context, index){
        Activite activite = activites[index];
        return GridTile(
          header: Text("Activité", textAlign: TextAlign.center),
          child: Icon(activite.icone, size: 40,),
          footer: Text(activite.nom, textAlign: TextAlign.center,style: TextStyle(color: Colors.blue, fontSize: 20),),
        );
      },
    );
  }
}
