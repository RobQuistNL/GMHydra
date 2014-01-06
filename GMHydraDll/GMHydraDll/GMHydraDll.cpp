#include <sixense.h>
#include <math.h>
#include <array>
#include <limits>

#define GMEXPORT extern "C" __declspec (dllexport)

typedef std::array<float, 3> float3;
typedef std::array<float3, 3> float3x3;

const float PI = 3.14159265358979323846264f;

std::string VERSION = "0.2";
std::string RetString;

sixenseAllControllerData acd;

template <typename T>
std::string to_string(const T & value) {
    std::stringstream sstr;
    sstr << value;
    return sstr.str();
}

bool closeEnough(const float& a, const float& b, const float& epsilon = std::numeric_limits<float>::epsilon()) {
    return (epsilon > std::abs(a - b));
}

float3 eulerAngles(double joyIndex) {
	float3x3 R;
	R[0][0] = acd.controllers[(int)joyIndex].rot_mat[0][0];
	R[0][1] = acd.controllers[(int)joyIndex].rot_mat[0][1];
	R[0][2] = acd.controllers[(int)joyIndex].rot_mat[0][2];
	R[1][0] = acd.controllers[(int)joyIndex].rot_mat[1][0];
	R[1][1] = acd.controllers[(int)joyIndex].rot_mat[1][1];
	R[1][2] = acd.controllers[(int)joyIndex].rot_mat[1][2];
	R[2][0] = acd.controllers[(int)joyIndex].rot_mat[2][0];
	R[2][1] = acd.controllers[(int)joyIndex].rot_mat[2][1];
	R[2][2] = acd.controllers[(int)joyIndex].rot_mat[2][2];

    //check for gimbal lock
    if (closeEnough(R[0][2], -1.0f)) {
        float x = 0; //gimbal lock, value of x doesn't matter
        float y = PI / 2;
        float z = x + atan2(R[1][0], R[2][0]);
        float3 returnvalue;
		returnvalue[0]=x;
		returnvalue[1]=y;
		returnvalue[2]=z;
        return returnvalue;
    } else if (closeEnough(R[0][2], 1.0f)) {
        float x = 0;
        float y = -PI / 2;
        float z = -x + atan2(-R[1][0], -R[2][0]);
		float3 returnvalue;
		returnvalue[0]=x;
		returnvalue[1]=y;
		returnvalue[2]=z;
        return returnvalue;
    } else { //two solutions exist
        float x1 = -asin(R[0][2]);
        float x2 = PI - x1;

        float y1 = atan2(R[1][2] / cos(x1), R[2][2] / cos(x1));
        float y2 = atan2(R[1][2] / cos(x2), R[2][2] / cos(x2));

        float z2 = atan2(R[0][1] / cos(x2), R[0][0] / cos(x2));
        float z1 = atan2(R[0][1] / cos(x1), R[0][0] / cos(x1));

        //choose one solution to return
        //for example the "shortest" rotation
        if ((std::abs(x1) + std::abs(y1) + std::abs(z1)) <= (std::abs(x2) + std::abs(y2) + std::abs(z2))) {
            float3 returnvalue;
			returnvalue[0]=x1;
			returnvalue[1]=y1;
			returnvalue[2]=z1;
			return returnvalue;
        } else {
            float3 returnvalue;
			returnvalue[0]=x2;
			returnvalue[1]=y2;
			returnvalue[2]=z2;
			return returnvalue;
        }
    }
}

GMEXPORT double GMH_updateStatus() {
	sixenseGetAllNewestData( &acd );
	return (double)1;
}

GMEXPORT const char * GMH_getVersion() {
	return VERSION.c_str();
}

// Joystick POSITION
GMEXPORT double GMH_getJoystickX(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].pos[0];
}
GMEXPORT double GMH_getJoystickY(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].pos[1];
}
GMEXPORT double GMH_getJoystickZ(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].pos[2];
}

// Joystick ORIENTATION
GMEXPORT double GMH_getJoystickRoll(double joyIndex) {
	float3 returned = eulerAngles(joyIndex);
	return (double) returned[2];
}

GMEXPORT double GMH_getJoystickPitch(double joyIndex) {
	float3 returned = eulerAngles(joyIndex);
	return (double) returned[1];
}

GMEXPORT double GMH_getJoystickYaw(double joyIndex) {
	float3 returned = eulerAngles(joyIndex);
	return (double) returned[0];
}

// Joystick RAW INPUT
GMEXPORT double GMH_getJoystickMatrix(double joyIndex, double row, double col) {
	return (double) acd.controllers[(int)joyIndex].rot_mat[(int)row][(int)col];
}

GMEXPORT double GMH_getJoystickQuaternion(double joyIndex, double index) {
	return (double) acd.controllers[(int)joyIndex].rot_quat[(int)index];
}

// Joystick BUTTONS
GMEXPORT double GMH_getJoystickTrigger(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].trigger;
}

GMEXPORT double GMH_getJoystickButtons(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].buttons;
}

// Joystick STICK
GMEXPORT double GMH_getJoystickStickX(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].joystick_x;
}

GMEXPORT double GMH_getJoystickStickY(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].joystick_y;
}

// Joystick OTHERS
GMEXPORT double GMH_getJoystickIsDocked(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].is_docked;
}

GMEXPORT double GMH_getJoystickWhichHand(double joyIndex) {
	return (double) acd.controllers[(int)joyIndex].which_hand;
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
	sixenseGetHemisphereTrackingMode((int) which, &state);
	return (double)state;
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
	return (double)sixenseSetFilterEnabled((int) on_or_off);
}

GMEXPORT double GMH_getFilterEnabled() {
	int on_or_off;
	sixenseGetFilterEnabled(&on_or_off);
	return (double)on_or_off;
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