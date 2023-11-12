import 'package:wonders/common_libs.dart';
import 'package:wonders/constants/constants.dart';
import 'package:wonders/widgets/drop_down.dart';
import 'package:wonders/widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: 'Chosen Model:',
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ModelsDropDownWidget(),
                )
              ],
            ),
          );
        });
  }
}
