import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      ///유저들의 스토리 라인 그리기
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, //가로 스크롤
        child: Row(
            children: List.generate(
                10, (index) => UserStory(userName: 'User $index'))));
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              /*
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(40)
            ),
            */
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('images/pfImg02.png', fit: BoxFit.fill),
              )),
          Text(userName)
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int linkCount;
  final String content;

  FeedData({required this.userName, required this.linkCount, required this.content});
}

final feedDataList = [
  FeedData(userName: 'User1', linkCount: 50, content: '동해물과11'),
  FeedData(userName: 'User2', linkCount: 24, content: '백두산이'),
  FeedData(userName: 'User3', linkCount: 41, content: '마르고 닳도록'),
  FeedData(userName: 'User4', linkCount: 22, content: '하느님이 보우하사'),
  FeedData(userName: 'User5', linkCount: 67, content: '우리나라만세'),
  FeedData(userName: 'User6', linkCount: 31, content: '무궁화 삼천리'),
  FeedData(userName: 'User7', linkCount: 66, content: '화려강산 대한사람 대한으로'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context,index) => FeedItem(feedData: feedDataList[index]),  ///그때그때 바뀌는 값이 들어가기 땨뮨애  const가 아님
    );
  }
}

class FeedItem extends StatelessWidget {

  final FeedData feedData;
  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  ///요소간의 간격을 양 끝으로
            children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade300,
                      ),
                    ),
                    const SizedBox(width: 8), //동그라미와 글자 사이 간격 띄우기
                    Text(feedData.userName),
                  ],
                ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.chat_bubble)),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.paperplane)),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark))
          ],
        ),

      ],
    );
  }
}
