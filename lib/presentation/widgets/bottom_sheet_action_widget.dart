import 'package:reddit_clone/app/app_dependencies.dart';

class BottomSheetActionWidget extends StatelessWidget {

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const BottomSheetActionWidget({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(vertical: -2), // to expand
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

