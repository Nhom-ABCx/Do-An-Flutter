// FutureBuilder<List<SanPham>?>(
//                 future: controller.getListSanPham(),
//                 builder: (context, snapshot) {
//                   {
//                     if (snapshot.hasError) {
//                       print(snapshot.error);
//                     }
//                     return snapshot.hasData
//                         ? (controller.listSanPham.isEmpty)
//                             ? const SizedBox() //show emty widget
//                             : ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: controller.listSanPham.length,
//                                 itemBuilder: (context, index) => ProductCard1(sanPham: controller.listSanPham[index]),
//                               )
//                         : const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                   }
//                 },
//               )