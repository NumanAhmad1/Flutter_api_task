import '/Models/LoginRepositery.dart';
import '/Constants/const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = true;
  String? token, first_name, last_name, phone, user_type, photo, address, zip_code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    first_name = prefs.getString('first_name');
    last_name = prefs.getString('last_name');
    phone = prefs.getString('phone');
    user_type = prefs.getString('user_type');
    photo = prefs.getString('photo');
    address = prefs.getString('address');
    zip_code = prefs.getString('zip_code');


    setState(() {
      _isLoading = false;
    });
    print('this is address for profile screen');
    print(zip_code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreycolor,
      appBar: AppBar(
        backgroundColor: kyellowcolor,
        title: Text('Profile'),
      ),
      body:_isLoading
          ? const Center(child: CircularProgressIndicator()): SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: kwhitecolor,
              backgroundImage: NetworkImage('$photo'),
              radius: 100.r,

            ),

            Text('Name: '+'$first_name '+'$last_name' , style: TextStyle(fontSize: 22.sp, color: kwhitecolor,),
            ),
            Text('Phone No: '+'$phone', style: TextStyle(fontSize: 22.sp, color: kwhitecolor,),),
            Text('User Type: '+'$user_type', style: TextStyle(fontSize: 22.sp, color: kwhitecolor,),),
            Text('Address: '+'$address', style: TextStyle(fontSize: 22.sp, color: kwhitecolor,),),
            Text('Zip Code: '+'$zip_code', style: TextStyle(fontSize: 22.sp, color: kwhitecolor,),),
            SizedBox(height: 200.h,),
          ],
        ),
      ),
    );
  }
}
