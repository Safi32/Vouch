import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/utils/colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  String? selectedModel;

  final List<String> models = ["Sarah Johnson", "John Deo", "Daniall"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              floating: true,
              snap: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Get.back(),
              ),
              title: const Text(
                "Sarah's Reviews",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: _buildReviewContent(),
      ),
    );
  }

  Widget _buildReviewContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildReviewHeader(),
          _buildAllReviewsSection(),
          _buildReviewsList(),
          _buildUpgradeButton(),
        ],
      ),
    );
  }

  Widget _buildReviewHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Is not that authentic? leave us Review.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Text(
            "Leave Review",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Color(0xFFE0C77A), width: 1.5),
              color: Color(0xFFFFF9EC),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedModel,
                hint: Text(
                  "Select Model",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                icon: Icon(Icons.keyboard_arrow_down_rounded, size: 28),
                isExpanded: true,
                items: models.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: value == selectedModel
                          ? BoxDecoration(
                              color: Color(0xFFFFF2D1),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: Text(value, style: TextStyle(fontSize: 16)),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedModel = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Share your experience with Sarah.',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Submit Review',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllReviewsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Reviews',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            "Showing last 5 reviews",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(
          5,
          (index) => _buildReviewItem(
            name: "Sarah John",
            review:
                "Excellent service! The product arrived quickly and exactly as described. Will definitely order again.",
            status: index % 3 == 0
                ? "verified"
                : (index % 3 == 1 ? "not_verified" : "pending"),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String review,
    required String status,
  }) {
    Color statusColor;
    String statusLabel;

    switch (status) {
      case "verified":
        statusColor = Colors.green;
        statusLabel = "Verified";
        break;

      case "not_verified":
        statusColor = Colors.red;
        statusLabel = "Not Verified";
        break;

      default:
        statusColor = Colors.orange;
        statusLabel = "Pending";
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary,
            child: Text(
              'S',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// NAME + VERIFIED ICON + STATUS BADGE + EDIT/DELETE ICONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// NAME + BLUE CHECK
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ),

                    /// STATUS BADGE + EDIT + DELETE
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            statusLabel,
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// EDIT ICON
                        InkWell(
                          onTap: () {
                            _showEditReviewDialog(
                              context: context,
                              name: name,
                              currentReview: review,
                            );
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// DELETE ICON
                        InkWell(
                          onTap: () {
                            _showDeleteReviewDialog(context: context);
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                /// REVIEW TEXT
                Text(
                  review,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
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

  /// DELETE REVIEW DIALOG
  void _showDeleteReviewDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Delete Review',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Once deleted, your review will be permanently removed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            color: Color(0xFF007AFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Keep Review',
                          style: TextStyle(
                            color: Color(0xFF007AFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditReviewDialog({
    required BuildContext context,
    required String name,
    required String currentReview,
  }) {
    final TextEditingController reviewController = TextEditingController(
      text: currentReview,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Review',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: reviewController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Share your experience with Sarah',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your update logic here
                          String updatedReview = reviewController.text;
                          Navigator.pop(context);
                          // Update the review in your data source
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _buildReviewItem({
  //   required String name,
  //   required String review,
  //   required String status,
  // }) {
  //   Color statusColor;
  //   String statusLabel;

  //   switch (status) {
  //     case "verified":
  //       statusColor = Colors.green;
  //       statusLabel = "Verified";
  //       break;

  //     case "not_verified":
  //       statusColor = Colors.red;
  //       statusLabel = "Not Verified";
  //       break;

  //     default:
  //       statusColor = Colors.orange;
  //       statusLabel = "Pending";
  //   }

  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 16, top: 8),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const CircleAvatar(
  //           radius: 20,
  //           backgroundColor: AppColors.primary,
  //           child: Text(
  //             'S',
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),

  //         const SizedBox(width: 12),

  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               /// NAME + VERIFIED ICON + STATUS BADGE + EDIT/DELETE ICONS
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   /// NAME + BLUE CHECK
  //                   Row(
  //                     children: [
  //                       Text(
  //                         name,
  //                         style: const TextStyle(
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.w600,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                       const SizedBox(width: 4),
  //                       const Icon(
  //                         Icons.verified,
  //                         color: Colors.blue,
  //                         size: 16,
  //                       ),
  //                     ],
  //                   ),

  //                   /// STATUS BADGE + EDIT + DELETE
  //                   Row(
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 10,
  //                           vertical: 4,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: statusColor.withOpacity(0.15),
  //                           borderRadius: BorderRadius.circular(12),
  //                         ),
  //                         child: Text(
  //                           statusLabel,
  //                           style: TextStyle(
  //                             color: statusColor,
  //                             fontSize: 11,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),

  //                       const SizedBox(width: 8),

  //                       /// EDIT ICON
  //                       InkWell(
  //                         onTap: () {},
  //                         child: const Icon(
  //                           Icons.edit,
  //                           size: 18,
  //                           color: Colors.grey,
  //                         ),
  //                       ),

  //                       const SizedBox(width: 8),

  //                       /// DELETE ICON
  //                       InkWell(
  //                         onTap: () {},
  //                         child: const Icon(
  //                           Icons.delete_outline,
  //                           size: 18,
  //                           color: Colors.red,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),

  //               const SizedBox(height: 4),

  //               /// REVIEW TEXT
  //               Text(
  //                 review,
  //                 style: const TextStyle(
  //                   fontSize: 12,
  //                   color: Colors.black87,
  //                   height: 1.4,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildUpgradeButton() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFFC107), width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upgrade your subscription to unlock their full review history.',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Upgrade Now',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
