# Optimistic UI for Like Button in Alumni Feed

Update the Like button functionality in `AlumniFeed` to provide immediate UI feedback when a user likes or unlikes a post. The UI will update optimistically and revert to its previous state if the API call fails.

## Proposed Changes

### [Alumni Feed Component]

#### [alumni_feed.dart](file:///C:/Users/all/Desktop/flutter/TCS/tcs-alumni-flutter/lib/Views/news_feeds/alumni_feed.dart)

- Refactor `likeDislikePost` to implement optimistic UI updates.
- Capture the current state (like status, like count, reaction) before making the API call.
- Immediately update the local state using `setState`.
- Trigger the API call in the background.
- On success, sync the state with the API response (primarily the like count) and update the local database.
- On failure (or if the API returns a failure status), revert the state to the captured values and display a toast message.
- Remove the `wait = true` state that might be causing UI lag during the process.

```dart
Future<void> likeDislikePost(index, postId, status, reaction) async {
  // 1. Save current state for potential rollback
  String? previousTotalLike = _postsTimeLine[index].totalLike;
  String? previousIsLike = _postsTimeLine[index].isLike;
  String? previousReaction = _postsTimeLine[index].reaction;

  // 2. Optimistic Update
  setState(() {
    _postsTimeLine[index].isLike = (status == "like" ? "1" : "0");
    _postsTimeLine[index].reaction = (status == "like" ? reaction : "");

    int currentLikes = int.tryParse(previousTotalLike ?? '0') ?? 0;
    if (status == "like") {
      currentLikes++;
    } else {
      currentLikes = (currentLikes > 0) ? currentLikes - 1 : 0;
    }
    _postsTimeLine[index].totalLike = currentLikes.toString();
  });

  // 3. API Call
  var response = await ApiCalls.likeUnlikePost(
    userId: AppConstants.myId,
    status: status,
    postId: postId,
    reaction: reaction,
    type: "timeline",
  );

  // 4. Handle Result
  if (response is ErrorEntity) {
    // Rollback on network/error
    _rollbackLikeState(index, previousTotalLike, previousIsLike, previousReaction);
    Fluttertoast.showToast(msg: "Failed to update your like. Please try again.");
  } else {
    LikePostEntity likeEntity = LikePostEntity().fromJson(response);
    if (likeEntity.success == 1) {
      // Update local DB
      await database.editPostLikes(postId, likeEntity.result.likes.toString());
      await database.editPostLikeStatus(postId, status == "like" ? "1" : "0");

      // Sync with actual response count if different
      if (mounted) {
        setState(() {
          _postsTimeLine[index].totalLike = likeEntity.result.likes.toString();
        });
      }
    } else {
      // Rollback on API failure
      _rollbackLikeState(index, previousTotalLike, previousIsLike, previousReaction);
      Fluttertoast.showToast(msg: "Failed to update your like. Please try again.");
    }
  }
}

void _rollbackLikeState(int index, String? totalLike, String? isLike, String? reaction) {
  if (mounted) {
    setState(() {
      _postsTimeLine[index].totalLike = totalLike;
      _postsTimeLine[index].isLike = isLike;
      _postsTimeLine[index].reaction = reaction;
    });
  }
}
```

## Verification Plan

### Manual Verification
- **Positive Case**: Tap "Like". The icon should change immediately, and the count should increment. Verify the API is called in the background.
- **Negative Case (API Failure)**: Simulate an API failure (e.g., by temporarily changing the endpoint or return value in `ApiCalls`). Tap "Like". The icon should change and count increment immediately, then revert after a short delay, and a toast should appear.
- **Rapid Taps**: Tap the Like button multiple times quickly. The UI should stay responsive.
- **Unlike Case**: Tap an already liked post. The icon should change back immediately, and the count should decrement.
- **Reaction Change**: Change reaction (e.g., Like to Love). The icon should update immediately.

### Automated Tests
- Not applicable for this UI-heavy change as per current project structure, but can be verified via logs to ensure API calls are correct.
