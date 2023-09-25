//
//  Constants.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/25.
//

import Foundation

enum Constants {
    enum Design {
        static var offset: CGFloat = 16.0
        static var buttonHeight: CGFloat = 50.0
    }
    
    enum Mock {
        static var mockErrorMessage: String = """
        21 I'm starting to rewrite an application and I want to use Swift 4 Codable protocol to automatically convert json string to Objects and Structs.Sometimes, specially at the beginning of coding, I encountered decoding problems, so I want to print these errors (whithout using always the debugger), in case some beans are not decoded correctly.
        """
        
        enum ResponseData {
            case balance
            case token
            
            var response: [String: Any] {
                switch self {
                case .balance:
                    let data: [String: Any] = [
                        "ctx_area_fk100": "12345678^01^N^N^02^01^Y^",
                        "ctx_area_nk100": "",
                        "output1": [
                            [
                                "pdno": "088350",
                                "prdt_name": "한화생명",
                                "trad_dvsn_name": "현금",
                                "bfdy_buy_qty": "0",
                                "bfdy_sll_qty": "0",
                                "thdt_buyqty": "0",
                                "thdt_sll_qty": "0",
                                "hldg_qty": "100",
                                "ord_psbl_qty": "100",
                                "pchs_avg_pric": "2835.0000",
                                "pchs_amt": "283500",
                                "prpr": "2995",
                                "evlu_amt": "299500",
                                "evlu_pfls_amt": "16000",
                                "evlu_pfls_rt": "5.64",
                                "evlu_erng_rt": "0.00000000",
                                "loan_dt": "",
                                "loan_amt": "0",
                                "stln_slng_chgs": "0",
                                "expd_dt": "",
                                "fltt_rt": "-1.96399345",
                                "bfdy_cprs_icdc": "-60",
                                "item_mgna_rt_name": "40%",
                                "grta_rt_name": "50%",
                                "sbst_pric": "2320",
                                "stck_loan_unpr": "0.0000"
                            ],
                            [
                                "pdno": "102280",
                                "prdt_name": "쌍방울",
                                "trad_dvsn_name": "현금",
                                "bfdy_buy_qty": "0",
                                "bfdy_sll_qty": "0",
                                "thdt_buyqty": "0",
                                "thdt_sll_qty": "0",
                                "hldg_qty": "11",
                                "ord_psbl_qty": "11",
                                "pchs_avg_pric": "276.9091",
                                "pchs_amt": "3046",
                                "prpr": "269",
                                "evlu_amt": "2959",
                                "evlu_pfls_amt": "-87",
                                "evlu_pfls_rt": "-2.85",
                                "evlu_erng_rt": "0.00000000",
                                "loan_dt": "",
                                "loan_amt": "0",
                                "stln_slng_chgs": "0",
                                "expd_dt": "",
                                "fltt_rt": "0.00000000",
                                "bfdy_cprs_icdc": "0",
                                "item_mgna_rt_name": "100%",
                                "grta_rt_name": "불가",
                                "sbst_pric": "0",
                                "stck_loan_unpr": "0.0000"
                            ],
                            [
                                "pdno": "232830",
                                "prdt_name": "시큐센",
                                "trad_dvsn_name": "현금",
                                "bfdy_buy_qty": "0",
                                "bfdy_sll_qty": "0",
                                "thdt_buyqty": "0",
                                "thdt_sll_qty": "0",
                                "hldg_qty": "1",
                                "ord_psbl_qty": "1",
                                "pchs_avg_pric": "9270.0000",
                                "pchs_amt": "9270",
                                "prpr": "3990",
                                "evlu_amt": "3990",
                                "evlu_pfls_amt": "-5280",
                                "evlu_pfls_rt": "-56.95",
                                "evlu_erng_rt": "0.00000000",
                                "loan_dt": "",
                                "loan_amt": "0",
                                "stln_slng_chgs": "0",
                                "expd_dt": "",
                                "fltt_rt": "-8.27586207",
                                "bfdy_cprs_icdc": "-360",
                                "item_mgna_rt_name": "50%",
                                "grta_rt_name": "불가",
                                "sbst_pric": "3040",
                                "stck_loan_unpr": "0.0000"
                            ],
                            [
                                "pdno": "432430",
                                "prdt_name": "와이랩",
                                "trad_dvsn_name": "현금",
                                "bfdy_buy_qty": "0",
                                "bfdy_sll_qty": "0",
                                "thdt_buyqty": "0",
                                "thdt_sll_qty": "0",
                                "hldg_qty": "11",
                                "ord_psbl_qty": "11",
                                "pchs_avg_pric": "19131.8182",
                                "pchs_amt": "210450",
                                "prpr": "9320",
                                "evlu_amt": "102520",
                                "evlu_pfls_amt": "-107930",
                                "evlu_pfls_rt": "-51.28",
                                "evlu_erng_rt": "0.00000000",
                                "loan_dt": "",
                                "loan_amt": "0",
                                "stln_slng_chgs": "0",
                                "expd_dt": "",
                                "fltt_rt": "-5.76339737",
                                "bfdy_cprs_icdc": "-570",
                                "item_mgna_rt_name": "50%",
                                "grta_rt_name": "불가",
                                "sbst_pric": "6920",
                                "stck_loan_unpr": "0.0000"
                            ]
                        ],
                        "output2": [
                            [
                                "dnca_tot_amt": "105619",
                                "nxdy_excc_amt": "105619",
                                "prvs_rcdl_excc_amt": "105619",
                                "cma_evlu_amt": "0",
                                "bfdy_buy_amt": "0",
                                "thdt_buy_amt": "0",
                                "nxdy_auto_rdpt_amt": "0",
                                "bfdy_sll_amt": "0",
                                "thdt_sll_amt": "0",
                                "d2_auto_rdpt_amt": "0",
                                "bfdy_tlex_amt": "0",
                                "thdt_tlex_amt": "0",
                                "tot_loan_amt": "0",
                                "scts_evlu_amt": "408969",
                                "tot_evlu_amt": "514588",
                                "nass_amt": "514588",
                                "fncg_gld_auto_rdpt_yn": "",
                                "pchs_amt_smtl_amt": "506266",
                                "evlu_amt_smtl_amt": "408969",
                                "evlu_pfls_smtl_amt": "-97297",
                                "tot_stln_slng_chgs": "0",
                                "bfdy_tot_asst_evlu_amt": "527219",
                                "asst_icdc_amt": "-12631",
                                "asst_icdc_erng_rt": "0.00000000"
                            ]
                        ],
                        "rt_cd": "0",
                        "msg_cd": "KIOK0510",
                        "msg1": "조회가 완료되었습니다"
                    ]
                    
                    return data
                case .token:
                    let data: [String: Any] = [
                    "access_token": "9.U2MTIxNjMsImp0aSI6IlBTd25IWG8zb1czcXZVNmpCNlRoclVEUFIwSzB0Y0doMHY1aiJ9.Qtw9OIp2BWHlR4binY5u8SGyTuti_ahGKxsrIoB91ya9e78dIIRBrFa6Mo8iIHJnmPLXG8x007-1Yx8h9D9aVQ0MiIsImlzcyI6eyJzdWIiOiJ0b2tlbiIsImF1ZCI6ImUxNDJmMjYzLTE2NTYtNGIzMS1hMmYyLTllYzllZTk1YTQTYzLCJpYeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJXQiOjE2OTInVub2d3IiwiZXhwIjoxNjk1Njk4N",
                        "access_token_token_expired": "2023-09-26 12:22:43",
                        "token_type": "Bearer",
                        "expires_in": 86400
                    ]
                    
                    return data
                }
            }
        }
    }
}
