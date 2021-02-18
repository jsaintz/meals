import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glúten',
                    'Só exibe refeições sem glúten!',
                    settings.isGlutenFree,
                    (value) => setState(
                      () => settings.isGlutenFree = value,
                    ),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem Lactose!',
                    settings.isLactoseFree,
                    (value) => setState(
                      () => settings.isLactoseFree = value,
                    ),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas!',
                    settings.isVegan,
                    (value) => setState(
                      () => settings.isVegan = value,
                    ),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições Vegetarianas!',
                    settings.isVegetarian,
                    (value) => setState(
                      () => settings.isVegetarian = value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
