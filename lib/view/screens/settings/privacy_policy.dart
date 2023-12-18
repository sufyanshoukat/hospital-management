import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/sliver_app_bar_widget_first.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidegtFirst(
            title: "Privacy Policy",
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "1. Types data we collect",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    paddingTop: 15,
                    text:
                        """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.""",
                    size: 12,
                    weight: FontWeight.w400,
                    color: kBlackColor50Percent,
                  ),
                  MyText(
                    paddingTop: 9,
                    text: "2. Use of your personal data",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    paddingTop: 15,
                    text:
                        """Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.""",
                    size: 12,
                    weight: FontWeight.w400,
                    color: kBlackColor50Percent,
                  ),
                  MyText(
                    paddingTop: 9,
                    text: "3. Disclosure of your personal data",
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    paddingTop: 15,
                    text:
                        """At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.\n\nEt harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\n\nTemporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus""",
                    size: 12,
                    weight: FontWeight.w400,
                    color: kBlackColor50Percent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
