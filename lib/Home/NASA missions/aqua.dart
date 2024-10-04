import 'package:flutter/material.dart';
import 'mission_card.dart';
import 'mission_link.dart';
import 'mission_text_box.dart'; // Import the new InfoTextBox class

class Aqua extends StatelessWidget {
  const Aqua({super.key});

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
                videoPath: 'assets/video/aqua.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Aqua',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionLink(
                linkText: 'https://aqua.nasa.gov/',
                url: 'https://aqua.nasa.gov/',
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
                'Launched in May 2002, the Aqua satellite is part of NASA\'s Earth Observing System (EOS) and plays a crucial role in studying the Earth’s water cycle and its interactions with the climate system. Aqua collects comprehensive data on precipitation, evaporation, and surface temperature, providing insights into how water moves through the atmosphere, oceans, and land.',
              ),
              const MissionTextBox(
                title: 'Historical Significance',
                content:
                'Aqua was designed to complement other EOS missions, enhancing our understanding of global climate dynamics. It was one of the first satellites to use advanced remote sensing technologies to monitor Earth\'s hydrological processes continuously.',
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
                'As of now, Aqua continues to operate successfully, delivering valuable data for various scientific applications. Its long-term observations have significantly contributed to climate research and environmental monitoring.',
              ),
              const MissionTextBox(
                title: 'Recent Enhancements',
                content:
                'In 2023, NASA announced upgrades to Aqua\'s data processing systems, enhancing the accuracy and resolution of its measurements. These improvements support ongoing research in climate science, hydrology, and atmospheric studies.',
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
                title: 'Atmospheric Measurements',
                content:
                'Aqua carries several scientific instruments, including the Atmospheric Infrared Sounder (AIRS), the Advanced Microwave Sounding Unit (AMSU), and the Moderate Resolution Imaging Spectroradiometer (MODIS). These instruments provide critical data on atmospheric temperature, humidity, and cloud properties, essential for weather forecasting and climate modeling.',
              ),
              const MissionTextBox(
                title: 'Ocean and Land Observations',
                content:
                'The satellite also monitors ocean surface temperatures, chlorophyll concentrations, and land surface properties. Aqua\'s data helps track changes in ocean health, including the impacts of climate change on marine ecosystems.',
              ),
              const MissionTextBox(
                title: 'Precipitation and Hydrology',
                content:
                'Aqua is equipped with the Precipitation Radar (PR), which measures rainfall and snowfall, providing valuable insights into global precipitation patterns. This data is vital for understanding the water cycle, flood forecasting, and drought assessment.',
              ),
              const MissionTextBox(
                title: 'Climate Change Research',
                content:
                'Aqua\'s long-term data set is invaluable for studying climate change and its impacts on the Earth’s water cycle. Researchers use Aqua\'s observations to assess trends in temperature, precipitation, and extreme weather events, contributing to our understanding of climate variability and change.',
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
                'Aqua operates under NASA\'s commitment to open access, allowing users worldwide to access its data products freely. Researchers, educators, and policymakers can obtain Aqua’s data through platforms like NASA\'s Earthdata and the MODIS data distribution system.',
              ),
              const MissionTextBox(
                title: 'Data Products',
                content:
                'Aqua provides a variety of data products, including surface temperature maps, cloud cover measurements, and precipitation estimates. These products are used across different disciplines, including climate science, hydrology, and environmental management.',
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
              const MissionTextBox(title: '', content: 'NASA\'s Aqua mission is a vital contributor to our understanding of the Earth’s water cycle and climate system. By providing high-quality, long-term data, Aqua supports critical research in climate change, hydrology, and atmospheric science, aiding scientists and policymakers in addressing pressing environmental challenges. The mission exemplifies NASA\'s commitment to advancing our knowledge of the Earth and its complex systems.',),
              const SizedBox(height: 30), // Optional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
