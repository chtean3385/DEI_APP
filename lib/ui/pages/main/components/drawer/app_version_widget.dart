
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
class DrawerAppVersion extends StatefulWidget {
  const DrawerAppVersion({super.key});

  @override
  State<DrawerAppVersion> createState() => _DrawerAppVersionState();
}

class _DrawerAppVersionState extends State<DrawerAppVersion> {
  String _version = '';
  String _build = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final info = await PackageInfo.fromPlatform();
    if (!mounted) return;
    setState(() {
      _version = info.version;
      _build = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_version -->> $_version");
    if (_version.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
            'App version $_version ($_build)',
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              color: context.colors.grey,
              fontWeight: FontWeight.w400,
            )
        ),
      ),
    );
  }
}