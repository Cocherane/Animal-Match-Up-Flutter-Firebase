import 'package:flutter/material.dart';
import 'package:parctica6_app_memory/shared/shared-constants.dart';

class GameMore extends StatelessWidget {
  const GameMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.arrow_back,
                    color: SharedConstants.colorGreyText,
                  )),
            ),
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children:[ 
            Container(
              margin: EdgeInsets.all(0),
              width: double.infinity,
              child: Image.network(
                'https://i.ibb.co/Qj66V4W/pexels-fatih-turan-10027612.jpg',
                fit: BoxFit.fill,
                ),
            ),
            Container(
              width: double.infinity,
              child: Image.network(
                
                'https://i.ibb.co/WPF5wnV/pexels-simon-berger-1323550.jpg',//'https://i.ibb.co/Qj66V4W/pexels-fatih-turan-10027612.jpg',
                height: 240,
                fit: BoxFit.fill,
                ),
            ),
            SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * (2 / 5),
                    color: SharedConstants.colorGrey.withOpacity(0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(60))),
                          child: Center(
                            child: CircleAvatar(
                              radius: 150,
                              backgroundImage: Image.asset('assets/me.png', opacity: AlwaysStoppedAnimation(0.2),).image,
                              backgroundColor: SharedConstants.colorGrey.withOpacity(.3),
                              
                            ),
                          ),
                    ),
                  ),
        
                  Container(
                    height: MediaQuery.of(context).size.height * (0.6 / 5),
                    decoration: BoxDecoration(
                      color: SharedConstants.colorGrey.withOpacity(0),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(160),
                              topLeft: Radius.circular(200)
                              )
                    ),
                  ),
        
        
                  Container(
                    height: MediaQuery.of(context).size.height * (2.25 / 5),
                    color: SharedConstants.colorGrey.withOpacity(0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Created by :', style: SharedConstants.getItimFontGoogle.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('Ariel Cocherane', style: SharedConstants.getItimFontGoogle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),),
                            Text('Full-Stack Developer', style: SharedConstants.getItimFontGoogle.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan( style: SharedConstants.getEx2FontGoogle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan( text: 'Made '),
                                  TextSpan( text: 'with '),
                                  WidgetSpan(child: Icon(Icons.favorite, color: Colors.redAccent,)),
                                ]
                                ),
                                
                                ),
                            )
        
                          ],
                        ),
                      ),    
        
                    ),
                  ),
                  SizedBox(height: 200,)
        
        
        
                ],
              ),
            ),
          ),
          ]
        )
        );
  }
}
