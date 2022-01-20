import 'package:flutter/material.dart';
import 'package:scroll/models/activite.dart';
import 'package:scroll/widgets/activite_grid.dart';
import 'package:scroll/widgets/activite_list.dart';

class PagePortraitPaysage extends StatefulWidget {
  const PagePortraitPaysage({Key? key}) : super(key: key);

  @override
  _PagePortraitPaysageState createState() => _PagePortraitPaysageState();
}

class _PagePortraitPaysageState extends State<PagePortraitPaysage> {
  List<Activite> activites = [
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
    Activite(nom: "Vélo", icone: Icons.directions_bike),
    Activite(nom: "Peinture", icone: Icons.palette),
    Activite(nom: "Golf", icone: Icons.golf_course),
    Activite(nom: "Jeux", icone: Icons.gamepad),
    Activite(nom: "Bricolage", icone: Icons.build),
  ];

  ScrollController activiteController = ScrollController();

  @override
  void initState() {
    activiteController.addListener(suite);
    super.initState();
  }

  void suite(){
    print("Position = ${activiteController.position.pixels} | Taille Max = ${activiteController.position.maxScrollExtent}");

    if(activiteController.position.pixels >= activiteController.position.maxScrollExtent * 0.95){
      List<Activite> shuffleActivite = activites;
      shuffleActivite.shuffle();

      setState(() {
        activites.add(shuffleActivite[0]);
        activites.add(shuffleActivite[1]);
        activites.add(shuffleActivite[2]);
        activites.add(shuffleActivite[3]);
        activites.add(shuffleActivite[4]);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);

    return Scaffold(
      appBar: AppBar(
        title: Text("Portrait / Paysage"),
      ),
      body: Center(
        child: Scrollbar(
          controller: activiteController,
          isAlwaysShown: true,
          child: (orientation == Orientation.portrait)
          ? ActiviteList(
              activites: activites,
              activiteController: activiteController,
            )
          : ActiviteGrid(
            activites: activites,
            activiteController: activiteController,
          ),
        ) ,
      ),
    );
  }
}
