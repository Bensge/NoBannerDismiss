/*

No Banner Dismiss
-----------------

Prevent auto-dimissal of banner notifications when opening, closing or switching apps.

Copyright (c) Bensge 2014

MIT License

*/


%hook SBUIMainScreenAnimationController
- (void)_dismissBannerAnimated:(BOOL)arg1
{
	//Block ALL the calls!
}
%end


///////////////////////////////////////////////////////////////////////////////
////////////////    R E S E A R C H       S T U F F    ////////////////////////
///////////////////////////////////////////////////////////////////////////////

/*
%hook SBBannerController

static BOOL ha=NO;

%new
+(void)h
{
	ha=YES;
}

- (void)dismissBannerWithAnimation:(BOOL)animation reason:(int)reason
{
	%log;
	%orig;
}
- (void)dismissBannerWithAnimation:(BOOL)animation reason:(int)reason forceEvenIfBusy:(BOOL)busy
{
	if (ha)
		[NSException raise:@"" format:@""];
	%log;
	%orig;
}
- (void)dismissCurrentBannerContextForSource:(id)source
{
	%log;
	%orig;
}
%end
*/

/*
Crash SpringBoard to get a backtrace.

Last Exception Backtrace:
0       CoreFoundation                	0x2f2fee7e 0x2f22a000 + 0xd4e7e 	// ___exceptionPreprocess + 0x7e
1       libobjc.A.dylib               	0x3965b6c2 0x39653000 + 0x86c2  	// _objc_exception_throw + 0x22
2       CoreFoundation                	0x2f2fedc0 0x2f22a000 + 0xd4dc0 	// +[NSException raise:format:] + 0x6c
3     + NoBannerDismiss.dylib         	0x021ccda2 0x021cc000 + 0xda2   	// 0x00000d59 + 0x49
4       SpringBoard (*)               	0x00279738 0x0008c000 + 0x1ed738	// -[SBUIMainScreenAnimationController _dismissBannerAnimated:] + 0x63
5       SpringBoard (*)               	0x0027965e 0x0008c000 + 0x1ed65e	// -[SBUIMainScreenAnimationController __startAnimation] + 0x51
6       SpringBoard (*)               	0x001942fa 0x0008c000 + 0x1082fa	// -[SBUIAnimationController beginAnimation] + 0x429
7       SpringBoard (*)               	0x00279800 0x0008c000 + 0x1ed800	// -[SBUIMainScreenAnimationController beginAnimation] + 0xbf
8       SpringBoard (*)               	0x00232e42 0x0008c000 + 0x1a6e42	// -[SBAppToAppWorkspaceTransaction _commit] + 0x45
9       SpringBoard (*)               	0x00230f56 0x0008c000 + 0x1a4f56	// -[SBWorkspaceTransaction commit] + 0x11d
10      SpringBoard (*)               	0x000b1648 0x0008c000 + 0x25648 	// -[SBWorkspace setCurrentTransaction:] + 0x13f
11      SpringBoard (*)               	0x000ab64c 0x0008c000 + 0x1f64c 	// 0x0001f38d + 0x2bf
12      SpringBoard (*)               	0x00237d9a 0x0008c000 + 0x1abd9a	// -[SBWorkspaceEventQueue _processNextEvent] + 0x145
13      SpringBoard (*)               	0x00239ba8 0x0008c000 + 0x1adba8	// -[SBWorkspaceEventQueueLockAssertion dealloc] + 0x23
14      libobjc.A.dylib               	0x39666b06 0x39653000 + 0x13b06 	// objc_object::sidetable_release(bool) + 0xaa
15      SpringBoard (*)               	0x00237da2 0x0008c000 + 0x1abda2	// -[SBWorkspaceEventQueue _processNextEvent] + 0x14d
16      SpringBoard (*)               	0x0023787c 0x0008c000 + 0x1ab87c	// -[SBWorkspaceEventQueue _executeOrPendEvents:position:] + 0x28b
17      SpringBoard (*)               	0x0012cf8c 0x0008c000 + 0xa0f8c 	// -[SBIconController _launchIcon:] + 0x147

*/