### EasyAR AI Cloud Client SDK for iOS

#### 运行Sample

注册和获取 key、secret

ViewController.m中填写获取的key和secret
* [BodyPoseFactory initWithKey:@"" andSecret:@""]
* [HandGestureFactory initWithKey:@"" andSecret:@""]


#### 创建项目

1， 目前直接支持 ObjectC 语言，如使用 swift 语言请自行编写 bridge 接口。 获取到的 AICloud.framework 为静态库方式编译。Sdk 识别过程请确保网络连接正常， 网速稳定。

添加方法如下: 在 TARGETS->BuildPhases->LinkBinaryWithLibaries中 点击“+”按钮，在弹出的窗口中点击“Add Other”按钮，选择 AICloud.framework 添加到 工程中。

2， 添加成功后，编译。如遇到 ld: framework not found AICloud 错误，请在 Build Settings->Framework Search Paths 双击添加 AICloud.framework 的路径。

3， 参考运行Sample，注册和获取 key、secret

ViewController.m中填写获取的key和secret
* [BodyPoseFactory initWithKey:@"" andSecret:@""]
* [HandGestureFactory initWithKey:@"" andSecret:@""]
