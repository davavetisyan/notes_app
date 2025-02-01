import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes_app/core/config/constants/app_assets.dart';
import 'package:notes_app/core/config/theme/app_colors.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/note/widgets/custom_dialog.dart';
import 'package:notes_app/features/stores/notes_store.dart';
import 'package:notes_app/features/widgets/app_bar_item.dart';
import 'package:notes_app/service_locator.dart';

class AddEditSingleNote extends StatefulWidget {
  const AddEditSingleNote({super.key, this.editableModel, this.index});
  final NoteModel? editableModel;
  final int? index;

  @override
  State<AddEditSingleNote> createState() => _AddEditSingleNoteState();
}

class _AddEditSingleNoteState extends State<AddEditSingleNote> {
  late final TextEditingController _titleTextEditingController;
  late final TextEditingController _contentTextEditingController;
  @override
  void initState() {
    _titleTextEditingController = TextEditingController();
    _contentTextEditingController = TextEditingController();

    if (widget.editableModel != null) {
      _titleTextEditingController.text = widget.editableModel?.title ?? "";
      _contentTextEditingController.text = widget.editableModel?.content ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _contentTextEditingController.dispose();
    super.dispose();
  }

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
            child: SvgPicture.asset(
              AppSvgs.eyeIcn,
            ),
          ),
          SizedBox(
            width: 21,
          ),
          AppBarIItem(
            onTap: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    text: 'Save changes ?',
                    greenText: 'Save',
                    redText: 'Discard',
                    onGreenPressed: () {
                      if (widget.editableModel == null &&
                          widget.index == null) {
                        locator<NoteStore>().addNewNote(
                          NoteModel(
                            title: _titleTextEditingController.text ?? 'Title',
                            content:
                                _contentTextEditingController.text ?? 'Content',
                            color: AppColors.getRandomColor(),
                          ),
                        );
                      } else {
                        locator<NoteStore>().updateModel(
                            NoteModel(
                              title:
                                  _titleTextEditingController.text ?? 'Title',
                              content: _contentTextEditingController.text ??
                                  'Content',
                              color: widget.editableModel?.color ??
                                  AppColors.getRandomColor(),
                            ),
                            widget.index!);
                      }

                      Navigator.pop(context);
                    },
                    onRedPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            child: SvgPicture.asset(
              AppSvgs.saveIcn,
            ),
          ),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextField(
                 textInputAction: TextInputAction.done,
                controller: _titleTextEditingController,
                decoration: InputDecoration(
                  
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintColor,
                  ),
                ),
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                minLines: 1,
                maxLines: 11,
                cursorColor: AppColors.hintColor,
              ),
              TextField(
                 textInputAction: TextInputAction.done,
                controller: _contentTextEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something...',
                  hintStyle: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintColor,
                  ),
                ),
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                minLines: 1,
                maxLines: 11000,
                cursorColor: AppColors.hintColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
