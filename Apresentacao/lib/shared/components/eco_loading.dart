import 'package:flutter/material.dart';

class EcoLoading {
  EcoLoading._();

  static OverlayEntry? _overlayEntry;

  static show(BuildContext context, {String? text}) {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(builder: (context) {
        return Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(
                color: Colors.black,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircularProgressIndicator(),
                  if (text != null) ...[
                    const SizedBox(height: 16.0),
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      });

      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  static hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
