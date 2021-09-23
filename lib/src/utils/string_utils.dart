
///
class StringUtils {
  static String? listToString(List? list) {
    if (list == null) {
      return null;
    }
    String? result;
    list.forEach(
      (string) => {
        if (result == null) result = string else result = '$result,$string',
      },
    );
    return result.toString();
  }
}
