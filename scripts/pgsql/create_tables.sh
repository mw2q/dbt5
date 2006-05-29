#!/bin/sh

#
# This file is released under the terms of the Artistic License.
# Please see the file LICENSE, included in this package, for details.
#
# Copyright (C) 2002 Mark Wong & Open Source Development Labs, Inc.
#
# 2006 Rilson Nascimento
# based on TPC-Benchmark E Specification, Revision 0.32

DIR=`dirname $0`
. ${DIR}/pgsql_profile || exit 1

USE_TABLESPACES=0
while getopts "t" OPT; do
	case ${OPT} in
	t)
		USE_TABLESPACES=1
		;;
	esac
done

if [ ${USE_TABLESPACES} -eq 1 ]; then
	TS_ACCOUNT_PERMISSION_DIR=${TSDIR}/account_permission/ts
	TS_CUSTOMER_DIR=${TSDIR}/customer/ts
	TS_CUSTOMER_ACCOUNT_DIR=${TSDIR}/customer_account/ts
	TS_CUSTOMER_TAXRATE_DIR=${TSDIR}/customer_taxrate/ts
	TS_HOLDING_DIR=${TSDIR}/holding/ts
	TS_HOLDING_HISTORY_DIR=${TSDIR}/holding_history/ts
	TS_HOLDING_SUMMARY_DIR=${TSDIR}/holding_summary/ts
	TS_WATCH_ITEM_DIR=${TSDIR}/watch_item/ts
	TS_WATCH_LIST_DIR=${TSDIR}/watch_list/ts
	TS_BROKER_DIR=${TSDIR}/broker/ts
	TS_CASH_TRANSACTION_DIR=${TSDIR}/cash_transaction/ts
	TS_CHARGE_DIR=${TSDIR}/charge/ts
	TS_COMMISSION_RATE_DIR=${TSDIR}/commission_rate/ts
	TS_SETTLEMENT_DIR=${TSDIR}/settlement/ts
	TS_TRADE_DIR=${TSDIR}/trade/ts
	TS_TRADE_HISTORY_DIR=${TSDIR}/trade_history/ts
	TS_TRADE_REQUEST_DIR=${TSDIR}/trade_request/ts
	TS_TRADE_TYPE_DIR=${TSDIR}/trade_type/ts
	TS_COMPANY_DIR=${TSDIR}/company/ts
	TS_COMPANY_COMPETITOR_DIR=${TSDIR}/company_competitor/ts
	TS_DAILY_MARKET_DIR=${TSDIR}/daily_market/ts
	TS_EXCHANGE_DIR=${TSDIR}/exchange/ts
	TS_FINANCIAL_DIR=${TSDIR}/financial/ts
	TS_INDUSTRY_DIR=${TSDIR}/industry/ts
	TS_LAST_TRADE_DIR=${TSDIR}/last_trade/ts
	TS_NEWS_ITEM_DIR=${TSDIR}/news_item/ts
	TS_NEWS_XREF_DIR=${TSDIR}/news_xref/ts
	TS_SECTOR_DIR=${TSDIR}/sector/ts
	TS_SECURITY_DIR=${TSDIR}/security/ts
	TS_ADDRESS_DIR=${TSDIR}/address/ts
	TS_STATUS_TYPE_DIR=${TSDIR}/status_type/ts
	TS_TAXRATE_DIR=${TSDIR}/taxrate/ts
	TS_ZIP_CODE_DIR=${TSDIR}/zip_code/ts

	#
	# Creating 'ts' subdirectories because PostgreSQL doesn't like that
	# 'lost+found' directory if a device was mounted at
	# '${TSDIR}/warehouse'.
	#
	mkdir -p ${TS_ACCOUNT_PERMISSION_DIR} || exit 1
	mkdir -p ${TS_CUSTOMER_DIR} || exit 1
	mkdir -p ${TS_CUSTOMER_ACCOUNT_DIR} || exit 1
	mkdir -p ${TS_CUSTOMER_TAXRATE_DIR} || exit 1
	mkdir -p ${TS_HOLDING_DIR} || exit 1
	mkdir -p ${TS_HOLDING_HISTORY_DIR} || exit 1
	mkdir -p ${TS_HOLDING_SUMMARY_DIR} || exit 1
	mkdir -p ${TS_WATCH_ITEM_DIR} || exit 1
	mkdir -p ${TS_WATCH_LIST_DIR} || exit 1
	mkdir -p ${TS_BROKER_DIR} || exit 1
	mkdir -p ${TS_CASH_TRANSACTION_DIR} || exit 1
	mkdir -p ${TS_CHARGE_DIR} || exit 1
	mkdir -p ${TS_COMMISSION_RATE_DIR} || exit 1
	mkdir -p ${TS_SETTLEMENT_DIR} || exit 1
	mkdir -p ${TS_TRADE_DIR} || exit 1
	mkdir -p ${TS_TRADE_HISTORY_DIR} || exit 1
	mkdir -p ${TS_TRADE_REQUEST_DIR} || exit 1
	mkdir -p ${TS_TRADE_TYPE_DIR} || exit 1
	mkdir -p ${TS_COMPANY_DIR} || exit 1
	mkdir -p ${TS_COMPANY_COMPETITOR_DIR} || exit 1
	mkdir -p ${TS_DAILY_MARKET_DIR} || exit 1
	mkdir -p ${TS_EXCHANGE_DIR} || exit 1
	mkdir -p ${TS_FINANCIAL_DIR} || exit 1
	mkdir -p ${TS_INDUSTRY_DIR} || exit 1
	mkdir -p ${TS_LAST_TRADE_DIR} || exit 1
	mkdir -p ${TS_NEWS_ITEM_DIR} || exit 1
	mkdir -p ${TS_NEWS_XREF_DIR} || exit 1
	mkdir -p ${TS_SECTOR_DIR} || exit 1
	mkdir -p ${TS_SECURITY_DIR} || exit 1
	mkdir -p ${TS_ADDRESS_DIR} || exit 1
	mkdir -p ${TS_STATUS_TYPE_DIR} || exit 1
	mkdir -p ${TS_TAXRATE_DIR} || exit 1
	mkdir -p ${TS_ZIP_CODE_DIR} || exit 1

	TS_ACCOUNT_PERMISSION="TABLESPACE dbt5_account_permission"
	TS_CUSTOMER="TABLESPACE dbt5_customer"
	TS_CUSTOMER_ACCOUNT="TABLESPACE dbt5_customer_account"
	TS_CUSTOMER_TAXRATE="TABLESPACE dbt5_customer_taxrate"
	TS_HOLDING="TABLESPACE dbt5_holding"
	TS_HOLDING_HISTORY="TABLESPACE dbt5_holding_history"
	TS_HOLDING_SUMMARY="TABLESPACE dbt5_holding_summary"
	TS_WATCH_ITEM="TABLESPACE dbt5_watch_item"
	TS_WATCH_LIST="TABLESPACE dbt5_watch_list"
	TS_BROKER="TABLESPACE dbt5_broker"
	TS_CASH_TRANSACTION="TABLESPACE dbt5_cash_transaction"
	TS_CHARGE="TABLESPACE dbt5_charge"
	TS_COMMISSION_RATE="TABLESPACE dbt5_commission_rate"
	TS_SETTLEMENT="TABLESPACE dbt5_settlement"
	TS_TRADE="TABLESPACE dbt5_trade"
	TS_TRADE_HISTORY="TABLESPACE dbt5_trade_history"
	TS_TRADE_REQUEST="TABLESPACE dbt5_trade_request"
	TS_TRADE_TYPE="TABLESPACE dbt5_trade_type"
	TS_COMPANY="TABLESPACE dbt5_company"
	TS_COMPANY_COMPETITOR="TABLESPACE dbt5_company_competitor"
	TS_DAILY_MARKET="TABLESPACE dbt5_daily_market"
	TS_EXCHANGE="TABLESPACE dbt5_exchange"
	TS_FINANCIAL="TABLESPACE dbt5_financial"
	TS_INDUSTRY="TABLESPACE dbt5_industry"
	TS_LAST_TRADE="TABLESPACE dbt5_last_trade"
	TS_NEWS_ITEM="TABLESPACE dbt5_news_item"
	TS_NEWS_XREF="TABLESPACE dbt5_news_xref"
	TS_SECTOR="TABLESPACE dbt5_sector"
	TS_SECURITY="TABLESPACE dbt5_security"
	TS_ADDRESS="TABLESPACE dbt5_address"
	TS_STATUS_TYPE="TABLESPACE dbt5_status_type"
	TS_TAXRATE="TABLESPACE dbt5_taxrate"
	TS_ZIP_CODE="TABLESPACE dbt5_zip_code"

	#
	# Don't need to '|| exit 1' in case the tablespaces do not already exist.
	#
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_ACCOUNT_PERMISSION};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_ACCOUNT_PERMISSION} LOCATION '${TS_ACCOUNT_PERMISSION_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_CUSTOMER};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_CUSTOMER} LOCATION '${TS_CUSTOMER_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_CUSTOMER_ACCOUNT};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_CUSTOMER_ACCOUNT} LOCATION '${TS_CUSTOMER_ACCOUNT_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_CUSTOMER_TAXRATE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_CUSTOMER_TAXRATE} LOCATION '${TS_CUSTOMER_TAXRATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_HOLDING};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_HOLDING} LOCATION '${TS_HOLDING_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_HOLDING_HISTORY};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_HOLDING_HISTORY} LOCATION '${TS_HOLDING_HISTORY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_HOLDING_SUMMARY};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_HOLDING_SUMMARY} LOCATION '${TS_HOLDING_SUMMARY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_WATCH_ITEM};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_WATCH_ITEM} LOCATION '${TS_WATCH_ITEM_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_WATCH_LIST};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_WATCH_LIST} LOCATION '${TS_WATCH_LIST_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_BROKER};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_BROKER} LOCATION '${TS_BROKER_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_CASH_TRANSACTION};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_CASH_TRANSACTION} LOCATION '${TS_CASH_TRANSACTION_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_CHARGE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_CHARGE} LOCATION '${TS_CHARGE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_COMMISSION_RATE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_COMMISSION_RATE} LOCATION '${TS_COMMISSION_RATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_SETTLEMENT};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_SETTLEMENT} LOCATION '${TS_SETTLEMENT_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_TRADE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_TRADE} LOCATION '${TS_TRADE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_TRADE_HISTORY};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_TRADE_HISTORY} LOCATION '${TS_TRADE_HISTORY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_TRADE_REQUEST};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_TRADE_REQUEST} LOCATION '${TS_TRADE_REQUEST_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_TRADE_TYPE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_TRADE_TYPE} LOCATION '${TS_TRADE_TYPE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_COMPANY};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_COMPANY} LOCATION '${TS_COMPANY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_COMPANY_COMPETITOR};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_COMPANY_COMPETITOR} LOCATION '${TS_COMPANY_COMPETITOR_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_DAILY_MARKET};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_DAILY_MARKET} LOCATION '${TS_DAILY_MARKET_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_EXCHANGE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_EXCHANGE} LOCATION '${TS_EXCHANGE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_FINANCIAL};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FINANCIAL} LOCATION '${TS_FINANCIAL_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_INDUSTRY};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_INDUSTRY} LOCATION '${TS_INDUSTRY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_LAST_TRADE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_LAST_TRADE} LOCATION '${TS_LAST_TRADE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_NEWS_ITEM};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_NEWS_ITEM} LOCATION '${TS_NEWS_ITEM_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_NEWS_XREF};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_NEWS_XREF} LOCATION '${TS_NEWS_XREF_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_SECTOR};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_SECTOR} LOCATION '${TS_SECTOR_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_SECURITY};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_SECURITY} LOCATION '${TS_SECURITY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_ADDRESS};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_ADDRESS} LOCATION '${TS_ADDRESS_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_STATUS_TYPE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_STATUS_TYPE} LOCATION '${TS_STATUS_TYPE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_TAXRATE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_TAXRATE} LOCATION '${TS_TAXRATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "DROP ${TS_ZIP_CODE};"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_ZIP_CODE} LOCATION '${TS_ZIP_CODE_DIR}';"
fi

# Creating domains to meta-type definitions (clause 2.2.3)

# FIXME: BIGINT or NUMERIC(11),(12),(15) for IDENT_T, S_COUNT_T and TRADE_T?
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN S_COUNT_T AS BIGINT NOT NULL;" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN IDENT_T AS BIGINT NOT NULL;" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN TRADE_T AS BIGINT NOT NULL;" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN BALANCE_T AS NUMERIC(12,2) NOT NULL;" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN S_PRICE_T AS NUMERIC(8,2);" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN S_QTY_T AS INTEGER NOT NULL;" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN VALUE_T AS NUMERIC(10,2) NOT NULL;" || exit 1
${PSQL} -e -d ${DBNAME} -c "CREATE DOMAIN FIN_AGG_T AS NUMERIC(15,2) NOT NULL;" || exit 1

# Note: when the specification states CHAR(n), the implementer can choose 
#       whether it pads strings with spaces to always have the maximum length,
#	or whether it doesn't pad strings (clause 2.2.2.1)

# Customer Tables

# Clause 2.2.5.1
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE account_permission (
    ap_ca_id IDENT_T,
    ap_acl char(4) NOT NULL,
    ap_tax_id VARCHAR(20) NOT NULL,
    ap_l_name VARCHAR(30) NOT NULL,
    ap_f_name VARCHAR(30) NOT NULL)
    ${TS_ACCOUNT_PERMISSION};
" || exit 1	

# Clause 2.2.5.2
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE customer (
    c_id IDENT_T,
    c_tax_id VARCHAR(20) NOT NULL,
    c_st_id char(4) NOT NULL,
    c_l_name VARCHAR(30) NOT NULL,
    c_f_name VARCHAR(30) NOT NULL,
    c_m_name char(1),
    c_gndr char(1),
    c_tier SMALLINT NOT NULL,
    c_dob TIMESTAMP NOT NULL,
    c_ad_id IDENT_T,
    c_ctry_1 char(3),
    c_area_1 char(3),
    c_local_1 char(10),
    c_ext_1 char(5),
    c_ctry_2 char(3),
    c_area_2 char(3),
    c_local_2 char(10),
    c_ext_2 char(5),
    c_ctry_3 char(3),
    c_area_3 char(3),
    c_local_3 char(10),
    c_ext_3 char(5),
    c_email_1 VARCHAR(50),
    c_email_2 VARCHAR(50))
    ${TS_CUSTOMER};
" || exit 1

# Clause 2.2.5.3
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE customer_account (
    ca_id IDENT_T,
    ca_b_id IDENT_T,
    ca_c_id IDENT_T,
    ca_name VARCHAR(50),
    ca_tax_st SMALLINT NOT NULL,
    ca_bal BALANCE_T)
    ${TS_CUSTOMER_ACCOUNT};
" || exit 1

# Clause 2.2.5.4
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE customer_taxrate (
    cx_tx_id char(4) NOT NULL,
    cx_c_id IDENT_T)
    ${TS_CUSTOMER_TAXRATE};
" || exit 1

# Clause 2.2.5.5
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE holding (
    h_t_id TRADE_T,
    h_ca_id IDENT_T,
    h_s_symb char(15) NOT NULL,
    h_dts TIMESTAMP NOT NULL,
    h_price S_PRICE_T NOT NULL CHECK (h_price > 0),
    h_qty S_QTY_T)
    ${TS_HOLDING};
" || exit 1

# Clause 2.2.5.6
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE holding_history (
    hh_h_t_id TRADE_T,
    hh_t_id TRADE_T,
    hh_before_qty S_QTY_T,
    hh_after_qty S_QTY_T)
    ${TS_HOLDING_HISTORY};
" || exit 1

# Clause 2.2.5.7
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE holding_summary (
    hs_ca_id IDENT_T,
    hs_s_symb char(15) NOT NULL,
    hs_qty S_QTY_T)
    ${TS_HOLDING_SUMMARY};
" || exit 1

# Clause 2.2.5.8
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE watch_item (
    wi_wl_id IDENT_T,
    wi_s_symb char(15) NOT NULL)
    ${TS_WATCH_ITEM};
" || exit 1

# Clause 2.2.5.9
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE watch_list (
    wl_id IDENT_T,
    wl_c_id IDENT_T)
    ${TS_WATCH_LIST};
" || exit 1

# Broker Tables

# Clause 2.2.6.1
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE broker (
    b_id IDENT_T,
    b_st_id char(4) NOT NULL,
    b_name VARCHAR(100) NOT NULL,
    b_num_trades INTEGER NOT NULL,
    b_comm_total BALANCE_T)
    ${TS_BROKER};
" || exit 1

# Clause 2.2.6.2
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE cash_transaction (
    ct_t_id TRADE_T,
    ct_dis TIMESTAMP NOT NULL,
    ct_amt VALUE_T,
    ct_name VARCHAR(100))
    ${TS_CASH_TRANSACTION};
" || exit 1

# Clause 2.2.6.3
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE charge (
    ch_tt_id char(3) NOT NULL,
    ch_c_tier SMALLINT,
    ch_chrg VALUE_T CHECK (ch_chrg > 0))
    ${TS_CHARGE};
" || exit 1

# Clause 2.2.6.4
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE commission_rate (
    cr_c_tier SMALLINT,
    cr_tt_id char(3) NOT NULL,
    cr_ex_id char(6) NOT NULL,
    cr_from_qty S_QTY_T CHECK (cr_from_qty >= 0),
    cr_to_qty S_QTY_T CHECK (cr_to_qty > cr_from_qty),
    cr_rate NUMERIC(5,2) NOT NULL CHECK (cr_rate >= 0))
    ${TS_COMMISSION_RATE};
" || exit 1

# Clause 2.2.6.5
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE settlement (
    se_t_id TRADE_T,
    se_cash_type VARCHAR(40) NOT NULL,
    se_cash_due_date TIMESTAMP NOT NULL,
    se_amt VALUE_T)
    ${TS_SETTLEMENT};
" || exit 1

# Clause 2.2.6.6
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE trade (
    t_id TRADE_T,
    t_dts TIMESTAMP NOT NULL,
    t_st_id char(4) NOT NULL,
    t_tt_id char(3) NOT NULL,
    t_is_cash bool NOT NULL,
    t_s_symb char(15) NOT NULL,
    t_qty S_QTY_T CHECK (t_qty > 0),
    t_bid_price S_PRICE_T NOT NULL CHECK (t_bid_price > 0),
    t_ca_id IDENT_T,
    t_exec_name VARCHAR(64) NOT NULL,
    t_trade_price S_PRICE_T,
    t_chrg VALUE_T CHECK (t_chrg >= 0),
    t_comm VALUE_T CHECK (t_comm >= 0),
    t_tax VALUE_T CHECK (t_tax >= 0),
    t_lifo bool NOT NULL)
    ${TS_TRADE};
" || exit 1

# Clause 2.2.6.7
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE trade_history (
    th_t_id TRADE_T,
    th_dts TIMESTAMP NOT NULL,
    th_st_id char(4) NOT NULL)
    ${TS_TRADE_HISTORY};
" || exit 1

# Clause 2.2.6.8
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE trade_request (
    tr_t_id TRADE_T,
    tr_tt_id char(3) NOT NULL,
    tr_s_symb char(15) NOT NULL,
    tr_qty S_QTY_T CHECK (tr_qty > 0),
    tr_bid_price S_PRICE_T NOT NULL CHECK (tr_bid_price > 0),
    tr_ca_id IDENT_T)
    ${TS_TRADE_REQUEST};
" || exit 1

# Clause 2.2.6.9
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE trade_type (
    tt_id char(3) NOT NULL,
    tt_name char(12) NOT NULL,
    tt_is_sell bool NOT NULL,
    tt_is_mkrt bool NOT NULL)
    ${TS_TRADE_TYPE};
" || exit 1

# Market Tables

# Clause 2.2.7.1
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE company (
    co_id IDENT_T,
    co_st_id char(4) NOT NULL,
    co_name VARCHAR(60) NOT NULL,
    co_in_id char(2) NOT NULL,
    co_sp_rate char(4) NOT NULL,
    co_ceo VARCHAR(100) NOT NULL,
    co_ad_id IDENT_T,
    co_desc VARCHAR(150) NOT NULL,
    co_open_date TIMESTAMP NOT NULL)
    ${TS_COMPANY};
" || exit 1

# Clause 2.2.7.2
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE company_competitor (
    cp_co_id IDENT_T,
    cp_comp_co_id IDENT_T,
    cp_in_id char(2) NOT NULL)
    ${TS_COMPANY_COMPETITOR};
" || exit 1

# Clause 2.2.7.3
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE daily_market (
    dm_date TIMESTAMP NOT NULL,
    dm_s_symb char(15) NOT NULL,
    dm_close S_PRICE_T NOT NULL,
    dm_high S_PRICE_T NOT NULL,
    dm_low S_PRICE_T NOT NULL,
    dm_vol S_COUNT_T)
    ${TS_DAILY_MARKET};
" || exit 1

# Clause 2.2.7.4
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE exchange (
    ex_id char(6) NOT NULL,
    ex_name VARCHAR(100) NOT NULL,
    ex_num_symb INTEGER NOT NULL,
    ex_open SMALLINT NOT NULL,
    ex_close SMALLINT NOT NULL,
    ex_desc VARCHAR(150),
    ex_ad_id IDENT_T)
    ${TS_EXCHANGE};
" || exit 1

# Clause 2.2.7.5
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE financial (
    fi_co_id IDENT_T,
    fi_year SMALLINT NOT NULL,
    fi_qtr SMALLINT,
    fi_qtr_start_date TIMESTAMP NOT NULL,
    fi_revenue FIN_AGG_T,
    fi_net_earn FIN_AGG_T,
    fi_basic_eps VALUE_T,
    fi_dilut_eps VALUE_T,
    fi_margin VALUE_T,
    fi_inventory FIN_AGG_T,
    fi_assets FIN_AGG_T,
    fi_out_basic S_COUNT_T,
    fi_out_dilut S_COUNT_T)
    ${TS_FINANCIAL};
" || exit 1

# Clause 2.2.7.6
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE industry (
    in_id char(2) NOT NULL,
    in_name VARCHAR(50) NOT NULL,
    in_sc_id char(2) NOT NULL)
    ${TS_INDUSTRY};
" || exit 1

# Clause 2.2.7.7
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE last_trade (
    lt_s_symb char(15) NOT NULL,
    lt_dts TIMESTAMP NOT NULL,
    lt_price S_PRICE_T NOT NULL,
    lt_open_price S_PRICE_T NOT NULL,
    lt_vol S_COUNT_T)
    ${TS_LAST_TRADE};
" || exit 1

# Clause 2.2.7.8
# FIXME: The NI_ITEM field may be either LOB(100000) or
#	LOB_Ref, which is a reference to a LOB(100000) object
#	stored outside the table. 
#	I chose to create a reference via an OID data type. 
#	OID provides a reference to the imported large object 
#	stored in pg_largeobject. There are specific functions
#	to load/retrieve objects into/from pg_largeobject

${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE news_item (
    ni_id IDENT_T,
    ni_headline VARCHAR(80) NOT NULL,
    ni_summary VARCHAR(255) NOT NULL,
    ni_item OID NOT NULL,
    ni_dts TIMESTAMP NOT NULL,
    ni_source VARCHAR(30) NOT NULL,
    ni_author VARCHAR(30))
    ${TS_NEWS_ITEM};
" || exit 1

# Clause 2.2.7.9
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE news_xref (
    nx_ni_id IDENT_T,
    nx_co_id IDENT_T)
    ${TS_NEWS_XREF};
" || exit 1

# Clause 2.2.7.10
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE sector (
    sc_id char(2) NOT NULL,
    sc_name VARCHAR(30) NOT NULL)
    ${TS_SECTOR};
" || exit 1

# Clause 2.2.7.11
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE security (
    s_symb char(15) NOT NULL,
    s_issue char(6) NOT NULL,
    s_st_id char(4) NOT NULL,
    s_name VARCHAR(70) NOT NULL,
    s_ex_id char(6) NOT NULL,
    s_co_id IDENT_T,
    s_num_out S_COUNT_T,
    s_start_date TIMESTAMP NOT NULL,
    s_exch_date TIMESTAMP NOT NULL,
    s_pe VALUE_T,
    s_52wk_high S_PRICE_T,
    s_52wk_high_date TIMESTAMP NOT NULL,
    s_52wk_low S_PRICE_T,
    s_52wk_low_date TIMESTAMP NOT NULL,
    s_dividend VALUE_T,
    s_yield NUMERIC(5,2) NOT NULL)
    ${TS_SECURITY};
" || exit 1

# Dimension Tables

# Clause 2.2.8.1
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE address (
    ad_id IDENT_T,
    ad_line1 VARCHAR(80),
    ad_line2 VARCHAR(80),
    ad_zc_code char(12) NOT NULL,
    ad_ctry VARCHAR(80))
    ${TS_ADDRESS};
" || exit 1

# Clause 2.2.8.2
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE status_type (
    st_id char(4) NOT NULL,
    st_name char(10) NOT NULL)
    ${TS_STATUS_TYPE};
" || exit 1

# Clause 2.2.8.3
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE taxrate (
    tx_id char(4) NOT NULL,
    tx_name VARCHAR(50) NOT NULL,
    tx_rate NUMERIC(6,5) NOT NULL CHECK (tx_rate >= 0))
    ${TS_TAXRATE};
" || exit 1

# Clause 2.2.8.4
${PSQL} -e -d ${DBNAME} -c "
CREATE TABLE zip_code (
    zc_code char(12) NOT NULL,
    zc_town VARCHAR(80) NOT NULL,
    zc_div VARCHAR(80) NOT NULL)
    ${TS_ZIP_CODE};
" || exit 1

exit 0