import 'package:flutter/material.dart';

class MyCategoryScreen extends StatefulWidget {
  const MyCategoryScreen({Key? key, required String title}) : super(key: key);

  @override
  State<MyCategoryScreen> createState() => _MyCategoryScreenState();
}

class _MyCategoryScreenState extends State<MyCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/category.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/love.png',
                ),
                const Spacer(),
                Row(
                  children: [
                    Text('1251'),
                    Image.asset('assets/images/coin.png'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Text(
              'Select Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 49,
            ),
            Container(
              width: 342,
              height: 430,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Color(0xff5508B7)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(38),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'What Do You Want To Play?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 44,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Play Randomly',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(247, 138, 155, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
