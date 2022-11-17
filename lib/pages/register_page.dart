import 'package:flutter/material.dart';

import '../widgets/row_space.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Register();
  }
}

class Register extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  var sex = 1;
  var isSubscribe = false;
  var ageRange = 1;
  var provinces = [
    Province(code: "-", label: "Please select province"),
    Province(code: "01", label: "Bangkok"),
    Province(code: "02", label: "Phisanulok"),
    Province(code: "03", label: "Nonthaburi"),
  ];

  var province = "-";
  var dobControler = TextEditingController();

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              nameInput(),
              const RowSpace(),
              sexInput(),
              const RowSpace(),
              subscribeInput(),
              const RowSpace(),
              ageInput(),
              const RowSpace(),
              provinceInput(),
              const RowSpace(),
              dobInput(),
              const RowSpace(),
              registerBtn(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton registerBtn() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: Text("Register"),
    );
  }

  TextFormField nameInput() {
    return TextFormField(
      decoration: InputDecoration(
        label: Text("Name"),
      ),
      validator: ((value) {
        if (value!.isEmpty) {
          return "Please input name";
        }
        if (value.length < 5) {
          return "Name must be > 5";
        }
      }),
    );
  }

  Widget sexInput() {
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              sex = value ?? 0;
            });
          },
        ),
        const Text("Male"),
        Radio(
          value: 2,
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              sex = value ?? 0;
            });
          },
        ),
        const Text("Female"),
      ],
    );
  }

  Widget subscribeInput() {
    return Row(
      children: [
        Checkbox(
          value: isSubscribe,
          onChanged: (value) {
            setState(
              () {
                isSubscribe = value ?? false;
              },
            );
          },
        ),
        const Text("Subscribe news feed ?"),
      ],
    );
  }

  Widget ageInput() {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text("1 - 10"),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text("11 - 20"),
        ),
      ],
      value: ageRange,
      onChanged: (value) {
        setState(() {
          ageRange = value ?? 0;
        });
      },
    );
  }

  Widget provinceInput() {
    return DropdownButtonFormField<String>(
      value: province,
      onChanged: (value) {
        setState(() {
          province = value ?? "";
        });
      },
      items: provinces
          .map(
            (e) => DropdownMenuItem(
              value: e.code,
              child: Text(e.label),
            ),
          )
          .toList(),
    );
  }

  Widget dobInput() {
    // return ElevatedButton(
    //     onPressed: () async {
    //       var now = DateTime.now();
    //       var result = await showDatePicker(
    //         context: context,
    //         initialDate: now,
    //         firstDate: now,
    //         lastDate: DateTime(now.year + 10),
    //       );
    //     },
    //     child: Text("DOB"));
    return TextFormField(
      controller: dobControler,
      decoration: InputDecoration(
        label: const Text("DOB"),
        suffix: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () async {
            var now = DateTime.now();
            var result = await showDatePicker(
              context: context,
              initialDate: now,
              firstDate: now,
              lastDate: DateTime(now.year + 10),
            );
            dobControler.text = result.toString();
          },
        ),
      ),
    );
  }
}
// Model

class Province {
  final String code;
  final String label;

  Province({required this.code, required this.label});
}
