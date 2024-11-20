import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/assets_manager.dart';
import '../Data/Models/model.dart';
import 'chatscreen.dart'; // شاشة الدردشة

class ConsultationScreen extends StatelessWidget {
  // محاكاة API (بديل يمكن استبداله بطلب حقيقي)
  Future<List<Message>> fetchMessages() async {
    await Future.delayed(Duration(seconds: 2)); // تأخير لتوضيح التحميل
    return [
      Message(name: 'M7md Hendy', message: 'السلام عليكم', time: '09:00 AM'),
      Message(name: 'M7md Hendy', message: 'السلام عليكم', time: '09:05 AM'),
      Message(name: 'M7md Hendy', message: 'السلام عليكم', time: '09:10 AM'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاستشارات'),
        leading:   IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.home); // العودة للصفحة السابقة
          },
          icon: Image.asset(ImageAssets.arrowBack),
        ),

      ),
      body: FutureBuilder<List<Message>>(
        future: fetchMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // مؤشر تحميل
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('لا توجد بيانات متاحة'));
          } else {
            final messages = snapshot.data!;
            return ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          name: message.name,
                          message: message.message,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            ImageAssets.avatarImg,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                message.message,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          message.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
