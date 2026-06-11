
import 'package:flutter/material.dart';

List <String> images = [
  "assets/w5-ex3/bird.jpg",
  "assets/w5-ex3/bird2.jpg",
  "assets/w5-ex3/girl.jpg",
  "assets/w5-ex3/insect.jpg",
  "assets/w5-ex3/man.jpg",
];

class ImageGalleryApp extends StatelessWidget {

  const ImageGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGalleryViewer()
    );
  }
}

class ImageGalleryViewer extends StatefulWidget {

  const ImageGalleryViewer({super.key});

  @override
  State<ImageGalleryViewer> createState() => _ImageGalleryViewerState();
}

class _ImageGalleryViewerState extends State<ImageGalleryViewer> {

  int order = 0;

  void previousImage(){
    setState(() {
      if (order > 0){
        order -= 1;
      } else {
        order = images.length - 1;
      }
    });
  }

  void nextImage(){
    setState(() {
      if (order < (images.length - 1)){
        order += 1;
      } else {
        order = 0;
      }
    });
  }

  Widget buildButton({required Icon icon, required VoidCallback function}){

    return IconButton(
      onPressed: function,
      icon: icon,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Viewer"
        ),
        backgroundColor: Colors.red[500],
        actions: [
          buildButton(icon: Icon(Icons.arrow_back_ios), function: previousImage),
          buildButton(icon: Icon(Icons.arrow_forward_ios), function: nextImage),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Image.asset(
                images[order],
                height: 600,
                key: ValueKey(images[order]),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 10,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: order + 1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red[500]!, Colors.red[500]!]
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4 - order,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 205, 210)
                        ),
                      ),
                    ),  
                  ],
                ),
              ),
            ),
            
          ],
        )
      )
    );
  }
}

void main(){
  runApp(
    ImageGalleryApp()
  );
}