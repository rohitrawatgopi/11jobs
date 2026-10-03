import 'package:flutter/material.dart';

class AppColors {
  static const Color appColor = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF1D4ED8);
  static const Color ternary = Color(0xFF0F172A);
  static const Color fourth = Color(0xFFF59E0B);
  static const Color white = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  // AppColors class ke andar add karo
  static BoxDecoration pageBg(bool dark) {
    if (dark) return BoxDecoration(color: bg(true));
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFDBEAFE), Color(0xFFEFF6FF), Color(0xFFF8FAFC)],
        stops: [0.0, 0.38, 1.0],
      ),
    );
  }

  static Color bg(bool dark) =>
      dark ? const Color(0xFF0B1220) : const Color(0xFFF8FAFC);
  static Color surface(bool dark) =>
      dark ? const Color(0xFF111827) : Colors.white;
  static Color text(bool dark) =>
      dark ? const Color(0xFFF1F5F9) : const Color(0xFF0F172A);
  static Color subText(bool dark) =>
      dark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
  static Color border(bool dark) =>
      dark ? const Color(0xFF1F2937) : const Color(0xFFE2E8F0);
  static const Color budgetRange = Color(0xFF9A9898);
  static const Color chatSearchiconcolor = Color(0xFFD9D9D9);
  static const Color budgetRangeText = Color(0xFF918F8F);
  static const Color redLightBlood = Color(0xFFFE2C55);
  static const Color textColor = Color(0xFF000000);
  static const Color greyClickTounlock = Color(0xFF7F7F7F);
  static const Color yellowLight = Color(0xFFE2C400);
  static const Color greyShare = Color(0xFF5D5D5D);
  static const Color black = Colors.black;
  static const Color orangeSave = Color(0xFFD28D0B);
  static const Color redChat = Color(0xFFFF0000);
  static const Color blueMessageImage = Color(0xFF0D99FF);
  static const Color blackLightNumber = Color(0xFF1E4FB0);
  static const Color textLightColor = Color(0xFF888686);
  static const Color bloodRequestText = Color(0xFFC1B4B4);
  static const Color optBackColor = Color(0xFFDADADA);

  static const Color textMoreLight = Color(0xFFEDEDED);
  static const Color lightOrangeColor = Color(0xFFEDEDED);
  static const Color greenWhatsapp = Color(0xFF00AD3F);
  static const Color resendColor = Color(0xFF8B8B8B);
  static const Color walletcard = Color(0xFFECA6FF);

  static const Color pink = Color(0xFFFE2007B);
  static const Color chatAppBarColor = Color(0xFFFB7416);
  static const Color emergencyBloodCard = Color(0xFFFB2F39);
  static const Color bloodNotificartionLight = Color(0xFFFFE2E2);

  static const Color postajobCategory = Color(0xFFF3F3F3);
  static const Color chatisNowColor = Color(0xFFFFCC00);
  static const Color chatisNowCardColor = Color(0xFF29223F);
  // static const Color appColor = Colors.orange;
}
