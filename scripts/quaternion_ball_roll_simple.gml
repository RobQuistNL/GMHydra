/** \def quaternion_ball_roll_simple(radius)
 * quaternion_ball_roll_simple(radius)
 *
 * This function implements a simple rolling motion
 * by converting the object's hspeed,vspeed into
 * a rotation and applying that to the object's 
 * orientation (q0,q1,q2,q3).
 */  
var t0,t1,t2,t3,vx,vy,vz,radius,temp,temp1;
radius=argument0;
// ang=degtorad(-5)/2;
// note that this function takes advantage of the fact that
// the angle in radians that the object has rolled is 
// equal to the linear distance divided by the radius
// also note that the factor of 2 that turns up repeatedly 
// is because quaternion rotations require the angle to be halved
// sinc(x)=sin(x)/x but fiddled such that sinc(0)=1
// it is used to prevent division-by-zero errors
/*if speed*100>radius 
{
  temp=sin(speed/(radius*2))/speed;
}
else
{
  temp=1/(radius*2);
}
*/
/*
movement vector is (hspeed,vspeed,0)
the cross-product of this and the vector pointing to
the point of contact: (0,0,-1)
yields (-vspeed,hspeed,0)
*/
vx=-vspeed/(radius*2);
vy=hspeed/(radius*2);
vz=0;
temp=sqrt(sqr(vx)+sqr(vy)+sqr(vz));
temp1=sinc(temp);
t0=cos(temp);
t1=vx*temp1;
t2=vy*temp1;
t3=vz;
// We use a LEFT multiply to carry out the rotation relative to the games
// reference not the object's reference
multiply_quaternion_left(t0,t1,t2,t3);
