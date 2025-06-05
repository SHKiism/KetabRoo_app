import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterInfo extends StatefulWidget {
  const RegisterInfo({super.key});

  @override
  State<RegisterInfo> createState() => _RegisterInfo();
}

class _RegisterInfo extends State<RegisterInfo> {
  File? _profileImage;
  final picker = ImagePicker();

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // Skip logic
                  },
                  child: const Text("Skip"),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Hello!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "What's your name?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your name and nickname so that friends can find your account!",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: pickImage,
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _profileImage != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(_profileImage!, fit: BoxFit.cover),
                    )
                        : const Icon(Icons.camera_alt_outlined, size: 32),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Select a photo for your profile",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: nicknameController,
                decoration: const InputDecoration(
                  labelText: "Nickname",
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: UnderlineInputBorder(),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // next action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Next", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
