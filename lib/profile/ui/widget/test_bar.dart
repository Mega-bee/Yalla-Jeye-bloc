import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DonationProgressWidget extends StatelessWidget {
  final double donationAmount; // Amount of money donated
  final double goalAmount; // Goal amount to be reached

  DonationProgressWidget({required this.donationAmount, required this.goalAmount});

  @override
  Widget build(BuildContext context) {
    // Calculate the progress percentage
    double progress = (donationAmount / goalAmount) * 100;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the progress percentage
            Text(
              'Donation Progress: ${progress.round()}%',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30,),
            // Display the progress bar
            Container(
              height: 7,
              width: 130,
              child: LinearPercentIndicator(
                percent: progress / 100, // Set the progress value
                backgroundColor: Colors.grey[300], // Set the background color of the progress bar
                progressColor: Colors.red, // Set the color of the progress bar
                animation: true, // Enable animation
                animationDuration: 1000, // Set animation duration in milliseconds
                linearStrokeCap: LinearStrokeCap.roundAll, // Set the stroke cap to round
                maskFilter: MaskFilter.blur(BlurStyle.solid, 3), // Apply blur effect to the progress bar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
