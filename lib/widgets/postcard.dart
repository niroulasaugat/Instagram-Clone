import 'package:flutter/material.dart';
import 'package:insatclone/utils/colors.dart';

class postCard extends StatelessWidget {
  
  final dynamic newsnap;
  // const postCard({super.key, required this.snap});
  postCard({
    required this.newsnap
  });

  @override
  Widget build(BuildContext context) {
    return 
     
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    
                    backgroundImage: NetworkImage(newsnap['profilepic'])
                    ),
                ),
                  SizedBox(width: 10,),
                  Expanded(child: Text(newsnap['username'],style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w900),)),
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return Dialog(
                        
                        
                        // backgroundColor: mobileBackgroundColor,
                        child: ListView(
                          shrinkWrap: true,
                          
                          padding: EdgeInsets.all(10),
                          children: [
                            'Delete',
                            'Report'
                            
                          ].map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  child: Text(e)),
                              ),
                              // Divider(color: mobileBackgroundColor,)
                            ],
                          )).toList()
                        ),

                      );
                    });
                  }, icon: Icon(Icons.more_vert, color: primaryColor,))
      
              ],
            ),
            SizedBox(height: 5,),
            Container(
              height: MediaQuery.of(context).size.height* 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(
                
                image: NetworkImage(newsnap['posturl']))),
            ),
            Row(
              children: [
                SizedBox(width: 2,),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.red,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.comment, color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.white,)),

                Expanded(
                  
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark, color: primaryColor,)))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${newsnap['likes'].toString()}' + ' Likes', style: TextStyle(color: primaryColor, fontSize: 18, )),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(newsnap['username'], style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w900)),
                  SizedBox(width: 5,),
                  Text(newsnap['description'], style: TextStyle(color: primaryColor, fontSize: 15, )),
                ],
              ),
            )
          ],
        ),
      );
    
  }
}