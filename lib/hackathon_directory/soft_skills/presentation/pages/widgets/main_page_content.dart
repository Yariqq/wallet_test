import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/list_profile_page.dart';

import '../../../domain/entity/recruiter.dart';

class MainPageContent extends StatelessWidget {
  final List<Recruiter> recruiters;

  const MainPageContent({required this.recruiters, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: recruiters.length,
      itemBuilder: (context, index) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black),
          ),
          leading: Image.network(
              'https://www.seekpng.com/png/full/258-2585503_girl-laptop-.png',
              height: 70,
              width: 70),
          title: Text(recruiters[index].firstName),
          subtitle: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${recruiters[index].rating}',
                ),
              ),
              const SizedBox(width: 7),
              RatingBar.builder(
                itemSize: 26,
                initialRating: recruiters[index].rating,
                ignoreGestures: true,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rat) {},
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ListProfilePage(recruiter: recruiters[index]))),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
    );
  }
}
