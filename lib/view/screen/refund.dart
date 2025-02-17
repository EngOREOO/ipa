import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundPage extends StatelessWidget {
  const RefundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "refundandreturnspolicy".tr,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Text(
              "سياسة الإسترجاع",
              style: TextStyle(color: AppColor.primaryColor, fontSize: 15),
            ),
            Text(
              "إذا كنت غير راضً عن مشترياتك من شركه المهدي ، فيمكنك إرجاع طلبك في غضون 14 يومًا من الشراء لاسترداد أموالك بالكامل. يجب أن تكون العناصر المعادة في الحالة التي تم استلامها بها وفي علبتها الأصلية. عند إعادة المنتج إلى متجر المهدي ، سيتم استرداد قيمة المنتج عن طريق التحويل المصرفي ، ولكن لن يتم رد أي رسوم شحن.",
              style: TextStyle(color: AppColor.greybody, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "سياسة الاستبدال",
              style: TextStyle(color: AppColor.primaryColor, fontSize: 15),
            ),
            Text(
              "إذا تم استبدال المنتج ، فسيتم تطبيق سياسة الإرجاع في غضون 14 يومًا ، بشرط أن يكون المنتج في حالته الأصلية وغير مستخدم يتم تركيب المنتج في غضون 14 يومًا من تاريخ استلام الطلب الأصلي",
              style: TextStyle(color: AppColor.greybody, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "سياسة الشحن",
              style: TextStyle(color: AppColor.primaryColor, fontSize: 15),
            ),
            Text(
              "تخضع جميع الطلبات لتوافر المنتجات المطلوبة من شركه المهدي. إذا كان أحد العناصر في طلبك غير متوفر في المخزون ، فسنقوم بإعلامك بعدم توفر المنتج والمدة اللازمة لتوفره. عندما يتوفر هذا المنتج ، سنقوم بشحن باقي طلبك. و رسوم الشحن علي حسب مكان الشحن و حجم الطلبية و يمكن الدفع عند الاستلام او الدفع المسبق. قد يختلف تاريخ تسليم طلبك اعتمادًا على إجراءات الشحن الخاصة بشركة الشحن وموقع التسليم وطريقة التسليم وكمية العناصر المطلوبة اعتمادًا على موقعك وحجم طلبك. إذا وصل طلبك تالفًا بأي شكل من الأشكال ، يجب عليك الاتصال بنا في غضون 24 ساعة من استلام طلبك. يجب على العميل فتح الشحنة وتأمين المنتج وتوقيع مندوبنا عليه للتأكد من أن المنتج في حالة جيدة.",
              style: TextStyle(color: AppColor.greybody, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "سياسة الضمان",
              style: TextStyle(color: AppColor.primaryColor, fontSize: 15),
            ),
            Text(
              "تضمن شركة المهدي المنتجات علي حسب ضمان كل منتج من عيوب التصنيع خلال فترة الضمان فقط لا تضمن الشركة أي عيب يحدث نتيجة سوء الاستخدام أو الأخطاء والأضرار الناتجة عن أخطاء الاستخدام. لا يغطي الضمان الأجزاء التي أصبحت قديمة ومتهالكة بسبب المواد الاستهلاكية والاستخدام وفقدت وظيفتها بسبب التلوث والأضرار والأعطال الناتجة عن فقدان خصائصها",
              style: TextStyle(color: AppColor.greybody, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
