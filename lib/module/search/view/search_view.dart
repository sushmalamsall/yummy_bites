import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_keyboard_hide.dart';
import 'package:yummy_bites/common/ui/custom_search_bar.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/module/search/viewmodel/search_view_model.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) {
        return CustomKeyboardHide(
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: xlPadding.copyWith(bottom: 0),
                    child: CustomSearchBar(
                      hintText: "Search meals...",
                      onChanged: (value) {},
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      itemCount: 10, // dummy items
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey, // line color
                                width: 0.2, // line thickness
                              ),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, // increase vertical padding
                              horizontal: 16,
                            ),
                            leading: Container(
                              height: 50, // slightly larger circle
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.fastfood,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            title: Text(
                              'Dummy Meal Name $index',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              'Description or subtext',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 16,
                            ),
                            onTap: () {
                              // handle tap if needed
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
