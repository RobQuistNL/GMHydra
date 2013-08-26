/*
Copyright (c) 2003-2006 Gino van den Bergen / Erwin Coumans  http://continuousphysics.com/Bullet/

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from the use of this software.
Permission is granted to anyone to use this software for any purpose, 
including commercial applications, and to alter it and redistribute it freely, 
subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.
*/


#ifndef SIMD_QUADWORD_H
#define SIMD_QUADWORD_H

#include "btScalar.h"
#include "btMinMax.h"


#if defined (__CELLOS_LV2) && defined (__SPU__)
#include <altivec.h>
#endif

#ifndef USE_LIBSPE2
ATTRIBUTE_ALIGNED16(class) btQuadWord
#else
class btQuadWord
#endif
{
protected:

#if defined (__SPU__) && defined (__CELLOS_LV2__)
        union {
                vec_float4 mVec128;
                btScalar        m_floats[4];
        };
public:
        vec_float4      get128() const
        {
                return mVec128;
        }
protected:
#else //__CELLOS_LV2__ __SPU__
        btScalar        m_floats[4];
#endif //__CELLOS_LV2__ __SPU__

        public:
  

                SIMD_FORCE_INLINE const btScalar& getX() const { return m_floats[0]; }
                SIMD_FORCE_INLINE const btScalar& getY() const { return m_floats[1]; }
                SIMD_FORCE_INLINE const btScalar& getZ() const { return m_floats[2]; }
                SIMD_FORCE_INLINE void  setX(btScalar x) { m_floats[0] = x;};
                SIMD_FORCE_INLINE void  setY(btScalar y) { m_floats[1] = y;};
                SIMD_FORCE_INLINE void  setZ(btScalar z) { m_floats[2] = z;};
                SIMD_FORCE_INLINE void  setW(btScalar w) { m_floats[3] = w;};
                SIMD_FORCE_INLINE const btScalar& x() const { return m_floats[0]; }
                SIMD_FORCE_INLINE const btScalar& y() const { return m_floats[1]; }
                SIMD_FORCE_INLINE const btScalar& z() const { return m_floats[2]; }
                SIMD_FORCE_INLINE const btScalar& w() const { return m_floats[3]; }

        //SIMD_FORCE_INLINE btScalar&       operator[](int i)       { return (&m_floats[0])[i]; }      
        //SIMD_FORCE_INLINE const btScalar& operator[](int i) const { return (&m_floats[0])[i]; }
        SIMD_FORCE_INLINE       operator       btScalar *()       { return &m_floats[0]; }
        SIMD_FORCE_INLINE       operator const btScalar *() const { return &m_floats[0]; }

        SIMD_FORCE_INLINE       bool    operator==(const btQuadWord& other) const
        {
                return ((m_floats[3]==other.m_floats[3]) && (m_floats[2]==other.m_floats[2]) && (m_floats[1]==other.m_floats[1]) && (m_floats[0]==other.m_floats[0]));
        }

        SIMD_FORCE_INLINE       bool    operator!=(const btQuadWord& other) const
        {
                return !(*this == other);
        }

                SIMD_FORCE_INLINE void  setValue(const btScalar& x, const btScalar& y, const btScalar& z)
                {
                        m_floats[0]=x;
                        m_floats[1]=y;
                        m_floats[2]=z;
                        m_floats[3] = 0.f;
                }

/*              void getValue(btScalar *m) const 
                {
                        m[0] = m_floats[0];
                        m[1] = m_floats[1];
                        m[2] = m_floats[2];
                }
*/
                SIMD_FORCE_INLINE void  setValue(const btScalar& x, const btScalar& y, const btScalar& z,const btScalar& w)
                {
                        m_floats[0]=x;
                        m_floats[1]=y;
                        m_floats[2]=z;
                        m_floats[3]=w;
                }
                SIMD_FORCE_INLINE btQuadWord()
                //      :m_floats[0](btScalar(0.)),m_floats[1](btScalar(0.)),m_floats[2](btScalar(0.)),m_floats[3](btScalar(0.))
                {
                }
 
                SIMD_FORCE_INLINE btQuadWord(const btScalar& x, const btScalar& y, const btScalar& z)           
                {
                        m_floats[0] = x, m_floats[1] = y, m_floats[2] = z, m_floats[3] = 0.0f;
                }

                SIMD_FORCE_INLINE btQuadWord(const btScalar& x, const btScalar& y, const btScalar& z,const btScalar& w) 
                {
                        m_floats[0] = x, m_floats[1] = y, m_floats[2] = z, m_floats[3] = w;
                }

                SIMD_FORCE_INLINE void  setMax(const btQuadWord& other)
                {
                        btSetMax(m_floats[0], other.m_floats[0]);
                        btSetMax(m_floats[1], other.m_floats[1]);
                        btSetMax(m_floats[2], other.m_floats[2]);
                        btSetMax(m_floats[3], other.m_floats[3]);
                }
                SIMD_FORCE_INLINE void  setMin(const btQuadWord& other)
                {
                        btSetMin(m_floats[0], other.m_floats[0]);
                        btSetMin(m_floats[1], other.m_floats[1]);
                        btSetMin(m_floats[2], other.m_floats[2]);
                        btSetMin(m_floats[3], other.m_floats[3]);
                }



};

#endif //SIMD_QUADWORD_H