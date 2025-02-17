import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PrivacyPolicy".tr, // "Privacy Policy"
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            _buildText("privacy_policy_title".tr,
                isBold: true), // "Privacy Policy for El Mahdy Store"
            _buildText(
                "effective_date".tr), // "Effective Date: January 20, 2023"
            _buildText("privacy_overview"
                .tr), // "At El Mahdy Store, we value your trust..."
            _buildText("information_we_collect".tr,
                isBold: true), // "1. Information We Collect"
            _buildText("information_collection_overview"
                .tr), // "We collect the following information when you use the app:"
            _buildText("personal_info"
                .tr), // "• Personal Information: Such as your name, email, and phone number..."
            _buildText("account_info"
                .tr), // "• Account Information: Such as your username and password."
            _buildText("device_info"
                .tr), // "• Device and Browsing Information: Such as IP address..."
            _buildText("cookies_tracking"
                .tr), // "• Cookies and Tracking Data: Used to enhance your experience..."
            _buildText("how_we_use_info".tr,
                isBold: true), // "2. How We Use Your Information"
            _buildText("use_for_improvement"
                .tr), // "• To improve our services and enhance user experience."
            _buildText("use_for_orders"
                .tr), // "• To process orders and communicate with you..."
            _buildText("use_for_analysis"
                .tr), // "• To analyze data to improve the app’s performance..."
            _buildText("use_for_compliance"
                .tr), // "• To comply with legal and regulatory requirements."
            _buildText("sharing_info".tr,
                isBold: true), // "3. Sharing Your Information"
            _buildText("sharing_commitment"
                .tr), // "We are committed to protecting your privacy..."
            _buildText("service_providers"
                .tr), // "• Service Providers: Who assist us in operating the app..."
            _buildText("legal_requirements"
                .tr), // "• Legal Requirements: If required by law..."
            _buildText("info_security".tr,
                isBold: true), // "4. Information Security"
            _buildText("security_measures"
                .tr), // "We use advanced security measures, including encryption..."
            _buildText("user_rights".tr, isBold: true), // "5. User Rights"
            _buildText("right_to_access"
                .tr), // "• Access your personal information and update or correct it."
            _buildText("right_to_delete"
                .tr), // "• Request the deletion of your information from our systems."
            _buildText("right_to_object"
                .tr), // "• Object to the processing of your data for marketing purposes."
            _buildText("right_to_withdraw"
                .tr), // "• Withdraw consent to data processing at any time..."
            _buildText("children_privacy".tr,
                isBold: true), // "6. Children's Privacy"
            _buildText("children_privacy_info"
                .tr), // "Our app is not directed to children under 13..."
            _buildText("changes_to_policy".tr,
                isBold: true), // "7. Changes to the Privacy Policy"
            _buildText("policy_changes_notice"
                .tr), // "We may update this privacy policy from time to time..."
            _buildText("contact_us".tr, isBold: true), // "8. Contact Us"
            _buildText(
                "contact_email".tr), // "• Email: info@elmahdy-techno-light.com"
            _buildText("contact_phone".tr), // "• Phone: 01094473883"
            _buildText("contact_landline".tr), // "• Landline: 0402384165"
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text, {bool isBold = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isBold ? 10 : 0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}
