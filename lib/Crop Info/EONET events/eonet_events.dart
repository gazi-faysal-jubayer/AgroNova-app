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
      appBar: AppBar(title: const Text("NASA EONET Events")),
      body: FutureBuilder<Welcome>(
        future: futureEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Displaying event list with details in a scrollable format
                    SingleChildScrollView(
                      child: Column(
                        children: snapshot.data!.events.map((event) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(event.title),
                              subtitle: Text(
                                event.geometries.isNotEmpty
                                    ? event.geometries[0].date.toString()
                                    : "No description available",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetails(event: event),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                  ],
                ),
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
