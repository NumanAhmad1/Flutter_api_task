import 'package:flutter_task/Models/PropertyListing.dart';

import '/Constants/const.dart';

class PropertyDetailScreen extends StatelessWidget {
  Properties property;
  PropertyDetailScreen({required this.property, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreycolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kyellowcolor,
        title: const Text('Details', style:  TextStyle(fontSize: 22, ),),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 1.sw,
            height: 0.3.sh,
            child: Image.network(
              '${property.propertyImage}',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 0.55.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.title}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.description}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.type}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category Title',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.categoryTitle}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Category Title',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.subCategoryTitle}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.price}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'City Title',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.cityTitle}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Area',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.area} Sq.Ft',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Zip Code',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.zipCode}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        '${property.address}',
                        style: TextStyle(
                          color: kwhitecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
