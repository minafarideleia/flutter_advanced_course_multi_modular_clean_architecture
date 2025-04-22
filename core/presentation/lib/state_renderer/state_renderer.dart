import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  var _isDialogDismissed = false;
  var _isDialogShowing = false;
  final VoidCallback? retryActionFunction;

  StateRenderer({super.key,
    required this.stateRendererType,
    this.message = "Loading...",
    this.title = "Error",
    this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _showPopupLoadingDialog(context, _buildLoadingWidget());
      case StateRendererType.popupErrorState:
        return _showPopupErrorDialog(context, _buildErrorWidget());
      case StateRendererType.fullScreenLoadingState:
        return _showFullScreenContent(_buildLoadingWidget());
      case StateRendererType.fullScreenErrorState:
        return _showFullScreenContent(_buildErrorWidget(showRetryButton: true));
      case StateRendererType.emptyState:
        return _showFullScreenContent(_buildEmptyWidget());
      case StateRendererType.contentState:
      // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.none:
      // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  // it will check if we are displaying a dialog.
  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute
          .of(context)
          ?.isCurrent != true;

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text(message)
      ],
    );
  }

  Widget _showPopupLoadingDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;

      WidgetsBinding.instance.addPersistentFrameCallback((_) =>
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    content: content,
                  )));
    }
    return Container(); // keep screen content behind the dialog
  }

  Widget _buildEmptyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.inbox,
          size: 50,
          color: Colors.grey,),
        SizedBox(height: 10,),
        Text("No Data Available")
      ],
    );
  }

  Widget _buildErrorWidget({bool showRetryButton = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 70, color: Colors.red),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(message),
        SizedBox(height: 10),
        if (showRetryButton)
          ElevatedButton(
            onPressed: retryActionFunction,
            child: Text("Retry"),
          )
      ],
    );
  }

  Widget _showFullScreenContent(Widget content) {
    return Container(color: Colors.white, child: Center(child: content));
  }

  Widget _showPopupErrorDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;

      WidgetsBinding.instance.addPersistentFrameCallback((_) =>
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    content: content,
                    actions: [
                      TextButton(
                          onPressed: () {
                            _isDialogDismissed = true;
                            Navigator.of(context, rootNavigator: true)
                                .pop(true); // dismiss the dialog
                          },
                          child: Text("Close"))
                    ],
                  )));
    }
    return Container(); // keep screen content behind the dialog
  }
}
