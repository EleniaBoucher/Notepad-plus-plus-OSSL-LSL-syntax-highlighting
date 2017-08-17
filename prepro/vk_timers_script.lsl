//
// Initialise the Library 
//
#define MaxTimers 4  // The number of timers you wish to create (maximum is 8)
#define TimeBase 1.0 // The tick rate in seconds (or fractions of if desierd)
//
// define the Functions to be called by each timer
//
#define timer1 ATask();          // can be any fuction name you desire
#define timer2 AnotherTask();    // can be any fuction name you desire
#define timer3 YetAnotherTask(); // can be any fuction name you desire
#define timer4 AndAnotherTask(); // can be any fuction name you desire
//
// inclde the library itself 
//
#include "vk_timers.lsl"
//
// Everything up to this pont could go into a header file
// and replaced with a single line:
//
// #include "Timers.h"
//
//-----------------------------------------------------------------------------
// create the Actual functions you named above
// the order and placement is not important
//-----------------------------------------------------------------------------
ATask()
{
    llSay(0, "Task 1 triggerd and will not repeat");
}
//-----------------------------------------------------------------------------
AnotherTask()
{
    llSay(0, "Task 2 triggerd and will repeat in "+(string)RemainingTime(2)+" seconds");
}
//-----------------------------------------------------------------------------
YetAnotherTask()
{
    llSay(0, "30 seconds is up");
}
//-----------------------------------------------------------------------------
AndAnotherTask()
{
    llSay(0, "tick");
}
//-----------------------------------------------------------------------------
// write the rest of your code
//-----------------------------------------------------------------------------
default
{
    //-----------------------------------------------------------------------------
    state_entry()
    {
        // Setup the timers using SetTimer(Timer Number, Number of Ticks, Repeat?);
        SetTimer(1, 15, FALSE); // Timer 1 is a single shot
        SetTimer(2, 10, TRUE);  // Timer 2 will repeat every 10 seconds
        SetTimer(3, 30, FALSE); // 
        SetTimer(4, 60, TRUE);  //
        // When ready Start the timers
        StartTimers();
    }
    //-----------------------------------------------------------------------------
    timer()
    {
        vkTimers(MaxTimers);
        //
        // Statements that need to execute every tick can go here
        //
    }
    //-----------------------------------------------------------------------------
}