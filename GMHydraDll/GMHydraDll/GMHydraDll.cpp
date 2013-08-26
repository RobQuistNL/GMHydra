#include <sixense.h>
#include <math.h>
#define GMEXPORT extern "C" __declspec (dllexport)

sixenseAllControllerData acd;

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

// Pitch roll and Yaw
GMEXPORT double GMH_getJoystickRoll(double joyIndex) {
	double roll;

	return (double) roll;
}

GMEXPORT double GMH_getJoystickPitch(double joyIndex) {
	double pitch;

	return (double) pitch;
}

GMEXPORT double GMH_getJoystickYaw(double joyIndex) {
	double yaw;

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
