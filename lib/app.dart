import 'package:consequences/model/story.dart';
import 'package:flutter/material.dart';

import 'story.dart';
import 'package:go_router/go_router.dart';

final storyName = "horror";
final story = getStories().firstWhere((element) => element.name == storyName);
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => StoryScreen(story, story.start, '0'),
    ),
    GoRoute(
      path: '/:segmentId',
      builder: (context, state) =>
          StoryScreen(story, state.params['segmentId'], '0'),
    ),
    GoRoute(
      path: '/' + story.name + '/:segmentId/:paragraph',
      builder: (context, state) => StoryScreen(
          story, state.params['segmentId'], state.params['paragraph']),
    ),
  ],
);

Iterable<Story> getStories() {
  const stories = {
   "7aba311a-8790-44dc-9d20-f0d0eab3726a":{
      "name":"a-bank-heist-2",
      "size":131,
      "endings":77,
      "start":"ab816a5c-2a2d-453f-a40f-bb67ed113bb8"
   },
   "be9b0e19-d470-4395-8f14-ef02d4801d65":{
      "name":"apocalypse",
      "size":514,
      "endings":307,
      "start":"1bf39446-4d01-4f8d-91b2-6a42d846211e"
   },
   "2e100915-6e92-4d67-8f60-6f00dd9fdf49":{
      "name":"avatar-2",
      "size":1503,
      "endings":898,
      "start":"4b168ab9-6d78-4c8f-bf3e-28b5a78cb25a"
   },
   "74a6903c-58de-4ace-8a13-859c50ee3571":{
      "name":"bank-heist-2",
      "size":3866,
      "endings":2321,
      "start":"38f38e4a-db77-43eb-8080-cb5269cf3032"
   },
   "c173796d-5eca-41e1-b747-7ca641317b7b":{
      "name":"calculator",
      "size":821,
      "endings":494,
      "start":"edae5a06-b6e1-40c5-9f12-cfdc285a5462"
   },
   "48237ac0-f49a-4c75-98c9-139d34babcce":{
      "name":"detective",
      "size":1001,
      "endings":602,
      "start":"5fa23a86-cdfd-41b9-b266-8e0984751293"
   },
   "56dcc525-a637-4728-8aa7-b22bd43386a1":{
      "name":"freestyle-1",
      "size":803,
      "endings":481,
      "start":"6aa201f7-3932-45be-9bac-74238dee805a"
   },
   "40f8328a-dd59-4a3f-a1ca-a74537f41438":{
      "name":"game",
      "size":735,
      "endings":440,
      "start":"f46fafef-ea10-4bbc-b7f8-1efad3549d95"
   },
   "cfd85762-64fb-41b0-a2de-b1092404ca1e":{
      "name":"horror",
      "size":523,
      "endings":310,
      "start":"8c747368-0065-4cc4-84f5-6a8c27f7a8c4"
   },
   "467d23dc-cc6f-4620-9c13-e80b14aa0c59":{
      "name":"hunger-games",
      "size":1661,
      "endings":988,
      "start":"e28ec90a-7fd4-4c15-a7a6-02c59df9398d"
   },
   "9e281101-ea2f-46ec-9248-51428190f360":{
      "name":"mario",
      "size":1176,
      "endings":706,
      "start":"62797f63-bb61-473a-a527-901a6f03dbbb"
   },
   "6caa1b3a-f254-4c0a-b2d0-9c6f90d9e39e":{
      "name":"minecraft",
      "size":1447,
      "endings":865,
      "start":"59f6c619-dcc7-4443-8406-83947fbcc454"
   },
   "ec170711-7202-4fb3-8a77-d8d7276233be":{
      "name":"pirate",
      "size":457,
      "endings":0,
      "start":"aae24a76-282f-4e4a-8223-fb452708fa63"
   },
   "2039db00-3e6e-4629-9572-3805d35582c4":{
      "name":"pokemon",
      "size":1056,
      "endings":638,
      "start":"9bb514fa-b3f5-4806-a05a-c8ab8949b122"
   },
   "bf4b0eac-3429-4ec7-bc28-3d18d966d2fd":{
      "name":"potter",
      "size":269,
      "endings":163,
      "start":"ab1c4dba-18d6-4e82-84e5-abe61f03b1fa"
   },
   "f4fa85b2-1528-4ddc-ad96-0c18e556a722":{
      "name":"romance",
      "size":624,
      "endings":378,
      "start":"edbf8a49-2e55-4633-be59-6bd62fc41037"
   },
   "fc07c4c4-9b3f-46df-9bd3-befaff4a9c95":{
      "name":"romance-2",
      "size":708,
      "endings":424,
      "start":"606d78a9-eb47-4bee-94a5-18b6f1e7a23d"
   },
   "de966d47-fcd5-4acb-8096-9a1e4de89a7d":{
      "name":"romance-3",
      "size":989,
      "endings":596,
      "start":"5e38e3b9-bf7a-4a24-bc12-3c9f4f2efab3"
   },
   "e50da25a-e6fc-42ae-a9ed-38a509f34840":{
      "name":"timeloop",
      "size":1244,
      "endings":748,
      "start":"5af0e714-2f54-4323-94a8-3ed4cf107dcd"
   },
   "d2a0faa7-4796-48f3-a842-c12822c00e4b":{
      "name":"trolley-2",
      "size":1280,
      "endings":772,
      "start":"9aa540f7-15f1-4300-ac40-04a11f174bd2"
   },
   "8b01de8f-18e5-4790-bb43-57d0f8b6348b":{
      "name":"trolley-problem",
      "size":96,
      "endings":57,
      "start":"4a299e2e-3a9f-427c-a9d5-1a7dce75dd02"
   },
   "a81431c9-b0c0-4161-978e-d64fa7291fcd":{
      "name":"war",
      "size":1347,
      "endings":803,
      "start":"e4eef18e-1119-4aa3-a78c-3cc737874832"
   }
};
  return stories.entries.map((e) => Story(
      e.key,
      e.value["name"] as String,
      e.value["size"] as int,
      e.value["endings"] as int,
      e.value["start"] as String));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Consequences.app - AI Generated Interactive Stories',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
