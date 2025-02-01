import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/widgets/note_item.dart';
import 'package:notes_app/features/stores/notes_store.dart';
import 'package:notes_app/service_locator.dart';

import '../../core/config/constants/app_assets.dart';
import '../../core/config/theme/app_colors.dart';
import '../widgets/app_bar_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  final ValueNotifier<List<NoteModel>> searchedModel =
      ValueNotifier<List<NoteModel>>([]);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_searchController.text.isNotEmpty) {
        print('hello');
        List<NoteModel> tmpList = [];
        locator<NoteStore>().notes.forEach((item) {
          if (item.title != null &&
              item.title!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) {
            tmpList.add(item);
          }
        });

        searchedModel.value = tmpList;
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: AppBarIItem(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppSvgs.backIcn,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.appBarItemBgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 27.0),
                    padding: EdgeInsets.only(left: 27.0, right: 10),
                    child: Stack(children: [
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search by the keyword...',
                          hintStyle: TextStyle(color: AppColors.hintColor),
                          border: InputBorder.none,
                        ),
                        cursorColor: AppColors.hintColor,
                        style: TextStyle(color: AppColors.white),
                      ),
                      Positioned(
                        right: 0,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            _searchController.text = "";
                          },
                          child: SvgPicture.asset(AppSvgs.closeIcn),
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: searchedModel,
              builder:
                  (BuildContext context, List<NoteModel> value, Widget? child) {
                if (value.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.emptySearch),
                      Text(
                        'File not found. Try searching again.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 27.0),
                      itemBuilder: (context, index) {
                        String keyValue =
                            searchedModel.value[index].title ?? "";
                        keyValue += searchedModel.value[index].content ?? '';
                        keyValue += searchedModel.value[index].color.toString();
                        return NoteItem(
                          noteModel: searchedModel.value[index],
                          index: locator<NoteStore>()
                              .notes
                              .indexOf(searchedModel.value[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                      itemCount: searchedModel.value.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
