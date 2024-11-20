import 'package:flutter/material.dart';
import 'package:clinic_system_patient/core/resources/assets_manager.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> days = ["السبت", "الأحد", "الاثنين", "الثلاثاء"];
  final List<String> dates = ["28", "29", "30", "31"];
  final int selectedDayIndex = 2;

  final List<Appointment> appointments = [
    Appointment(
      patientName: "محمد حمدي",
      appointmentNumber: 5,
      dateTime: "من 16:00 إلى 18:30 مساءً",
      age: 24,
      height: "175 سم",
      weight: "70 كجم",
    ),
    Appointment(
      patientName: "علي أحمد",
      appointmentNumber: 6,
      dateTime: "من 16:00 إلى 18:30 مساءً",
      age: 30,
      height: "180 سم",
      weight: "80 كجم",
    ),
    Appointment(
      patientName: "سارة علي",
      appointmentNumber: 7,
      dateTime: "من 16:00 إلى 18:30 مساءً",
      age: 25,
      height: "165 سم",
      weight: "60 كجم",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "يوم سعيد محمد",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "كيف حالك؟",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/hd_img_home.png',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "M7md Henedy",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "24 سنه,",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const Icon(
                          Icons.male,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(ImageAssets.avatarImg),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(days.length, (index) {
                final isSelected = index == selectedDayIndex;
                return Column(
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blue : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        dates[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Image.asset(ImageAssets.avatarImg),
                      ),
                      title: Text(
                        "كشف باطنه - ${appointment.patientName}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(appointment.dateTime),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "رقم الكشف ${appointment.appointmentNumber}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        // عند الضغط على الكشف، نفتح شاشة التفاصيل
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentDetailsScreen(
                              appointment: appointment,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Appointment {
  final String patientName;
  final int appointmentNumber;
  final String dateTime;
  final int age;
  final String height;
  final String weight;

  Appointment({
    required this.patientName,
    required this.appointmentNumber,
    required this.dateTime,
    required this.age,
    required this.height,
    required this.weight,
  });
}



class AppointmentDetailsScreen extends StatelessWidget {
  final Appointment appointment;

  const AppointmentDetailsScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الموعد"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // العودة للصفحة السابقة
          },
          icon: Image.asset(ImageAssets.arrowBack),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الاسم: ${appointment.patientName}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("السن: ${appointment.age} سنة"),
              SizedBox(height: 8),
              Text("الطول: ${appointment.height}"),
              SizedBox(height: 8),
              Text("الوزن: ${appointment.weight}"),
              SizedBox(height: 20),
              // تشخيص الحالة
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تشخيص الحالة:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "أدخل التشخيص...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // الروشتة
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الروشتة:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "أدخل الروشتة...",
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // زر إتمام الموعد
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentCompletedScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "إتمام الموعد",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إتمام الموعد"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.rateSuccess, // ضع صورة النجاح هنا
              height: 430,
              width: 430,
            ),
            SizedBox(height: 20),
            Text(
              "تم إتمام الموعد بنجاح",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

