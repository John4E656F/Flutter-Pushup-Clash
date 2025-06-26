import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PushUpCounter {
  int _count = 0;
  bool _isDownPosition = false;
  double _previousShoulderHeight = 0;

  int countPushUps(List<Pose> poses) {
    if (poses.isEmpty) return _count;

    final pose = poses.first;
    final leftShoulder = pose.landmarks[PoseLandmarkType.leftShoulder];
    final rightShoulder = pose.landmarks[PoseLandmarkType.rightShoulder];

    if (leftShoulder == null || rightShoulder == null) return _count;

    // Calculate average shoulder height
    final shoulderHeight = (leftShoulder.y + rightShoulder.y) / 2;

    // Initialize previous height on first frame
    if (_previousShoulderHeight == 0) {
      _previousShoulderHeight = shoulderHeight;
      return _count;
    }

    // Detect downward movement
    if (!_isDownPosition && shoulderHeight > _previousShoulderHeight + 0.05) {
      _isDownPosition = true;
    }
    // Detect upward movement (push-up completion)
    else if (_isDownPosition &&
        shoulderHeight < _previousShoulderHeight - 0.05) {
      _isDownPosition = false;
      _count++;
    }

    _previousShoulderHeight = shoulderHeight;
    return _count;
  }

  void reset() => _count = 0;
}
