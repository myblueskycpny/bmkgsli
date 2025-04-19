import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../audio manager/audio_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioManager = Provider.of<AudioManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 19,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PENGATURAN UMUM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SwitchListTile(
                    activeTrackColor: Colors.blue,
                    title: const Text('Suara',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                    value: audioManager.isMusicOn,
                    onChanged: (value) async {
                      await audioManager.toggleMusic();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(19),
                          child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Tentang Aplikasi SLI',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '    V2.0.1',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/about-page');
                          },
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/about-page'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 0.7,
                indent: 19,
                endIndent: 19,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
