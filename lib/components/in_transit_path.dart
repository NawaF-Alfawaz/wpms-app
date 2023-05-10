import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart' as step;
import '/models/package.dart';

class InTransitPath extends StatelessWidget {
  final List<step.StepperData> steps = [];
  final PackageData packageData;
  InTransitPath({super.key, required this.packageData});
  void setPath() {
    steps.clear();
    final received = step.StepperData(
      title: step.StepperText(
        "Received",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your package has been received"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(5, 132, 54, 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    );
    // --------------------------------------------------
    final processing = step.StepperData(
      title: step.StepperText(
        "Processing",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your package is under processing now"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(5, 132, 54, 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    );
    // --------------------------------------------------
    final inTransit = step.StepperData(
      title: step.StepperText(
        "In Transit",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your package is on the way"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(5, 132, 54, 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    );
    // --------------------------------------------------
    final delivered = step.StepperData(
      title: step.StepperText(
        "Delivered",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("You have received your package successfully"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(5, 132, 54, 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    );

    final lost = step.StepperData(
      title: step.StepperText(
        "Lost",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText(
          "Unfortunately, we lost your package, Contact our customer service"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(139, 0, 0, 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    );

    final delayed = step.StepperData(
      title: step.StepperText(
        "Delayed Delivery",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText(
          "Sorry for the Inconvience, your delivery did not arrived at the scheduled time. Please contact our customer services to get a partial refund "),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 165, 0, 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    );

    steps.add(received);
    steps.add(processing);
    steps.add(inTransit);

    if (packageData.getStatus.compareTo("Lost") == 0) {
      steps.add(lost);
      return;
    }

    if (packageData.getStatus.compareTo("Delayed") == 0) {
      steps.add(delayed);
      return;
    }

    steps.add(delivered);
  }

  int whichStep() {
    if (packageData.getStatus.compareTo("Processing") == 0) {
      return 1;
    }
    if (packageData.getStatus.compareTo("InTransit") == 0) {
      return 2;
    }

    if (packageData.getStatus.compareTo("Delivered") == 0) {
      return 3;
    }
    if (packageData.getStatus.compareTo("Delayed") == 0) {
      return 3;
    }
    if (packageData.getStatus.compareTo("Lost") == 0) {
      return 3;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    setPath();
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 2, 20, 0),
        child: step.AnotherStepper(
          stepperList: steps,
          stepperDirection: Axis.vertical,
          inverted: false,
          activeBarColor: const Color.fromRGBO(5, 132, 54, 1),
          inActiveBarColor: Colors.grey,
          activeIndex: whichStep(),
        ),
      ),
    );
  }
}
