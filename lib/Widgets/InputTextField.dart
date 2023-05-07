import '/Constants/const.dart';

class InputTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obsecuretext;
  final TextInputType keyboardType;


   const InputTextField({
     required this.text,
     required this.controller,
     required this.obsecuretext,
     required this.keyboardType,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: kwhitecolor, fontSize: 18.sp,),
      controller: controller,
      obscureText: obsecuretext,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontSize: 18.sp, color: kwhitecolor),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 2.w, color: kwhitecolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 2.w, color: kwhitecolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 2.w, color: kwhitecolor),
        ),
      ),
    );
  }
}