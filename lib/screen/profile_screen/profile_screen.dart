import 'package:flutter/material.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: ListView(
        children: [
          ProfileSection(
            title: 'My Account',
            items: [
              ProfileItem(icon: Icons.person, label: 'Profile'),
              ProfileItem(icon: Icons.language, label: 'Language'),
              ProfileItem(icon: Icons.notifications, label: 'Notifications'),
              ProfileItem(icon: Icons.lock, label: 'Privacy'),
              ProfileItem(icon: Icons.help, label: 'Help Center'),
            ],
            actionButton: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: const Text('LOG OUT'),
            ),
          ),
          ProfileSection(
            title: 'Settings',
            items: [
              SwitchItem(label: 'Dark Mode', value: true),
              SwitchItem(label: 'Notifications', value: false),
              SwitchItem(label: 'Auto Updates', value: true),
            ],
          ),
          ProfileSection(
            title: 'Language',
            items: [
              LanguageItem(label: 'English'),
              LanguageItem(label: 'Spanish'),
              LanguageItem(label: 'French'),
            ],
          ),
          ProfileSection(
            title: 'Security',
            items: [
              ActionItem(label: 'Change Password', onTap: () {}),
              ActionItem(label: 'Two-Factor Authentication', onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final Widget? actionButton;

  ProfileSection({required this.title, required this.items, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...items,
              if (actionButton != null) ...[
                const SizedBox(height: 16),
                Center(child: actionButton),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;

  ProfileItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}

class SwitchItem extends StatefulWidget {
  final String label;
  final bool value;

  SwitchItem({required this.label, required this.value});

  @override
  _SwitchItemState createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.label),
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String label;

  LanguageItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: const Icon(Icons.check, color: Colors.blue),
      onTap: () {},
    );
  }
}

class ActionItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  ActionItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
