import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
double rating=0;
int count=0;
bool val=true;
int cheese=0;
int val1=-1;
bool value=false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle=OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
            color:Color(0xFFf0f0f0),width: 2
        )
    );
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'начало'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  /*void _incrementCounter() {
    setState(() {
      _count=500+count+(rating.round().toInt())*17;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //прокрутка экрана
      body: SingleChildScrollView(
        child: Column(children:[
          //картинка
          Padding(
            padding: const EdgeInsets.fromLTRB(200.0, 0.0, 30.0, 0.0),
            child:Image.asset('android/assets/pizza.jpg'),
          ),
          const Text(
          "Калькулятор пиццы",
          style: TextStyle(
            fontSize:40.0,
              fontWeight: FontWeight.bold
          ),
        ),
          Divider(height:70,),
          const Text(
            "Выберите параметры:",
            style: TextStyle(
                fontSize:25.0,
                fontStyle: FontStyle.normal
            ),
          ),
          const SizedBox(height: 20,),
          //выбор один из двух
          CupertinoSegmentedControl(
            children: {
              0: Expanded(
                flex:1,
                child: Text("      Тонкое тесто      ",style: TextStyle(
                    fontSize:20.0,
                    fontStyle: FontStyle.normal,
                ),),
              ),
              50: Expanded(
                flex:1,
                child: Text("      Обычное тесто      ",style: TextStyle(
                    fontSize:20.0,
                    fontStyle: FontStyle.normal
                ),),
              ),

            },
            onValueChanged: (T)
            {
              print(T);
              if (T==0) {count=0;}
              else {count=50;};
            },
            selectedColor: CupertinoColors.white,
            unselectedColor: CupertinoColors.inactiveGray,
            borderColor: CupertinoColors.systemGrey5,
            pressedColor: CupertinoColors.activeBlue,

          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0,0.0,270.0,0.0),
            child: const Text(
                  "Размер:",
                      style: TextStyle(
                      fontSize:20.0,
                      fontStyle: FontStyle.normal
                  ),
                ),
          ),
          //столбики
          Row(children:[
            //равномерноеи заполнение по частям
            Expanded(
              flex:1,
              child: const Text(
              "  30 см",
                  textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize:14.0,
                  fontStyle: FontStyle.normal
              ),
            ),),
            //слайдер - движок
            Expanded(
                 flex:4,
                 child: Slider(value: rating,
                  //label:rating.round().toString(),
                  onChanged:(newRating){
                  setState(()=>rating=newRating);},
                  min:0,max:10,divisions:2,
            ),
               ),

            Expanded(
              flex:1,
              child: const Text(
                "40 см",
                style: TextStyle(
                    fontSize:14.0,
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0,0.0,295.0,0.0),
            child: const Text(
              "Соус:",
              style: TextStyle(
                  fontSize:20.0,
                  fontStyle: FontStyle.normal
              ),
            ),
          ),
          //радиокнопки для соуса

          ListTile(
              title: const Text('Острый'),
              leading: Radio (
                value: 1,
                groupValue: val1,
                onChanged: (value) {
                  setState(() {
                    val1 = 1;
                  });
                },
                activeColor:Colors.blue,
              ),
            ),
          ListTile(
              title: const Text('Кисло-сладкий'),
              leading: Radio(
                value: 2,
                groupValue: val1,
                onChanged: (value) {
                  setState(() {
                    val1 = 2;
                  });
                },
                activeColor:Colors.blue,
              ),
            ),
          ListTile(
            title: const Text('Сырный'),
            leading: Radio(
              value: 3,
              groupValue: val1,
              onChanged: (value) {
                setState(() {
                  val1 = 3;
                });
              },
              activeColor:Colors.blue,
            ),
          ),

          Row(children:[
             const Expanded(
               flex:3,
                 child: const Text(
                   "           Дополнительный сыр",
                   textAlign: TextAlign.left,
                   style: TextStyle(
                       fontSize:20.0,
                       fontStyle: FontStyle.normal
                   ),)
             ),
             //переключатель
             Expanded(
                flex:1,
              child: CupertinoSwitch(value: val, onChanged: (newval){
                setState(() {
                  val=newval;
                  if (val==true){
                    cheese=80;}
                  else {cheese=0;};
                }
                );
              }),
            )
          ]
        ),

          //const SizedBox(height: 20,),
          Divider(height:25,),
          //mainAxisAlignment: MainAxisAlignment.center,
          //кнопка расчета стоимости
          TextButton (
              child: Text("Узнать стоимость",style: TextStyle(
                  fontSize:25.0,
                  fontStyle: FontStyle.normal
              ),),
              onPressed:() {setState(() {
                _count=500+count+(rating.round().toInt())*17+cheese;
              });},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black38),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              )
          ),
          //вывод переменной count на экран
          Text(
              '$_count',
              style: Theme.of(context).textTheme.headline4,
            ),
//заказать
          TextButton (
              child: Text("Заказать",style: TextStyle(
                  fontSize:20.0,
                  fontStyle: FontStyle.normal
              ),),
              onPressed:() {
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              )
          ),
        ],

          ),

      ),
    );
  }
}
