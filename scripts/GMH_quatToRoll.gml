//argument0 = q0
//argument1 = q1
//argument2 = q2
//argument3 = q3

rx=-radtodeg(arctan2(2*(argument0*argument1+argument2*argument3),1-2*(argument1*argument1+argument2*argument2)))
rz=-radtodeg(arctan2(2*(argument0*argument3+argument1*argument2),1-2*(argument2*argument2+argument3*argument3)))

a=2*(argument0*argument2-argument3*argument1)

if a>=1 {
    rx=-radtodeg(2*arctan2(argument1,argument0))
    ry=-90
    rz=0
} else if a<=-1 {
    rx=-radtodeg(2*arctan2(argument1,argument0))
    ry=90
    rz=0
} else {
  ry=-radtodeg(arcsin(2*(argument0*argument2-argument3*argument1)))
}

pitch = rx-180
yaw = ry
roll = rz

return roll;
