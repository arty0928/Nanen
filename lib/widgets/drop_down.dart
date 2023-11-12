import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/constants/constants.dart';
import 'package:wonders/models/models_model.dart';
import 'package:wonders/providers/models_provider.dart';
import 'package:wonders/widgets/text_widget.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModel = 'gpt-3.5-turbo';
  //String? currentModel;

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = modelsProvider.getCurrentModel;

    return FutureBuilder<List<ModelsModel>>(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : DropdownButton(
                  dropdownColor: scaffoldBackgroundColor,
                  iconEnabledColor: Colors.white,
                  items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                            value: snapshot.data![index].id,
                            child: TextWidget(
                              label: snapshot.data![index].id,
                              fontSize: 15,
                            ),
                          )),
                  value: currentModel,
                  onChanged: (value) {
                    setState(() {
                      currentModel = value.toString();
                    });
                    modelsProvider.setCurrentModel(
                      value.toString(),
                    );
                  },
                );
        });
  }
}
