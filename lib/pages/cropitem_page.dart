import 'package:flutter/material.dart';
import 'cropdescription_page.dart'; // Import the CropDescriptionPage

class CropItem extends StatelessWidget {
  final String imagePath;
  final String cropName;
  final String cropDetails;

  const CropItem({
    Key? key,
    required this.imagePath,
    required this.cropName,
    required this.cropDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CropDescriptionPage(
              imagePath: imagePath,
              cropName: cropName,
              cropDetails: cropDetails,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            cropName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(cropDetails),
        ),
      ),
    );
  }
}
