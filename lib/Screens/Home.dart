import 'package:flutter_task/Screens/Auth/Login.dart';
import 'package:flutter_task/Screens/Profile.dart';

import '../Models/LoginRepositery.dart';
import '/Models/PropertyListing.dart';
import 'package:flutter_task/Widgets/ListCard.dart';

import '/Models/PropertyListingRepositery.dart';
import '/Constants/const.dart';
import 'PropertyDetailsScreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _propertyListing = PropertyListingRepositery();
    final _authProvider = AuthProvider();

    return Scaffold(
      backgroundColor: kgreycolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kyellowcolor,
        title: const Text('Home'),
        actions: [
          // Profile Button

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfileScreen(),),);
          }, icon: const Icon(Icons.person),),


          //LogOut Button here

          IconButton(
            onPressed: () async{
              await _authProvider.logout();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: FutureBuilder<PropertyListing>(
              future: _propertyListing.propertyListingRepositeryResponse(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final properties = snapshot.data!.data!.properties!;
                  return ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return Padding(
                        padding: EdgeInsets.only(top: 10.h),

                        // Main Custom Widget

                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    PropertyDetailScreen(property: property),
                              ),
                            );
                          },
                          child: ListCard(
                            image: '${property.propertyImage}',
                            title: 'Title: ${property.title}',
                            description: 'Description: ${property.description}',
                            rent: 'Type: ${property.type}',
                            price: 'Price: ${property.price}',
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: kwhitecolor,
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: const CircularProgressIndicator(
                        color: kwhitecolor,
                      ),
                    ),
                  );
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}
