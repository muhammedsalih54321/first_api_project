import 'package:flutter/material.dart';

class Firstview extends StatefulWidget {
  final String img;
  final String title;
  final String ranking;
  final String description;

  const Firstview({super.key, required this.img, required this.title, required this.ranking, required this.description});

  @override
  State<Firstview> createState() => _FirstviewState();
}

class _FirstviewState extends State<Firstview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:250,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                   
                  ),
                  child: Image.network(widget.img,fit: BoxFit.cover,),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'ranking:  ${widget.ranking}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                widget.description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
