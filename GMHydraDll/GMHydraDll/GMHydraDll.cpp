#include <sixense.h>
#include <math.h>
#define GMEXPORT extern "C" __declspec (dllexport)

sixenseAllControllerData acd;

int max(int arg0, int arg1) {
	if (arg0 == arg1) {
		return arg0;
	}
	if (arg0 > arg1) {
		return arg0;
	} else {
		return arg1;
	}
}

class Quaternion {
	public:
	float w, x, y, z;
};

void CalculateRotation( Quaternion& q, double joyIndex ) {
  float trace = acd.controllers[(int)joyIndex].rot_mat[0][0] + acd.controllers[(int)joyIndex].rot_mat[1][1] + acd.controllers[(int)joyIndex].rot_mat[2][2]; // I removed + 1.0f; see discussion with Ethan
  if( trace > 0 ) {// I changed M_EPSILON to 0
    float s = 0.5f / sqrtf(trace+ 1.0f);
    q.w = 0.25f / s;
    q.x = ( acd.controllers[(int)joyIndex].rot_mat[2][1] - acd.controllers[(int)joyIndex].rot_mat[1][2] ) * s;
    q.y = ( acd.controllers[(int)joyIndex].rot_mat[0][2] - acd.controllers[(int)joyIndex].rot_mat[2][0] ) * s;
    q.z = ( acd.controllers[(int)joyIndex].rot_mat[1][0] - acd.controllers[(int)joyIndex].rot_mat[0][1] ) * s;
  } else {
    if ( acd.controllers[(int)joyIndex].rot_mat[0][0] > acd.controllers[(int)joyIndex].rot_mat[1][1] && acd.controllers[(int)joyIndex].rot_mat[0][0] > acd.controllers[(int)joyIndex].rot_mat[2][2] ) {
      float s = 2.0f * sqrtf( 1.0f + acd.controllers[(int)joyIndex].rot_mat[0][0] - acd.controllers[(int)joyIndex].rot_mat[1][1] - acd.controllers[(int)joyIndex].rot_mat[2][2]);
      q.w = (acd.controllers[(int)joyIndex].rot_mat[2][1] - acd.controllers[(int)joyIndex].rot_mat[1][2] ) / s;
      q.x = 0.25f * s;
      q.y = (acd.controllers[(int)joyIndex].rot_mat[0][1] + acd.controllers[(int)joyIndex].rot_mat[1][0] ) / s;
      q.z = (acd.controllers[(int)joyIndex].rot_mat[0][2] + acd.controllers[(int)joyIndex].rot_mat[2][0] ) / s;
    } else if (acd.controllers[(int)joyIndex].rot_mat[1][1] > acd.controllers[(int)joyIndex].rot_mat[2][2]) {
      float s = 2.0f * sqrtf( 1.0f + acd.controllers[(int)joyIndex].rot_mat[1][1] - acd.controllers[(int)joyIndex].rot_mat[0][0] - acd.controllers[(int)joyIndex].rot_mat[2][2]);
      q.w = (acd.controllers[(int)joyIndex].rot_mat[0][2] - acd.controllers[(int)joyIndex].rot_mat[2][0] ) / s;
      q.x = (acd.controllers[(int)joyIndex].rot_mat[0][1] + acd.controllers[(int)joyIndex].rot_mat[1][0] ) / s;
      q.y = 0.25f * s;
      q.z = (acd.controllers[(int)joyIndex].rot_mat[1][2] + acd.controllers[(int)joyIndex].rot_mat[2][1] ) / s;
    } else {
      float s = 2.0f * sqrtf( 1.0f + acd.controllers[(int)joyIndex].rot_mat[2][2] - acd.controllers[(int)joyIndex].rot_mat[0][0] - acd.controllers[(int)joyIndex].rot_mat[1][1] );
      q.w = (acd.controllers[(int)joyIndex].rot_mat[1][0] - acd.controllers[(int)joyIndex].rot_mat[0][1] ) / s;
      q.x = (acd.controllers[(int)joyIndex].rot_mat[0][2] + acd.controllers[(int)joyIndex].rot_mat[2][0] ) / s;
      q.y = (acd.controllers[(int)joyIndex].rot_mat[1][2] + acd.controllers[(int)joyIndex].rot_mat[2][1] ) / s;
      q.z = 0.25f * s;
    }
  }
}

GMEXPORT double GMH_updateStatus() {
	sixenseGetAllNewestData( &acd );
	return (double)1;
}

// Joystick functions
GMEXPORT double GMH_getJoystickX(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].pos[0];
}
GMEXPORT double GMH_getJoystickY(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].pos[1];
}
GMEXPORT double GMH_getJoystickZ(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].pos[2];
}
/*
GMEXPORT double GMH_getJoystickRoll(double joyIndex) {
	double roll;
	roll = atan2(acd.controllers[(int)joyIndex].rot_mat[2][0], acd.controllers[(int)joyIndex].rot_mat[2][1]);
	return (double) roll;
}

GMEXPORT double GMH_getJoystickPitch(double joyIndex) {
	double pitch;
	pitch = acos(acd.controllers[(int)joyIndex].rot_mat[2][2]);
	return (double) pitch;
}

GMEXPORT double GMH_getJoystickYaw(double joyIndex) {
	double yaw;
	yaw = -atan2(acd.controllers[(int)joyIndex].rot_mat[0][2], acd.controllers[(int)joyIndex].rot_mat[1][2]);
	return (double) yaw;
}
*/


/*
public static Quaternion QuaternionFromMatrix(Matrix4x4 m)
{
// Adapted from: http://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToQuaternion/index.htm
w = sqrt(max(0, 1 + acd.controllers[(int)joyIndex].rot_mat[0][0] + acd.controllers[(int)joyIndex].rot_mat[1][1] + acd.controllers[(int)joyIndex].rot_mat[2][2])) / 2;
x = sqrt(max(0, 1 + acd.controllers[(int)joyIndex].rot_mat[0][0] - acd.controllers[(int)joyIndex].rot_mat[1][1] - acd.controllers[(int)joyIndex].rot_mat[2][2])) / 2;
y = sqrt(max(0, 1 - acd.controllers[(int)joyIndex].rot_mat[0][0] + acd.controllers[(int)joyIndex].rot_mat[1][1] - acd.controllers[(int)joyIndex].rot_mat[2][2])) / 2;
z = sqrt(max(0, 1 - acd.controllers[(int)joyIndex].rot_mat[0][0] - acd.controllers[(int)joyIndex].rot_mat[1][1] + acd.controllers[(int)joyIndex].rot_mat[2][2])) / 2;
x = x * Mathf.Sign(x * (acd.controllers[(int)joyIndex].rot_mat[2][1] - acd.controllers[(int)joyIndex].rot_mat[1][2]));
y = y * Mathf.Sign(y * (acd.controllers[(int)joyIndex].rot_mat[0][2] - acd.controllers[(int)joyIndex].rot_mat[2][0]));
z = z * Mathf.Sign(z * (acd.controllers[(int)joyIndex].rot_mat[1][0] - acd.controllers[(int)joyIndex].rot_mat[0][1]));
}*/

GMEXPORT double GMH_getJoystickRoll(double joyIndex) {
	double roll;
	//roll = atan2(acd.controllers[(int)joyIndex].rot_mat[2][0], acd.controllers[(int)joyIndex].rot_mat[2][1]);
	Quaternion q;
	CalculateRotation( q, joyIndex );
	roll =  atan2(2*(q.x*q.y + q.w*q.z), q.w*q.w + q.x*q.x - q.y*q.y - q.z*q.z);
	return (double) roll;
}

GMEXPORT double GMH_getJoystickPitch(double joyIndex) {
	double pitch;
	//pitch = acos(acd.controllers[(int)joyIndex].rot_mat[2][2]);
	Quaternion q;
	CalculateRotation( q, joyIndex );
	pitch = atan2(2*(q.y*q.z + q.w*q.x), q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z);
	return (double) pitch;
}

GMEXPORT double GMH_getJoystickYaw(double joyIndex) {
	double yaw;
	//yaw = -atan2(acd.controllers[(int)joyIndex].rot_mat[0][2], acd.controllers[(int)joyIndex].rot_mat[1][2]);
	Quaternion q;
	CalculateRotation( q, joyIndex );

	yaw = asin(-2*(q.x*q.z - q.w*q.y));

	return (double) yaw;
}

//General functions
GMEXPORT double GMH_init() {
	return (double)sixenseInit();
}

GMEXPORT double GMH_destroy() {
	return (double)sixenseExit();
}

GMEXPORT double GMH_getMaxBases() {
	return (double)sixenseGetMaxBases();
}

GMEXPORT double GMH_setActiveBase(double i) {
	return (double)sixenseSetActiveBase((int)i);
}

GMEXPORT double GMH_isBaseConnected(double i) {
	return (double)sixenseIsBaseConnected((int)i);
}


GMEXPORT double GMH_getMaxControllers() {
	return (double)sixenseGetMaxControllers();
}

GMEXPORT double GMH_isControllerEnabled(double i) {
	return (double)sixenseIsControllerEnabled((int)i);
}

GMEXPORT double GMH_getNumActiveControllers() {
	return (double)sixenseGetNumActiveControllers();
}

GMEXPORT double GMH_getHistorySize() {
	return (double)sixenseGetHistorySize();
}

GMEXPORT double GMH_autoEnableHemisphereTracking(double which) {
	return (double)sixenseAutoEnableHemisphereTracking((int) which);
}

GMEXPORT double GMH_setHemisphereTrackingMode(double which, double state) {
	return (double)sixenseSetHemisphereTrackingMode((int) which, (int) state);
}

GMEXPORT double GMH_getHemisphereTrackingMode(double which) {
	int state;
	return (double)sixenseGetHemisphereTrackingMode((int) which, &state);
}

GMEXPORT double GMH_setHighPriorityBindingEnabled(double on_or_off) {
	return (double)sixenseSetHighPriorityBindingEnabled((int) on_or_off);
}

GMEXPORT double GMH_getHighPriorityBindingEnabled() {
	int on_or_off;
	return (double)sixenseGetHighPriorityBindingEnabled(&on_or_off);
}

GMEXPORT double GMH_triggerVibration(double controller_id, double duration_100ms, double pattern_id) {
	return (double)sixenseTriggerVibration((int) controller_id, (int) duration_100ms, (int) pattern_id);
}

//Filters
GMEXPORT double GMH_setFilterEnabled(double on_or_off) {
	return (double)sixenseSetHighPriorityBindingEnabled((int) on_or_off);
}

GMEXPORT double GMH_getFilterEnabled() {
	int on_or_off;
	return (double)sixenseGetFilterEnabled(&on_or_off);
}

GMEXPORT double GMH_setFilterParams(double near_range, double near_val, double far_range, double far_val) {
	return (double)sixenseSetFilterParams((float) near_range, (float) near_val, (float) far_range, (float) far_val);
}

GMEXPORT double GMH_getFilterNearRange() {
	float near_range;
	float near_val;
	float far_range;
	float far_val;
	sixenseGetFilterParams(&near_range, &near_val, &far_range, &far_val);
	return (double)near_range;
}

GMEXPORT double GMH_getFilterNearVal() {
	float near_range;
	float near_val;
	float far_range;
	float far_val;
	sixenseGetFilterParams(&near_range, &near_val, &far_range, &far_val);
	return (double)near_val;
}

GMEXPORT double GMH_getFilterFarRange() {
	float near_range;
	float near_val;
	float far_range;
	float far_val;
	sixenseGetFilterParams(&near_range, &near_val, &far_range, &far_val);
	return (double)far_range;
}

GMEXPORT double GMH_getFilterFarVal() {
	float near_range;
	float near_val;
	float far_range;
	float far_val;
	sixenseGetFilterParams(&near_range, &near_val, &far_range, &far_val);
	return (double)far_val;
}

/* Not implemented */
//SIXENSE_EXPORT int sixenseSetBaseColor( unsigned char red, unsigned char green, unsigned char blue );
//SIXENSE_EXPORT int sixenseGetBaseColor( unsigned char *red, unsigned char *green, unsigned char *blue );
