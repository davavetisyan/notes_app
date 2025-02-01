import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes_app/core/config/constants/app_assets.dart';
import 'package:notes_app/core/config/theme/app_colors.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/note/add_edit_single_note.dart';
import 'package:notes_app/features/widgets/app_bar_item.dart';

class SingleNoteScreen extends StatelessWidget {
  const SingleNoteScreen({super.key, required this.model, required this.index});
  final NoteModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 78,
        automaticallyImplyLeading: false,
        leading: Container(
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
        actions: [
          AppBarIItem(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditSingleNote(
                    editableModel: model,
                    index: index,
                  ),
                ),
              );
            },
            child: SvgPicture.asset(
              AppSvgs.editIcn,
            ),
          ),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title ?? 'Title',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Text(
                model.content ?? 'Content',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
