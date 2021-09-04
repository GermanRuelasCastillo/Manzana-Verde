import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonAlmuerzos extends StatefulWidget {
  final index;
  SkeletonAlmuerzos({this.index});

  @override
  _SkeletonAlmuerzosState createState() => _SkeletonAlmuerzosState();
}

class _SkeletonAlmuerzosState extends State<SkeletonAlmuerzos> {
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: SkeletonAnimation(
              shimmerColor: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              shimmerDuration: 1000,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: shadowList,
                ),
                margin: EdgeInsets.only(top: 30),
              ),
            ),
          ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: shadowList,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: SkeletonAnimation(
                        borderRadius: BorderRadius.circular(10.0),
                        shimmerColor: this.widget.index % 2 != 0
                            ? Colors.grey
                            : Colors.white54,
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: SkeletonAnimation(
                        borderRadius: BorderRadius.circular(10.0),
                        shimmerColor: this.widget.index % 2 != 0
                            ? Colors.grey
                            : Colors.white54,
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SkeletonAnimation(
                      borderRadius: BorderRadius.circular(10.0),
                      shimmerColor: this.widget.index % 2 != 0
                          ? Colors.grey
                          : Colors.white54,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
