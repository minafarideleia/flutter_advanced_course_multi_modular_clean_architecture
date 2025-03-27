# flutter_advanced_course_multi_modular_clean_architecture

A new Flutter project.

## How to create a module?
1- create directory
--> mkdir core

2- --> cd core 

3- --> flutter create --template=package enter_module_name_here
3- --> flutter create --template=package data
============= OR ==============

1- --> flutter create --template=package core/data

=============================
1- dart pub add melos
2- dart pub global activate melos
3- export PATH="$PATH":"$HOME/.pub-cache/bin"
4- dart pub outdated
5- dart pub upgrade --major-versions
6- open  ~/.zshrc   
7- export PATH="$JAVA_HOME/bin:$PATH:$HOME/.pub-cache/bin" // copy and paste it in .zshrc   
====================
to generate injection.config.dart
1- dart run build_runner watch --delete-conflicting-outputs
2- build->flutter->build apk (optional if the file is not auto generated after running the command line above)
