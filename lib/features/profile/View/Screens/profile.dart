import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/material.dart';


class Doctor {
  final String name;
  final String specialty;
  final int experienceYears;
  final double rating;
  final int consultationFee;
  final String about;
  final List<String> reviews;
  final List<String> reviewImages;
  final String email;
  final String phone;

  Doctor({
    required this.name,
    required this.specialty,
    required this.experienceYears,
    required this.rating,
    required this.consultationFee,
    required this.about,
    required this.reviews,
    required this.reviewImages,
    required this.email,
    required this.phone,
  });
}

Doctor doctor = Doctor(
  name: 'محمد خالد',
  specialty: 'باطنة',
  experienceYears: 7,
  rating: 5.0,
  consultationFee: 200,
  about: 'استشاري الأمراض الباطنية، متخصص في تشخيص وعلاج مجموعة واسعة من الأمراض المتعلقة بالجهاز الهضمي، الجهاز التنفسي، والكلى. يتمتع بخبرة تزيد عن 7 سنوات في مجال الطب الباطني.',
  reviews: [
    'دكتور ممتاز جداً و مريح في التعامل، الحمد لله بعد العلاج اتحسنت حالتي جداً',
    'بجد دكتور فاهم شغله كويس و دائماً بيطمني لما اسأله في اي حاجة',
  ],
  reviewImages: [
    'lib/assets/unsplash.jpg',
    'lib/assets/unsplash_W-inhanjr9E.jpg',
  ],
  email: 'mohamed@gmail.com',
  phone: '01012345678',
);

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          icon: Image.asset(ImageAssets.arrowBack),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // الصورة المدورة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage(ImageAssets.docImg),
                        ),

                        // أيقونة الإعدادات بجانب الصورة
                        IconButton(
                            icon: Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, Routes.settingsprfile);
                            },
                          ),

                      ],
                    ),
                    SizedBox(height: 10),
                    // النص "دكتور محمد خالد" أسفل الصورة
                    Text(
                      'دكتور محمد خالد',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    // تنسيق الكتابة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'تخصص: ${doctor.specialty}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 95),
                        Text(
                          'خبرة: ${doctor.experienceYears} سنوات',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'سعر الكشف: ${doctor.consultationFee} ج.م',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 50),
                        Row(
                          children: List.generate(
                            5,
                                (index) => Icon(
                              index < doctor.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // إضافة المعلومات الأخرى (البريد الإلكتروني والهاتف)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'البريد الإلكتروني: ${doctor.email}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          'رقم الهاتف: ${doctor.phone}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // قسم "عن الطبيب"
                    Text(
                      'عن الطبيب',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                        textAlign: TextAlign.start
                    ),
                    SizedBox(height: 8),
                    Text(
                      doctor.about,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                        textAlign: TextAlign.start
                    ),
                    SizedBox(height: 16),
                    Text(
                      'بعض الآراء والتقييمات',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                        textAlign: TextAlign.start
                    ),
                    SizedBox(height: 8),
                    // عرض الآراء والتقييمات
                    Column(
                      children: List.generate(doctor.reviews.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(

                                child: Text(
                                  doctor.reviews[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(width: 8),
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(ImageAssets.avatarImg),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
