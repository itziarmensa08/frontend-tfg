import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  final String username;
  final String? profileImageUrl;

  const UserProfileWidget({
    super.key,
    required this.username,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (profileImageUrl != null) ...[
          CircleAvatar(
            backgroundImage: NetworkImage(profileImageUrl!),
            radius: 20,
          ),
        ] else ...[
          const CircleAvatar(
            radius: 20,
            child: Icon(Icons.person, size: 24),
          ),
        ],
        const SizedBox(width: 8),
        Text(
          username,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}