import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zidan Kusuma',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1E1E1E),
          secondary: Color(0xFF8C8C8C),
          background: Color(0xFFF8F8F8),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        fontFamily: 'Inter',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // fungsi helper
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Foto profil
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                ),
                const SizedBox(height: 24),

                // Nama
                Text(
                  'M Zidan Kusuma Firdaus',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 6),

                // Subjudul
                Text(
                  'Informatics Student • 231080200078',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Ikon kontak
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _IconButton(
                      icon: Icons.email_outlined,
                      onTap: () => _launchUrl(
                        'mailto:zidankusumafirdaus.school@gmail.com',
                      ),
                    ),
                    const SizedBox(width: 20),
                    _IconButton(
                      icon: Icons.phone_outlined,
                      onTap: () => _launchUrl('tel:+6281234567890'),
                    ),
                    const SizedBox(width: 20),
                    _IconButton(
                      icon: Icons.location_on_outlined,
                      onTap: () => _launchUrl(
                        'https://maps.app.goo.gl/UmxgpiBnbNEDkdFp6',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Tombol utama
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                      side: BorderSide(
                        color: theme.colorScheme.primary.withOpacity(0.4),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => _launchUrl(
                      'https://wa.me/6281234567890',
                    ), // ke WhatsApp
                    icon: const Icon(Icons.send_rounded, size: 20),
                    label: const Text(
                      'Call me',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 22,
          color: theme.colorScheme.primary.withOpacity(0.8),
        ),
      ),
    );
  }
}
