/*
 * This file is released under the terms of the Artistic License.  Please see
 * the file LICENSE, included in this package, for details.
 *
 * Copyright (C) 2006 Rilson Nascimento
 *
 * MEE (Market Exchange Emulator) - SUT Interface class
 * 30 July 2006
 */

#ifndef MEE_SUT_H
#define MEE_SUT_H

#include "MEESUTInterface.h"
#include "locking.h"

class CMEESUT : public CMEESUTInterface, public CBaseInterface
{
private:
	TTradeResultTxnInput	m_TradeResultTxnInput;
	TMarketFeedTxnInput	m_MarketFeedTxnInput;
	
public:
	CMEESUT(char* addr, const int iListenPort, ofstream* pflog, ofstream* pfmix,
			CMutex* pLogLock, CMutex* pMixLock) :
			CBaseInterface(addr, iListenPort, pflog, pfmix, pLogLock,
			pMixLock) {};
	~CMEESUT() {};

	// return whether it was successful
	virtual bool TradeResult( PTradeResultTxnInput pTxnInput );
	// return whether it was successful
	virtual bool MarketFeed( PMarketFeedTxnInput pTxnInput );
	
	friend void *TradeResultAsync(void* data);
	friend bool RunTradeResultAsync(void* data);

	friend void *MarketFeedAsync(void* data);
	friend bool RunMarketFeedAsync(void* data);
};

//parameter structure for the threads
typedef struct TMEESUTThreadParam
{
	CMEESUT*		pCMEESUT;
	union
	{
		TTradeResultTxnInput	m_TradeResultTxnInput;
		TMarketFeedTxnInput	m_MarketFeedTxnInput;
	} TxnInput;
} *PMEESUTThreadParam;

#endif	// MEE_SUT_H
