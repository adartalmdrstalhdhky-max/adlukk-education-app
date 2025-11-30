// app/lib/features/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/sync_service.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sync = Provider.of<SyncService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ADLUKK — Home'),
        actions: [
          IconButton(
            onPressed: () {
              final pending = sync.pending();
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Pending Sync Operations'),
                  content: Text(pending.isEmpty
                      ? 'No pending ops'
                      : pending.map((e) => e.toString()).join('\n')),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.sync),
            tooltip: 'Show pending sync',
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ADLUKK Education Platform',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Enqueue test sync'),
              onPressed: () {
                sync.enqueue({
                  'type': 'test',
                  'timestamp': DateTime.now().toIso8601String(),
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Test sync enqueued')),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open content folder (read only)'),
              onPressed: () {
                // placeholder - later will open content viewer
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Content viewer not implemented yet')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
