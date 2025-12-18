#ifndef MYSPI_H
#define MYSPI_H
#include <stdbool.h>

void initSPI();
/*
void setSPIOut(unsigned char newDataOut);
bool getSPIReady();
unsigned char getSPIIn();
unsigned char getSPINumBytes();
*/
void updateSPI();

unsigned char getSPIIn(unsigned char i);
//void setSPIOut(unsigned char newDataOut);
bool isSPIReady();
void clearSPIBuffer();

#endif