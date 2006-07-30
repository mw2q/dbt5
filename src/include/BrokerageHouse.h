/*
 * BrokerageHouse.h
 * This class represents the Brokerage House
 *
 * 2006 Rilson Nascimento
 *
 * 25 July 2006
 */

#ifndef BROKERAGE_HOUSE_H
#define BROKERAGE_HOUSE_H

namespace TPCE
{

class CBrokerageHouse
{
	CSocket		m_Socket;

	char		m_szHost[iMaxPGHost];		// host name
	char		m_szDBName[iMaxPGDBName];	// database name
	char		m_szPostmasterPort[iMaxPGPort]; // PostgreSQL postmaster port

private:
	void ThrowError();

	friend void* TPCE::WorkerThread(void* data);
	friend void TPCE::EntryWorkerThread(void* data);	// entry point for worker thread

	INT32 RunTradeStatus( PTradeStatusTxnInput pTxnInput, CTradeStatus &TradeStatus );
	INT32 RunTradeLookup( PTradeLookupTxnInput pTxnInput, CTradeLookup &TradeLookup );
	INT32 RunTradeUpdate( PTradeUpdateTxnInput pTxnInput, CTradeUpdate &TradeUpdate );
	INT32 RunTradeOrder( PTradeOrderTxnInput pTxnInput, CTradeOrder &TradeOrder );
	INT32 RunBrokerVolume( PBrokerVolumeTxnInput pTxnInput, CBrokerVolume &BrokerVolume );
	INT32 RunCustomerPosition( PCustomerPositionTxnInput pTxnInput, CCustomerPosition &CustomerPosition );
	INT32 RunSecurityDetail( PSecurityDetailTxnInput pTxnInput, CSecurityDetail &SecurityDetail );
	INT32 RunMarketWatch( PMarketWatchTxnInput pTxnInput, CMarketWatch &MarketWatch );
	INT32 RunTradeResult( PTradeResultTxnInput pTxnInput, CTradeResult &TradeResult );
	INT32 RunMarketFeed( PMarketFeedTxnInput pTxnInput, CMarketFeed &MarketFeed );
	INT32 RunDataMaintenance( PDataMaintenanceTxnInput pTxnInput, CDataMaintenance &DataMaintenance );

public:

	CBrokerageHouse(const char *szHost, const char *szDBName, const char *szPostmasterPort);
	~CBrokerageHouse();

	void Listener(void);

};

//parameter structure for the threads
typedef struct TThreadParameter
{
	CBrokerageHouse*	pBrokerageHouse;
	int			iSockfd;
	TMsgDriverBrokerage	Message;
} *PThreadParameter;


}	// namespace TPCE

#endif	// BROKERAGE_HOUSE_H