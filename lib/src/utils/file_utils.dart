
class FileUtils {

  ///转换double 文件大小
  static renderSize(double? value) {
    if (null == value) {
      return 0;
    }
    //'List.filled' or 'List.generate'.
    List<String> unitArr = ['B','K','M','G'];
    int index = 0;
    while (value! > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  ///根据路径获取文件名
  static String getNameFromFilePath(String? path){
    if(path == null){
      return '';
    }
    return path.substring(path.lastIndexOf('/') + 1);
  }

}