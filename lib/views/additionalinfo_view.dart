// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:testapp/constants/routes.dart';
import 'package:testapp/services/auth/auth_service.dart';

class AdditionalInfo extends StatefulWidget {
  const AdditionalInfo({super.key});

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  String _fullName = '';
  String _number = '';
  String _selectedGender = '';
  String _selectedCountry = '';
  String _selectedSport = '';
  String _selectedLevel = 'Débutant'; // Set initial value to the first item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Informations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _fullName = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _number = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Man'),
                      leading: Radio(
                        value: 'Man',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Woman'),
                      leading: Radio(
                        value: 'Woman',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Country'),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _selectedSport = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Favorite Sport'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: _selectedLevel,
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value.toString();
                  });
                },
                items: ['Débutant', 'Intermédiaire', 'Avancé']
                    .map((level) => DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        ))
                    .toList(),
                decoration: const InputDecoration(labelText: 'Level'),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            coachaAdditionalInfoRoute,
                            arguments: {'fullName': _fullName});
                      },
                      child: const Text('I am a coach'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        AuthService.firebase().sendEmailVerfication();
                        Navigator.of(context).pushNamed(verifyemailRoute);
                      },
                      child: const Text('I am a normal user'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
