# adn_flutter_offerwall

# adn flutter offerwall plugin 설치 안내

ADN의 SDK를 적용하여 Offerwall 광고 적용


## Installation

프로젝트의 IDE루트 경로에서 터미널을 열고 다음과 같이 실행하여 플러그인을 설치합니다.

```
flutter pub add adn_flutter_offerwall
```


### Manifest 설정하기

android 프로젝트의 manifest파일에 다음과 같은 설정이 필요합니다.


#### 적용 예제 샘플입니다.
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools" // 추가해야하는 코드
    package="com.adn.flutter.adn_flutter_offerwall.adn_flutter_offerwall_example">
   <application
        tools:replace="android:label" // 추가해야하는 코드
        android:label="adn_flutter_offerwall_example"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
```


### 가. SDK 초기화

```dart
// tnk rwd sdk를  import 합니다.
import 'package:adn_flutter_offerwall/adn_flutter_offerwall_plugin.dart';
// ...
// ...
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initOfferWall(); // SDK 초기화
  }

  Future<void> initOfferWall() async {
    final appKey = Platform.isAndroid
        ? "android Unit ID" // 안드로이드 광고 Unit ID
        : Platform.isIOS
            ? "iOS Unit ID" // IOS 광고 Unit ID
            : throw Exception("Unsupported Platform");
    OfferWall.init(appKey: appKey);
    OfferWall.setUserId(userId: 'userId');
    OfferWall.setGender(gender: 'F');
    OfferWall.setBirthYear(birthYear: 1992);
  }

  Future<void> showOfferWall() async {
    OfferWall.showOfferWall(title: "Get point");
  }

  // 버튼 구현
  ElevatedButton(
    child: Text("Show OfferWalls"),
    onPressed: () {
        showOfferWall();
    },
  ),
  // ...
```