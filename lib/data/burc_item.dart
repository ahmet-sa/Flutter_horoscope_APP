import 'package:burc_uygulamsi/burc_detay.dart';
import 'package:burc_uygulamsi/data/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc ListenilenBurc;
  const BurcItem({required this.ListenilenBurc ,super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStle=Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BurcDetay(secilenBurc: ListenilenBurc) ,),);
            },
            leading:Image.asset("images/"+ListenilenBurc.burcKucukResim,) ,
            title: Text(ListenilenBurc.burcAdi,
            style: myTextStle.headline5),
            subtitle: Text(ListenilenBurc.burcTarihi,style: myTextStle.subtitle1,),
            trailing:Icon(Icons.arrow_forward_ios,color: Colors.pink,)

          ),
        ),
      ),
    );
  }
}