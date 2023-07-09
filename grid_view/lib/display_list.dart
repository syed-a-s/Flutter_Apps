import 'package:flutter/material.dart';
import 'data_file.dart';

class MyListDisplay extends StatelessWidget{
  const MyListDisplay ({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(

        /*
      gridDelegate controls the layout of the
      children within the GridView.

      SliverGridDelegateWithFixedCrossAxisCount
      creates grid layouts with a fixed number of
      tiles in the cross axis.
      */

        crossAxisCount: 2,
        mainAxisSpacing:  5,
        crossAxisSpacing: 5,
      ),

      itemCount:  countries.length,
      itemBuilder:  _buildListBody,
    );
  }

  Widget _buildListBody( BuildContext context, int index ) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar (
              content: Text('Country: ${countries[index].name} Capital: ${countries[index].capital}'),
            )
        );
      },
      child: Text(countries[index].name),
    );
  }
}  // end of MyListDisplay
