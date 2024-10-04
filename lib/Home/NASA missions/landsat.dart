import 'package:flutter/material.dart';
import 'mission_card.dart';
import 'mission_link.dart';
import 'mission_text_box.dart'; // Import the new InfoTextBox class

class Landsat extends StatelessWidget {
  const Landsat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              const SizedBox(height: 50), // Optional space at the top
              MissionCard(
                videoPath: 'assets/video/lansat.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'LANDSAT',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionLink(
                linkText: 'https://landsat.gsfc.nasa.gov/',
                url: 'https://landsat.gsfc.nasa.gov/',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Mission Overview',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Using InfoTextBox class for the text boxes
              const MissionTextBox(
                title: 'Purpose',
                content:
                    'The Landsat program is a joint initiative between NASA and the United States Geological Survey (USGS). It aims to provide comprehensive, high-resolution satellite imagery of Earth\'s land surface, which is critical for understanding, managing, and protecting our natural resources and the environment. Landsat data is invaluable for various applications, including environmental monitoring, land use planning, and disaster response.',
              ),
              const MissionTextBox(
                title: 'Historical Significance',
                content:
                    'Launched in 1972 with Landsat 1, the program marked the beginning of continuous satellite-based observations of the Earth. Over the years, the Landsat satellites have provided over 50 years of consistent and comparable data, making it one of the longest-running Earth observation programs.',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Latest News',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionTextBox(
                title: 'Landsat 9',
                content:
                    'Launched on September 27, 2021, Landsat 9 is the latest addition to the Landsat satellite family. It features advanced imaging technology, enhancing its ability to capture detailed images of the Earth’s surface. This satellite operates alongside Landsat 8, ensuring continuous data collection with minimal gaps.',
              ),
              const MissionTextBox(
                title: 'Imaging Improvements',
                content:
                    'Landsat 9 boasts a more sensitive Operational Land Imager (OLI-2) and a new Thermal Infrared Sensor (TIRS-2), both designed to improve image quality and data accuracy. These enhancements allow for better monitoring of changes in land use, vegetation health, and surface temperatures, particularly relevant for assessing climate change impacts.',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Data Focus',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionTextBox(
                title: 'Land Cover and Land Use',
                content:
                    'Landsat imagery supports the assessment and mapping of land cover types, including urban areas, forests, wetlands, and agricultural fields. This information is crucial for urban planning, resource management, and environmental conservation.',
              ),
              const MissionTextBox(
                title: 'Agriculture',
                content:
                    'The program assists farmers and agricultural scientists by providing insights into crop health, soil moisture levels, and irrigation needs. Landsat data enables the monitoring of crop growth and identification of areas requiring intervention.',
              ),
              const MissionTextBox(
                title: 'Forest Monitoring',
                content:
                    'Landsat satellites play a vital role in monitoring deforestation, forest health, and reforestation efforts. The high-resolution imagery helps track changes in forest cover and biodiversity, supporting conservation efforts.',
              ),
              const MissionTextBox(
                title: 'Water Resource Management',
                content:
                    'The data aids in monitoring water bodies, assessing water quality, and managing water resources efficiently. Landsat imagery can track changes in lakes, rivers, and reservoirs, providing insights into hydrological patterns.',
              ),
              const MissionTextBox(
                title: 'Disaster Response',
                content:
                    'Landsat data is critical for disaster management, enabling rapid assessment of damage caused by events such as wildfires, floods, and hurricanes. The imagery supports emergency response efforts and recovery planning.',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Access to Data',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionTextBox(
                title: 'Open Data Policy',
                content:
                    'One of the key features of the Landsat program is its commitment to open data access. Users can access Landsat imagery and data products for free through platforms like the USGS Earth Explorer and NASA\'s Land Processes Distributed Active Archive Center (LP DAAC). This accessibility encourages a wide range of applications across scientific research, education, and policy-making.',
              ),
              const MissionTextBox(
                title: 'Data Products',
                content:
                    'The Landsat program provides a variety of data products, including raw imagery, surface reflectance data, and surface temperature measurements. These products cater to diverse user needs, from scientific research to practical applications in land management.',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Conclusion',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionTextBox(title: '*', content: 'The Landsat program represents a cornerstone of Earth observation, providing essential data for monitoring and understanding our planet’s changing landscapes. With the launch of Landsat 9 and ongoing improvements in technology, the program continues to support global efforts in environmental stewardship, resource management, and sustainable development.',),
              const SizedBox(height: 30), // Optional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
