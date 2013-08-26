/* Placeholder script, does nothing 
 * 20 July 2006
 */
/** \file Quaternions.gml
 * 
 * A collection of Gamemaker scripts for rotation using simplified
 * quaternion algebra.
 *
 * Quaternions are derived from complex numbers, and whereas a unit
 * complex number can describe an orientation in a 2D space a
 * quaternion can describe any orientation in a 3D space and
 * provides a code-efficient means to transform orientations
 * particularly in Gamemaker where the more usual matrix algebra
 * would require a larger number of operations for the same result
 *
 * Quaternions have many of the characteristics of rotation matrices
 * and indeed the same results could be obtained from matrices, however
 * as Gamemaker does not have vectorised math functions (matrix functions)
 * quaternions appear preferable due to requiring less operations.
 *
 */
