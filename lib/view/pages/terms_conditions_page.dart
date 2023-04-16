import 'package:flutter/material.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:const Text("Terms & Conditions"),


    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          // Text('About Us',style: TextStyle(fontSize: 16),),
          //   SizedBox(height: 12,),
          //   Text("Founded in 2017 by jewelry enthusiasts, Arzonai – Operated by Mani Enterprises has become a prodigiously curated jewelry boutique for the fashion savvy individual. At Arzonai – Operated by Mani Enterprises we strive to bring our customers the latest in jewelry fashion for a fraction of high retail prices. We at Arzonai view ourselves as lifestyle advocates. We seek to inspire others to chase who they truly see themselves as. Founded by individuals who grew up during the California indie movement, we aim to share our journey with our fans. We pride ourselves on bringing people together through our brand, and we encourage others to follow us along this amazing adventure.",
          //   textAlign: TextAlign.center,
          //   ),
          //   Divider(),
          //
          //   Text('Terms & Conditions',style: TextStyle(fontSize: 16),),
            Text('''Welcome to Arzonai jewellery is owned and managed by (hereinafter referred to as). If you continue to browse and use this website or app you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern arzonai jewellery relationship with you in relation to this app and website.
                The term 'arzonai jewellery' or 'us' or 'we' refers to the owner of the website and app whose registered office is . Our company registration number is <, India. The term 'you' refers to the user or viewer of our app and website.
                The use of this website is subject to the following terms of use:
                The content of the pages of this app and website is for your general information and use only. It is subject to change without notice.
                Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.
                Your use of any information or materials on this app & website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this app & website meet your specific requirements.
                This app and website contains materials which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions. All trademarks reproduced in this app and website which are not the property of, or licensed to are acknowledged on the app & website.
                Unauthorised use of this app & website may give rise to a claim for damages and/or be a criminal offence. From time to time this app or website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).
    You may not create a link to this app and website from another website or document without <App Name> prior written consent. Your use of this website and any dispute arising out of such use of the website is subject to the laws of India or regulatory authority within the country of India.
        Cancellation Policy
        <App Name> believes in helping its customers as far as possible, and has therefore a liberal cancellation policy. Under this policy:
        Cancellations will only be considered if the request is made within  of placing an order. However, the cancellation request will not be entertained if the orders have been communicated to the operational team and Operations team has initiated the process of assignment. Cancellation and refund of fees or charges will be strictly governed by the Company Refund Policy of the company informed and declared from time to time.
        There is no cancellation of orders placed under the Same day delivery category.
        No cancellations are entertained for those products/services that the <App Name> marketing team has obtained on special discounts and offers on occasions like New Year, Pongal, Diwali, Independence Day, Foundation Day, etc. These are limited-occasion offers and therefore cancellations are not possible.
        Refund Policy
        When you buy our products/services, your purchase is covered by our <Enter hours> hours money back guarantee. If you are, for any reason, not entirely happy with your purchase, we will cheerfully issue a full refund, subject to deductions for legal documents or services provided. To request a refund under this guarantee, you must contact us within the first  hours of your payment. Just send an email to. We'll gladly refund you 100% of your fees within <Enter hours> hours of your refund request.''',
            textAlign: TextAlign.center,)
        ],),
      ),
    ),
    );
  }
}
