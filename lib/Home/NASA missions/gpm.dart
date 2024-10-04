import 'package:flutter/material.dart';
import 'mission_card.dart';
import 'mission_link.dart';
import 'mission_text_box.dart'; // Import the new InfoTextBox class

class Gpm extends StatelessWidget {
  const Gpm({super.key});

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
                videoPath: 'assets/video/gpm.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'GPM',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionLink(
                linkText: 'https://gpm.nasa.gov/',
                url: 'https://gpm.nasa.gov/',
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
                'Launched in February 2014, the Global Precipitation Measurement (GPM) mission is a collaborative effort between NASA and the Japan Aerospace Exploration Agency (JAXA). The primary goal of GPM is to provide accurate and high-resolution measurements of global precipitation, including rain, snow, and ice. This mission plays a crucial role in understanding the Earth\'s water cycle, weather patterns, and climate change.',
              ),
              const MissionTextBox(
                title: 'Historical Significance',
                content:
                'GPM builds upon the legacy of earlier precipitation missions, such as the Tropical Rainfall Measuring Mission (TRMM), which operated from 1997 to 2015. GPM enhances the accuracy and coverage of precipitation data, providing a more comprehensive understanding of global rainfall and its impacts.',
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
                'GPM continues to operate successfully, providing valuable data for meteorological and climate research. The mission has significantly improved our understanding of precipitation patterns and their effects on weather and climate.',
              ),
              const MissionTextBox(
                title: 'Recent Enhancements',
                content:
                'In 2023, NASA announced improvements to GPM\'s data processing algorithms, resulting in enhanced precipitation estimates and better detection of extreme weather events. These enhancements improve the reliability and usability of GPM data for researchers and decision-makers.',
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
                title: 'Precipitation Measurement',
                content:
                'GPM\'s core instrument, the GPM Microwave Imager (GMI), works alongside the Dual-frequency Precipitation Radar (DPR) to measure precipitation intensity and type with high accuracy. This combination allows GPM to provide detailed information on rainfall rates and snowfall amounts across the globe.',
              ),
              const MissionTextBox(
                title: 'Global Coverage',
                content:
                'GPM provides global precipitation data every 30 minutes, covering both land and ocean regions. This high temporal resolution allows for real-time monitoring of precipitation events and supports weather forecasting and disaster response efforts.',
              ),
              const MissionTextBox(
                title: 'Climate Change Research',
                content:
                'The GPM mission is instrumental in studying climate change and its impacts on global precipitation patterns. By providing long-term precipitation data, GPM helps researchers understand trends in rainfall, drought, and extreme weather events associated with a changing climate.',
              ),
              const MissionTextBox(
                title: 'Disaster Management',
                content:
                'GPM’s data is critical for monitoring and predicting severe weather events, such as hurricanes and floods. By providing accurate rainfall estimates, GPM assists emergency management agencies in making informed decisions during natural disasters.',
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
                'GPM operates under NASA\'s commitment to open data access, allowing users worldwide to access its data products for free. Researchers, policymakers, and educators can obtain GPM data through NASA\’s Earthdata and the GPM Data Center.',
              ),
              const MissionTextBox(
                title: 'Data Products',
                content:
                'GPM provides a variety of data products, including high-resolution precipitation maps, global rainfall estimates, and information on storm intensity. These products are utilized in various fields, including meteorology, hydrology, and climate science.',
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
              const MissionTextBox(title: '', content: 'NASA\'s Global Precipitation Measurement (GPM) mission is a vital component of our understanding of global precipitation and its implications for weather and climate. By delivering high-quality, comprehensive data, GPM supports critical research in meteorology, climate change, and disaster management. The mission exemplifies NASA\'s commitment to advancing scientific knowledge and addressing global environmental challenges.',),
              const SizedBox(height: 30), // Optional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
