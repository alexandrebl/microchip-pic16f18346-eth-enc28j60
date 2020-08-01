#include "mcc_generated_files/mcc.h"
#include "mcc_generated_files/TCPIPLibrary/udpv4.h"
#include "mcc_generated_files/TCPIPLibrary/udpv4_port_handler_table.h"

#define IPV4_BROADCAST 0xFFFFFFFF

uint8_t udpData;
bool receivedMsg = false;

void Demo_UDP_Receive(int length)
{
    //length holds the number of bytes received
    //this example, however, will only receive the first byte
    UDP_ReadBlock(&udpData, 1);
    receivedMsg = true;
}

void main(void)
{
    // initialize the device
    SYSTEM_Initialize();

    // When using interrupts, you need to set the Global and Peripheral Interrupt Enable bits
    // Use the following macros to:

    // Enable the Global Interrupts
    INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    INTERRUPT_PeripheralInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();

    while (1)
    {
        Network_Manage();
        if (receivedMsg)
        {
            //Broadcast the received message, onto the same UDP port
            if (UDP_Start(IPV4_BROADCAST, 65531, 65531) == SUCCESS)
            {
                UDP_Write8(udpData);
                UDP_Send();   
            }
            receivedMsg = false;
        }
    }
}
/**
 End of File
*/