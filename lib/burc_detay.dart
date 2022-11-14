import 'package:burc_uygulamsi/data/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required Burc this.secilenBurc,super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi=Colors.pink;
  late PaletteGenerator _generator;

  @override
  void initState() {
    appbarrenkbul();
    super.initState();
  }

 void appbarrenkbul() async{
  _generator= await PaletteGenerator.fromImageProvider(AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
  setState(() {
      appbarRengi=_generator.dominantColor!.color;
  });

 }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
        
          backgroundColor: appbarRengi,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi+" Burçu ve Özellikleri"),
            centerTitle: true,
            background: Image.asset('images/'+widget.secilenBurc.burcBuyukResim,fit: BoxFit.cover,),),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(16),
            child: SingleChildScrollView(child:Text(widget.secilenBurc.burcDetayi,style: Theme.of(context).textTheme.subtitle1,) )),
        )

      ],
    )
    );
  }
}