import 'package:flutter/material.dart';



class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key, required this.imgURL,
  });

  final String imgURL;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        //height:  MediaQuery.of(context).size.height * .3,
        //width: MediaQuery.of(context).size.width * .25,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
            image:  DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imgURL),
            )),
      ),
    );
  }
}
