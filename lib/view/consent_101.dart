import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/auth/login_screen.dart';
import 'package:vouch/widgets/custom_button.dart';

class Consent101 extends StatelessWidget {
  const Consent101({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Consent 101",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "At Vouch, we believe real connection starts with respect. Consent isn't just a rule — it's a mutual understanding that makes every experience safe, genuine, and human.",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Whether you're chatting, meeting, or exploring intimacy, consent is essential — every time, at every step.",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            // What Consent Means Section
            _buildSection(
              title: "What Consent Means",
              content: [
                "Consent means clear, ongoing permission for any form of intimacy — verbal or nonverbal — between two people who are comfortable, aware, and freely choosing to engage.",
                "",
                "It's simple, safe, no confusion, no assumptions. If you're unsure, ask. If you're uncomfortable, say no. Both are equally valid.",
                "",
                "Healthy consent looks like:",
                "• Mutual agreement — both people actively choose to participate",
                "• Clarity — there's no fear, manipulation, or uncertainty",
                "• Ongoing — it doesn't stop once it starts; it's checked in on throughout",
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "And remember: consent can change at any moment. A 'yes' once does not mean 'yes' again.",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade700,
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 30),

            // What Is Not Consent Section
            _buildSection(
              title: "What Is Not Consent",
              content: [
                "Consent must be freely and consciously given. That means it cannot exist when:",
                "",
                "• Someone is impaired by drugs or alcohol and unable to make clear decisions",
                "• Fear, guilt, or pressure are used to gain agreement",
                "• Someone feels unsafe, intimidated, or emotionally manipulated",
                "• Silence, hesitation, or 'maybe' replaces a clear 'yes'",
              ],
            ),
            SizedBox(height: 20),
            Text(
              "And remember: consent can change at any moment. A `Yes`  once does not mean `Yes` again.",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            _buildSection(
              title: "Asking for Consent",
              content: [
                "Asking for consent isnt't awkward - it's confident, respectful, and even attractive",
                "You can ask with words:",
                "\"Do you want to keep going?\"",
                 "\"Is this okay for you?\"",
                  "\"Tell me what you like\"",
                "You can also read nonverable cues - like body langauge, eye contact, or reciprocation but remeber: nonverbal signs can be misread, especailly early on. When in doubt, speak up",
                "",
                "Consent should always be clear, enthusiastic, and continuous. The more you communicate, the safer and more enjoyable the experience becomes",
              ],
            ),
            const SizedBox(height: 30),
             _buildSection(
              title: "Giving Consent",
              content: [
                "Your boundaries matter — and they're yours to define. You never owe intimacy to anyone, no matter how long you've talked, how much you like them, or what you've done before.",
                "",
                "If something doesn't feel right, you can stop — no justification needed. Say, \"I'm not comfortable with that,\" or \"Let's pause.\" Anyone worth your time will respect that without hesitation.",
                "",
                "Consent goes both ways:",
                "• Share what makes you feel comfortable and what doesn't.",
                "• Stay open, honest, and communicative.",
                "• Respect your partner's boundaries just as you want yours respected.",
              ],
            ),
            _buildSection(
              title: "Sexual Assault & Legal Awareness",
              content: [
                "Sexual assault occurs when any sexual activity happens without consent. That includes:",
                "",
                "• Rape or attempted rape",
                "• Nonconsensual touching", 
                "• Coerced or forced acts (verbal, emotional, or physical)",
                "",
                "If you or someone you know has experienced sexual assault:",
                "• Get to a safe place first.",
                "• Contact local authorities if you wish to file a report.",
                "• In the U.S., you can reach the National Sexual Assault Hotline at 1-800-656-HOPE or hotline.rainn.org for confidential support.",
                "",
                "Legal definitions of consent vary by state. You can learn more about your local laws at apps.rainn.org/policy.",
              ],
            ),

            const SizedBox(height: 30),

            // Resources Section
            _buildSection(
              title: "The Vouch Standard",
              content: [
                "Every verified connection on Vouch is built on the same principle: respect above all. We believe in creating an environment where consent, safety, and communication aren't reminders — they're the default.",
                "",
                "Ask clearly. Listen fully. Respect completely. That's not just etiquette — it's trust in action. That's the Vouch standard.",
                "",
                "If you ever feel unsafe or need support:",
                "",
                "• Report concerning behavior through our in-app reporting system",
                "• Reach out to our support team anytime",
                "• Connect with local crisis support services if needed",
                "",
                "Your safety and wellbeing matter to us. You're never alone in this community.",
              ],
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                icon: "",
                text: "Next",
                backgroundColor: AppColors.primary,
                borderColor: AppColors.primary,
                textColor: Colors.black,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<String> content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading4.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        ...content.map((text) {
          if (text.isEmpty) {
            return const SizedBox(height: 8);
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  void _handleNext(BuildContext context) {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Consent guidelines acknowledged!",
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back or to next screen
    Navigator.of(context).pop();
  }
}
