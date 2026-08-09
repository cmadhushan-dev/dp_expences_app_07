import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:dp_expenz_application/services/expences_services.dart';
import 'package:dp_expenz_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constant/colors.dart';

class AddNewScreen extends StatefulWidget {
  final Function(ExpenceModel) addExpences;
  const AddNewScreen({super.key, required this.addExpences});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //state to track expence or income
  int _selectedMethod = 0;

  IncomeCategary _incomeCategory = IncomeCategary.passive;
  ExpenceCateraries _expenceCatagory = ExpenceCateraries.health;

  //controllers for the fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  //varible to stroe data
  DateTime _selestedDate = DateTime.now();
  //varible to store the time
  DateTime _timeNow = DateTime.now();
  //dipose the controller
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMethod = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedMethod == 0 ? kRed : kWhite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 60,
                          ),
                          child: Text('Expences'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMethod = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedMethod == 1 ? kGreen : kWhite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 60,
                          ),
                          child: Text('Income'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //here the how much implimentation
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How much? ',
                      style: TextStyle(
                        color: kLightGrey,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        color: kLightGrey,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: ' 0',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kLightGrey,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.68,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        //category selector dropdown
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: 'Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kGrey.withOpacity(0.7),
                              ),
                            ),
                          ),
                          items: _selectedMethod == 1
                              ? IncomeCategary.values.map((categary) {
                                  return DropdownMenuItem(
                                    value: categary,
                                    child: Text(categary.name),
                                  );
                                }).toList()
                              : ExpenceCateraries.values.map((categary) {
                                  return DropdownMenuItem(
                                    value: categary,
                                    child: Text(categary.name),
                                  );
                                }).toList(),
                          value: _selectedMethod == 0
                              ? _expenceCatagory
                              : _incomeCategory,
                          onChanged: (values) {
                            setState(() {
                              _selectedMethod == 0
                                  ? _expenceCatagory =
                                        values as ExpenceCateraries
                                  : _incomeCategory = values as IncomeCategary;
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(color: kGrey.withOpacity(0.6)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kGrey.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kBlack.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(color: kGrey.withOpacity(0.6)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kBlack.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kBlack.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _amountController,
                          decoration: InputDecoration(
                            hintText: 'Amount',
                            hintStyle: TextStyle(color: kGrey.withOpacity(0.6)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kBlack.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(
                                color: kBlack.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        //data and time picker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //date day selector
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2026),
                                  // assign the selsted value to the datatime vairable
                                ).then((vales) {
                                  if (vales != null) {
                                    setState(() {
                                      _selestedDate = vales;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: kMainColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.calendar_month),
                                      color: kWhite,
                                      onPressed: () {},
                                    ),
                                    // const SizedBox(width: 6),
                                    const Text(
                                      'Selected Date',
                                      style: TextStyle(color: kWhite),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(_selestedDate),
                              style: const TextStyle(color: kGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        //time selector
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((val) {
                                  if (val != null) {
                                    setState(() {
                                      _timeNow = DateTime(
                                        _selestedDate.year,
                                        _selestedDate.month,
                                        _selestedDate.day,
                                        val.hour,
                                        val.minute,
                                      );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: const Color.fromARGB(
                                    255,
                                    245,
                                    156,
                                    54,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.alarm_add),
                                      color: kWhite,
                                      onPressed: () {},
                                    ),
                                    // const SizedBox(width: 6),
                                    const Text(
                                      'selected Time',
                                      style: TextStyle(color: kWhite),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_timeNow),
                              style: TextStyle(color: kGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: kLightGrey, thickness: 5),
                        const SizedBox(height: 12),
                        //submit button
                        GestureDetector(
                          onTap: () async {
                            //save the expence or income data to the shared prefernce
                            List<ExpenceModel> lodedExpences =
                                await ExpencesServices().loadExpences();

                            //create a expences to store
                            ExpenceModel expenceForStore = ExpenceModel(
                              id: lodedExpences.length + 1,
                              expenceMainTitle: _titleController.text,
                              expenceSubTitle: _descriptionController.text,
                              expencePrize: _amountController.text.isEmpty
                                  ? 0
                                  : double.parse(_amountController.text),
                              expenceTime: _selestedDate,
                              expenceDate: _timeNow,
                              category: _expenceCatagory,
                            );
                            widget.addExpences(expenceForStore);
                          },
                          child: CustomButton(
                            buttonColor: _selectedMethod == 0 ? kRed : kGreen,
                            buttonText: 'Add',
                          ),
                        ),
                      ],
                    ),
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
