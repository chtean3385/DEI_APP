import 'package:flutter/material.dart';

class DiversityInclusionWidget extends StatelessWidget {
  const DiversityInclusionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1a237e), // Deep blue
            Color(0xFF283593), // Slightly lighter blue
            Color(0xFF3949ab), // Even lighter blue for depth
          ],
        ),
        // Adding subtle geometric overlay effect
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Subtle geometric background shapes
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.03),
              ),
            ),
          ),
          
          // Main content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Main description text
                Text(
                  'An inclusive workplace is built when everyone takes responsibility for change. When men become active allies—listening, speaking up, and taking intentional action—they help close the diversity gap and set the stage for success.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
                SizedBox(height: 24),
                
                // Highlighted quote text
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.amber.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Diversity is not a women\'s initiative. It\'s a leadership imperative—and men have the power to lead the way',
                    style: TextStyle(
                      color: Color(0xFFFFD54F), // Golden yellow
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                SizedBox(height: 32),
                
                // Call-to-action button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your navigation or action here
                      print('Become an Ally button pressed');
                    },
                    icon: Icon(
                      Icons.group_add,
                      color: Color(0xFF1a237e),
                      size: 20,
                    ),
                    label: Text(
                      'Become an Ally',
                      style: TextStyle(
                        color: Color(0xFF1a237e),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF1a237e),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.3),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage in a screen
class DiversityScreen extends StatelessWidget {
  const DiversityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Workplace Diversity'),
        backgroundColor: Color(0xFF1a237e),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            
            // Your diversity widget
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: DiversityInclusionWidget(),
              ),
            ),
            
            SizedBox(height: 20),
            
            // You can add more content below if needed
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Additional content can go here...',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative compact version for smaller screens
class CompactDiversityWidget extends StatelessWidget {
  const CompactDiversityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1a237e),
            Color(0xFF283593),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Diversity is not a women\'s initiative. It\'s a leadership imperative—and men have the power to lead the way',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFD54F),
              fontSize: 16,
              height: 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          SizedBox(height: 20),
          
          ElevatedButton.icon(
            onPressed: () {
              print('Become an Ally button pressed');
            },
            icon: Icon(
              Icons.group_add,
              color: Color(0xFF1a237e),
              size: 18,
            ),
            label: Text(
              'Become an Ally',
              style: TextStyle(
                color: Color(0xFF1a237e),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}