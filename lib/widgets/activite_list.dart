import 'package:flutter/material.dart';
import 'package:scroll/models/activite.dart';

class ActiviteList extends StatefulWidget {
  List<Activite> activites;
  ScrollController activiteController;

  ActiviteList({Key? key, required this.activites, required this.activiteController}) : super(key: key);


  @override
  _ActiviteListState createState() => _ActiviteListState();
}

class _ActiviteListState extends State<ActiviteList> {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.activites.length,
      controller:  widget.activiteController,
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
        Activite activite =  widget.activites[index];
        return Dismissible(
          key: Key(activite.nom),
          onDismissed: (DismissDirection direction){
            print(direction);
            setState(() {
              widget.activites.removeAt(index);
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
                  widget.activites[index].nom = "Toto";
                });
              },
            ),
          ),
        );
      },
    );
  }
}
