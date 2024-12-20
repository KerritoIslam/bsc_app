import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

List<String> trains = ['alger-boumerdes', 'alger-boumerdes', 'alger-boumerdes'];
List<String> Buses = ['alger-boumerdes', 'alger-boumerdes', 'alger-boumerdes'];

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Train',
              style: TextStyle(fontSize: 20, color: Colors.grey[800])),
          SizedBox(
            height: 3,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: trains.length,
            itemBuilder: (context, index) {
              return Container(
                height: 68,
                margin: EdgeInsets.fromLTRB(14, 0, 14, 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap:  (){
                    showModalBottomSheet(context: context, builder:(BuildContext context)=>StopsList(),isScrollControlled: true);
                  },
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(trains[index],
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                  ),
                ),
              );
            },
          ),
          Text('Bus', style: TextStyle(fontSize: 20, color: Colors.grey[800])),
          SizedBox(
            height: 3,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: trains.length,
            itemBuilder: (context, index) {
              return Container(
                height: 68,
                margin: EdgeInsets.fromLTRB(14, 0, 14, 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap:  (){
                    showModalBottomSheet(context: context, builder:(BuildContext context)=>StopsList(),isScrollControlled: true);
                  },
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(Buses[index],
                        style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


class StopsList extends StatelessWidget {
  final List<Map<String, String>> stops = [
    {"name": "Algiers", "price": "Prix: 0DA"},
    {"name": "Algiers", "price": "Prix: 0DA"},
    {"name": "Algiers", "price": "Prix: 0DA"},
    {"name": "Algiers", "price": "Prix: 0DA"},
    {"name": "Boumerdess", "price": "Prix: 0DA"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 540,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Text(
                  'Liste liteneraire',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(onPressed: (){Navigator.of(context).pop();}, icon:Icon(Icons.close))
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: stops.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Circular icon with dashed line
                      Column(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.deepPurple, width: 2),
                            ),
                          ),
                          if (index != stops.length - 1)
                            CustomPaint(
                              painter: DashedLinePainter(),
                              child: SizedBox(
                                height: 60, // Controls line height
                                width: 2,   // Line thickness
                              ),
                            ),
                        ],
                      ),
                      SizedBox(width: 12), // Space between icon and text
                      // Text content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stops[index]['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                stops[index]['price']!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ,
                        ],
                      ),
                    ],
                  );
                },
              ),
            ElevatedButton(
    style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xffD9D9D9)),
                minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.sizeOf(context).width*0.9, 40)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey)))),
              
              onPressed: (){}, child: Text('Buy',style: TextStyle(color: Colors.grey[700],fontSize:20),))
      
          ],
        ),
      ),
    );
    
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashHeight = 5, dashSpace = 5, startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
