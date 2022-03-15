// All function declared below runs on Main UI thread

// we learned async , await api keywords
// and also learned Future , then api keywords

void main() {
  print('Main program: Starts');
  printFileContent();
  print('Main program: Ends');
}

// Using async await
// printFileContent() async{

//   String fileContent = await downloadAFile();

//   print('The content of the file is --> $fileContent');

// }

// Future then
printFileContent() {
  Future<String> fileContent = downloadAFile();

  fileContent.then((resultString) {
    return print('The content of the file is --> $resultString');
  });
}

Future<String> downloadAFile() {
  Future<String> result = Future.delayed(Duration(seconds: 6), () {
    return 'My secret file content';
  });
  return result;
}
