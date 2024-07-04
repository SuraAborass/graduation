import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/advert.dart';

class AdvertItem extends StatelessWidget {
  const AdvertItem({super.key, required this.advert});
  final Advert advert;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20), // Increase the bottom margin to add more space between ads
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            UIColors.white.withOpacity(0.7),
            UIColors.lightBlack.withOpacity(0.7),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إعلان جديد',
            style: UITextStyle.titleBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'تم النشر: ${advert.createdAt}',
            style: UITextStyle.titleNormal,
          ),
          const SizedBox(height: 10),
          if (advert.image.isNotEmpty)
            Center(
              child: Container(
                width: double.infinity, // Set the container width to full width
                height: 200, // Set a fixed height for the image container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(advert.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
          Text(
            advert.description,
            style: UITextStyle.titleNormal.copyWith(color: UIColors.primary),
          ),
          const SizedBox(height: 10),
          Center(
            child: MaterialButton(
              height: 56,
              minWidth: double.infinity, // Set the button width to full width
              color: UIColors.primary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: const Text('تسجيل', style: UITextStyle.titleBold),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
