import 'package:flutter/material.dart';
import 'package:wavekeeper/views/album_view.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final Function()? onTap;
  final double size;

  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumView(
                    image: image,
                  ),
                ),
              );
            }
          : null,
      child: Semantics(
        image: true,
        label: label,
        child: ExcludeSemantics(
          child: Container(
            constraints: BoxConstraints(minHeight: size, minWidth: size),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: image,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
