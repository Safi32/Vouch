import 'package:flutter/material.dart';
import 'package:vouch/constants/app_images.dart';

class ReviewScreens extends StatefulWidget {
  final String userName;
  
  const ReviewScreens({
    super.key,
    this.userName = 'Sarah John',
  });

  @override
  State<ReviewScreens> createState() => _ReviewScreensState();
}

class _ReviewScreensState extends State<ReviewScreens> {
  // Sample reviews data
  List<ReviewItem> reviews = [
    ReviewItem(
      userName: 'Sarah John',
      isVerified: true,
      reviewText: 'Excellent service! The product arrived quickly and exactly as described. Will definitely order again.',
      rating: 5,
    ),
    ReviewItem(
      userName: 'Sarah John',
      isVerified: true,
      reviewText: 'Excellent service! The product arrived quickly and exactly as described. Will definitely order again.',
      rating: 5,
    ),
    ReviewItem(
      userName: 'Sarah John',
      isVerified: true,
      reviewText: 'Excellent service! The product arrived quickly and exactly as described. Will definitely order again.',
      rating: 5,
    ),
    ReviewItem(
      userName: 'Sarah John',
      isVerified: true,
      reviewText: 'Excellent service! The product arrived quickly and exactly as described. Will definitely order again.',
      rating: 5,
    ),
    ReviewItem(
      userName: 'Sarah John',
      isVerified: true,
      reviewText: 'Excellent service! The product arrived quickly and exactly as described. Will definitely order again.',
      rating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom header
            Container(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      '${widget.userName}\'s Reviews',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Review text field
                    _buildReviewTextField(),
                    const SizedBox(height: 24),
                    
                    // Submit Review button
                    _buildSubmitReviewButton(),
                    const SizedBox(height: 24),
                    
                    // All Reviews section
                    _buildAllReviewsSection(),
                    const SizedBox(height: 16),
                    
                    // Reviews list
                    ...reviews.map((review) => _buildReviewCard(review)),
                    
                    const SizedBox(height: 16),
                    
                    // Upgrade Now button
                    _buildUpgradeButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewTextField() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Share your experience with ${widget.userName}.',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }



  Widget _buildSubmitReviewButton() {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // Handle submit review
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFA500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Submit Review',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildAllReviewsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'All Reviews',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          'Show (${reviews.length})',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard(ReviewItem review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFFA500),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'S',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    if (review.isVerified) ...[
                      const SizedBox(width: 4),
                      Image.asset(AppImages.verifiedIcon, width: 16, height: 16),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  review.reviewText,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeButton() {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // Handle upgrade
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFA500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Upgrade Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class ReviewItem {
  final String userName;
  final bool isVerified;
  final String reviewText;
  final int rating;

  ReviewItem({
    required this.userName,
    required this.isVerified,
    required this.reviewText,
    required this.rating,
  });
}