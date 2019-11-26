class ListDelegate {
  static String getStringFromList(List<String> strings) {
    String result = "";
    for (int i = 0; i < strings.length; i++) {
      result = "$result ${strings[i]}";
      if (i < strings.length - 1) {
        result = "$result ,";
      }
    }
    print(result);
    return result;
  }

  static List<String> getListFromCSV(String string) {
    return string.split(",");
  }
}
