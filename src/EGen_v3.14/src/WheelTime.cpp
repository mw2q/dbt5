/*
 * Legal Notice
 *
 * This document and associated source code (the "Work") is a preliminary
 * version of a benchmark specification being developed by the TPC. The
 * Work is being made available to the public for review and comment only.
 * The TPC reserves all right, title, and interest to the Work as provided
 * under U.S. and international laws, including without limitation all patent
 * and trademark rights therein.
 *
 * No Warranty
 *
 * 1.1 TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE INFORMATION
 *     CONTAINED HEREIN IS PROVIDED "AS IS" AND WITH ALL FAULTS, AND THE
 *     AUTHORS AND DEVELOPERS OF THE WORK HEREBY DISCLAIM ALL OTHER
 *     WARRANTIES AND CONDITIONS, EITHER EXPRESS, IMPLIED OR STATUTORY,
 *     INCLUDING, BUT NOT LIMITED TO, ANY (IF ANY) IMPLIED WARRANTIES,
 *     DUTIES OR CONDITIONS OF MERCHANTABILITY, OF FITNESS FOR A PARTICULAR
 *     PURPOSE, OF ACCURACY OR COMPLETENESS OF RESPONSES, OF RESULTS, OF
 *     WORKMANLIKE EFFORT, OF LACK OF VIRUSES, AND OF LACK OF NEGLIGENCE.
 *     ALSO, THERE IS NO WARRANTY OR CONDITION OF TITLE, QUIET ENJOYMENT,
 *     QUIET POSSESSION, CORRESPONDENCE TO DESCRIPTION OR NON-INFRINGEMENT
 *     WITH REGARD TO THE WORK.
 * 1.2 IN NO EVENT WILL ANY AUTHOR OR DEVELOPER OF THE WORK BE LIABLE TO
 *     ANY OTHER PARTY FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO THE
 *     COST OF PROCURING SUBSTITUTE GOODS OR SERVICES, LOST PROFITS, LOSS
 *     OF USE, LOSS OF DATA, OR ANY INCIDENTAL, CONSEQUENTIAL, DIRECT,
 *     INDIRECT, OR SPECIAL DAMAGES WHETHER UNDER CONTRACT, TORT, WARRANTY,
 *     OR OTHERWISE, ARISING IN ANY WAY OUT OF THIS OR ANY OTHER AGREEMENT
 *     RELATING TO THE WORK, WHETHER OR NOT SUCH AUTHOR OR DEVELOPER HAD
 *     ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES.
 *
 * Contributors
 * - Doug Johnson
 */

/******************************************************************************
*	Description:		Implementation of the CWheelTime class.
*						See WheelTime.h for a high level description.
******************************************************************************/

#include "../inc/WheelTime.h"

using namespace TPCE;

CWheelTime::CWheelTime( PWheelConfig pWheelConfig )
	: m_pWheelConfig( pWheelConfig )
	, m_Cycles( 0 )
	, m_Index( 0 )
{
}

CWheelTime::CWheelTime( PWheelConfig pWheelConfig, INT32 Cycles, INT32 Index )
	: m_pWheelConfig( pWheelConfig )
	, m_Cycles( Cycles )
	, m_Index( Index )
{
}

CWheelTime::CWheelTime( PWheelConfig pWheelConfig, CDateTime& Base, CDateTime& Now, INT32 Offset )
	: m_pWheelConfig( pWheelConfig )
{
	Set( Base , Now );
	Add( Offset );
}

CWheelTime::~CWheelTime( void )
{
}

void CWheelTime::Add( INT32 Interval )
{
	//DJ - should throw error if Interval >= m_pWheelConfig->WheelSize?
	m_Cycles += Interval / m_pWheelConfig->WheelSize;
	m_Index += Interval % m_pWheelConfig->WheelSize;
	if( m_Index >= m_pWheelConfig->WheelSize )
	{
		//Handle wrapping in the wheel - assume we don't allow multi-cycle intervals
		m_Cycles++;
		m_Index -= m_pWheelConfig->WheelSize;
	}
}

INT32 CWheelTime::Offset( const CWheelTime& Time )
{
	INT32	Interval;

	Interval = ( m_Cycles - Time.m_Cycles ) * m_pWheelConfig->WheelSize;
	Interval += ( m_Index - Time.m_Index );
	return( Interval );
}

void CWheelTime::Set( INT32 Cycles, INT32 Index )
{
	m_Cycles = Cycles;
	m_Index = Index;	//DJ - should throw error if Index >= m_pWheelConfig->WheelSize
}

// Set is overloaded. This version is used by the timer wheel.
void CWheelTime::Set( CDateTime& Base, CDateTime& Now )
{
	INT32		Offset;	//offset from BaseTime in milliseconds

	//DJ - If Now < Base, then we should probably throw an exception

	Offset = Now.DiffInMilliSeconds( Base ) / m_pWheelConfig->WheelResolution; // convert based on wheel resolution
	m_Cycles = Offset / m_pWheelConfig->WheelSize;
	m_Index = Offset % m_pWheelConfig->WheelSize;
}

// Set is overloaded. This version is used by the event wheel.
void CWheelTime::Set( CDateTime* pBase, CDateTime* pNow )
{
	INT32		Offset;	//offset from BaseTime in milliseconds

	//DJ - If Now < Base, then we should probably throw an exception

	Offset = pNow->DiffInMilliSeconds( pBase ) / m_pWheelConfig->WheelResolution; // convert based on wheel resolution
	m_Cycles = Offset / m_pWheelConfig->WheelSize;
	m_Index = Offset % m_pWheelConfig->WheelSize;
}

bool CWheelTime::operator <(const CWheelTime& Time)
{
	return ( m_Cycles == Time.m_Cycles ) ? ( m_Index < Time.m_Index ) : ( m_Cycles < Time.m_Cycles );
}

CWheelTime& CWheelTime::operator = (const CWheelTime& Time)
{
	m_pWheelConfig = Time.m_pWheelConfig;
	m_Cycles = Time.m_Cycles;
	m_Index = Time.m_Index;

	return *this;
}

CWheelTime& CWheelTime::operator += ( const INT32& Interval )
{
	Add( Interval );
	return *this;
}

CWheelTime CWheelTime::operator ++ ( INT32 )
{
	Add( 1 );
	return *this;
}
