import 'package:flutter/widgets.dart';
import 'package:mechanice/core/class/statusrequest.dart';

class HandelingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.looding
        ? const Center(child: Text('loading'))
        : statusRequest == StatusRequest.failure
            ? const Center(child: Text('no data'))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(child: Text('serverfailure'))
                : statusRequest == StatusRequest.offlinefailure
                    ? const Center(child: Text('offlinefailure'))
                    : widget;
  }
}

class HandelingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandelingDataViewRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.looding
        ? const Center(child: Text('looding'))
        : statusRequest == StatusRequest.serverfailure
            ? const Center(child: Text('serverfailure'))
            : statusRequest == StatusRequest.offlinefailure
                ? const Center(child: Text('offlinefailure'))
                : widget;
  }
}
