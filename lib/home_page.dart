// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:assignment_pc/models/performance_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/overview_model.dart';
var ovResponse ;
var mapResponse;
var tcResponse;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getOverview () async {
    var uri = Uri.parse("https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en");
    http.Response response = await http.get(uri);
    if(response.statusCode == 200){
    setState(() {
      mapResponse = jsonDecode(response.body);
    });
    }
  }
  Future getPerformance() async{
    var uri = Uri.parse('https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en');
    http.Response response = await http.get(uri);
    if(response.statusCode == 200){
      setState(() {
        tcResponse = jsonDecode(response.body);

      });
    }
  } 
  List<Overview >? overview ;
  List <Performance>? performance ;
  var isLoaded = false;
   void initState(){
    super.initState();
    getData();
    getPerformance();
  }
   getData() async{
   overview = await getOverview();
   performance = await getPerformance();
    if(overview !=null){
      setState(() {
        isLoaded = true;
      });
    }
   }

  








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PaprClip"),
        backgroundColor: Colors.green,
      ),
      
      body: SafeArea(
        child:SingleChildScrollView(
          child: Center(
            child:  mapResponse!= null && tcResponse != null?  Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 280, 0),
                  child: Text("Overview ",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 6, 0, 67),fontWeight: FontWeight.bold)),
                ),
                Divider(
                  height: 1,
                ),
                SizedBox(height: 20,),
               entry("Sector", mapResponse['SectorSlug']),
                SizedBox(height: 10,),
               entry("Industry", mapResponse['IndustrySlug'].toString()),
               SizedBox(height: 10,),
               entry("Market Cap.", mapResponse['MCAP'].toString()+" Crs"),
               SizedBox(height: 10,),
               entry("Enterprise Value (EV)", "--"), 
               SizedBox(height: 10,),
               entry("Book Value / Share", mapResponse['BookNavPerShare'].toStringAsFixed(2) ),
               SizedBox(height: 10,),
               entry("Price-Earning Ratio (PE)", mapResponse['TTMPE'].toStringAsFixed(2)),
               SizedBox(height: 10,),
               entry("PEG Ratio", mapResponse['PEGRatio'].toStringAsFixed(2)),
               SizedBox(height: 10,),
               entry("Dividend Yield", mapResponse['Yield'].toStringAsFixed(2)),
               SizedBox(height: 10,),
                  Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0,20, 160, 0),
                  child: Text("Technical Performance ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 6, 0, 67))),
                ),
                Divider(
                  height: 1,
                ),
                SizedBox(height: 20,),
             performanceTC(0,10,
             0.0,0.0),
             SizedBox(height: 10,),
             performanceTC(1,10, 0.0,10.0),
             SizedBox(height: 10,),
             performanceTC(2,20,0.0,20.0),
             SizedBox(height: 10,),
             performanceTC(3,30,
            0.0,20.0),
             SizedBox(height: 10,),
             performanceTC(4,5,0.0,0.0
             ),
             SizedBox(height: 10,),
             performanceTC(5,10,
             0.0,0.0),
             SizedBox(height: 10,),
             performanceTC(6,20,
            0.0,0.0),
             SizedBox(height: 10,),
             performanceTC(7,140,0.0,0.0),
             SizedBox(height: 10,),
            ],
            ): CircularProgressIndicator()
          )
        )
       )
    );
  }
}



Widget entry ( var name , var data){
             
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: name != null ? Text(name , style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 6, 0, 67)),)
          : Text("-")
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
          child:data != null ? Text(data) : Text("-")
        ),
  ],
);
}


Widget performanceTC (int index , size,double S,E){
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Text(tcResponse[index]['Label'].toString(),style: TextStyle(fontSize: 15,)),
              ),
            ],
          ),
              Padding(
              padding: EdgeInsetsDirectional.fromSTEB(S, 0, E, 0),
                child: Conta(size,index),
              ),
       
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             if(tcResponse[index]['ChangePercent'] > 0)
          Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),            child: Text(tcResponse[index]['ChangePercent'].toStringAsFixed(1) , style: TextStyle(color: Colors.green,fontSize: 15)),
          )
          else 
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: Text(tcResponse[index]['ChangePercent'].toStringAsFixed(1) , style: TextStyle(color: Colors.red)),
          ),

          ],
         )
          
        ],
      );
    }
//   );

// }

Widget Conta (int width, index){
  return Container(
     width: 150,height: 30,
     decoration: BoxDecoration(
       color: Color.fromARGB(255, 193, 190, 190),
       borderRadius: BorderRadius.circular(10)
                ),
     child:  Row(
       children: [
         if(tcResponse[index]['ChangePercent'] > 0)
        width <150 ? Container( 
          height: 30,width: width.ceilToDouble(),
           decoration: BoxDecoration(
             color: Color.fromARGB(255, 0, 255, 8),
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))),
         ): Text("Invalid Size")
         else
          width <150 ? Container( 
          height: 30,width: width.ceilToDouble(),
           decoration: BoxDecoration(
             color: Color.fromARGB(255, 255, 0, 0),
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))),
         ): Text("Invalid Size")

       ],
     )
           
  );
}