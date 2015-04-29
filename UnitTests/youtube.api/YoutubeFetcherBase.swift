//
//  YoutubeFetcherTests.swift
//  AsYoutubeiPadSwiftClient
//
//  Created by djzhang on 3/26/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//


import XCTest


class YoutubeFetcherBase: XCTestCase {

    var requestInfo = YTYoutubeRequestInfo()
    var isSucess = false

    let videoID: NSString = "eoXneK3WIgQ"

    //  "channelTitle": "Adobe Acrobat"
    let playlistID: NSString = "UUl78QGX_hfK6zT8Mc-2w8GA"

    let channelIDs: NSString = "UCbn1OgGei-DV7aSRo_HaAiw,UCl78QGX_hfK6zT8Mc-2w8GA,UCl-radPCbXcrYCE4EdNH3QA"

    let subscribedChannelIds: NSString = "UCRFpCoHKbB6Zpexqso_Moqw,UCejjF--PW1v2IyEo1A6US0A,UC5K94YJq3ORkb3CWKrdB8rw,UCGp4UBwpTNegd_4nCpuBcow,UCnhNprbImkzTkVCxWe5QhKw,UC_x5XG1OV2P6uZZ5FSM9Ttw,UCl78QGX_hfK6zT8Mc-2w8GA,UCU8W5R6NAX0LMa-0qR3Tzhg,UCEJi23qnygQHE5UeLXoV_JQ,UCyU5wkjgQYGRB0hIHMwm2Sg,UCP_lo1MFyx5IXDeD9s_6nUw,UCl-radPCbXcrYCE4EdNH3QA,UCsJXkw_Ssp-1myJFm4_SMJA,UCnAsiniI4DF7vAAe7omWWFQ,UCwRQxHVCyShQyky_HzHdZEQ,UCM2z6CHM4wvmlB9qo_dq0dg,UC5ldarXk6Sao3jcFC02QMuw,UCb--64Gl51jIEVE-GLDAVTg,UC9eJ0QMxVANECYICsnM1yzA,UCb4eIVujwUhasgDr4YO0vyg,UCbn1OgGei-DV7aSRo_HaAiw,UCG_GmMOXaG0yTRrXX4j9RmA,UCtVd0c0tGXuTSbU5d8cSBUg,UCikzJG7RbnNZhKLqqaXRM6A,UCT0OddH-0Avs8FI-TH1FQXw,UCSdp5logiFTM3SyLJrHabOQ,UCye_Qari3Sy69GgoDHb90Aw,UC28kJmX6wIbD5BxvosP5ziQ,UCkg_xpBf5gMSnBZx8uRG-yg,UCibKclzsnnHjQZFOLuykZ1A,UCcVnq0_u0RRIFUIndbS3rng,UCIPArH-WymgiRdfArDk9ctA,UC_SYgfi5FnND6MjPC0S7OdQ,UCV3em5aIfhpe-UmqTZ6jDiA,UCbNUIMpd09tVD88i03igNng,UCKvDySsrOVgUgRLhWHeyHJA,UCyuKHB47IX1kSefEIjSGFhg,UCMkYd9teJEBlCOwDan6qPpg,UCJDbxi-geHp0QZjpczniN2Q,UCm9iiIfgmVODUJxINecHQkA,UCTP1DN8Us94z0ciuCx71scg,UCd-EhXGbXSozuzsAAdPIn3A,UC69XtVGLRydpG7o1nkdQs8Q,UCLLxyaKSNav9f9Vqvp99npQ,UCLiify2gtHRSXRYuJe3AvGw,UC1-bpWFX44G2uWkszFm5MEA,UCVyRiMvfUNMA1UPlDPzG5Ow,UCwQNs_Ev0yd5LfhjqqOK8mg,UCKW92i7iQFuNILqQOUOCrFw,UCwJTdt4ypL4A7KADzk91H0w,UC67ZYW49GiiDkOk_yIDRroQ,UCX4c8SFh4rhhQ-VMj1tl4Tg,UCx19n_wOCj4Z2U63M_RpY2Q,UCoMZKJA1PcpE3vqULWuXHIQ,UC9BqPtCcSyHvQsbl2rumM4w,UCZ2YmU9IkNVbeCCcBmX6oyQ,UCztYOVbRsB-G0UlZGlvQ4oA,UCvKDmhl2_lOFUKSloRcHA4A,UC2D6eRvCeMtcF5OGHf1-trw,UCXOThDQobPsnQjnfUPTF-Jg,UCVHFbqXqoYvEWM1Ddxl0QDg,UCfoEqIFtqfc6xBV185DQnBw,UCgFckrt4POt3Qd0-BeJonjg,UCppqA-uJ4duBJymLy8vyEDQ,UCSgwg6C__wjdnVPXJO6Ur4Q,UC6wo5vqSkXaJwlUOzyIOKvw,UCndfHdRdEiGOyCOgxQ4W9YQ,UCWXkTYk-_IbQwlJkc8yWUPQ,UCPX7ftyfJa-yXcMyb6njcHw,UC083mi1sPEKkXB6ye7VaRPg,UCf6n7nW4ICGj2CJ5cMbwiFA,UCmq4oh96OepSJRZ0WzZVATw,UCu-kNSMm0A8Ud4r5DFGBE4Q,UCr5IFrOf8-JH0JAP_fdhH7Q,UCXLYl0USKh4nc1yRisHnYmg,UC9ObAKKcpFeHcYiNtnSqbMg,UCBR0r3k50_tOuyM4ZIBRYmA,UCE0YGYQNEykYMvVc-VCwBcQ,UCBoe6rTht6aZda7RxVAU2yQ,UCt94ujZsxao2u32D289Y09A,UCSYL65MlNgFmKdn3K0NnH6Q,UCwOuQWY2KUH6XF8kePZPZwg,UCfHC2zM2Rr4YrZiFEIAr--A,UCPunCM8qcgCfGhF_EGte-bg,UC4EY_qnSeAP1xGsh61eOoJA,UCGXVljCdA4UEFW_aVkmHziA,UCToOzXoT-O4SVUNTkK4b7kg,UCdTDZ4RUT9Jl81oRhpEIIxA,UCWgK4JfQYO4KhwzjH8pYVlA,UCRpabzqVLT7hZ-Mi2Cp6vzg,UCgMerRfodGE4K2W6KN13y-Q,UC64eec0UYHxflyEWgyZOvLA,UClFMniGLo1ysEIrUQShlK3A,UCbHYKKkgccgeeI3sA5IJORA,UCL8qiCnNguyKd9JAaaX-7cA,UCDxee3uk4Bfra-JgN94RSmA,UCU1XozSx35hUCqhpIbuzX7g,UCHip-wiEtSSRtJtA2OoChOA,UCOxFrKa0ap-tHPiknUkcy9g,UCQqCU9HtbaWyWIXKoro8Fqg,UCiEdtpSMX-pfg9GudQziIUg,UCiPzmz_UyRqQE0Tboc7n66g,UCroqCIkkP2CsR5cSAd6b8bw,UC1bnQlnh96ALRWe7BStytOQ,UCUSiHHXLjaIqjYMGpnCXaOg,UCA93yYk-_s4fUntaU6k4Uog,UCtlToP2mqz6MEjPkMOzqoLQ,UCRsg5-lbTFFrSvt1ODbch0w,UCq8rOh_bJXwMeX66WqIzx6A,UCZoPwmGr1vwElo2TGOZsd_A,UCu-Xs2rwag1q6GnW7zDqQpg,UCsxfydgmLe4BntBRYjCGOJg,UCUrdUfgOAWGq47Yj64zDTNA,UCrOC_l2MzKEsSr2mPx4xwJg,UCpgFSIrateR_KlyeGtCRSqw,UCK6TzBHhEUCKa6dgjlsVHEw,UCBVu6da-fTp-VWY9HYv5NCA,UCpOIUW62tnJTtpWFABxWZ8g,UCKUigv_O0fMkCxpP30uPR5A,UCG2ImUAmyXVqrsCoGRG7kng,UCrbkHP3jxMJyL2CuU8B_YDQ,UCt-oC8Pwq0gF-KvbETN-hVA,UCgJv2CO6YZmZzYMQZwGemiQ,UCXjedf6L9VUvBsQQktIn7Aw,UCb884L6sGWvdaAezfqKZ7FQ,UCjAQea4v_RzWqqGflM0JtWw,UCVRqNQqSq39p1dlZTRiqLOw,UChW16s4OMiBupYH-jkX0SJg,UCJqcPB8PTxbSm4K5u5qwA6A,UCQYHIh_MC7gKfGIBiAvjQjQ,UCLwj2bUm7BLsxE8OCkGwnTQ,UCaX9XGZHHh-D3xSqExT0F5Q,UCypt27zYiK8pq_A0G5xxaxA,UCUpS8tVQbWTOQ85ytd_B4Zg,UCYvlBEeEEoJE8uP7WWzPmnA,UCuvC6NkvrXkBfXaqDJ6-8pw,UChk5eyAGuO3J4rV-CiMNkNQ,UCqKRlX8Pi6xg-lAAzkt3wfA,UCA2V5-_ea_SL4gofMNAbgKg,UCAmlRsXWTHdLC7ui7CPxVjQ,UCkdFkUqDuNwAkqkryg8e_-g,UC7NyBKOKI6vdFDHYzDHlteg,UC4BUz_oL5TzXVe-BVtU_j9g,UCM1H5JZtwv66ZMD0bfiehIw,UCfctRLXLbhoTIevEVrpsdIQ,UCz3cM4qLljXcQ8oWjMPgKZA,UCszK7ks5LS_vTglbbZAfy1g,UCthV50MozQIfawL9a_g5rdg,UCcxE8FdqZlHR8nUTJfg2g4A,UCJVWcgW_3zq_gxX61VP-0kg,UCXvgeth8scT-nVQA2SfLxJg,UCC36CM_uLqhoKEqSy2mjqFQ,UCAHVgG4R3JBzO9fUDvQ0M7g,UCWp3Yrya05q7xbhD8wVccFw"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        requestInfo = YTYoutubeRequestInfo()
        isSucess = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
