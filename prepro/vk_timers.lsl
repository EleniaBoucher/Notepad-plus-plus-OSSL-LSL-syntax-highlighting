#ifndef VK_TIMERS
#define VK_TIMERS
//_____________________________________________________________________________
//
//    Author:	Very Keynes
//    Script:	vk_timers.lsl
//    Version:	1.0
//    Created:	2012-09-28
//    Modified:
//-----------------------------------------------------------------------------
//	Description:
//
//_____________________________________________________________________________
//
list vk_timers;
//-----------------------------------------------------------------------------
StartTimers(){llSetTimerEvent(TimeBase);}
StopTimers(){llSetTimerEvent(0.0);}
//-----------------------------------------------------------------------------
SetTimer(integer num, integer val, integer repeat)
{
	if(repeat)vk_timers = llListReplaceList(vk_timers, [val, val], num *= 2, num + 1);
	else vk_timers = llListReplaceList(vk_timers, [val, -1], num *= 2, num + 1);
}
//-----------------------------------------------------------------------------
StopTimer(integer num)
{
	vk_timers = llListReplaceList(vk_timers, [-1, -1], num *= 2, num + 1);
}
//-----------------------------------------------------------------------------
integer RemainingTime(integer num)
{
	return llList2Integer(vk_timers, (num - 1) * 2);
}
//-----------------------------------------------------------------------------
DoTimer(integer x)
{
	if(0 == x){return;}
        //
        // This is where the real majic happens
        //
	#ifdef	timer1
		else if(1 == x){timer1}
	#endif //
	#ifdef	timer2
		else if(2 == x){timer2}
	#endif //
	#ifdef	timer3
		else if(3 == x){timer3}
	#endif //
		#ifdef	timer4
		else if(4 == x){timer4}
	#endif //
		#ifdef	timer5
		else if(5 == x){timer5}
	#endif //
	#ifdef	timer6
		else if(6 == x){timer6}
	#endif //
	#ifdef	timer7
		else if(7 == x){timer7}
	#endif //
	#ifdef	timer8
		else if(8 == x){timer8}
	#endif //
}
//-----------------------------------------------------------------------------
vkTimers(integer x)
{
	integer y;
	integer z;
	for(x = 0; x < MaxTimers; x++)
	{
		y = x * 2;
		z = llList2Integer(vk_timers, y);
		if(z > 0)vk_timers = llListReplaceList(vk_timers, [z - 1], y, y);
		else if(z == 0)
		{
			vk_timers = llListReplaceList(vk_timers, [llList2Integer(vk_timers, (y) + 1)], y, y);
			DoTimer(x + 1);
		}
	}
}
//_____________________________________________________________________________
//
#endif //VK_TIMERS