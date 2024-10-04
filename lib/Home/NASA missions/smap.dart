import 'package:flutter/material.dart';
import 'mission_card.dart';
import 'mission_link.dart';
import 'mission_text_box.dart'; // Import the new InfoTextBox class

class Smap extends StatelessWidget {
  const Smap({super.key});

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
                videoPath: 'assets/video/smap.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'SMAP',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionLink(
                linkText: 'https://smap.jpl.nasa.gov/',
                url: 'https://smap.jpl.nasa.gov/',
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
                'The Soil Moisture Active Passive (SMAP) mission, launched by NASA in January 2015, aims to measure and map global soil moisture levels. Soil moisture is crucial for understanding various environmental processes, including weather patterns, climate change, and agriculture. SMAP’s data helps improve weather forecasting, hydrological models, and climate assessments.',
              ),
              const MissionTextBox(
                title: 'Historical Significance',
                content:
                'The SMAP mission represents a significant advancement in soil moisture remote sensing. It provides continuous global measurements, filling critical gaps in our understanding of the Earth\'s water cycle and enhancing the capacity to monitor soil moisture variations over time.',
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
                'Since its launch, SMAP has been providing high-quality soil moisture data. It underwent a successful calibration and validation phase, allowing researchers and agencies to rely on its measurements for various applications. As of now, SMAP continues to operate and deliver data to users worldwide.',
              ),
              const MissionTextBox(
                title: 'Recent Enhancements',
                content:
                'In 2022, NASA implemented updates to SMAP’s data processing algorithms, improving the accuracy of soil moisture estimates. These enhancements include better handling of snow cover and surface conditions, which are vital for more precise soil moisture readings.',
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
                title: 'Soil Moisture Mapping',
                content:
                'SMAP utilizes both active and passive microwave sensing technologies to measure surface soil moisture with high spatial resolution. The mission provides data at a resolution of 1 kilometer, allowing for detailed analysis of soil moisture variations across different landscapes.',
              ),
              const MissionTextBox(
                title: 'Climate and Weather Research',
                content:
                'The data collected by SMAP is instrumental for improving weather forecasts and climate models. Accurate soil moisture information helps meteorologists predict rainfall, drought conditions, and extreme weather events, which are increasingly relevant in a changing climate.',
              ),
              const MissionTextBox(
                title: 'Agricultural Monitoring',
                content:
                'Farmers and agricultural researchers benefit from SMAP’s soil moisture data, which aids in managing irrigation and assessing crop health. The information helps optimize water usage, leading to improved agricultural productivity and sustainability.',
              ),
              const MissionTextBox(
                title: 'Hydrological Studies',
                content:
                'SMAP contributes to hydrological research by providing essential data for understanding water movement through the soil, plants, and atmosphere. This information is crucial for managing water resources, especially in regions susceptible to flooding or drought.',
              ),
              const MissionTextBox(
                title: 'Natural Disaster Response',
                content:
                'The mission supports emergency response efforts during natural disasters by providing real-time soil moisture data. This information can help assess flood risks and inform decision-making during events such as heavy rainfall or snowmelt.',
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
                'SMAP operates under NASA’s commitment to open data access. Users can access soil moisture data and related products through platforms like NASA’s Earthdata and the SMAP Data Center. This policy encourages the use of SMAP data across various fields, including research, agriculture, and environmental management.',
              ),
              const MissionTextBox(
                title: 'Data Products',
                content:
                'SMAP offers a range of data products, including soil moisture maps, freeze/thaw state information, and vegetation water content. These products are tailored to meet the needs of different users, from scientists to policymakers.',
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
              const MissionTextBox(title: '*', content: 'The SMAP mission plays a vital role in advancing our understanding of soil moisture and its impact on the Earth’s environment. By providing comprehensive and accessible data, SMAP supports critical applications in climate research, agriculture, and natural disaster management, contributing to a better understanding of our planet’s water cycle and its implications for life on Earth.',),
              const SizedBox(height: 30), // Optional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
