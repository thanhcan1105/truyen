import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:truyen/app/controllers/read_story_controller.dart';

class SettingTheme extends StatelessWidget {
  const SettingTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReadStoryController controller = Get.put(ReadStoryController());
    Color getForegroundOnBackground(Color backgroundColor) {
      double luminance = backgroundColor.computeLuminance();
      return luminance > 0.5 ? Colors.black : Colors.white;
    }

    double sizeText = controller.textSize / 6;

    // Color color = getForegroundOnBackground(controller.backgroundColor);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Obx(
              () => controller.isLoading.value
                  ? const SizedBox(
                      height: 200,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      // constraints: const BoxConstraints(minHeight: 200),
                      height: 200,
                      color: controller.backgroundColor,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...controller.listBackground.map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      controller.changeBackground(e['color']);
                                      controller.numSelected.value = e['id'];
                                    },
                                    child: Obx(
                                      () => Background(
                                        color: e['color'],
                                        textColor: getForegroundOnBackground(
                                            e['color']),
                                        selectedColor:
                                            getForegroundOnBackground(
                                                e['color']),
                                        isSelected:
                                            controller.numSelected.value ==
                                                    e['id']
                                                ? true
                                                : false,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    height: 30,
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Font chữ',
                                          style: TextStyle(
                                            color: getForegroundOnBackground(
                                                controller.backgroundColor),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            controller.decrementSize();
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    getForegroundOnBackground(
                                                  controller.backgroundColor,
                                                ),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              '-',
                                              style: TextStyle(
                                                color:
                                                    getForegroundOnBackground(
                                                        controller
                                                            .backgroundColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${controller.numSize}%',
                                          style: TextStyle(
                                            color: getForegroundOnBackground(
                                                controller.backgroundColor),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.incrementSize();
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    getForegroundOnBackground(
                                                        controller
                                                            .backgroundColor),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                color:
                                                    getForegroundOnBackground(
                                                        controller
                                                            .backgroundColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _showBottomSheetStyle(
                                              context,
                                              controller,
                                              controller.backgroundColor,
                                              [
                                                FontItem(
                                                  color:
                                                      getForegroundOnBackground(
                                                          controller
                                                              .backgroundColor),
                                                  name: 'Mặc định',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color:
                                                        getForegroundOnBackground(
                                                            controller
                                                                .backgroundColor),
                                                  ),
                                                  function: () {
                                                    controller.theme.value =
                                                        'Roboto';
                                                  },
                                                ),
                                                FontItem(
                                                  color:
                                                      getForegroundOnBackground(
                                                          controller
                                                              .backgroundColor),
                                                  name: 'Lato',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    color:
                                                        getForegroundOnBackground(
                                                            controller
                                                                .backgroundColor),
                                                  ),
                                                  function: () {
                                                    controller.theme.value =
                                                        'Lato';
                                                  },
                                                ),
                                                FontItem(
                                                  color:
                                                      getForegroundOnBackground(
                                                          controller
                                                              .backgroundColor),
                                                  name: 'Bruno',
                                                  style: TextStyle(
                                                    fontFamily: 'Bruno',
                                                    color:
                                                        getForegroundOnBackground(
                                                            controller
                                                                .backgroundColor),
                                                  ),
                                                  function: () {
                                                    controller.theme.value =
                                                        'Bruno';
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    getForegroundOnBackground(
                                                        controller
                                                            .backgroundColor),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              'Thêm font',
                                              style: TextStyle(
                                                color:
                                                    getForegroundOnBackground(
                                                  controller.backgroundColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: getForegroundOnBackground(
                                        controller.backgroundColor,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      _showBottomSheetStyle(
                                        context,
                                        controller,
                                        controller.backgroundColor,
                                        [
                                          GestureDetector(
                                            onTap: () {
                                              Get.close(2);
                                              controller.getChapterData();
                                              controller.isScrollHori.value =
                                                  true;
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: controller
                                                        .isScrollHori.value
                                                    ? getForegroundOnBackground(
                                                        controller
                                                            .backgroundColor)
                                                    : null,
                                                border: Border.all(
                                                  color:
                                                      getForegroundOnBackground(
                                                    controller.backgroundColor,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Text(
                                                'Cuộn dọc',
                                                style: TextStyle(
                                                    color: controller
                                                            .isScrollHori.value
                                                        ? controller
                                                            .backgroundColor
                                                        : getForegroundOnBackground(
                                                            controller
                                                                .backgroundColor,
                                                          ),
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.close(2);
                                              controller.getChapterData();
                                              controller.isScrollHori.value =
                                                  false;
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: controller
                                                        .isScrollHori.value
                                                    ? null
                                                    : getForegroundOnBackground(
                                                        controller
                                                            .backgroundColor),
                                                border: Border.all(
                                                  color:
                                                      getForegroundOnBackground(
                                                    controller.backgroundColor,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Text(
                                                'Cuộn ngang',
                                                style: TextStyle(
                                                    color: controller
                                                            .isScrollHori.value
                                                        ? getForegroundOnBackground(
                                                            controller
                                                                .backgroundColor,
                                                          )
                                                        : controller
                                                            .backgroundColor,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    child: Text(
                                      'Chuyển trang',
                                      style: TextStyle(
                                        color: getForegroundOnBackground(
                                          controller.backgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: getForegroundOnBackground(
                                        controller.backgroundColor,
                                      ),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Cài đặt',
                                    style: TextStyle(
                                      color: getForegroundOnBackground(
                                        controller.backgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            );
          },
        );
      },
      child: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Icon(
                Iconsax.setting,
                color: getForegroundOnBackground(
                  controller.backgroundColor,
                ),
              ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  Background({
    required this.color,
    this.selectedColor,
    this.textColor,
    required this.isSelected,
    super.key,
  });

  Color? selectedColor;
  Color? color;
  Color? textColor;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: selectedColor ?? Colors.white, width: 2)
            : null,
      ),
      child: Text(
        'Aa',
        style: TextStyle(
          color: textColor ?? Colors.black,
        ),
      ),
    );
  }
}

void _showBottomSheetStyle(
    context, controller, Color color, List<Widget> list) {
  Color getForegroundOnBackground(Color backgroundColor) {
    double luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        color: color,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            childAspectRatio: 3.5,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: list,
          ),
        ),
      );
    },
  );
}

class FontItem extends StatelessWidget {
  FontItem({
    required this.color,
    required this.name,
    required this.style,
    required this.function,
    super.key,
  });

  String name;
  TextStyle style;
  Color color;
  Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
          ),
        ),
        child: Text(
          name,
          style: style,
        ),
      ),
    );
  }
}
