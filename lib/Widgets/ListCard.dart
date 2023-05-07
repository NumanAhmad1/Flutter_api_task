import '/Constants/const.dart';

class ListCard extends StatelessWidget {
  String image;
  String title;
  String description;
  String rent;
  String price;
   ListCard({
     required this.image,
    required this.title,
    required this.description,
    required this.rent,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:1.sw,
                  height: 0.3.sh,
                  child: Image.network(image, fit: BoxFit.cover,),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: kgreycolor,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: kgreycolor,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  rent,
                  style: TextStyle(
                    color: kgreycolor,
                    fontSize: 22.sp,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: kgreycolor,
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}