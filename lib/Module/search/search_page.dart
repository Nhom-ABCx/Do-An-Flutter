import 'package:flutter/material.dart';

class SearchPage extends SearchDelegate<String> {
  final List<String> data;
  SearchPage({required this.data});

  @override
  String get searchFieldLabel => 'Search...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(onPressed: () {
      close(context, query);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    return const SizedBox();
    // final suggestions = lstString.where((name) {
    //   return name.toLowerCase().contains(query.toLowerCase());
    // });

    // return ListView.builder(
    //   itemCount: suggestions.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       title: Text(
    //         suggestions.elementAt(index),
    //       ),
    //       onTap: () {
    //         result = suggestions.elementAt(index);
    //         close(context, result!);
    //       },
    //     );
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = lstString.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    //limit suggest
    // const int limitSuggest = 5;
    // if (suggestions.length > limitSuggest) {
    //   suggestions.removeRange(limitSuggest, suggestions.length);
    // }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: query.isEmpty
              ? Text(
                  suggestions.elementAt(index),
                )
              : RichText(
                  text: TextSpan(
                      children: _highlightOccurrences(suggestions[index], query), style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                ),
          onTap: () => query = suggestions.elementAt(index),
        );
      },
    );
  }
}

//hight light occurrentces
List<TextSpan> _highlightOccurrences(String text, String query) {
  final List<TextSpan> spans = [];
  final String lowercaseText = text.toLowerCase();
  final String lowercaseQuery = query.toLowerCase();

  int lastIndex = 0;
  int index = lowercaseText.indexOf(lowercaseQuery);

  while (index != -1) {
    spans.add(TextSpan(text: text.substring(lastIndex, index)));
    spans.add(TextSpan(text: text.substring(index, index + query.length), style: const TextStyle(fontWeight: FontWeight.bold)));
    lastIndex = index + query.length;
    index = lowercaseText.indexOf(lowercaseQuery, lastIndex);
  }

  spans.add(TextSpan(text: text.substring(lastIndex, text.length)));

  return spans;
}

final List<String> lstString = [
  "Camila	Chapman",
  "Belinda	Cameron",
  "Amelia	Harris",
  "Aldus	Howard",
  "Mike	Ryan",
  "Adelaide	Perry",
  "Derek	Hall",
  "Cherry	Ryan",
  "Derek	Owens",
  "John	Walker",
  "Belinda	Ferguson",
  "Vanessa	Barrett",
  "Julian	Foster",
  "Jasmine	Evans",
  "Sabrina	Hunt",
  "Deanna	Carroll",
  "Hailey	Murray",
  "Maximilian	Crawford",
  "Grace	Wright",
  "Garry	Murphy",
  "Catherine	Ferguson",
  "Amelia	Watson",
  "Alisa	Baker",
  "Maria	Miller",
  "Daisy	Harper",
  "Michelle	West",
  "Caroline	Taylor",
  "Heather	West",
  "Justin	Lloyd",
  "Lydia	Cameron",
  "Daryl	Harris",
  "Tara	Robinson",
  "Haris	Wells",
  "Emily	Scott",
  "Catherine	Wells",
  "Ned	Murphy",
  "Blake	Casey",
  "Chelsea	Mitchell",
  "Stuart	Reed",
  "Ellia	Jones",
  "Florrie	Lloyd",
  "Blake	Barnes",
  "Jack	Cole",
  "Adele	Henderson",
  "Jessica	Rogers",
  "Florrie	Barrett",
  "Ryan	Owens",
  "Briony	Dixon",
  "Alexander	Cole",
  "Jessica	Casey",
  "Ryan	Grant",
  "Emily	Fowler",
  "Edith	Turner",
  "Max	Payne",
  "Melanie	Davis",
  "Lucas	Mitchell",
  "Aldus	Warren",
  "Ashton	Kelley",
  "Frederick	Armstrong",
  "Chester	Smith",
  "Alissa	Riley",
  "Bruce	Rogers",
  "Edgar	Armstrong",
  "Cadie	Cooper",
  "Ryan	Scott",
  "Rebecca	Campbell",
  "Rebecca	Parker",
  "Grace	Bennett",
  "Alen	Cunningham",
  "Lucia	Douglas",
  "Sydney	Allen",
  "Roland	Cole",
  "Eddy	Lloyd",
  "Haris	Murphy",
  "Fiona	Farrell",
  "Honey	Jones",
  "Edward	Watson",
  "Ada	Harris",
  "Jordan	Owens",
  "Carlos	Stevens",
  "Alissa	Howard",
  "Madaline	Smith",
  "Luke	Carroll",
  "Paul	Campbell",
  "Adrian	Murray",
  "Ashton	Brown",
  "Ned	Harris",
  "Michelle	Thomas",
  "Ted	Evans",
  "Adelaide	Hawkins",
  "Sydney	Hall",
  "Arnold	Ross",
  "Clark	Stewart",
  "Carl	Smith",
  "Vivian	Watson",
  "Sam	Wells",
  "Arnold	Stevens",
  "Vivian	Miller",
  "John	Hawkins",
  "Edgar	Payne",
];
