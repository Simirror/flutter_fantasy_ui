import 'package:flutter/material.dart';
import 'package:flutter_fantasy_ui/border/atlas_border.dart';
import 'package:flutter_fantasy_ui/border/basilisk_border.dart';
import 'package:flutter_fantasy_ui/border/behemoth_border.dart';
import 'package:flutter_fantasy_ui/border/centaur_border.dart';
import 'package:flutter_fantasy_ui/border/cerberus_border.dart';
import 'package:flutter_fantasy_ui/border/chimera_border.dart';
import 'package:flutter_fantasy_ui/border/crystal_border.dart';
import 'package:flutter_fantasy_ui/border/cyclops_border.dart';
import 'package:flutter_fantasy_ui/border/dragon_border.dart';
import 'package:flutter_fantasy_ui/border/gorgon_border.dart';
import 'package:flutter_fantasy_ui/border/griffin_border.dart';
import 'package:flutter_fantasy_ui/border/harpy_border.dart';
import 'package:flutter_fantasy_ui/border/hydraa_border.dart';
import 'package:flutter_fantasy_ui/border/kraken_border.dart';
import 'package:flutter_fantasy_ui/border/leviathian_border.dart';
import 'package:flutter_fantasy_ui/border/manticore_border.dart';
import 'package:flutter_fantasy_ui/border/medusa_border.dart';
import 'package:flutter_fantasy_ui/border/minotaur_border.dart';
import 'package:flutter_fantasy_ui/border/nemean_border.dart';
import 'package:flutter_fantasy_ui/border/nymph_border.dart';
import 'package:flutter_fantasy_ui/border/oracle_border.dart';
import 'package:flutter_fantasy_ui/border/pegasus_border.dart';
import 'package:flutter_fantasy_ui/border/phoenix_border.dart';
import 'package:flutter_fantasy_ui/border/satyr_border.dart';
import 'package:flutter_fantasy_ui/border/siren_border.dart';
import 'package:flutter_fantasy_ui/border/sphinx_border.dart';
import 'package:flutter_fantasy_ui/border/swallow_boarder.dart';
import 'package:flutter_fantasy_ui/border/sylph_border.dart';
import 'package:flutter_fantasy_ui/border/titan_border.dart';
import 'package:flutter_fantasy_ui/border/unicorn_border.dart';
import 'package:flutter_fantasy_ui/border/valkyrie_border.dart';
import 'package:flutter_fantasy_ui/border/wyvern_border.dart';

class BorderShowcase extends StatelessWidget {
  const BorderShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderWidgets = [
      (AtlasBorder(borderColor: Colors.blue), 'AtlasBorder'),
      (BasiliskBorder(), 'BasiliskBorder'),
      (BehemothBorder(), 'BehemothBorder'),
      (CentaurBorder(), 'CentaurBorder'),
      (CerberusBorder(), 'CerberusBorder'),
      (ChimeraBorder(), 'ChimeraBorder'),
      (CrystalBorder(), 'CrystalBorder'),
      (CyclopsBorder(), 'CyclopsBorder'),
      (DragonBorder(), 'DragonBorder'),
      (GorgonBorder(), 'GorgonBorder'),
      (GriffinBorder(), 'GriffinBorder'),
      (HarpyBorder(), 'HarpyBorder'),
      (HydraaBorder(), 'HydraaBorder'),
      (KrakenBorder(), 'KrakenBorder'),
      (LeviathianBorder(), 'LeviathianBorder'),
      (ManticoreBorder(), 'ManticoreBorder'),
      (MedusaBorder(), 'MedusaBorder'),
      (MinotaurBorder(), 'MinotaurBorder'),
      (NemeanBorder(), 'NemeanBorder'),
      (NymphBorder(), 'NymphBorder'),
      (OracleBorder(), 'OracleBorder'),
      (PegasusBorder(), 'PegasusBorder'),
      (PhoenixBorder(), 'PhoenixBorder'),
      (SatyrBorder(), 'SatyrBorder'),
      (SirenBorder(), 'SirenBorder'),
      (SphinxBorder(), 'SphinxBorder'),
      (SwallowBorder(), 'SwallowBorder'),
      (SylphBorder(), 'SylphBorder'),
      (TitanBorder(), 'TitanBorder'),
      (UnicornBorder(), 'UnicornBorder'),
      (ValkyrieBorder(), 'ValkyrieBorder'),
      (WyvernBorder(), 'WyvernBorder'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('边框展示')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: borderWidgets.length,
        itemBuilder: (context, index) {
          final (border, name) = borderWidgets[index];
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: border,
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
