import 'package:flutter/material.dart';
import 'package:scroll/models/activite.dart';

class PageListView extends StatefulWidget {
  const PageListView({Key? key}) : super(key: key);

  @override
  _PageListViewState createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Center(
        child: Scrollbar(
          controller: activiteController,
          isAlwaysShown: true,
          child: ListView.separated(
            itemCount: activites.length,
            controller: activiteController,
            separatorBuilder: (context, index){
              if(index%10==0){
                return Container(
                  height: 100,
                  color: Colors.red,
                  child: Text("Publicité"),
                  alignment: Alignment.center,
                );
              }
              return Divider();

            },
            itemBuilder: (context, index){
              Activite activite = activites[index];
              return Dismissible(
                key: Key(activite.nom),
                onDismissed: (DismissDirection direction){
                  print(direction);
                  setState(() {
                    activites.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${activite.nom} a bien été supprimée")));
                },
                background: Container(
                  color: Colors.red,
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.white,),
                      Text("Supprimer")
                    ],
                  ),
                ),
                secondaryBackground:Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Archiver"),
                      Icon(Icons.folder, color: Colors.white,),
                    ],
                  ),
                ) ,
                child: ListTile(
                  title: Text("Activite:"),
                  subtitle: Text(activite.nom),
                  trailing: Icon(activite.icone),
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      setState(() {
                        activites[index].nom = "Toto";
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ) ,
      ),
    );
  }
}
