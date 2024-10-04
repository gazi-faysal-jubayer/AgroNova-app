import 'package:flutter/material.dart';
import 'mission_card.dart';
import 'mission_link.dart';
import 'mission_text_box.dart'; // Import the new InfoTextBox class

class Grace extends StatelessWidget {
  const Grace({super.key});

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
                videoPath: 'assets/video/grace.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'GRACE',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const MissionLink(
                linkText: 'https://gracefo.jpl.nasa.gov/',
                url: 'https://gracefo.jpl.nasa.gov/',
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
                    'The Gravity Recovery and Climate Experiment (GRACE) mission, launched in March 2002, is a joint initiative between NASA and the German Aerospace Center (DLR). Its primary objective is to measure variations in Earth\'s gravity field with high precision. These measurements help scientists understand changes in mass distribution related to water storage, ice sheets, sea level rise, and other climate-related phenomena.',
              ),
              const MissionTextBox(
                title: 'Historical Significance',
                content:
                    'GRACE has revolutionized our understanding of the Earth\'s water cycle and mass changes. By providing data on how gravity changes over time, the mission has contributed significantly to research in hydrology, glaciology, and climate science.',
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
                title: 'Mission Extension and Successor',
                content:
                    'GRACE operated successfully until its decommissioning in October 2017. However, its legacy continues with the GRACE Follow-On (GRACE-FO) mission, launched in May 2018. GRACE-FO builds on the original mission\'s success, using advanced technology to continue monitoring changes in Earth\'s gravity field.',
              ),
              const MissionTextBox(
                title: 'Recent Enhancements',
                content:
                    'GRACE-FO has implemented improved measurement techniques, including a laser ranging system that enhances the precision of gravity measurements. This advancement allows for better monitoring of mass changes, particularly in the polar regions and large aquifers.',
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
                title: 'Gravity Measurements',
                content:
                    'GRACE measures the gravitational pull exerted by Earth\'s mass. By analyzing variations in gravity, scientists can infer changes in mass distribution, which is crucial for understanding water movement, ice mass loss, and sea level changes.',
              ),
              const MissionTextBox(
                title: 'Water Cycle Monitoring',
                content:
                    'The mission provides essential data for tracking water storage changes in lakes, rivers, reservoirs, and groundwater aquifers. This information is vital for water resource management and understanding droughts and floods.',
              ),
              const MissionTextBox(
                title: 'Ice Sheet Dynamics',
                content:
                    'GRACE has played a crucial role in studying polar ice sheets in Greenland and Antarctica. By measuring mass loss from these ice sheets, GRACE contributes to understanding global sea level rise and the effects of climate change on polar regions.',
              ),
              const MissionTextBox(
                title: 'Earthquake Research',
                content:
                    'The mission has also been instrumental in analyzing gravitational changes associated with large earthquakes, providing insights into how tectonic activity affects mass distribution and the Earth’s gravity field.',
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
                    'GRACE operates under NASA\'s commitment to open data access. Users worldwide can access GRACE and GRACE-FO data products for free. Researchers, educators, and policymakers can obtain data through NASA\’s Earthdata and the GRACE Data System.',
              ),
              const MissionTextBox(
                title: 'Data Products',
                content:
                    'GRACE provides a variety of data products, including monthly global gravity field solutions, mass change estimates, and water storage changes. These products support research in various fields, including climate science, hydrology, and geology.',
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
                    'NASA\'s Gravity Recovery and Climate Experiment (GRACE) mission has profoundly impacted our understanding of the Earth\'s gravity field and its relationship with the water cycle and climate change. By delivering high-quality, long-term data, GRACE and its successor, GRACE-FO, continue to support critical research in hydrology, glaciology, and environmental science. The mission exemplifies NASA\'s commitment to advancing scientific knowledge and addressing global challenges related to climate change and water resource management.',
              ),
              const SizedBox(height: 30), // Optional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
