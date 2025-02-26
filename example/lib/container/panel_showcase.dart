import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/panel/aether_panel.dart';
import 'package:flutter_fantasy_ui/panel/aphrodite_panel.dart';
import 'package:flutter_fantasy_ui/panel/apollo_panel.dart';
import 'package:flutter_fantasy_ui/panel/ares_panel.dart';
import 'package:flutter_fantasy_ui/panel/artemis_panel.dart';
import 'package:flutter_fantasy_ui/panel/astraea_panel.dart';
import 'package:flutter_fantasy_ui/panel/athena_panel.dart';
import 'package:flutter_fantasy_ui/panel/chronos_panel.dart';
import 'package:flutter_fantasy_ui/panel/demeter_panel.dart';
import 'package:flutter_fantasy_ui/panel/dionysus_panel.dart';
import 'package:flutter_fantasy_ui/panel/eirene_panel.dart';
import 'package:flutter_fantasy_ui/panel/eris_panel.dart';
import 'package:flutter_fantasy_ui/panel/eros_panel.dart';
import 'package:flutter_fantasy_ui/panel/hades_panel.dart';
import 'package:flutter_fantasy_ui/panel/harmonia_panel.dart';
import 'package:flutter_fantasy_ui/panel/hecate_panel.dart';
import 'package:flutter_fantasy_ui/panel/helios_panel.dart';
import 'package:flutter_fantasy_ui/panel/hephaestus_panel.dart';
import 'package:flutter_fantasy_ui/panel/hermes_panel.dart';
import 'package:flutter_fantasy_ui/panel/hestia_panel.dart';
import 'package:flutter_fantasy_ui/panel/hypnos_panel.dart';
import 'package:flutter_fantasy_ui/panel/iris_panel.dart';
import 'package:flutter_fantasy_ui/panel/morpheus_panel.dart';
import 'package:flutter_fantasy_ui/panel/nemesis_panel.dart';
import 'package:flutter_fantasy_ui/panel/nike_panel.dart';
import 'package:flutter_fantasy_ui/panel/nyx_panel.dart';
import 'package:flutter_fantasy_ui/panel/persephone_panel.dart';
import 'package:flutter_fantasy_ui/panel/poseidon_panel.dart';
import 'package:flutter_fantasy_ui/panel/selene_panel.dart';
import 'package:flutter_fantasy_ui/panel/thanatos_panel.dart';
import 'package:flutter_fantasy_ui/panel/themis_panel.dart';
import 'package:flutter_fantasy_ui/panel/tyche_panel.dart';

class PanelShowcase extends StatelessWidget {
  const PanelShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final panelWidgets = [
      (AetherPanel(height: 200, width: 200), 'AetherPanel'),
      (AphroditePanel(), 'AphroditePanel'),
      (ApolloPanel(), 'ApolloPanel'),
      (AresPanel(), 'AresPanel'),
      (ArtemisPanel(), 'ArtemisPanel'),
      (AstraeaPanel(), 'AstraeaPanel'),
      (AthenaPanel(), 'AthenaPanel'),
      (ChronosPanel(), 'ChronosPanel'),
      (DemeterPanel(), 'DemeterPanel'),
      (DionysusPanel(), 'DionysusPanel'),
      (EirenePanel(), 'EirenePanel'),
      (ErisPanel(), 'ErisPanel'),
      (ErosPanel(), 'ErosPanel'),
      (HadesPanel(), 'HadesPanel'),
      (HarmoniaPanel(), 'HarmoniaPanel'),
      (HecatePanel(), 'HecatePanel'),
      (HeliosPanel(), 'HeliosPanel'),
      (HephaestusPanel(), 'HephaestusPanel'),
      (HermesPanel(), 'HermesPanel'),
      (HestiaPanel(), 'HestiaPanel'),
      (HypnosPanel(), 'HypnosPanel'),
      (IrisPanel(), 'IrisPanel'),
      (MorpheusPanel(), 'MorpheusPanel'),
      (NemesisPanel(), 'NemesisPanel'),
      (NikePanel(), 'NikePanel'),
      (NyxPanel(), 'NyxPanel'),
      (PersephonePanel(), 'PersephonePanel'),
      (PoseidonPanel(), 'PoseidonPanel'),
      (SelenePanel(), 'SelenePanel'),
      (ThanatosPanel(), 'ThanatosPanel'),
      (ThemisPanel(), 'ThemisPanel'),
      (TychePanel(), 'TychePanel'),
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(title: const Text('面板展示')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: panelWidgets.length,
        itemBuilder: (context, index) {
          final (panel, name) = panelWidgets[index];
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: panel,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
