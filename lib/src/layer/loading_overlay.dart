import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:supercluster/supercluster.dart';

class LoadingOverlay extends StatelessWidget {
  final Future<Supercluster<Marker>> superclusterFuture;
  final Function(ConnectionState)? loadingOverlayBuilder;

  const LoadingOverlay({
    super.key,
    required this.superclusterFuture,
    required this.loadingOverlayBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Supercluster<Marker>>(
      future: superclusterFuture,
      builder: (context, snapshot) {
        return loadingOverlayBuilder?.call(snapshot.connectionState) ??
            Container(
              color: Colors.black26,
              child: const Center(
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 24, 18, 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16.0),
                        Text('Building clusters'),
                      ],
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }
}
