part of 'container_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
        padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.notifications_none_outlined, size: 32),
                  title: Text(BaseTranslation.Notify.tr),
                  children: [
                    SwitchListTile(
                      value: true,
                      onChanged: (value) {},
                      title: const Text("Tin tức chuyên mục mới"),
                    ),
                    SwitchListTile(
                      value: false,
                      onChanged: (value) {},
                      title: const Text("Bài viết của bạn"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.subject_outlined, size: 32),
                  title: Text(BaseTranslation.UserManual.tr),
                  children: [
                    SwitchListTile(
                      value: true,
                      onChanged: (value) {},
                      title: const Text("Hướng dẫn phân tích da"),
                      subtitle: const Text("Bật/Tắt HD trước khi bắt đầu phân tích da"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.help,
                    size: 32,
                  ),
                  title: Text(BaseTranslation.FrequentlyAskedQuestions.tr),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.translate_outlined, size: 32),
                  title: Text(BaseTranslation.Language.tr),
                  children: [
                    MyRadioListTile<Locale?>(
                      value: TranslationService.locales[0],
                      groupValue: TranslationService.locale.value,
                      onChanged: (Locale? value) => TranslationService.changeLocale(value!),
                      title: Text(BaseTranslation.English.tr),
                    ),
                    MyRadioListTile<Locale?>(
                      value: TranslationService.locales[1],
                      groupValue: TranslationService.locale.value,
                      onChanged: (Locale? value) => TranslationService.changeLocale(value!),
                      title: Text(BaseTranslation.Vietnamese.tr),
                    ),
                    // MyRadioListTile<Locale?>(
                    //   value: TranslationService.locales[2],
                    //   groupValue: TranslationService.locale.value,
                    //   onChanged: (Locale? value) => TranslationService.changeLocale(value!),
                    //   title: Text(StringConstant.Japanese.tr),
                    // ),
                  ],
                ),
              ),
              //
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: ExpansionTile(
                  leading: const Icon(Icons.shield_outlined, size: 32),
                  title: Text(BaseTranslation.Juridical.tr),
                  children: const [
                    ListTile(title: Text('ABCXYZ')),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.edit_outlined,
                    size: 32,
                  ),
                  title: Text(BaseTranslation.GeneralAssessment.tr),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  //boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))],
                ),
                child: SwitchListTile(
                  value: Service.themeDarkMode.value,
                  onChanged: (value) {
                    value ? Get.changeThemeMode(ThemeMode.dark) : Get.changeThemeMode(ThemeMode.light);
                    Service.themeDarkMode.value = value;
                  },
                  title: Text(BaseTranslation.DarkMode.tr),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {}, //=> LoginController.logout(),
                  child: Text(
                    BaseTranslation.Logout.tr,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 50)
            ])),
          ],
        )));
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            isSelected ? const Icon(Icons.check, color: Colors.blue) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
