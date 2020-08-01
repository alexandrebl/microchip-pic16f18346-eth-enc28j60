# 1 "mcc_generated_files/TCPIPLibrary/lfsr.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16F1xxxx_DFP/1.4.119/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "mcc_generated_files/TCPIPLibrary/lfsr.c" 2
# 40 "mcc_generated_files/TCPIPLibrary/lfsr.c"
# 1 "mcc_generated_files/TCPIPLibrary/lfsr.h" 1
# 42 "mcc_generated_files/TCPIPLibrary/lfsr.h"
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\stdint.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\musl_xc8.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\stdint.h" 2 3
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 1 3
# 127 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long uintptr_t;
# 142 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long intptr_t;
# 158 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 188 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 229 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\stdint.h" 2 3


typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 139 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\bits/stdint.h" 1 3
typedef int32_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint32_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 139 "C:\\Program Files\\Microchip\\xc8\\v2.20\\pic\\include\\c99\\stdint.h" 2 3
# 42 "mcc_generated_files/TCPIPLibrary/lfsr.h" 2


typedef uint8_t lfsr_t;
int lfsr_getSequenceCount(void);
lfsr_t lfsr_getSequence(void);
void lfsr_reset(void);
void lfsr_setSequence(uint16_t s);
lfsr_t lfsr(void);
lfsr_t lfsrWithSeed(uint8_t lfsrSeed);
# 40 "mcc_generated_files/TCPIPLibrary/lfsr.c" 2





static uint8_t sequenceIndex = 0;
const lfsr_t xorSequences[] = {0x41,0x44,0x47,0x48,0x4E,0x53,0x55,0x5C,0x5F,0x60,0x65,0x69,0x6A,0x72,0x77,0x78,0x7B,0x7E};
lfsr_t xor_mask = 0x41;
lfsr_t lfsr_value = 0x40;

lfsr_t lfsr_getSequence(void)
{
 return xorSequences[sequenceIndex];
}

int lfsr_getSequenceCount(void)
{
 return sizeof(xorSequences)/sizeof(*xorSequences);
}

void lfsr_reset(void)
{
 lfsr_value = 0x40;
}

void lfsr_setSequence(uint16_t s)
{
 s %= sizeof(xorSequences)/sizeof(*xorSequences);
 xor_mask = xorSequences[s];
}

lfsr_t lfsr(void)
{
 unsigned char lsb = lfsr_value & 1u;
 lfsr_value >>= 1u;
 if (lsb)
  lfsr_value ^= xor_mask;
 return lfsr_value & 0x7fu;
}

lfsr_t lfsrWithSeed(uint8_t lfsrSeed)
{
    lfsr_value = lfsrSeed;
 unsigned char lsb = lfsr_value & 1u;
 lfsr_value >>= 1;
 if (lsb)
  lfsr_value ^= xor_mask;
 return lfsr_value & 0x7fu;
}
