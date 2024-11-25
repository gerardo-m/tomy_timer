import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/utils/enums.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/views/meeting/clock/clock_widget.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final _homeButtonTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return HomeBlocBuilder(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TomyTimer'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: HomeScreenOptions.templates,
                  child: Text('Plantillas'),
                ),
                const PopupMenuItem(
                  value: HomeScreenOptions.settings,
                  child: Text('Ajustes'),
                ),
              ],
              onSelected: (value) async {
                switch (value) {
                  case HomeScreenOptions.templates:
                    Navigator.of(context).pushNamed(TomyTimerRoutes.templates);
                  case HomeScreenOptions.settings:
                    await Navigator.of(context).pushNamed(TomyTimerRoutes.settings);
                    if (!context.mounted) return;
                    context.read<HomeCubit>().load();
                    break;
                  default:
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () async {
                  await _homeButtonAction(context, state);
                },
                child: _CurrentMeetingWidget(
                  child: state.currentMeeting == null
                      ? SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.add_rounded,
                                size: 50,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                'Nueva Reunión',
                                style: _homeButtonTextStyle.copyWith(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Column(
                          children: [
                            Text('Reunión en marcha'),
                            ClockWidget(
                              milestoneEditable: false,
                            ),
                          ],
                        ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(TomyTimerRoutes.pastMeetings);
                },
                child: const Text('Ver reuniones pasadas'),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<void> _homeButtonAction(BuildContext context, HomeValid state) async {
    if (state.currentMeeting == null) {
      NewMeetingOptions? selectedOption = await _getNewMeetingOption(context);
      if (selectedOption == null) return;
      if (!context.mounted) return;
      await _newMeeting(context, selectedOption, state);
    } else {
      await Navigator.of(context).pushNamed(TomyTimerRoutes.meeting, arguments: {
        "id": state.currentMeeting?.id,
      });
      if (!context.mounted) return;
      context.read<HomeCubit>().load();
    }
  }

  Future<void> _newMeeting(BuildContext context, NewMeetingOptions option, HomeValid state) async {
    int? newMeetingId;
    if (option == NewMeetingOptions.empty) {
      newMeetingId = await context.read<HomeCubit>().createNewMeeting();
    }
    if (option == NewMeetingOptions.fromTemplate) {
      if (!context.mounted) return;
      ETemplate? selectedTemplate = await _getSelectedTemplate(context, state);
      if (selectedTemplate == null) return;
      if (!context.mounted) return;
      newMeetingId = await context.read<HomeCubit>().createMeetingFromTemplate(selectedTemplate.id);
    }
    if (option == NewMeetingOptions.fromTomy) {
      // TODO
      if (!context.mounted) return;
      String? meetingData = await _getQrCodeData(context);
      // String? meetingData = await Navigator.of(context).pushNamed(TomyTimerRoutes.qrCode);
      if (meetingData == null) return;
      if (!context.mounted) return;
      newMeetingId = await context.read<HomeCubit>().createMeetingFromTomy(meetingData);
    }
    if (newMeetingId == null) return;
    if (!context.mounted) return;
    context.read<ClockCubit>().reset();
    await Navigator.of(context).pushNamed(TomyTimerRoutes.meeting, arguments: {"id": newMeetingId});
  }

  Future<ETemplate?> _getSelectedTemplate(BuildContext context, HomeValid state) async {
    return showDialog<ETemplate>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            if (state.templates.isEmpty)
              Center(
                child: Text(
                  'No hay plantillas',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            for (ETemplate template in state.templates)
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(template);
                },
                child: Text(template.name),
              ),
          ],
        );
      },
    );
  }

  Future<NewMeetingOptions?> _getNewMeetingOption(BuildContext context) async {
    return showDialog<NewMeetingOptions>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(NewMeetingOptions.empty);
              },
              child: const Text('Reunión vacía'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(NewMeetingOptions.fromTemplate);
              },
              child: const Text('Copiar desde plantilla'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(NewMeetingOptions.fromTomy);
              },
              child: const Text('Copiar desde Tomy App'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _getQrCodeData(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Escanea el código QR desde Tomy'),
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width,
              child: MobileScanner(
                onDetect: (barcodes) {
                  Uint8List? data = barcodes.barcodes[0].rawBytes;
                  List<int> decodedData = GZipCodec().decode(data?.toList() ?? []);
                  String fullData = utf8.decode(decodedData);
                  Navigator.of(context).pop(fullData);
                },
                onDetectError: (error, stackTrace) => Navigator.of(context).pop(),
              ),
            )
          ],
        );
      },
    );
  }
}

class _CurrentMeetingWidget extends StatelessWidget {
  const _CurrentMeetingWidget({
    required this.child,
  });

  final Widget child;
  static const _borderRadius = 10.0;
  static const _borderSize = 30.0;
  static const _borderWidth = 5.0;
  static const _borderColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_borderRadius))),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(
                height: _borderSize,
                width: _borderSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(_borderRadius)),
                    border: Border(
                        left: BorderSide(color: _borderColor, width: _borderWidth),
                        top: BorderSide(
                          color: _borderColor,
                          width: _borderWidth,
                        )),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: _borderSize,
                width: _borderSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(_borderRadius)),
                    border: Border(
                        right: BorderSide(color: _borderColor, width: _borderWidth),
                        top: BorderSide(
                          color: _borderColor,
                          width: _borderWidth,
                        )),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              child,
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                height: _borderSize,
                width: _borderSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_borderRadius)),
                    border: Border(
                        left: BorderSide(color: _borderColor, width: _borderWidth),
                        bottom: BorderSide(
                          color: _borderColor,
                          width: _borderWidth,
                        )),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: _borderSize,
                width: _borderSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(_borderRadius)),
                    border: Border(
                        right: BorderSide(color: _borderColor, width: _borderWidth),
                        bottom: BorderSide(color: _borderColor, width: _borderWidth)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
