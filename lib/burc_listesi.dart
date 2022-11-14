import 'package:burc_uygulamsi/data/burc_item.dart';
import 'package:flutter/material.dart';

import 'data/burc.dart';
import 'data/strings.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc>tumBurclar;
  BurcListesi(){
    tumBurclar = verikaynaginiHazirla();
    print(tumBurclar);

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Burçlar Listesi'),),
      body: Center(
        child: ListView.builder(itemBuilder: (context, index){
        return BurcItem(ListenilenBurc: tumBurclar[index] ,);



        },itemCount: tumBurclar.length ,),
      ),
    );
  }
  
  verikaynaginiHazirla() {
    List<Burc> gecici=[];
    for(int i=0;i<12;i++){
      var burcKucukResim=Strings.BURC_ADLARI[i].toLowerCase()+ "${i+1}.png";
      var burcBuyukResim=Strings.BURC_ADLARI[i].toLowerCase()+ '_buyuk' + '${i+1}.png';


      Burc eklenecekBurc=Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],Strings.BURC_GENEL_OZELLIKLERI[i],burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);


    }
    
    return gecici;
  }
}