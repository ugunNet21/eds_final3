import 'package:edsp_final3/presentation/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/values/colors.dart';
import '../../../routes/apps_route.dart';

class RegistFormPage extends StatefulWidget {
  const RegistFormPage({Key? key}) : super(key: key);

  @override
  State<RegistFormPage> createState() => _RegistFormPageState();
}

class _RegistFormPageState extends State<RegistFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController =
      TextEditingController();
  String? selectedKelas;
  String jenisKelamin = '';

  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistFormController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {},
            color: AppColors.black,
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Yuk isi data diri',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              const Text('Email'),
              TextFormField(
                controller: controller.emailTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                enabled: false,
              ),
              SizedBox(height: 16),
              const Text('Nama Lengkap'),
              TextFormField(
                controller: _fullNameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'contoh: Ihsan Adireja',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              SizedBox(height: 16),
              const Text('Nama Sekolah'),
              TextFormField(
                controller: _schoolNameTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nama Sekolah',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),
              DropdownButton<String?>(
                value: selectedKelas,
                items: ['10', '11', '12']
                    .map((element) => DropdownMenuItem<String?>(
                          child: Text('Kelas $element'),
                          value: element,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      selectedKelas = value;
                    }
                  });
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          jenisKelamin = 'Laki-Laki';
                        });
                      },
                      child: Container(
                        color: jenisKelamin == 'Laki-Laki'
                            ? Colors.green
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                          'Laki-Laki',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: jenisKelamin == 'Laki-Laki'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          jenisKelamin = 'Perempuan';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: jenisKelamin == 'Perempuan'
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFD6D6D6),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Perempuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: jenisKelamin == 'Perempuan'
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() == true) {
                    if (selectedKelas != null) {
                      if (jenisKelamin != '') {
                        // TODO: call RegistFormController.registerUser()
                        // Sementara redirect ke Dashboard Page, tapi nanti harus call RegistFormController.registerUser()
                        Get.snackbar('Valid!!!', '.......',
                            snackPosition: SnackPosition.BOTTOM);
                        Get.offAllNamed(Routes.dashboard);
                      } else {
                        Get.snackbar(
                          'Invalid!!!',
                          'Jenis Kelamin Harus Diisi!',
                          backgroundColor: Colors.red,
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Invalid!!!',
                        'Kelas Harus Diisi!',
                        backgroundColor: Colors.red,
                      );
                    }
                  } else {
                    Get.snackbar(
                      'Invalid!!',
                      'blablabla',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.blue,
                    );
                  }
                },
                child: const Text('DAFTAR'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
