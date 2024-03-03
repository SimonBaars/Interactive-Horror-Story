import 'package:consequences/model/story.dart';
import 'package:flutter/material.dart';

import 'auth_gate.dart';
import 'story.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AuthGate(),
    ),
    for (Story story in getStories())
      GoRoute(
        path: '/' + story.name,
        builder: (context, state) => StoryScreen(story, story.start, '0'),
      ),
    for (Story story in getStories())
      GoRoute(
        path: '/' + story.name + '/:segmentId',
        builder: (context, state) =>
            StoryScreen(story, state.params['segmentId'], '0'),
      ),
    for (Story story in getStories())
      GoRoute(
        path: '/' + story.name + '/:segmentId/:paragraph',
        builder: (context, state) => StoryScreen(
            story, state.params['segmentId'], state.params['paragraph']),
      ),
  ],
);

Iterable<Story> getStories() {
  const stories = {
    "6d9a2e51-2550-40cf-94ce-4d811567c21d": {
      "name": "a-bank-heist-2",
      "size": 131,
      "endings": 77,
      "start": "b3550952-5fdd-4016-a6d1-189aa332535e"
    },
    "437dc9be-8a0d-44fb-b25d-c42a0a8b9b79": {
      "name": "apocalypse",
      "size": 514,
      "endings": 307,
      "start": "59f14f5d-102b-4bf5-8a71-58e49dde845e"
    },
    "593baadb-c884-401d-87cd-7b4621f10fc5": {
      "name": "avatar-2",
      "size": 1503,
      "endings": 898,
      "start": "5517c639-0477-433a-9887-a565535320ad"
    },
    "f31463b9-09bf-4047-86b6-30610c6a77a2": {
      "name": "bank-heist",
      "size": 3866,
      "endings": 2321,
      "start": "b15c5343-ec33-488c-a810-a2dc22c0e00e"
    },
    "e1136575-13d1-4461-94eb-0811cefcde0f": {
      "name": "calculator",
      "size": 821,
      "endings": 494,
      "start": "1243097e-ba6a-48e2-bf44-7976c2c46870"
    },
    "6a9c39a1-222f-49c3-a560-f70ab064cab8": {
      "name": "detective",
      "size": 1001,
      "endings": 602,
      "start": "b6c93c90-d958-4336-9859-bc2284b7af93"
    },
    "b23af501-a751-4adf-8e1f-430aab45c6e4": {
      "name": "freestyle-1",
      "size": 803,
      "endings": 481,
      "start": "d6c498be-9d0d-42fb-ad47-a315b7d85b6d"
    },
    "fb8886bf-57d9-4408-b276-2142569417f6": {
      "name": "game",
      "size": 735,
      "endings": 440,
      "start": "91a75615-45e0-4996-a4ac-ef6d574b4beb"
    },
    "260d34ac-e8f3-4f9d-ae96-50754bddee8f": {
      "name": "horror",
      "size": 523,
      "endings": 310,
      "start": "d6c288b6-72ba-4ac8-927b-dde2619f60ac"
    },
    "410befef-f63d-4c99-bcc6-003c72422df0": {
      "name": "hunger-games",
      "size": 1661,
      "endings": 988,
      "start": "797e3ac4-0618-4f0f-bab6-e0acaeb6cfff"
    },
    "0a5a47dc-7347-4b41-9a7b-037974cf2127": {
      "name": "mario",
      "size": 1176,
      "endings": 706,
      "start": "a53ac6e5-6b8f-4194-998e-782908a4ac2c"
    },
    "712de06e-bb36-4454-8ed0-87527d3e2376": {
      "name": "minecraft",
      "size": 1447,
      "endings": 865,
      "start": "09433ce5-59e9-4056-abf6-4fb92c6481b2"
    },
    "36fb497a-2cd2-4dae-b9d1-e7e5730e27a0": {
      "name": "pirate",
      "size": 457,
      "endings": 0,
      "start": "0da6417b-df92-40c1-9f61-ccaeab369f9d"
    },
    "3e280543-7232-4f46-b7b8-e58c3894a7d6": {
      "name": "pokemon",
      "size": 1056,
      "endings": 638,
      "start": "f31f479b-1114-4041-9c39-1986f900630d"
    },
    "45a958f6-f800-48b2-ae75-bfb9b0d6975a": {
      "name": "potter",
      "size": 269,
      "endings": 163,
      "start": "c8aa5577-50eb-4671-a63f-4ee969a67bc2"
    },
    "46d16f8a-5e33-4e70-9d21-7656b9a9383c": {
      "name": "romance",
      "size": 624,
      "endings": 378,
      "start": "0786016d-a255-40ee-bbef-5efb6260dc03"
    },
    "62bca6f4-400b-4159-826e-a50686014bdc": {
      "name": "romance-2",
      "size": 708,
      "endings": 424,
      "start": "2f672e3c-1782-4abc-b849-283ffd147c89"
    },
    "c4694a82-81ed-47b9-b083-b24cc42b71c7": {
      "name": "romance-3",
      "size": 989,
      "endings": 596,
      "start": "4010096a-9d1b-40ea-8fe4-fc870acf2304"
    },
    "332efa2f-1e97-4fac-b476-f24c6757bdc6": {
      "name": "timeloop",
      "size": 1244,
      "endings": 748,
      "start": "0f0992f8-c7d1-4efe-9db1-cacca9965e46"
    },
    "3d3ba74f-d91d-40b3-be72-228b0f8fe6ff": {
      "name": "trolley-2",
      "size": 1280,
      "endings": 772,
      "start": "9cc8953b-1cb1-40a4-b082-801cd0eb58e6"
    },
    "aad77037-2d54-498f-9aea-251e88041f15": {
      "name": "trolley-problem",
      "size": 96,
      "endings": 57,
      "start": "6af3621b-9498-4e18-802c-784cdb30eff0"
    },
    "b021fd7e-fff7-4271-8892-b7c2110be44b": {
      "name": "war",
      "size": 1347,
      "endings": 803,
      "start": "37452581-50d6-4405-984d-10b0b8b42ebf"
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
