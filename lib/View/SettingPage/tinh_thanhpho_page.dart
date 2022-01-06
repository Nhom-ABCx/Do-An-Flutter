import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '/all_page.dart';

class TinhThanhPhoPage extends StatefulWidget {
  const TinhThanhPhoPage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<TinhThanhPhoPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "Province / City",
              style: TextStyle(color: Colors.indigo),
            ),
          ),
          //Hide
          //drawer: const NavigationDrawer(),
          //Body
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TypeAheadField<TinhThanhPho>(
                hideSuggestionsOnKeyboardHide: false, //huy? viec an? query khi tat' ban`phim'
                textFieldConfiguration: const TextFieldConfiguration(
                  autofocus: true, //tu dong forcus vo
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                  ),
                ),
                //goi api
                suggestionsCallback: api_GetAll_TinhThanhPho, //dang' ly' ra la co' tham so'() nhung cu' phap' no' the'
                //build ra widget
                itemBuilder: (context, suggestion) => ListTile(
                  title: Text(suggestion.name!),
                  tileColor: Colors.white,
                ),
                //neu tim` kiem' ko ra
                noItemsFoundBuilder: (context) => const SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      'No Item Found.',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                //khi click vao thi se tra ve Nguyen 1 tinh/ThanhPho de query ra phan`sau
                onSuggestionSelected: (suggestion) => Navigator.pop<TinhThanhPho>(context, suggestion),
              ),
            ),
          ),
          //nho' thay doi? lai con so' truyen du~ lieu
          //bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
