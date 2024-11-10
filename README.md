https://app.eraser.io/workspace/UpO8u5X0hsnFbEvtetRz

Simple Library App 

State Management : Cubit
Network Provider : Dio

Firebase Services : 
- Firebase Remote Config
- Firestore
- Firebase Crashlytics
- Firebase Auth
- Firebase App Distribution for CD

to run this project, you should provide firebase credentials 
see firebase-options.dart and see the bottom block, you will see what credentials you needed
then you should provide your base api on firebase remote config,
you can check the api on https://github.com/ghulammuzz/flexmaster-app

the project already have CI/CD with github action + Firebase App Distribution

to execute the CICD you need to provide some repository credentials, you can check the .mainflow.yaml to check what credentials is needed
