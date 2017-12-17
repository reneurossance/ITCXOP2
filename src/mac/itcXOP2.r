#include "XOPStandardHeaders.r"

resource 'vers' (1) {								// XOP version info
	0x01, 0x10, final, 0x00, 0,				// Version bytes and country integer
	"1.10",
	"1.10, Copyright 1996-2013 WaveMetrics, Inc., all rights reserved."
};

resource 'vers' (2) {								// Igor version info
	0x06, 0x30, release, 0x00, 0,			// Version bytes and country integer
	"6.30",
	"(for Igor Pro 6.30 or later)"
};

resource 'STR#' (1100) {					 // Custom error messages
	{
		// [1] OLD_IGOR
		"itcXOP2 requires at least Igor Pro 6.30 (32bit) or Igor Pro 7.0 (64bit).",
		
		// [2] UNHANDLED_CPP_EXCEPTION
		"Unhandled C++ Exception.",
		
		// [3] SLOT_LOCKED_TO_OTHER_THREAD
		"DeviceID is locked to another thread.",
		
		// [4] SLOT_EMPTY EXIT_FAILURE
		"Tried to access an unused DeviceID.",
		
		// [5] COULDNT_FIND_EMPTY_SLOT
		"No DeviceIDs available to use.",
		
		// [6] ITC_DLL_ERROR
		"Problem with ITC DLL.",
		
		// [7] INVALID_DEVICETYPE_NUMERIC
		"Invalid numeric device type (/DTN).",
		
		// [8] INVALID_DEVICETYPE_STRING
		"Invalid string device type (/DTS).",
		
		// [9] DTN_DTS_DISAGREE
		"The device types specified by /DTN and /DTS do not agree.",
		
		// [10] INVALID_CHANNELTYPE_NUMERIC
		"Invalid numeric channel type (/CHN).",
		
		// [11] INVALID_CHANNELTYPE_STRING
		"Invalid string channel type (/CHS).",
		
		// [12] CHN_CHS_DISAGREE
		"The channel types specified by /CHN and /CHS do not agree.",
		
		// [13] MUST_SPECIFY_CHN_OR_CHS
		"Must specify /CHN or /CHS.",
		
		// [14] ITCCONFIGCHANNEL2_BAD_S
		"Invalid value for /S flag.",
		
		// [15] ITCCONFIGCHANNEL2_BAD_M
		"Invalid value for /M flag.",
	
		// [16] ITCCONFIGCHANNEL2_BAD_A
	  "Invalid value for /A flag.",
	
		// [17] ITCCONFIGCHANNEL2_BAD_O
		"Invalid value for /O flag.",
		
		// [18] ITCCONFIGCHANNEL2_BAD_U
		"Invalid value for /U flag.",
		
		// [19] NEED_MIN_ROWS
		"Wave does not have the minumum number of rows required.",
		
		// [20] F_FLAG_REQUIRES_ITC18_ITC18USB_ITC1600
		"The /F flag requires an ITC18, ITC18USB or ITC1600.",
		
		// [21] D_FLAG_REQUIRES_ITC1600
		"The /D flag requires an ITC1600.",
		
		// [22] H_FLAG_REQUIRES_ITC1600
		"The /H flag requires an ITC1600.",
		
		// [23] R_FLAG_REQUIRES_ITC1600
		"The /R flag requires an ITC1600.",
		
		// [24] THREAD_DEVICE_ID_NOT_SET
		"Tried to access the default device, but the default device has not been set.",
	}
};

resource 'STR#' (1101) {	// Misc strings for XOP.
	{
		"-1",									// This item is no longer supported by the Carbon XOP Toolkit.
		"No Menu Item",				// This item is no longer supported by the Carbon XOP Toolkit.
		"itcXOP2 Help",				// Name of XOP's help file.
	}
};

resource 'XOPI' (1100) {
	XOP_VERSION,							// XOP protocol version.
	DEV_SYS_CODE,							// Development system information.
	0,												// Obsolete - set to zero.
	0,												// Obsolete - set to zero.
	XOP_TOOLKIT_VERSION,			// XOP Toolkit version.
};

// Describes operations that the XOP adds to IGOR.
resource 'XOPC' (1100) {
	{
		"ITCCloseAll2"             , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCCloseDevice2"          , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCConfigChannelReset2"   , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCConfigChannelUpload2"  , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCConfigAllChannels2"    , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCConfigChannel2"        , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCFIFOAvailable2"        , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCFIFOAvailableAll2"     , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetAllChannelsConfig2" , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetChannelConfig2"     , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetCurrentDevice2"     , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetDeviceInfo2"        , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetDevices2"           , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetErrorString2"       , utilOp + XOPOp + compilableOp + threadSafeOp,
		//  "ITCGetLastError2"     , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetSerialNumber2"      , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetState2"             , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCGetVersions2"          , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCInitialize2"           , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCOpenDevice2"           , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCReadADC2"              , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCReadDigital2"          , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCReadTimer2"            , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCSelectDevice2"         , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCSetDAC2"               , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCSetGlobals2"           , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCSetModes2"             , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCSetState2"             , utilOp + XOPOp + compilableOp + threadSafeOp,
		//  "ITCShortAcquisition2" , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCStartAcq2"             , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCStopAcq2"              , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCUpdateFIFOPosition2"   , utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCUpdateFIFOPositionAll2", utilOp + XOPOp + compilableOp + threadSafeOp,
		"ITCWriteDigital2"         , utilOp + XOPOp + compilableOp + threadSafeOp,
	}
};
