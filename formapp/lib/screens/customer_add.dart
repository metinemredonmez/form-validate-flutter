import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formapp/mixins/validation_mixin.dart';
import 'package:formapp/models/customer.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  //with ValidationMixin  bu cok onemölı flutter da boyle bısey yok birlikte bunuda kullan demek !

  //form için id
  final formKey = GlobalKey<FormState>();
  final customer = Customer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0), // global deger id si form'a ulaşmak için!
      child: Form(
        key: formKey,
        child: Column(
          children: [
            firstNameField(),
            surnameNameField(),
            emailNameField(),
            phoneNameField(),
            submitButtonField()
          ],
        ),
      ),
    );
  }

// name
  Widget firstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name", hintText: "Add to Name"),
      //validation
      validator: validateFirstName,
      onSaved: (String value) {
        customer.firstName = value;
      },
    );
  }

// surname
  Widget surnameNameField() {
    return TextFormField(
        decoration:
            InputDecoration(labelText: "Surname", hintText: "Add to Surname"),
        validator: validateSurName);
  }

// email
  Widget emailNameField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(labelText: "Email", hintText: "Add to Email"),
        validator: validateEmail());
  }

// phone
  Widget phoneNameField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Phone", hintText: "Add to Phone"),
    );
  }

  // submit button
  Widget submitButtonField() {
    return TextButton(
        child: Text("Save"),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            // bundan sonrada istersek api ye gonderebılrıız !! gibi gibi ...

            saveCustomer(customer);
          }
          ;
        });
  }
  
  void saveCustomer(Customer customer) {
    
  }
}
