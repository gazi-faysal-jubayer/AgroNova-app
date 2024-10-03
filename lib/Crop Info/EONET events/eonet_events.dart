import 'package:agro_nova_app/Crop%20Info/EONET%20events/eonet_services.dart';
import 'package:flutter/material.dart';
import '../../Model/eonet_data_model.dart';
import 'eonet_event_details.dart';

class EonetEvents extends StatefulWidget {
  const EonetEvents({super.key});

  @override
  _EonetEventsState createState() => _EonetEventsState();
}

class _EonetEventsState extends State<EonetEvents> {
  late Future<Welcome> futureEvents;
  final EonetService apiService = EonetService();

  @override
  void initState() {
    super.initState();
    futureEvents = apiService.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Disaster Events", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<Welcome>(
        future: futureEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    snapshot.data!.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.data!.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Events:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Displaying event list with details in a scrollable format
                  Column(
                    children: snapshot.data!.events.map((event) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            event.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            event.geometries.isNotEmpty
                                ? event.geometries[0].date.toString()
                                : "No date available",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EventDetails(event: event),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
