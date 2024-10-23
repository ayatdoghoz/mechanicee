import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class CategoryData {
  Crud crud;

  CategoryData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.dcategory, {});
    return response.fold((l) => l, (r) => r);
  }
}
