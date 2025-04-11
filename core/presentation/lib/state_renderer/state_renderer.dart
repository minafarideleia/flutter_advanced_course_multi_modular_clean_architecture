import 'package:flutter/cupertino.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;

  const StateRenderer({super.key, required this.stateRendererType});

  @override
  Widget build(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.popupErrorState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.fullScreenLoadingState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.fullScreenErrorState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.emptyState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.contentState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.none:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
