import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/services/order_service.dart';
import 'package:geocoder/geocoder.dart';

import 'package:provider/provider.dart';

class AddressForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String name;
  final String addressLine;
  final String city;
  final String pincode;
  final String state;
  AddressForm({
    Key key,
    this.formKey,
    this.name,
    this.addressLine,
    this.city,
    this.pincode,
    this.state,
  }) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String _name;
  String _phoneNumber;

  String _addressLine;
  String _city;
  String _state;
  String _postCode;

  // initState
  @override
  initState() {
    super.initState();

    _name = this.widget.name;
    _addressLine = this.widget.addressLine;
    _city = this.widget.city;
    _state = this.widget.state;
    _postCode = this.widget.pincode;
  }

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return Flexible(
      child: TextFormField(
        initialValue: "$_name",
        decoration: InputDecoration(labelText: "Name"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Flexible(
      // flex: 1,
      child: TextFormField(
        decoration: InputDecoration(labelText: "Mobile Number"),
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone Number is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _phoneNumber = value;
        },
      ),
    );
  }

  Widget _buildAddressLine() {
    return Flexible(
      child: TextFormField(
        initialValue: "$_addressLine",
        decoration: InputDecoration(labelText: "Address"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Address is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _addressLine = value;
        },
      ),
    );
  }

  Widget _buildCity() {
    return Flexible(
      child: TextFormField(
        initialValue: "$_city",
        decoration: InputDecoration(labelText: "City"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'City is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _city = value;
        },
      ),
    );
  }

  Widget _buildState() {
    return Flexible(
      child: TextFormField(
        initialValue: "$_state",
        decoration: InputDecoration(labelText: "State"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'State is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _state = value;
        },
      ),
    );
  }

  Widget _buildPosteCode() {
    return Flexible(
      child: TextFormField(
        initialValue: "$_postCode",
        decoration: InputDecoration(labelText: "Pin Code"),
        keyboardType: TextInputType.number,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Pincode is Required';
          }

          if (value.length != 6) {
            return "Pincode not Valid";
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      width: double.infinity,
      child: Form(
        key: this.widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildName(),
            _buildPhoneNumber(),
            SizedBox(
              height: 10,
            ),
            _buildAddressLine(),
            Row(
              children: [
                _buildCity(),
                SizedBox(
                  width: 20,
                ),
                _buildPosteCode(),
              ],
            ),
            _buildState(),
          ],
        ),
      ),
    );
  }
}
