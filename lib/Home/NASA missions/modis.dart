import 'package:flutter/material.dart';
import 'mission_card.dart';
import 'mission_link.dart';
import 'mission_text_box.dart'; // Import the new InfoTextBox class

class Modis extends StatelessWidget {
  const Modis({super.key});

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
                videoPath: 'assets/video/modis.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'MODIC',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionLink(
                linkText: 'https://modis.gsfc.nasa.gov/',
                url: 'https://modis.gsfc.nasa.gov/',
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
                    'The Moderate Resolution Imaging Spectroradiometer (MODIS) is an instrument aboard NASA\'s Terra and Aqua satellites, launched in December 1999 and May 2002, respectively. MODIS is designed to capture high-resolution images of the Earth\’s surface in multiple spectral bands, providing crucial data for monitoring and understanding various environmental processes, including land cover changes, ocean health, and atmospheric conditions.',
              ),
              const MissionTextBox(
                title: 'Historical Significance',
                content:
                    'MODIS has played a pivotal role in Earth observation since its launch, contributing significantly to climate research, environmental monitoring, and disaster response. Its broad range of spectral bands enables scientists to gather a diverse set of data for various applications.',
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
                title: 'Operational Status',
                content:
                    'MODIS continues to operate successfully, delivering valuable data for a wide range of applications. The instrument has maintained high levels of performance, providing consistent data essential for long-term environmental monitoring.',
              ),
              const MissionTextBox(
                title: 'Recent Enhancements',
                content:
                    'In 2023, NASA announced improvements in data processing algorithms for MODIS, enhancing the accuracy and quality of the data products. These updates have been particularly beneficial for applications in agriculture, forestry, and land use planning.',
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
                title: 'Land Surface Monitoring',
                content:
                    'MODIS provides critical data on land cover, vegetation dynamics, and land surface temperature. Its high-resolution images are used to track changes in ecosystems, monitor deforestation, and assess agricultural productivity.',
              ),
              const MissionTextBox(
                title: 'Ocean Observations',
                content:
                    'The instrument monitors ocean color and temperature, providing insights into marine ecosystems and the health of coral reefs. MODIS data is essential for studying ocean currents, phytoplankton blooms, and the impacts of climate change on ocean health.',
              ),
              const MissionTextBox(
                title: 'Atmospheric Studies',
                content:
                    'MODIS plays a crucial role in monitoring atmospheric conditions, including aerosols, clouds, and greenhouse gas concentrations. This data is vital for understanding air quality, climate change, and weather patterns.',
              ),
              const MissionTextBox(
                title: 'Disaster Response and Management',
                content:
                    'MODIS data is invaluable for responding to natural disasters, such as wildfires, hurricanes, and floods. Its rapid revisit capability allows for real-time monitoring and assessment of disaster impacts, supporting emergency management efforts.',
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
                    'MODIS operates under NASA\'s commitment to open data access, allowing users worldwide to access its data products for free. Researchers, educators, and policymakers can obtain MODIS data through NASA\’s Earthdata and the MODIS Data Distribution System.',
              ),
              const MissionTextBox(
                title: 'Data Products',
                content:
                    'MODIS provides a variety of data products, including land surface temperature maps, vegetation indices, ocean color measurements, and atmospheric profiles. These products are used in various fields, including climate science, agriculture, forestry, and environmental management.',
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
              const MissionTextBox(
                title: '*',
                content:
                    'NASA\'s Moderate Resolution Imaging Spectroradiometer (MODIS) mission is a cornerstone of Earth observation, providing essential data for monitoring the environment and understanding climate processes. By delivering high-quality, long-term data, MODIS supports critical research in various fields, including ecology, oceanography, and atmospheric science. The mission exemplifies NASA\'s commitment to advancing scientific knowledge and addressing global environmental challenges.',
              ),
              const SizedBox(height: 30), // Optional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
