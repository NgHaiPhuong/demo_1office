import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  const HomeHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.grid_view_outlined, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              userName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(width: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.bookmark_border_outlined, size: 30),
              const SizedBox(width: 12),
              const Icon(
                Icons.details_outlined,
                color: Colors.orange,
                size: 30,
              ),
              const SizedBox(width: 12),
              Stack(
                children: [
                  const Icon(Icons.notifications_none, size: 30),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 14,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              const Icon(Icons.home_filled, color: Colors.green, size: 30),
            ],
          ),
        ],
      ),
    );
  }
}

