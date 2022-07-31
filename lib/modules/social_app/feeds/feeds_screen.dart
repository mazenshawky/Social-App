import 'package:flutter/material.dart';
import 'package:testo/shared/styles/colors.dart';

class FeedsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children:
        [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/teen-girl-portrait-close-up_23-2149231222.jpg?t=st=1649185211~exp=1649185811~hmac=aef1b9e315f3ca2a931b12992c7a3f1db49a6c1fa2c1f05a425cd9ed3b773ae9&w=740',
                  ),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'communicate with friends',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildPostItem(context),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0,
            ),
            itemCount: 10,
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children:
        [
          Row(
            children:
            [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/wonderful-girl-with-wavy-hair-modern-plaid-light-clothes-holding-pink-flowers-looking-into-camera-isolated-background_197531-28770.jpg?w=740&t=st=1649187086~exp=1649187686~hmac=185a121d7d070e04c99d65727ad8af37accf9bf309b16af7d6d7d78e9f3a8d03',
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Row(
                      children: [
                        Text(
                          'Mazen Shawky',
                          style: TextStyle(
                            height: 1.4,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      'January 21, 2022 at 11:00 pm',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 16.0,
                  )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     bottom: 10.0,
          //     top: 5.0,
          //   ),
          //   child: Container(
          //     width: double.infinity,
          //     child: Wrap(
          //       children:
          //       [
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(
          //             end: 6.0,
          //           ),
          //           child: Container(
          //             height: 25.0,
          //             child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text(
          //                 '#software',
          //                 style: Theme.of(context).textTheme.caption!.copyWith(
          //                   color: defaultColor,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(
          //             end: 6.0,
          //           ),
          //           child: Container(
          //             height: 25.0,
          //             child: MaterialButton(
          //               onPressed: (){},
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               child: Text(
          //                 '#flutter',
          //                 style: Theme.of(context).textTheme.caption!.copyWith(
          //                   color: defaultColor,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 15.0,
            ),
            child: Container(
              height: 140.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/teen-girl-portrait-close-up_23-2149231222.jpg?t=st=1649185211~exp=1649185811~hmac=aef1b9e315f3ca2a931b12992c7a3f1db49a6c1fa2c1f05a425cd9ed3b773ae9&w=740',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(
              children:
              [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        children:
                        [
                          Icon(
                            Icons.favorite,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '120',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:
                        [
                          Icon(
                            Icons.chat_outlined,
                            size: 16.0,
                            color: Colors.deepPurple[200],
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '120 comments',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children:
            [
              Expanded(
                child: InkWell(
                  child: Row(
                    children:
                    [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/wonderful-girl-with-wavy-hair-modern-plaid-light-clothes-holding-pink-flowers-looking-into-camera-isolated-background_197531-28770.jpg?w=740&t=st=1649187086~exp=1649187686~hmac=185a121d7d070e04c99d65727ad8af37accf9bf309b16af7d6d7d78e9f3a8d03',
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'write a comment ...',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                        ),
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              InkWell(
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.favorite,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                onTap: (){},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
