// FutureBuilder<List<SanPham>?>(
//                 future: controller.listSanPham,
//                 builder: (context, snapshot) {
//                   {
//                     if (snapshot.hasError) {
//                       print(snapshot.error);
//                     }
//                     if (snapshot.hasData) {
//                       if (snapshot.data!.isEmpty) return const SizedBox.shrink(); //show emty widget
                      
//                       return ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) => ProductCard1(sanPham: snapshot.data![index]),
//                       );
//                     }
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               )