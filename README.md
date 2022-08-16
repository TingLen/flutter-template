# Description

Flutter项目模板

flutter: 3.0.5  
dart: 2.17.6

集成以下框架：
* dio
* fluro
* flutter_bloc

# Get Start

## get packages

```
  flutter pub get
```

## development

vscode 配置如下

```
{
  "name": "flutter_code",
  "request": "launch",
  "type": "dart",
  "args": ["-t", "lib/main_dev.dart"]
}
```
### or

```
  flutter run -t lib/main_dev.dart
```
## build

```
  flutter build -t ./lib/main_prod.dart --split-per-abi
```

# 项目结构

```
├── README.md
├── pubspec.yaml
├── analysis_options.yaml
├── android
├── build
├── flutter_code.iml
├── ios
├── lib
│   ├── app.dart                      项目入口
│   ├── common       
│   │   └── constant.dart             常量
│   ├── env                           全局环境变量
│   │   └── env.dart
│   ├── http                          http请求配置
│   │   ├── http.dart
│   │   └── intercept.dart
│   ├── login                        
│   │   ├── bloc                      存放模块bloc
│   │   ├── login.dart
│   │   ├── models                    存放模块models
│   │   └── view                      存放模块页面文件
│   ├── main.dart                     项目启动通用模块
│   ├── main_dev.dart                 开发环境
│   ├── main_prod.dart                生产环境
│   ├── router                        路由配置
│   │   ├── app_routes.dart
│   │   ├── handlers.dart
│   │   ├── navigator_key.dart
│   │   └── router.dart
├── packages                          本地package，如repository，api_client等均放入该文件夹
```
