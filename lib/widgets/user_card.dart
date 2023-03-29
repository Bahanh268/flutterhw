import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      this.avatarUrl = 'https://picsum.photos/400',
      required this.id,
      required this.name,
      this.useCachedImage = false});

  final String avatarUrl;
  final String id;
  final String name;
  final bool useCachedImage;

  Widget _renderAvatarMethod() {
    if (useCachedImage) {
      return CachedNetworkImage(
        imageUrl: avatarUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 20,
        ),
      );
    }
    return CircleAvatar(
      backgroundImage: NetworkImage(avatarUrl),
      radius: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          _renderAvatarMethod(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(name)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
