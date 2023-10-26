//
//  BalanceResponseModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/21.
//

import Foundation

struct BalanceResponseModel: Codable {
    let ctxAreaFk100: String?       // 연속조회검색조건100
    let ctxAreaNk100: String?       // 연속조회키100
    let output1: [Output1]?
    let output2: [Output2]?
    let resultCode: String
    let messageCode: String
    let message: String

    enum CodingKeys: String, CodingKey {
        case ctxAreaFk100 = "ctx_area_fk100"
        case ctxAreaNk100 = "ctx_area_nk100"
        case output1, output2
        case resultCode = "rt_cd"
        case messageCode = "msg_cd"
        case message = "msg1"
    }
}

// MARK: - Output1
struct Output1: Codable {
    let pdno: String                // 종목코드
    let prdtName: String            // 종목명
    let tradDvsnName: String        // 매수매도구분
    let bfdyBuyQty: String          // 전일매수수량
    let bfdySllQty: String          // 전일매도수량
    let thdtBuyqty: String          // 금일매수수량
    let thdtSllQty: String          // 금일매도수량
    let hldgQty: String             // 보유수량
    let ordPsblQty: String          // 
    let pchsAvgPric: String
    let pchsAmt: String
    let prpr: String
    let evluAmt: String
    let evluPflsAmt: String
    let evluPflsRt: String
    let evluErngRt: String
    let loanDt: String
    let loanAmt: String
    let stlnSlngChgs: String
    let expdDt: String
    let flttRt: String
    let bfdyCprsIcdc: String
    let itemMgnaRtName: String
    let grtaRtName: String
    let sbstPric: String
    let stckLoanUnpr: String

    enum CodingKeys: String, CodingKey {
        case pdno
        case prdtName = "prdt_name"
        case tradDvsnName = "trad_dvsn_name"
        case bfdyBuyQty = "bfdy_buy_qty"
        case bfdySllQty = "bfdy_sll_qty"
        case thdtBuyqty = "thdt_buyqty"
        case thdtSllQty = "thdt_sll_qty"
        case hldgQty = "hldg_qty"
        case ordPsblQty = "ord_psbl_qty"
        case pchsAvgPric = "pchs_avg_pric"
        case pchsAmt = "pchs_amt"
        case prpr
        case evluAmt = "evlu_amt"
        case evluPflsAmt = "evlu_pfls_amt"
        case evluPflsRt = "evlu_pfls_rt"
        case evluErngRt = "evlu_erng_rt"
        case loanDt = "loan_dt"
        case loanAmt = "loan_amt"
        case stlnSlngChgs = "stln_slng_chgs"
        case expdDt = "expd_dt"
        case flttRt = "fltt_rt"
        case bfdyCprsIcdc = "bfdy_cprs_icdc"
        case itemMgnaRtName = "item_mgna_rt_name"
        case grtaRtName = "grta_rt_name"
        case sbstPric = "sbst_pric"
        case stckLoanUnpr = "stck_loan_unpr"
    }
}

// MARK: - Output2
struct Output2: Codable {
    let dncaTotAmt: String
    let nxdyExccAmt: String
    let prvsRcdlExccAmt: String
    let cmaEvluAmt: String
    let bfdyBuyAmt: String
    let thdtBuyAmt: String
    let nxdyAutoRdptAmt: String
    let bfdySllAmt: String
    let thdtSllAmt: String
    let d2AutoRdptAmt: String
    let bfdyTlexAmt: String
    let thdtTlexAmt: String
    let totLoanAmt: String
    let sctsEvluAmt: String
    let totEvluAmt: String
    let nassAmt: String
    let fncgGldAutoRdptYn: String
    let pchsAmtSmtlAmt: String
    let evluAmtSmtlAmt: String
    let evluPflsSmtlAmt: String
    let totStlnSlngChgs: String
    let bfdyTotAsstEvluAmt: String
    let asstIcdcAmt: String
    let asstIcdcErngRt: String

    enum CodingKeys: String, CodingKey {
        case dncaTotAmt = "dnca_tot_amt"
        case nxdyExccAmt = "nxdy_excc_amt"
        case prvsRcdlExccAmt = "prvs_rcdl_excc_amt"
        case cmaEvluAmt = "cma_evlu_amt"
        case bfdyBuyAmt = "bfdy_buy_amt"
        case thdtBuyAmt = "thdt_buy_amt"
        case nxdyAutoRdptAmt = "nxdy_auto_rdpt_amt"
        case bfdySllAmt = "bfdy_sll_amt"
        case thdtSllAmt = "thdt_sll_amt"
        case d2AutoRdptAmt = "d2_auto_rdpt_amt"
        case bfdyTlexAmt = "bfdy_tlex_amt"
        case thdtTlexAmt = "thdt_tlex_amt"
        case totLoanAmt = "tot_loan_amt"
        case sctsEvluAmt = "scts_evlu_amt"
        case totEvluAmt = "tot_evlu_amt"
        case nassAmt = "nass_amt"
        case fncgGldAutoRdptYn = "fncg_gld_auto_rdpt_yn"
        case pchsAmtSmtlAmt = "pchs_amt_smtl_amt"
        case evluAmtSmtlAmt = "evlu_amt_smtl_amt"
        case evluPflsSmtlAmt = "evlu_pfls_smtl_amt"
        case totStlnSlngChgs = "tot_stln_slng_chgs"
        case bfdyTotAsstEvluAmt = "bfdy_tot_asst_evlu_amt"
        case asstIcdcAmt = "asst_icdc_amt"
        case asstIcdcErngRt = "asst_icdc_erng_rt"
    }
}
