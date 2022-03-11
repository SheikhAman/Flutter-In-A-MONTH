import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App',
      home: SIForm(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ).copyWith(secondary: Colors.indigoAccent),
      ),
    ),
  );
}

class SIForm extends StatefulWidget {
  const SIForm({Key? key}) : super(key: key);

  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  bool _principleInputIsValid = true;
  bool _roiInputIsValid = true;
  bool _termInputIsValid = true;

  var _formKey = GlobalKey<FormState>();

  var _currencies = ['BDT', 'Rupees', 'Dollars', 'Ponds'];
  final _minimumPadding = 5.0;
  var _currentItemSelected;
  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: [
              getImageAsset(),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                    controller: principalController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter principle amount';
                      }
                    },
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _principleInputIsValid
                          ? null
                          : 'Please enter an integer!',
                      errorStyle:
                          TextStyle(color: Colors.yellowAccent, fontSize: 15),
                      labelStyle: textStyle,
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g. 12000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String val) {
                      final v = int.tryParse(val);
                      debugPrint('parsed value = $v');
                      if (v == null) {
                        setState(() => _principleInputIsValid = false);
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                    controller: roiController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter rate of interest';
                      }
                    },
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText:
                          _roiInputIsValid ? null : 'Please enter an integer!',
                      errorStyle:
                          TextStyle(color: Colors.yellowAccent, fontSize: 15),
                      hintStyle: textStyle,
                      labelStyle: textStyle,
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String val) {
                      final v = int.tryParse(val);
                      debugPrint('parsed value = $v');
                      if (v == null) {
                        setState(() => _roiInputIsValid = false);
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter time';
                            }
                          },
                          controller: termController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            errorText: _termInputIsValid
                                ? null
                                : 'Please enter an integer!',
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent, fontSize: 15),
                            hintStyle: textStyle,
                            labelStyle: textStyle,
                            labelText: 'Term',
                            hintText: 'Time in years',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String val) {
                            final v = int.tryParse(val);
                            debugPrint('parsed value = $v');
                            if (v == null) {
                              setState(() => _termInputIsValid = false);
                            }
                          }),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                          value: _currentItemSelected,
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (String? newValueSelected) {
                            _onDropItemSelected(newValueSelected!);
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: _minimumPadding, top: _minimumPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              displayResult = _calculateTotalReturns();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColorDark)),
                        child: Text(
                          'Calculate',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _reset();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColorDark,
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight)),
                        child: Text(
                          'Reset',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: Text(displayResult, style: textStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(
      image: assetImage,
      width: 150,
      height: 150,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        'After $term years, your investment will be worth  $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void _reset() {
    setState(() {
      principalController.text = '';
      roiController.text = '';
      termController.text = '';
      displayResult = '';
      _currentItemSelected = _currencies[0];
    });
  }
}
