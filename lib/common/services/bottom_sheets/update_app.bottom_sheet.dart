import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/common/services/app_update_service/app_update_service.dart';
import 'package:yummy_bites/common/ui/custom_button.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';

class UpdateAppBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const UpdateAppBottomSheet({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.black,
      ),

      child: Column(
        children: [
          sHSpan,
          Expanded(
            child: SvgPicture.asset(
              "assets/svg/update_rocket.svg",
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: lPadding.copyWith(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Update Notice!",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                sHSpan,
                Text(
                  "You need to get the new version of the app to use this and other new features of the app.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                lHSpan,
                Row(
                  children: [
                    if (request.data != null &&
                        request.data is bool &&
                        !request.data!) ...[
                      Expanded(
                        child: CustomOutlinedButton(
                          width: 150,
                          buttonLabel: "Cancel",
                          onPressed: () {
                            completer(SheetResponse(confirmed: false));
                          },
                        ),
                      ),
                      lWSpan,
                    ],
                    Expanded(
                      child: CustomButton(
                        width: 150,
                        buttonLabel: "Update",
                        onPressed: () {
                          appUpdateService.update();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          lHSpan,
        ],
      ),
    );
  }
}
