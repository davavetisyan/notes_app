import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes_app/core/config/constants/app_assets.dart';
import 'package:notes_app/core/config/theme/app_colors.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/widgets/note_item.dart';
import 'package:notes_app/features/note/add_edit_single_note.dart';
import 'package:notes_app/features/stores/notes_store.dart';
import 'package:notes_app/features/widgets/app_bar_item.dart';
import 'package:notes_app/service_locator.dart';

import '../search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NoteStore noteStore;

  @override
  void initState() {
    noteStore = locator();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEditSingleNote()));
            },
            child: AnimatedContainer(
              margin: noteStore.notes.isEmpty
                  ? EdgeInsets.zero
                  : EdgeInsets.only(bottom: 150),
              padding: EdgeInsets.all(11),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mainBgColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(-5, 0),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              duration: Duration(milliseconds: 500),
              child: SvgPicture.asset(AppSvgs.addIcn),
            ),
          );
        },
      ),
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Notes',
            style: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
        actions: [
          AppBarIItem(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child: SvgPicture.asset(
              AppSvgs.searchIcn,
            ),
          ),
          SizedBox(
            width: 21,
          ),
          AppBarIItem(
            child: SvgPicture.asset(
              AppSvgs.infoIcn,
            ),
          ),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: Observer(
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: noteStore.notes.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.emptyNotes,
                      ),
                      Text(
                        'Create your first note !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(top: 40),
                    itemBuilder: (context, index) {
                      String keyValue = noteStore.notes[index].title ?? "";
                      keyValue += noteStore.notes[index].content ?? '';
                      keyValue += noteStore.notes[index].color.toString();
                      return Dismissible(
                        background: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(AppSvgs.deleteIcn),
                        ),
                        key: ValueKey(keyValue),
                        child: NoteItem(
                          noteModel: noteStore.notes[index],
                          index: index,
                        ),
                        onDismissed: (direction) {
                          noteStore.removeNote(noteStore.notes[index]);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                    itemCount: noteStore.notes.length,
                  ),
          );
        },
      ),
    );
  }
}
