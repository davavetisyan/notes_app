import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/core/config/theme/app_colors.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/note/single_note_screen.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
    required this.index 
  });

  final NoteModel noteModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleNoteScreen(model: noteModel, index: index,),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 27,
        ),
        decoration: BoxDecoration(
          color: noteModel.color != null
              ? Color(noteModel.color!)
              : Color(AppColors.getRandomColor()),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          noteModel.title ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
