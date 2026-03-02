module attributes {pyc.top = @fastfwd_v3_2, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3_2(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3_2", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_2__L33"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v3_2__L34"} : i2
  %v13 = pyc.wire {pyc.name = "cycle_cnt__next"} : i16
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i16
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i16
  %v17 = pyc.alias %v16 {pyc.name = "cycle_cnt"} : i16
  %v18 = pyc.alias %v17 {pyc.name = "cycle_cnt__fastfwd_v3_2__L35"} : i16
  %v19 = pyc.constant 1 : i16
  %v20 = pyc.add %v18, %v19 : i16
  pyc.assign %v13, %v20 : i16
  %v21 = pyc.alias %v18 {pyc.name = "current_cycle__fastfwd_v3_2__L37"} : i16
  %v22 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_2__L40"} : i16
  %v23 = pyc.alias %lane0_pkt_in_vld {pyc.name = "offset_1__fastfwd_v3_2__L42"} : i1
  %v24 = pyc.add %v23, %lane1_pkt_in_vld : i1
  %v25 = pyc.alias %v24 {pyc.name = "offset_2__fastfwd_v3_2__L43"} : i1
  %v26 = pyc.add %v25, %lane2_pkt_in_vld : i1
  %v27 = pyc.alias %v26 {pyc.name = "offset_3__fastfwd_v3_2__L44"} : i1
  %v28 = pyc.wire {pyc.name = "ic_vld0__next"} : i1
  %v29 = pyc.constant 1 : i1
  %v30 = pyc.constant 0 : i1
  %v31 = pyc.reg %clk, %rst, %v29, %v28, %v30 : i1
  %v32 = pyc.alias %v31 {pyc.name = "ic_vld0"} : i1
  %v33 = pyc.wire {pyc.name = "ic_vld1__next"} : i1
  %v34 = pyc.constant 1 : i1
  %v35 = pyc.constant 0 : i1
  %v36 = pyc.reg %clk, %rst, %v34, %v33, %v35 : i1
  %v37 = pyc.alias %v36 {pyc.name = "ic_vld1"} : i1
  %v38 = pyc.wire {pyc.name = "ic_vld2__next"} : i1
  %v39 = pyc.constant 1 : i1
  %v40 = pyc.constant 0 : i1
  %v41 = pyc.reg %clk, %rst, %v39, %v38, %v40 : i1
  %v42 = pyc.alias %v41 {pyc.name = "ic_vld2"} : i1
  %v43 = pyc.wire {pyc.name = "ic_vld3__next"} : i1
  %v44 = pyc.constant 1 : i1
  %v45 = pyc.constant 0 : i1
  %v46 = pyc.reg %clk, %rst, %v44, %v43, %v45 : i1
  %v47 = pyc.alias %v46 {pyc.name = "ic_vld3"} : i1
  %v48 = pyc.wire {pyc.name = "ic_data0__next"} : i128
  %v49 = pyc.constant 1 : i1
  %v50 = pyc.constant 0 : i128
  %v51 = pyc.reg %clk, %rst, %v49, %v48, %v50 : i128
  %v52 = pyc.alias %v51 {pyc.name = "ic_data0"} : i128
  %v53 = pyc.wire {pyc.name = "ic_data1__next"} : i128
  %v54 = pyc.constant 1 : i1
  %v55 = pyc.constant 0 : i128
  %v56 = pyc.reg %clk, %rst, %v54, %v53, %v55 : i128
  %v57 = pyc.alias %v56 {pyc.name = "ic_data1"} : i128
  %v58 = pyc.wire {pyc.name = "ic_data2__next"} : i128
  %v59 = pyc.constant 1 : i1
  %v60 = pyc.constant 0 : i128
  %v61 = pyc.reg %clk, %rst, %v59, %v58, %v60 : i128
  %v62 = pyc.alias %v61 {pyc.name = "ic_data2"} : i128
  %v63 = pyc.wire {pyc.name = "ic_data3__next"} : i128
  %v64 = pyc.constant 1 : i1
  %v65 = pyc.constant 0 : i128
  %v66 = pyc.reg %clk, %rst, %v64, %v63, %v65 : i128
  %v67 = pyc.alias %v66 {pyc.name = "ic_data3"} : i128
  %v68 = pyc.wire {pyc.name = "ic_ctrl0__next"} : i5
  %v69 = pyc.constant 1 : i1
  %v70 = pyc.constant 0 : i5
  %v71 = pyc.reg %clk, %rst, %v69, %v68, %v70 : i5
  %v72 = pyc.alias %v71 {pyc.name = "ic_ctrl0"} : i5
  %v73 = pyc.wire {pyc.name = "ic_ctrl1__next"} : i5
  %v74 = pyc.constant 1 : i1
  %v75 = pyc.constant 0 : i5
  %v76 = pyc.reg %clk, %rst, %v74, %v73, %v75 : i5
  %v77 = pyc.alias %v76 {pyc.name = "ic_ctrl1"} : i5
  %v78 = pyc.wire {pyc.name = "ic_ctrl2__next"} : i5
  %v79 = pyc.constant 1 : i1
  %v80 = pyc.constant 0 : i5
  %v81 = pyc.reg %clk, %rst, %v79, %v78, %v80 : i5
  %v82 = pyc.alias %v81 {pyc.name = "ic_ctrl2"} : i5
  %v83 = pyc.wire {pyc.name = "ic_ctrl3__next"} : i5
  %v84 = pyc.constant 1 : i1
  %v85 = pyc.constant 0 : i5
  %v86 = pyc.reg %clk, %rst, %v84, %v83, %v85 : i5
  %v87 = pyc.alias %v86 {pyc.name = "ic_ctrl3"} : i5
  %v88 = pyc.wire {pyc.name = "ic_seq0__next"} : i16
  %v89 = pyc.constant 1 : i1
  %v90 = pyc.constant 0 : i16
  %v91 = pyc.reg %clk, %rst, %v89, %v88, %v90 : i16
  %v92 = pyc.alias %v91 {pyc.name = "ic_seq0"} : i16
  %v93 = pyc.wire {pyc.name = "ic_seq1__next"} : i16
  %v94 = pyc.constant 1 : i1
  %v95 = pyc.constant 0 : i16
  %v96 = pyc.reg %clk, %rst, %v94, %v93, %v95 : i16
  %v97 = pyc.alias %v96 {pyc.name = "ic_seq1"} : i16
  %v98 = pyc.wire {pyc.name = "ic_seq2__next"} : i16
  %v99 = pyc.constant 1 : i1
  %v100 = pyc.constant 0 : i16
  %v101 = pyc.reg %clk, %rst, %v99, %v98, %v100 : i16
  %v102 = pyc.alias %v101 {pyc.name = "ic_seq2"} : i16
  %v103 = pyc.wire {pyc.name = "ic_seq3__next"} : i16
  %v104 = pyc.constant 1 : i1
  %v105 = pyc.constant 0 : i16
  %v106 = pyc.reg %clk, %rst, %v104, %v103, %v105 : i16
  %v107 = pyc.alias %v106 {pyc.name = "ic_seq3"} : i16
  pyc.assign %v28, %lane0_pkt_in_vld : i1
  pyc.assign %v48, %lane0_pkt_in_data : i128
  pyc.assign %v68, %lane0_pkt_in_ctrl : i5
  %v108 = pyc.constant 0 : i16
  %v109 = pyc.add %v22, %v108 : i16
  pyc.assign %v88, %v109 : i16
  pyc.assign %v33, %lane1_pkt_in_vld : i1
  pyc.assign %v53, %lane1_pkt_in_data : i128
  pyc.assign %v73, %lane1_pkt_in_ctrl : i5
  %v110 = pyc.zext %v23 : i1 -> i16
  %v111 = pyc.add %v22, %v110 : i16
  pyc.assign %v93, %v111 : i16
  pyc.assign %v38, %lane2_pkt_in_vld : i1
  pyc.assign %v58, %lane2_pkt_in_data : i128
  pyc.assign %v78, %lane2_pkt_in_ctrl : i5
  %v112 = pyc.zext %v25 : i1 -> i16
  %v113 = pyc.add %v22, %v112 : i16
  pyc.assign %v98, %v113 : i16
  pyc.assign %v43, %lane3_pkt_in_vld : i1
  pyc.assign %v63, %lane3_pkt_in_data : i128
  pyc.assign %v83, %lane3_pkt_in_ctrl : i5
  %v114 = pyc.zext %v27 : i1 -> i16
  %v115 = pyc.add %v22, %v114 : i16
  pyc.assign %v103, %v115 : i16
  %v116 = pyc.constant 0 : i1
  %v117 = pyc.add %lane0_pkt_in_vld, %v116 : i1
  %v118 = pyc.add %v117, %lane1_pkt_in_vld : i1
  %v119 = pyc.add %v118, %lane2_pkt_in_vld : i1
  %v120 = pyc.add %v119, %lane3_pkt_in_vld : i1
  %v121 = pyc.alias %v120 {pyc.name = "total_input__fastfwd_v3_2__L58"} : i1
  %v122 = pyc.zext %v121 : i1 -> i16
  %v123 = pyc.add %v22, %v122 : i16
  pyc.assign %v1, %v123 : i16
  %v124 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v125 = pyc.constant 1 : i1
  %v126 = pyc.constant 0 : i1
  %v127 = pyc.reg %clk, %rst, %v125, %v124, %v126 : i1
  %v128 = pyc.alias %v127 {pyc.name = "fe0_busy"} : i1
  %v129 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v130 = pyc.constant 1 : i1
  %v131 = pyc.constant 0 : i1
  %v132 = pyc.reg %clk, %rst, %v130, %v129, %v131 : i1
  %v133 = pyc.alias %v132 {pyc.name = "fe1_busy"} : i1
  %v134 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v135 = pyc.constant 1 : i1
  %v136 = pyc.constant 0 : i1
  %v137 = pyc.reg %clk, %rst, %v135, %v134, %v136 : i1
  %v138 = pyc.alias %v137 {pyc.name = "fe2_busy"} : i1
  %v139 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v140 = pyc.constant 1 : i1
  %v141 = pyc.constant 0 : i1
  %v142 = pyc.reg %clk, %rst, %v140, %v139, %v141 : i1
  %v143 = pyc.alias %v142 {pyc.name = "fe3_busy"} : i1
  %v144 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v145 = pyc.constant 1 : i1
  %v146 = pyc.constant 0 : i3
  %v147 = pyc.reg %clk, %rst, %v145, %v144, %v146 : i3
  %v148 = pyc.alias %v147 {pyc.name = "fe0_timer"} : i3
  %v149 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v150 = pyc.constant 1 : i1
  %v151 = pyc.constant 0 : i3
  %v152 = pyc.reg %clk, %rst, %v150, %v149, %v151 : i3
  %v153 = pyc.alias %v152 {pyc.name = "fe1_timer"} : i3
  %v154 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v155 = pyc.constant 1 : i1
  %v156 = pyc.constant 0 : i3
  %v157 = pyc.reg %clk, %rst, %v155, %v154, %v156 : i3
  %v158 = pyc.alias %v157 {pyc.name = "fe2_timer"} : i3
  %v159 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v160 = pyc.constant 1 : i1
  %v161 = pyc.constant 0 : i3
  %v162 = pyc.reg %clk, %rst, %v160, %v159, %v161 : i3
  %v163 = pyc.alias %v162 {pyc.name = "fe3_timer"} : i3
  %v164 = pyc.wire {pyc.name = "fe0_last_finish__next"} : i6
  %v165 = pyc.constant 1 : i1
  %v166 = pyc.constant 0 : i6
  %v167 = pyc.reg %clk, %rst, %v165, %v164, %v166 : i6
  %v168 = pyc.alias %v167 {pyc.name = "fe0_last_finish"} : i6
  %v169 = pyc.wire {pyc.name = "fe1_last_finish__next"} : i6
  %v170 = pyc.constant 1 : i1
  %v171 = pyc.constant 0 : i6
  %v172 = pyc.reg %clk, %rst, %v170, %v169, %v171 : i6
  %v173 = pyc.alias %v172 {pyc.name = "fe1_last_finish"} : i6
  %v174 = pyc.wire {pyc.name = "fe2_last_finish__next"} : i6
  %v175 = pyc.constant 1 : i1
  %v176 = pyc.constant 0 : i6
  %v177 = pyc.reg %clk, %rst, %v175, %v174, %v176 : i6
  %v178 = pyc.alias %v177 {pyc.name = "fe2_last_finish"} : i6
  %v179 = pyc.wire {pyc.name = "fe3_last_finish__next"} : i6
  %v180 = pyc.constant 1 : i1
  %v181 = pyc.constant 0 : i6
  %v182 = pyc.reg %clk, %rst, %v180, %v179, %v181 : i6
  %v183 = pyc.alias %v182 {pyc.name = "fe3_last_finish"} : i6
  %v184 = pyc.wire {pyc.name = "fe0_pkt_seq__next"} : i16
  %v185 = pyc.constant 1 : i1
  %v186 = pyc.constant 0 : i16
  %v187 = pyc.reg %clk, %rst, %v185, %v184, %v186 : i16
  %v188 = pyc.alias %v187 {pyc.name = "fe0_pkt_seq"} : i16
  %v189 = pyc.wire {pyc.name = "fe1_pkt_seq__next"} : i16
  %v190 = pyc.constant 1 : i1
  %v191 = pyc.constant 0 : i16
  %v192 = pyc.reg %clk, %rst, %v190, %v189, %v191 : i16
  %v193 = pyc.alias %v192 {pyc.name = "fe1_pkt_seq"} : i16
  %v194 = pyc.wire {pyc.name = "fe2_pkt_seq__next"} : i16
  %v195 = pyc.constant 1 : i1
  %v196 = pyc.constant 0 : i16
  %v197 = pyc.reg %clk, %rst, %v195, %v194, %v196 : i16
  %v198 = pyc.alias %v197 {pyc.name = "fe2_pkt_seq"} : i16
  %v199 = pyc.wire {pyc.name = "fe3_pkt_seq__next"} : i16
  %v200 = pyc.constant 1 : i1
  %v201 = pyc.constant 0 : i16
  %v202 = pyc.reg %clk, %rst, %v200, %v199, %v201 : i16
  %v203 = pyc.alias %v202 {pyc.name = "fe3_pkt_seq"} : i16
  %v204 = pyc.wire {pyc.name = "fwd0_pkt_data_vld__next"} : i1
  %v205 = pyc.constant 1 : i1
  %v206 = pyc.constant 0 : i1
  %v207 = pyc.reg %clk, %rst, %v205, %v204, %v206 : i1
  %v208 = pyc.alias %v207 {pyc.name = "fwd0_pkt_data_vld"} : i1
  %v209 = pyc.wire {pyc.name = "fwd1_pkt_data_vld__next"} : i1
  %v210 = pyc.constant 1 : i1
  %v211 = pyc.constant 0 : i1
  %v212 = pyc.reg %clk, %rst, %v210, %v209, %v211 : i1
  %v213 = pyc.alias %v212 {pyc.name = "fwd1_pkt_data_vld"} : i1
  %v214 = pyc.wire {pyc.name = "fwd2_pkt_data_vld__next"} : i1
  %v215 = pyc.constant 1 : i1
  %v216 = pyc.constant 0 : i1
  %v217 = pyc.reg %clk, %rst, %v215, %v214, %v216 : i1
  %v218 = pyc.alias %v217 {pyc.name = "fwd2_pkt_data_vld"} : i1
  %v219 = pyc.wire {pyc.name = "fwd3_pkt_data_vld__next"} : i1
  %v220 = pyc.constant 1 : i1
  %v221 = pyc.constant 0 : i1
  %v222 = pyc.reg %clk, %rst, %v220, %v219, %v221 : i1
  %v223 = pyc.alias %v222 {pyc.name = "fwd3_pkt_data_vld"} : i1
  %v224 = pyc.wire {pyc.name = "fwd0_pkt_data__next"} : i128
  %v225 = pyc.constant 1 : i1
  %v226 = pyc.constant 0 : i128
  %v227 = pyc.reg %clk, %rst, %v225, %v224, %v226 : i128
  %v228 = pyc.alias %v227 {pyc.name = "fwd0_pkt_data"} : i128
  %v229 = pyc.wire {pyc.name = "fwd1_pkt_data__next"} : i128
  %v230 = pyc.constant 1 : i1
  %v231 = pyc.constant 0 : i128
  %v232 = pyc.reg %clk, %rst, %v230, %v229, %v231 : i128
  %v233 = pyc.alias %v232 {pyc.name = "fwd1_pkt_data"} : i128
  %v234 = pyc.wire {pyc.name = "fwd2_pkt_data__next"} : i128
  %v235 = pyc.constant 1 : i1
  %v236 = pyc.constant 0 : i128
  %v237 = pyc.reg %clk, %rst, %v235, %v234, %v236 : i128
  %v238 = pyc.alias %v237 {pyc.name = "fwd2_pkt_data"} : i128
  %v239 = pyc.wire {pyc.name = "fwd3_pkt_data__next"} : i128
  %v240 = pyc.constant 1 : i1
  %v241 = pyc.constant 0 : i128
  %v242 = pyc.reg %clk, %rst, %v240, %v239, %v241 : i128
  %v243 = pyc.alias %v242 {pyc.name = "fwd3_pkt_data"} : i128
  %v244 = pyc.wire {pyc.name = "fwd0_pkt_lat__next"} : i2
  %v245 = pyc.constant 1 : i1
  %v246 = pyc.constant 0 : i2
  %v247 = pyc.reg %clk, %rst, %v245, %v244, %v246 : i2
  %v248 = pyc.alias %v247 {pyc.name = "fwd0_pkt_lat"} : i2
  %v249 = pyc.wire {pyc.name = "fwd1_pkt_lat__next"} : i2
  %v250 = pyc.constant 1 : i1
  %v251 = pyc.constant 0 : i2
  %v252 = pyc.reg %clk, %rst, %v250, %v249, %v251 : i2
  %v253 = pyc.alias %v252 {pyc.name = "fwd1_pkt_lat"} : i2
  %v254 = pyc.wire {pyc.name = "fwd2_pkt_lat__next"} : i2
  %v255 = pyc.constant 1 : i1
  %v256 = pyc.constant 0 : i2
  %v257 = pyc.reg %clk, %rst, %v255, %v254, %v256 : i2
  %v258 = pyc.alias %v257 {pyc.name = "fwd2_pkt_lat"} : i2
  %v259 = pyc.wire {pyc.name = "fwd3_pkt_lat__next"} : i2
  %v260 = pyc.constant 1 : i1
  %v261 = pyc.constant 0 : i2
  %v262 = pyc.reg %clk, %rst, %v260, %v259, %v261 : i2
  %v263 = pyc.alias %v262 {pyc.name = "fwd3_pkt_lat"} : i2
  %v264 = pyc.wire {pyc.name = "fwd0_pkt_dp_vld__next"} : i1
  %v265 = pyc.constant 1 : i1
  %v266 = pyc.constant 0 : i1
  %v267 = pyc.reg %clk, %rst, %v265, %v264, %v266 : i1
  %v268 = pyc.alias %v267 {pyc.name = "fwd0_pkt_dp_vld"} : i1
  %v269 = pyc.wire {pyc.name = "fwd1_pkt_dp_vld__next"} : i1
  %v270 = pyc.constant 1 : i1
  %v271 = pyc.constant 0 : i1
  %v272 = pyc.reg %clk, %rst, %v270, %v269, %v271 : i1
  %v273 = pyc.alias %v272 {pyc.name = "fwd1_pkt_dp_vld"} : i1
  %v274 = pyc.wire {pyc.name = "fwd2_pkt_dp_vld__next"} : i1
  %v275 = pyc.constant 1 : i1
  %v276 = pyc.constant 0 : i1
  %v277 = pyc.reg %clk, %rst, %v275, %v274, %v276 : i1
  %v278 = pyc.alias %v277 {pyc.name = "fwd2_pkt_dp_vld"} : i1
  %v279 = pyc.wire {pyc.name = "fwd3_pkt_dp_vld__next"} : i1
  %v280 = pyc.constant 1 : i1
  %v281 = pyc.constant 0 : i1
  %v282 = pyc.reg %clk, %rst, %v280, %v279, %v281 : i1
  %v283 = pyc.alias %v282 {pyc.name = "fwd3_pkt_dp_vld"} : i1
  %v284 = pyc.wire {pyc.name = "fwd0_pkt_dp_data__next"} : i128
  %v285 = pyc.constant 1 : i1
  %v286 = pyc.constant 0 : i128
  %v287 = pyc.reg %clk, %rst, %v285, %v284, %v286 : i128
  %v288 = pyc.alias %v287 {pyc.name = "fwd0_pkt_dp_data"} : i128
  %v289 = pyc.wire {pyc.name = "fwd1_pkt_dp_data__next"} : i128
  %v290 = pyc.constant 1 : i1
  %v291 = pyc.constant 0 : i128
  %v292 = pyc.reg %clk, %rst, %v290, %v289, %v291 : i128
  %v293 = pyc.alias %v292 {pyc.name = "fwd1_pkt_dp_data"} : i128
  %v294 = pyc.wire {pyc.name = "fwd2_pkt_dp_data__next"} : i128
  %v295 = pyc.constant 1 : i1
  %v296 = pyc.constant 0 : i128
  %v297 = pyc.reg %clk, %rst, %v295, %v294, %v296 : i128
  %v298 = pyc.alias %v297 {pyc.name = "fwd2_pkt_dp_data"} : i128
  %v299 = pyc.wire {pyc.name = "fwd3_pkt_dp_data__next"} : i128
  %v300 = pyc.constant 1 : i1
  %v301 = pyc.constant 0 : i128
  %v302 = pyc.reg %clk, %rst, %v300, %v299, %v301 : i128
  %v303 = pyc.alias %v302 {pyc.name = "fwd3_pkt_dp_data"} : i128
  %v304 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v305 = pyc.constant 1 : i1
  %v306 = pyc.constant 0 : i1
  %v307 = pyc.reg %clk, %rst, %v305, %v304, %v306 : i1
  %v308 = pyc.alias %v307 {pyc.name = "dep0_valid"} : i1
  %v309 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v310 = pyc.constant 1 : i1
  %v311 = pyc.constant 0 : i1
  %v312 = pyc.reg %clk, %rst, %v310, %v309, %v311 : i1
  %v313 = pyc.alias %v312 {pyc.name = "dep1_valid"} : i1
  %v314 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v315 = pyc.constant 1 : i1
  %v316 = pyc.constant 0 : i1
  %v317 = pyc.reg %clk, %rst, %v315, %v314, %v316 : i1
  %v318 = pyc.alias %v317 {pyc.name = "dep2_valid"} : i1
  %v319 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v320 = pyc.constant 1 : i1
  %v321 = pyc.constant 0 : i1
  %v322 = pyc.reg %clk, %rst, %v320, %v319, %v321 : i1
  %v323 = pyc.alias %v322 {pyc.name = "dep3_valid"} : i1
  %v324 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v325 = pyc.constant 1 : i1
  %v326 = pyc.constant 0 : i1
  %v327 = pyc.reg %clk, %rst, %v325, %v324, %v326 : i1
  %v328 = pyc.alias %v327 {pyc.name = "dep4_valid"} : i1
  %v329 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v330 = pyc.constant 1 : i1
  %v331 = pyc.constant 0 : i1
  %v332 = pyc.reg %clk, %rst, %v330, %v329, %v331 : i1
  %v333 = pyc.alias %v332 {pyc.name = "dep5_valid"} : i1
  %v334 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v335 = pyc.constant 1 : i1
  %v336 = pyc.constant 0 : i1
  %v337 = pyc.reg %clk, %rst, %v335, %v334, %v336 : i1
  %v338 = pyc.alias %v337 {pyc.name = "dep6_valid"} : i1
  %v339 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v340 = pyc.constant 1 : i1
  %v341 = pyc.constant 0 : i1
  %v342 = pyc.reg %clk, %rst, %v340, %v339, %v341 : i1
  %v343 = pyc.alias %v342 {pyc.name = "dep7_valid"} : i1
  %v344 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v345 = pyc.constant 1 : i1
  %v346 = pyc.constant 0 : i128
  %v347 = pyc.reg %clk, %rst, %v345, %v344, %v346 : i128
  %v348 = pyc.alias %v347 {pyc.name = "dep0_data"} : i128
  %v349 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v350 = pyc.constant 1 : i1
  %v351 = pyc.constant 0 : i128
  %v352 = pyc.reg %clk, %rst, %v350, %v349, %v351 : i128
  %v353 = pyc.alias %v352 {pyc.name = "dep1_data"} : i128
  %v354 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v355 = pyc.constant 1 : i1
  %v356 = pyc.constant 0 : i128
  %v357 = pyc.reg %clk, %rst, %v355, %v354, %v356 : i128
  %v358 = pyc.alias %v357 {pyc.name = "dep2_data"} : i128
  %v359 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v360 = pyc.constant 1 : i1
  %v361 = pyc.constant 0 : i128
  %v362 = pyc.reg %clk, %rst, %v360, %v359, %v361 : i128
  %v363 = pyc.alias %v362 {pyc.name = "dep3_data"} : i128
  %v364 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v365 = pyc.constant 1 : i1
  %v366 = pyc.constant 0 : i128
  %v367 = pyc.reg %clk, %rst, %v365, %v364, %v366 : i128
  %v368 = pyc.alias %v367 {pyc.name = "dep4_data"} : i128
  %v369 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v370 = pyc.constant 1 : i1
  %v371 = pyc.constant 0 : i128
  %v372 = pyc.reg %clk, %rst, %v370, %v369, %v371 : i128
  %v373 = pyc.alias %v372 {pyc.name = "dep5_data"} : i128
  %v374 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v375 = pyc.constant 1 : i1
  %v376 = pyc.constant 0 : i128
  %v377 = pyc.reg %clk, %rst, %v375, %v374, %v376 : i128
  %v378 = pyc.alias %v377 {pyc.name = "dep6_data"} : i128
  %v379 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v380 = pyc.constant 1 : i1
  %v381 = pyc.constant 0 : i128
  %v382 = pyc.reg %clk, %rst, %v380, %v379, %v381 : i128
  %v383 = pyc.alias %v382 {pyc.name = "dep7_data"} : i128
  %v384 = pyc.wire {pyc.name = "dep0_seq__next"} : i16
  %v385 = pyc.constant 1 : i1
  %v386 = pyc.constant 0 : i16
  %v387 = pyc.reg %clk, %rst, %v385, %v384, %v386 : i16
  %v388 = pyc.alias %v387 {pyc.name = "dep0_seq"} : i16
  %v389 = pyc.wire {pyc.name = "dep1_seq__next"} : i16
  %v390 = pyc.constant 1 : i1
  %v391 = pyc.constant 0 : i16
  %v392 = pyc.reg %clk, %rst, %v390, %v389, %v391 : i16
  %v393 = pyc.alias %v392 {pyc.name = "dep1_seq"} : i16
  %v394 = pyc.wire {pyc.name = "dep2_seq__next"} : i16
  %v395 = pyc.constant 1 : i1
  %v396 = pyc.constant 0 : i16
  %v397 = pyc.reg %clk, %rst, %v395, %v394, %v396 : i16
  %v398 = pyc.alias %v397 {pyc.name = "dep2_seq"} : i16
  %v399 = pyc.wire {pyc.name = "dep3_seq__next"} : i16
  %v400 = pyc.constant 1 : i1
  %v401 = pyc.constant 0 : i16
  %v402 = pyc.reg %clk, %rst, %v400, %v399, %v401 : i16
  %v403 = pyc.alias %v402 {pyc.name = "dep3_seq"} : i16
  %v404 = pyc.wire {pyc.name = "dep4_seq__next"} : i16
  %v405 = pyc.constant 1 : i1
  %v406 = pyc.constant 0 : i16
  %v407 = pyc.reg %clk, %rst, %v405, %v404, %v406 : i16
  %v408 = pyc.alias %v407 {pyc.name = "dep4_seq"} : i16
  %v409 = pyc.wire {pyc.name = "dep5_seq__next"} : i16
  %v410 = pyc.constant 1 : i1
  %v411 = pyc.constant 0 : i16
  %v412 = pyc.reg %clk, %rst, %v410, %v409, %v411 : i16
  %v413 = pyc.alias %v412 {pyc.name = "dep5_seq"} : i16
  %v414 = pyc.wire {pyc.name = "dep6_seq__next"} : i16
  %v415 = pyc.constant 1 : i1
  %v416 = pyc.constant 0 : i16
  %v417 = pyc.reg %clk, %rst, %v415, %v414, %v416 : i16
  %v418 = pyc.alias %v417 {pyc.name = "dep6_seq"} : i16
  %v419 = pyc.wire {pyc.name = "dep7_seq__next"} : i16
  %v420 = pyc.constant 1 : i1
  %v421 = pyc.constant 0 : i16
  %v422 = pyc.reg %clk, %rst, %v420, %v419, %v421 : i16
  %v423 = pyc.alias %v422 {pyc.name = "dep7_seq"} : i16
  %v424 = pyc.wire {pyc.name = "dep_write_ptr__next"} : i3
  %v425 = pyc.constant 1 : i1
  %v426 = pyc.constant 0 : i3
  %v427 = pyc.reg %clk, %rst, %v425, %v424, %v426 : i3
  %v428 = pyc.alias %v427 {pyc.name = "dep_write_ptr"} : i3
  %v429 = pyc.alias %v428 {pyc.name = "dep_write_ptr__fastfwd_v3_2__L77"} : i3
  %v430 = pyc.alias %fwded0_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_2__L85"} : i1
  %v431 = pyc.constant 0 : i1
  %v432 = pyc.or %v430, %v431 : i1
  %v433 = pyc.alias %v432 {pyc.name = "fe_done__fastfwd_v3_2__L86"} : i1
  %v434 = pyc.not %v430 : i1
  %v435 = pyc.constant 0 : i128
  %v436 = pyc.mux %v434, %v435, %fwded0_pkt_data : i128
  %v437 = pyc.alias %v436 {pyc.name = "fe_done_data__fastfwd_v3_2__L87"} : i128
  %v438 = pyc.not %v430 : i1
  %v439 = pyc.constant 0 : i16
  %v440 = pyc.mux %v438, %v439, %v188 : i16
  %v441 = pyc.alias %v440 {pyc.name = "fe_done_seq__fastfwd_v3_2__L88"} : i16
  %v442 = pyc.alias %fwded1_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_2__L85"} : i1
  %v443 = pyc.or %v433, %v442 : i1
  %v444 = pyc.alias %v443 {pyc.name = "fe_done__fastfwd_v3_2__L86"} : i1
  %v445 = pyc.not %v442 : i1
  %v446 = pyc.mux %v445, %v437, %fwded1_pkt_data : i128
  %v447 = pyc.alias %v446 {pyc.name = "fe_done_data__fastfwd_v3_2__L87"} : i128
  %v448 = pyc.not %v442 : i1
  %v449 = pyc.mux %v448, %v441, %v193 : i16
  %v450 = pyc.alias %v449 {pyc.name = "fe_done_seq__fastfwd_v3_2__L88"} : i16
  %v451 = pyc.alias %fwded2_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_2__L85"} : i1
  %v452 = pyc.or %v444, %v451 : i1
  %v453 = pyc.alias %v452 {pyc.name = "fe_done__fastfwd_v3_2__L86"} : i1
  %v454 = pyc.not %v451 : i1
  %v455 = pyc.mux %v454, %v447, %fwded2_pkt_data : i128
  %v456 = pyc.alias %v455 {pyc.name = "fe_done_data__fastfwd_v3_2__L87"} : i128
  %v457 = pyc.not %v451 : i1
  %v458 = pyc.mux %v457, %v450, %v198 : i16
  %v459 = pyc.alias %v458 {pyc.name = "fe_done_seq__fastfwd_v3_2__L88"} : i16
  %v460 = pyc.alias %fwded3_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_2__L85"} : i1
  %v461 = pyc.or %v453, %v460 : i1
  %v462 = pyc.alias %v461 {pyc.name = "fe_done__fastfwd_v3_2__L86"} : i1
  %v463 = pyc.not %v460 : i1
  %v464 = pyc.mux %v463, %v456, %fwded3_pkt_data : i128
  %v465 = pyc.alias %v464 {pyc.name = "fe_done_data__fastfwd_v3_2__L87"} : i128
  %v466 = pyc.not %v460 : i1
  %v467 = pyc.mux %v466, %v459, %v203 : i16
  %v468 = pyc.alias %v467 {pyc.name = "fe_done_seq__fastfwd_v3_2__L88"} : i16
  %v469 = pyc.constant 0 : i3
  %v470 = pyc.eq %v429, %v469 : i3
  %v471 = pyc.and %v462, %v470 : i1
  %v472 = pyc.alias %v471 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v473 = pyc.or %v472, %v308 : i1
  pyc.assign %v304, %v473 : i1
  %v474 = pyc.mux %v472, %v465, %v348 : i128
  pyc.assign %v344, %v474 : i128
  %v475 = pyc.mux %v472, %v468, %v388 : i16
  pyc.assign %v384, %v475 : i16
  %v476 = pyc.constant 1 : i3
  %v477 = pyc.eq %v429, %v476 : i3
  %v478 = pyc.and %v462, %v477 : i1
  %v479 = pyc.alias %v478 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v480 = pyc.or %v479, %v313 : i1
  pyc.assign %v309, %v480 : i1
  %v481 = pyc.mux %v479, %v465, %v353 : i128
  pyc.assign %v349, %v481 : i128
  %v482 = pyc.mux %v479, %v468, %v393 : i16
  pyc.assign %v389, %v482 : i16
  %v483 = pyc.constant 2 : i3
  %v484 = pyc.eq %v429, %v483 : i3
  %v485 = pyc.and %v462, %v484 : i1
  %v486 = pyc.alias %v485 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v487 = pyc.or %v486, %v318 : i1
  pyc.assign %v314, %v487 : i1
  %v488 = pyc.mux %v486, %v465, %v358 : i128
  pyc.assign %v354, %v488 : i128
  %v489 = pyc.mux %v486, %v468, %v398 : i16
  pyc.assign %v394, %v489 : i16
  %v490 = pyc.constant 3 : i3
  %v491 = pyc.eq %v429, %v490 : i3
  %v492 = pyc.and %v462, %v491 : i1
  %v493 = pyc.alias %v492 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v494 = pyc.or %v493, %v323 : i1
  pyc.assign %v319, %v494 : i1
  %v495 = pyc.mux %v493, %v465, %v363 : i128
  pyc.assign %v359, %v495 : i128
  %v496 = pyc.mux %v493, %v468, %v403 : i16
  pyc.assign %v399, %v496 : i16
  %v497 = pyc.constant 4 : i3
  %v498 = pyc.eq %v429, %v497 : i3
  %v499 = pyc.and %v462, %v498 : i1
  %v500 = pyc.alias %v499 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v501 = pyc.or %v500, %v328 : i1
  pyc.assign %v324, %v501 : i1
  %v502 = pyc.mux %v500, %v465, %v368 : i128
  pyc.assign %v364, %v502 : i128
  %v503 = pyc.mux %v500, %v468, %v408 : i16
  pyc.assign %v404, %v503 : i16
  %v504 = pyc.constant 5 : i3
  %v505 = pyc.eq %v429, %v504 : i3
  %v506 = pyc.and %v462, %v505 : i1
  %v507 = pyc.alias %v506 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v508 = pyc.or %v507, %v333 : i1
  pyc.assign %v329, %v508 : i1
  %v509 = pyc.mux %v507, %v465, %v373 : i128
  pyc.assign %v369, %v509 : i128
  %v510 = pyc.mux %v507, %v468, %v413 : i16
  pyc.assign %v409, %v510 : i16
  %v511 = pyc.constant 6 : i3
  %v512 = pyc.eq %v429, %v511 : i3
  %v513 = pyc.and %v462, %v512 : i1
  %v514 = pyc.alias %v513 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v515 = pyc.or %v514, %v338 : i1
  pyc.assign %v334, %v515 : i1
  %v516 = pyc.mux %v514, %v465, %v378 : i128
  pyc.assign %v374, %v516 : i128
  %v517 = pyc.mux %v514, %v468, %v418 : i16
  pyc.assign %v414, %v517 : i16
  %v518 = pyc.constant 7 : i3
  %v519 = pyc.eq %v429, %v518 : i3
  %v520 = pyc.and %v462, %v519 : i1
  %v521 = pyc.alias %v520 {pyc.name = "should_write__fastfwd_v3_2__L91"} : i1
  %v522 = pyc.or %v521, %v343 : i1
  pyc.assign %v339, %v522 : i1
  %v523 = pyc.mux %v521, %v465, %v383 : i128
  pyc.assign %v379, %v523 : i128
  %v524 = pyc.mux %v521, %v468, %v423 : i16
  pyc.assign %v419, %v524 : i16
  %v525 = pyc.constant 1 : i3
  %v526 = pyc.add %v429, %v525 : i3
  %v527 = pyc.constant 7 : i3
  %v528 = pyc.and %v526, %v527 : i3
  %v529 = pyc.alias %v528 {pyc.name = "new_dep_ptr__fastfwd_v3_2__L96"} : i3
  %v530 = pyc.mux %v462, %v529, %v429 : i3
  pyc.assign %v424, %v530 : i3
  %v531 = pyc.constant 3 : i5
  %v532 = pyc.and %v72, %v531 : i5
  %v533 = pyc.alias %v532 {pyc.name = "lat__fastfwd_v3_2__L101"} : i5
  %v534 = pyc.lshri %v72 {amount = 2} : i5
  %v535 = pyc.constant 7 : i5
  %v536 = pyc.and %v534, %v535 : i5
  %v537 = pyc.alias %v536 {pyc.name = "dep__fastfwd_v3_2__L102"} : i5
  %v538 = pyc.constant 2 : i6
  %v539 = pyc.zext %v538 : i6 -> i16
  %v540 = pyc.add %v21, %v539 : i16
  %v541 = pyc.zext %v533 : i5 -> i16
  %v542 = pyc.add %v540, %v541 : i16
  %v543 = pyc.alias %v542 {pyc.name = "finish_cycle__fastfwd_v3_2__L103"} : i16
  %v544 = pyc.zext %v168 : i6 -> i16
  %v545 = pyc.ult %v544, %v543 : i16
  %v546 = pyc.alias %v545 {pyc.name = "constraint_ok__fastfwd_v3_2__L104"} : i1
  %v547 = pyc.not %v128 : i1
  %v548 = pyc.and %v547, %v32 : i1
  %v549 = pyc.and %v548, %v546 : i1
  %v550 = pyc.alias %v549 {pyc.name = "can_schedule__fastfwd_v3_2__L105"} : i1
  %v551 = pyc.zext %v537 : i5 -> i16
  %v552 = pyc.sub %v92, %v551 : i16
  %v553 = pyc.alias %v552 {pyc.name = "target_seq__fastfwd_v3_2__L108"} : i16
  %v554 = pyc.eq %v388, %v553 : i16
  %v555 = pyc.and %v308, %v554 : i1
  %v556 = pyc.alias %v555 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v557 = pyc.constant 0 : i1
  %v558 = pyc.or %v556, %v557 : i1
  %v559 = pyc.alias %v558 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v560 = pyc.not %v556 : i1
  %v561 = pyc.constant 0 : i128
  %v562 = pyc.mux %v560, %v561, %v348 : i128
  %v563 = pyc.alias %v562 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v564 = pyc.eq %v393, %v553 : i16
  %v565 = pyc.and %v313, %v564 : i1
  %v566 = pyc.alias %v565 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v567 = pyc.or %v559, %v566 : i1
  %v568 = pyc.alias %v567 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v569 = pyc.not %v566 : i1
  %v570 = pyc.mux %v569, %v563, %v353 : i128
  %v571 = pyc.alias %v570 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v572 = pyc.eq %v398, %v553 : i16
  %v573 = pyc.and %v318, %v572 : i1
  %v574 = pyc.alias %v573 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v575 = pyc.or %v568, %v574 : i1
  %v576 = pyc.alias %v575 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v577 = pyc.not %v574 : i1
  %v578 = pyc.mux %v577, %v571, %v358 : i128
  %v579 = pyc.alias %v578 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v580 = pyc.eq %v403, %v553 : i16
  %v581 = pyc.and %v323, %v580 : i1
  %v582 = pyc.alias %v581 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v583 = pyc.or %v576, %v582 : i1
  %v584 = pyc.alias %v583 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v585 = pyc.not %v582 : i1
  %v586 = pyc.mux %v585, %v579, %v363 : i128
  %v587 = pyc.alias %v586 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v588 = pyc.eq %v408, %v553 : i16
  %v589 = pyc.and %v328, %v588 : i1
  %v590 = pyc.alias %v589 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v591 = pyc.or %v584, %v590 : i1
  %v592 = pyc.alias %v591 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v593 = pyc.not %v590 : i1
  %v594 = pyc.mux %v593, %v587, %v368 : i128
  %v595 = pyc.alias %v594 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v596 = pyc.eq %v413, %v553 : i16
  %v597 = pyc.and %v333, %v596 : i1
  %v598 = pyc.alias %v597 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v599 = pyc.or %v592, %v598 : i1
  %v600 = pyc.alias %v599 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v601 = pyc.not %v598 : i1
  %v602 = pyc.mux %v601, %v595, %v373 : i128
  %v603 = pyc.alias %v602 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v604 = pyc.eq %v418, %v553 : i16
  %v605 = pyc.and %v338, %v604 : i1
  %v606 = pyc.alias %v605 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v607 = pyc.or %v600, %v606 : i1
  %v608 = pyc.alias %v607 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v609 = pyc.not %v606 : i1
  %v610 = pyc.mux %v609, %v603, %v378 : i128
  %v611 = pyc.alias %v610 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v612 = pyc.eq %v423, %v553 : i16
  %v613 = pyc.and %v343, %v612 : i1
  %v614 = pyc.alias %v613 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v615 = pyc.or %v608, %v614 : i1
  %v616 = pyc.alias %v615 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v617 = pyc.not %v614 : i1
  %v618 = pyc.mux %v617, %v611, %v383 : i128
  %v619 = pyc.alias %v618 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v620 = pyc.constant 0 : i3
  %v621 = pyc.zext %v620 : i3 -> i5
  %v622 = pyc.eq %v537, %v621 : i5
  %v623 = pyc.not %v622 : i1
  %v624 = pyc.alias %v623 {pyc.name = "has_dep__fastfwd_v3_2__L116"} : i1
  %v625 = pyc.and %v624, %v616 : i1
  %v626 = pyc.alias %v625 {pyc.name = "dep_ready__fastfwd_v3_2__L117"} : i1
  %v627 = pyc.not %v624 : i1
  %v628 = pyc.or %v627, %v626 : i1
  %v629 = pyc.and %v550, %v628 : i1
  %v630 = pyc.alias %v629 {pyc.name = "can_schedule__fastfwd_v3_2__L118"} : i1
  %v631 = pyc.constant 1 : i3
  %v632 = pyc.ult %v631, %v148 : i3
  %v633 = pyc.and %v128, %v632 : i1
  %v634 = pyc.or %v630, %v633 : i1
  pyc.assign %v124, %v634 : i1
  %v635 = pyc.constant 1 : i3
  %v636 = pyc.zext %v635 : i3 -> i5
  %v637 = pyc.add %v533, %v636 : i5
  %v638 = pyc.constant 1 : i3
  %v639 = pyc.sub %v148, %v638 : i3
  %v640 = pyc.constant 0 : i3
  %v641 = pyc.mux %v128, %v639, %v640 : i3
  %v642 = pyc.zext %v641 : i3 -> i5
  %v643 = pyc.mux %v630, %v637, %v642 : i5
  %v644 = pyc.alias %v643 {pyc.name = "new_timer__fastfwd_v3_2__L122"} : i5
  %v645 = pyc.trunc %v644 : i5 -> i3
  pyc.assign %v144, %v645 : i3
  %v646 = pyc.zext %v168 : i6 -> i16
  %v647 = pyc.mux %v630, %v543, %v646 : i16
  %v648 = pyc.trunc %v647 : i16 -> i6
  pyc.assign %v164, %v648 : i6
  %v649 = pyc.mux %v630, %v92, %v188 : i16
  pyc.assign %v184, %v649 : i16
  pyc.assign %v204, %v630 : i1
  %v650 = pyc.constant 0 : i128
  %v651 = pyc.mux %v630, %v52, %v650 : i128
  pyc.assign %v224, %v651 : i128
  %v652 = pyc.constant 0 : i2
  %v653 = pyc.zext %v652 : i2 -> i5
  %v654 = pyc.mux %v630, %v533, %v653 : i5
  %v655 = pyc.trunc %v654 : i5 -> i2
  pyc.assign %v244, %v655 : i2
  %v656 = pyc.and %v624, %v630 : i1
  pyc.assign %v264, %v656 : i1
  %v657 = pyc.and %v624, %v630 : i1
  %v658 = pyc.constant 0 : i128
  %v659 = pyc.mux %v657, %v619, %v658 : i128
  pyc.assign %v284, %v659 : i128
  %v660 = pyc.constant 3 : i5
  %v661 = pyc.and %v77, %v660 : i5
  %v662 = pyc.alias %v661 {pyc.name = "lat__fastfwd_v3_2__L101"} : i5
  %v663 = pyc.lshri %v77 {amount = 2} : i5
  %v664 = pyc.constant 7 : i5
  %v665 = pyc.and %v663, %v664 : i5
  %v666 = pyc.alias %v665 {pyc.name = "dep__fastfwd_v3_2__L102"} : i5
  %v667 = pyc.constant 2 : i6
  %v668 = pyc.zext %v667 : i6 -> i16
  %v669 = pyc.add %v21, %v668 : i16
  %v670 = pyc.zext %v662 : i5 -> i16
  %v671 = pyc.add %v669, %v670 : i16
  %v672 = pyc.alias %v671 {pyc.name = "finish_cycle__fastfwd_v3_2__L103"} : i16
  %v673 = pyc.zext %v173 : i6 -> i16
  %v674 = pyc.ult %v673, %v672 : i16
  %v675 = pyc.alias %v674 {pyc.name = "constraint_ok__fastfwd_v3_2__L104"} : i1
  %v676 = pyc.not %v133 : i1
  %v677 = pyc.and %v676, %v37 : i1
  %v678 = pyc.and %v677, %v675 : i1
  %v679 = pyc.alias %v678 {pyc.name = "can_schedule__fastfwd_v3_2__L105"} : i1
  %v680 = pyc.zext %v666 : i5 -> i16
  %v681 = pyc.sub %v97, %v680 : i16
  %v682 = pyc.alias %v681 {pyc.name = "target_seq__fastfwd_v3_2__L108"} : i16
  %v683 = pyc.eq %v388, %v682 : i16
  %v684 = pyc.and %v308, %v683 : i1
  %v685 = pyc.alias %v684 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v686 = pyc.constant 0 : i1
  %v687 = pyc.or %v685, %v686 : i1
  %v688 = pyc.alias %v687 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v689 = pyc.not %v685 : i1
  %v690 = pyc.constant 0 : i128
  %v691 = pyc.mux %v689, %v690, %v348 : i128
  %v692 = pyc.alias %v691 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v693 = pyc.eq %v393, %v682 : i16
  %v694 = pyc.and %v313, %v693 : i1
  %v695 = pyc.alias %v694 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v696 = pyc.or %v688, %v695 : i1
  %v697 = pyc.alias %v696 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v698 = pyc.not %v695 : i1
  %v699 = pyc.mux %v698, %v692, %v353 : i128
  %v700 = pyc.alias %v699 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v701 = pyc.eq %v398, %v682 : i16
  %v702 = pyc.and %v318, %v701 : i1
  %v703 = pyc.alias %v702 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v704 = pyc.or %v697, %v703 : i1
  %v705 = pyc.alias %v704 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v706 = pyc.not %v703 : i1
  %v707 = pyc.mux %v706, %v700, %v358 : i128
  %v708 = pyc.alias %v707 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v709 = pyc.eq %v403, %v682 : i16
  %v710 = pyc.and %v323, %v709 : i1
  %v711 = pyc.alias %v710 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v712 = pyc.or %v705, %v711 : i1
  %v713 = pyc.alias %v712 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v714 = pyc.not %v711 : i1
  %v715 = pyc.mux %v714, %v708, %v363 : i128
  %v716 = pyc.alias %v715 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v717 = pyc.eq %v408, %v682 : i16
  %v718 = pyc.and %v328, %v717 : i1
  %v719 = pyc.alias %v718 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v720 = pyc.or %v713, %v719 : i1
  %v721 = pyc.alias %v720 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v722 = pyc.not %v719 : i1
  %v723 = pyc.mux %v722, %v716, %v368 : i128
  %v724 = pyc.alias %v723 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v725 = pyc.eq %v413, %v682 : i16
  %v726 = pyc.and %v333, %v725 : i1
  %v727 = pyc.alias %v726 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v728 = pyc.or %v721, %v727 : i1
  %v729 = pyc.alias %v728 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v730 = pyc.not %v727 : i1
  %v731 = pyc.mux %v730, %v724, %v373 : i128
  %v732 = pyc.alias %v731 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v733 = pyc.eq %v418, %v682 : i16
  %v734 = pyc.and %v338, %v733 : i1
  %v735 = pyc.alias %v734 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v736 = pyc.or %v729, %v735 : i1
  %v737 = pyc.alias %v736 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v738 = pyc.not %v735 : i1
  %v739 = pyc.mux %v738, %v732, %v378 : i128
  %v740 = pyc.alias %v739 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v741 = pyc.eq %v423, %v682 : i16
  %v742 = pyc.and %v343, %v741 : i1
  %v743 = pyc.alias %v742 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v744 = pyc.or %v737, %v743 : i1
  %v745 = pyc.alias %v744 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v746 = pyc.not %v743 : i1
  %v747 = pyc.mux %v746, %v740, %v383 : i128
  %v748 = pyc.alias %v747 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v749 = pyc.constant 0 : i3
  %v750 = pyc.zext %v749 : i3 -> i5
  %v751 = pyc.eq %v666, %v750 : i5
  %v752 = pyc.not %v751 : i1
  %v753 = pyc.alias %v752 {pyc.name = "has_dep__fastfwd_v3_2__L116"} : i1
  %v754 = pyc.and %v753, %v745 : i1
  %v755 = pyc.alias %v754 {pyc.name = "dep_ready__fastfwd_v3_2__L117"} : i1
  %v756 = pyc.not %v753 : i1
  %v757 = pyc.or %v756, %v755 : i1
  %v758 = pyc.and %v679, %v757 : i1
  %v759 = pyc.alias %v758 {pyc.name = "can_schedule__fastfwd_v3_2__L118"} : i1
  %v760 = pyc.constant 1 : i3
  %v761 = pyc.ult %v760, %v153 : i3
  %v762 = pyc.and %v133, %v761 : i1
  %v763 = pyc.or %v759, %v762 : i1
  pyc.assign %v129, %v763 : i1
  %v764 = pyc.constant 1 : i3
  %v765 = pyc.zext %v764 : i3 -> i5
  %v766 = pyc.add %v662, %v765 : i5
  %v767 = pyc.constant 1 : i3
  %v768 = pyc.sub %v153, %v767 : i3
  %v769 = pyc.constant 0 : i3
  %v770 = pyc.mux %v133, %v768, %v769 : i3
  %v771 = pyc.zext %v770 : i3 -> i5
  %v772 = pyc.mux %v759, %v766, %v771 : i5
  %v773 = pyc.alias %v772 {pyc.name = "new_timer__fastfwd_v3_2__L122"} : i5
  %v774 = pyc.trunc %v773 : i5 -> i3
  pyc.assign %v149, %v774 : i3
  %v775 = pyc.zext %v173 : i6 -> i16
  %v776 = pyc.mux %v759, %v672, %v775 : i16
  %v777 = pyc.trunc %v776 : i16 -> i6
  pyc.assign %v169, %v777 : i6
  %v778 = pyc.mux %v759, %v97, %v193 : i16
  pyc.assign %v189, %v778 : i16
  pyc.assign %v209, %v759 : i1
  %v779 = pyc.constant 0 : i128
  %v780 = pyc.mux %v759, %v57, %v779 : i128
  pyc.assign %v229, %v780 : i128
  %v781 = pyc.constant 0 : i2
  %v782 = pyc.zext %v781 : i2 -> i5
  %v783 = pyc.mux %v759, %v662, %v782 : i5
  %v784 = pyc.trunc %v783 : i5 -> i2
  pyc.assign %v249, %v784 : i2
  %v785 = pyc.and %v753, %v759 : i1
  pyc.assign %v269, %v785 : i1
  %v786 = pyc.and %v753, %v759 : i1
  %v787 = pyc.constant 0 : i128
  %v788 = pyc.mux %v786, %v748, %v787 : i128
  pyc.assign %v289, %v788 : i128
  %v789 = pyc.constant 3 : i5
  %v790 = pyc.and %v82, %v789 : i5
  %v791 = pyc.alias %v790 {pyc.name = "lat__fastfwd_v3_2__L101"} : i5
  %v792 = pyc.lshri %v82 {amount = 2} : i5
  %v793 = pyc.constant 7 : i5
  %v794 = pyc.and %v792, %v793 : i5
  %v795 = pyc.alias %v794 {pyc.name = "dep__fastfwd_v3_2__L102"} : i5
  %v796 = pyc.constant 2 : i6
  %v797 = pyc.zext %v796 : i6 -> i16
  %v798 = pyc.add %v21, %v797 : i16
  %v799 = pyc.zext %v791 : i5 -> i16
  %v800 = pyc.add %v798, %v799 : i16
  %v801 = pyc.alias %v800 {pyc.name = "finish_cycle__fastfwd_v3_2__L103"} : i16
  %v802 = pyc.zext %v178 : i6 -> i16
  %v803 = pyc.ult %v802, %v801 : i16
  %v804 = pyc.alias %v803 {pyc.name = "constraint_ok__fastfwd_v3_2__L104"} : i1
  %v805 = pyc.not %v138 : i1
  %v806 = pyc.and %v805, %v42 : i1
  %v807 = pyc.and %v806, %v804 : i1
  %v808 = pyc.alias %v807 {pyc.name = "can_schedule__fastfwd_v3_2__L105"} : i1
  %v809 = pyc.zext %v795 : i5 -> i16
  %v810 = pyc.sub %v102, %v809 : i16
  %v811 = pyc.alias %v810 {pyc.name = "target_seq__fastfwd_v3_2__L108"} : i16
  %v812 = pyc.eq %v388, %v811 : i16
  %v813 = pyc.and %v308, %v812 : i1
  %v814 = pyc.alias %v813 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v815 = pyc.constant 0 : i1
  %v816 = pyc.or %v814, %v815 : i1
  %v817 = pyc.alias %v816 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v818 = pyc.not %v814 : i1
  %v819 = pyc.constant 0 : i128
  %v820 = pyc.mux %v818, %v819, %v348 : i128
  %v821 = pyc.alias %v820 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v822 = pyc.eq %v393, %v811 : i16
  %v823 = pyc.and %v313, %v822 : i1
  %v824 = pyc.alias %v823 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v825 = pyc.or %v817, %v824 : i1
  %v826 = pyc.alias %v825 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v827 = pyc.not %v824 : i1
  %v828 = pyc.mux %v827, %v821, %v353 : i128
  %v829 = pyc.alias %v828 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v830 = pyc.eq %v398, %v811 : i16
  %v831 = pyc.and %v318, %v830 : i1
  %v832 = pyc.alias %v831 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v833 = pyc.or %v826, %v832 : i1
  %v834 = pyc.alias %v833 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v835 = pyc.not %v832 : i1
  %v836 = pyc.mux %v835, %v829, %v358 : i128
  %v837 = pyc.alias %v836 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v838 = pyc.eq %v403, %v811 : i16
  %v839 = pyc.and %v323, %v838 : i1
  %v840 = pyc.alias %v839 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v841 = pyc.or %v834, %v840 : i1
  %v842 = pyc.alias %v841 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v843 = pyc.not %v840 : i1
  %v844 = pyc.mux %v843, %v837, %v363 : i128
  %v845 = pyc.alias %v844 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v846 = pyc.eq %v408, %v811 : i16
  %v847 = pyc.and %v328, %v846 : i1
  %v848 = pyc.alias %v847 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v849 = pyc.or %v842, %v848 : i1
  %v850 = pyc.alias %v849 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v851 = pyc.not %v848 : i1
  %v852 = pyc.mux %v851, %v845, %v368 : i128
  %v853 = pyc.alias %v852 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v854 = pyc.eq %v413, %v811 : i16
  %v855 = pyc.and %v333, %v854 : i1
  %v856 = pyc.alias %v855 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v857 = pyc.or %v850, %v856 : i1
  %v858 = pyc.alias %v857 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v859 = pyc.not %v856 : i1
  %v860 = pyc.mux %v859, %v853, %v373 : i128
  %v861 = pyc.alias %v860 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v862 = pyc.eq %v418, %v811 : i16
  %v863 = pyc.and %v338, %v862 : i1
  %v864 = pyc.alias %v863 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v865 = pyc.or %v858, %v864 : i1
  %v866 = pyc.alias %v865 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v867 = pyc.not %v864 : i1
  %v868 = pyc.mux %v867, %v861, %v378 : i128
  %v869 = pyc.alias %v868 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v870 = pyc.eq %v423, %v811 : i16
  %v871 = pyc.and %v343, %v870 : i1
  %v872 = pyc.alias %v871 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v873 = pyc.or %v866, %v872 : i1
  %v874 = pyc.alias %v873 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v875 = pyc.not %v872 : i1
  %v876 = pyc.mux %v875, %v869, %v383 : i128
  %v877 = pyc.alias %v876 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v878 = pyc.constant 0 : i3
  %v879 = pyc.zext %v878 : i3 -> i5
  %v880 = pyc.eq %v795, %v879 : i5
  %v881 = pyc.not %v880 : i1
  %v882 = pyc.alias %v881 {pyc.name = "has_dep__fastfwd_v3_2__L116"} : i1
  %v883 = pyc.and %v882, %v874 : i1
  %v884 = pyc.alias %v883 {pyc.name = "dep_ready__fastfwd_v3_2__L117"} : i1
  %v885 = pyc.not %v882 : i1
  %v886 = pyc.or %v885, %v884 : i1
  %v887 = pyc.and %v808, %v886 : i1
  %v888 = pyc.alias %v887 {pyc.name = "can_schedule__fastfwd_v3_2__L118"} : i1
  %v889 = pyc.constant 1 : i3
  %v890 = pyc.ult %v889, %v158 : i3
  %v891 = pyc.and %v138, %v890 : i1
  %v892 = pyc.or %v888, %v891 : i1
  pyc.assign %v134, %v892 : i1
  %v893 = pyc.constant 1 : i3
  %v894 = pyc.zext %v893 : i3 -> i5
  %v895 = pyc.add %v791, %v894 : i5
  %v896 = pyc.constant 1 : i3
  %v897 = pyc.sub %v158, %v896 : i3
  %v898 = pyc.constant 0 : i3
  %v899 = pyc.mux %v138, %v897, %v898 : i3
  %v900 = pyc.zext %v899 : i3 -> i5
  %v901 = pyc.mux %v888, %v895, %v900 : i5
  %v902 = pyc.alias %v901 {pyc.name = "new_timer__fastfwd_v3_2__L122"} : i5
  %v903 = pyc.trunc %v902 : i5 -> i3
  pyc.assign %v154, %v903 : i3
  %v904 = pyc.zext %v178 : i6 -> i16
  %v905 = pyc.mux %v888, %v801, %v904 : i16
  %v906 = pyc.trunc %v905 : i16 -> i6
  pyc.assign %v174, %v906 : i6
  %v907 = pyc.mux %v888, %v102, %v198 : i16
  pyc.assign %v194, %v907 : i16
  pyc.assign %v214, %v888 : i1
  %v908 = pyc.constant 0 : i128
  %v909 = pyc.mux %v888, %v62, %v908 : i128
  pyc.assign %v234, %v909 : i128
  %v910 = pyc.constant 0 : i2
  %v911 = pyc.zext %v910 : i2 -> i5
  %v912 = pyc.mux %v888, %v791, %v911 : i5
  %v913 = pyc.trunc %v912 : i5 -> i2
  pyc.assign %v254, %v913 : i2
  %v914 = pyc.and %v882, %v888 : i1
  pyc.assign %v274, %v914 : i1
  %v915 = pyc.and %v882, %v888 : i1
  %v916 = pyc.constant 0 : i128
  %v917 = pyc.mux %v915, %v877, %v916 : i128
  pyc.assign %v294, %v917 : i128
  %v918 = pyc.constant 3 : i5
  %v919 = pyc.and %v87, %v918 : i5
  %v920 = pyc.alias %v919 {pyc.name = "lat__fastfwd_v3_2__L101"} : i5
  %v921 = pyc.lshri %v87 {amount = 2} : i5
  %v922 = pyc.constant 7 : i5
  %v923 = pyc.and %v921, %v922 : i5
  %v924 = pyc.alias %v923 {pyc.name = "dep__fastfwd_v3_2__L102"} : i5
  %v925 = pyc.constant 2 : i6
  %v926 = pyc.zext %v925 : i6 -> i16
  %v927 = pyc.add %v21, %v926 : i16
  %v928 = pyc.zext %v920 : i5 -> i16
  %v929 = pyc.add %v927, %v928 : i16
  %v930 = pyc.alias %v929 {pyc.name = "finish_cycle__fastfwd_v3_2__L103"} : i16
  %v931 = pyc.zext %v183 : i6 -> i16
  %v932 = pyc.ult %v931, %v930 : i16
  %v933 = pyc.alias %v932 {pyc.name = "constraint_ok__fastfwd_v3_2__L104"} : i1
  %v934 = pyc.not %v143 : i1
  %v935 = pyc.and %v934, %v47 : i1
  %v936 = pyc.and %v935, %v933 : i1
  %v937 = pyc.alias %v936 {pyc.name = "can_schedule__fastfwd_v3_2__L105"} : i1
  %v938 = pyc.zext %v924 : i5 -> i16
  %v939 = pyc.sub %v107, %v938 : i16
  %v940 = pyc.alias %v939 {pyc.name = "target_seq__fastfwd_v3_2__L108"} : i16
  %v941 = pyc.eq %v388, %v940 : i16
  %v942 = pyc.and %v308, %v941 : i1
  %v943 = pyc.alias %v942 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v944 = pyc.constant 0 : i1
  %v945 = pyc.or %v943, %v944 : i1
  %v946 = pyc.alias %v945 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v947 = pyc.not %v943 : i1
  %v948 = pyc.constant 0 : i128
  %v949 = pyc.mux %v947, %v948, %v348 : i128
  %v950 = pyc.alias %v949 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v951 = pyc.eq %v393, %v940 : i16
  %v952 = pyc.and %v313, %v951 : i1
  %v953 = pyc.alias %v952 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v954 = pyc.or %v946, %v953 : i1
  %v955 = pyc.alias %v954 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v956 = pyc.not %v953 : i1
  %v957 = pyc.mux %v956, %v950, %v353 : i128
  %v958 = pyc.alias %v957 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v959 = pyc.eq %v398, %v940 : i16
  %v960 = pyc.and %v318, %v959 : i1
  %v961 = pyc.alias %v960 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v962 = pyc.or %v955, %v961 : i1
  %v963 = pyc.alias %v962 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v964 = pyc.not %v961 : i1
  %v965 = pyc.mux %v964, %v958, %v358 : i128
  %v966 = pyc.alias %v965 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v967 = pyc.eq %v403, %v940 : i16
  %v968 = pyc.and %v323, %v967 : i1
  %v969 = pyc.alias %v968 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v970 = pyc.or %v963, %v969 : i1
  %v971 = pyc.alias %v970 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v972 = pyc.not %v969 : i1
  %v973 = pyc.mux %v972, %v966, %v363 : i128
  %v974 = pyc.alias %v973 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v975 = pyc.eq %v408, %v940 : i16
  %v976 = pyc.and %v328, %v975 : i1
  %v977 = pyc.alias %v976 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v978 = pyc.or %v971, %v977 : i1
  %v979 = pyc.alias %v978 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v980 = pyc.not %v977 : i1
  %v981 = pyc.mux %v980, %v974, %v368 : i128
  %v982 = pyc.alias %v981 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v983 = pyc.eq %v413, %v940 : i16
  %v984 = pyc.and %v333, %v983 : i1
  %v985 = pyc.alias %v984 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v986 = pyc.or %v979, %v985 : i1
  %v987 = pyc.alias %v986 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v988 = pyc.not %v985 : i1
  %v989 = pyc.mux %v988, %v982, %v373 : i128
  %v990 = pyc.alias %v989 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v991 = pyc.eq %v418, %v940 : i16
  %v992 = pyc.and %v338, %v991 : i1
  %v993 = pyc.alias %v992 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v994 = pyc.or %v987, %v993 : i1
  %v995 = pyc.alias %v994 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v996 = pyc.not %v993 : i1
  %v997 = pyc.mux %v996, %v990, %v378 : i128
  %v998 = pyc.alias %v997 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v999 = pyc.eq %v423, %v940 : i16
  %v1000 = pyc.and %v343, %v999 : i1
  %v1001 = pyc.alias %v1000 {pyc.name = "match__fastfwd_v3_2__L112"} : i1
  %v1002 = pyc.or %v995, %v1001 : i1
  %v1003 = pyc.alias %v1002 {pyc.name = "dep_found__fastfwd_v3_2__L113"} : i1
  %v1004 = pyc.not %v1001 : i1
  %v1005 = pyc.mux %v1004, %v998, %v383 : i128
  %v1006 = pyc.alias %v1005 {pyc.name = "dep_value__fastfwd_v3_2__L114"} : i128
  %v1007 = pyc.constant 0 : i3
  %v1008 = pyc.zext %v1007 : i3 -> i5
  %v1009 = pyc.eq %v924, %v1008 : i5
  %v1010 = pyc.not %v1009 : i1
  %v1011 = pyc.alias %v1010 {pyc.name = "has_dep__fastfwd_v3_2__L116"} : i1
  %v1012 = pyc.and %v1011, %v1003 : i1
  %v1013 = pyc.alias %v1012 {pyc.name = "dep_ready__fastfwd_v3_2__L117"} : i1
  %v1014 = pyc.not %v1011 : i1
  %v1015 = pyc.or %v1014, %v1013 : i1
  %v1016 = pyc.and %v937, %v1015 : i1
  %v1017 = pyc.alias %v1016 {pyc.name = "can_schedule__fastfwd_v3_2__L118"} : i1
  %v1018 = pyc.constant 1 : i3
  %v1019 = pyc.ult %v1018, %v163 : i3
  %v1020 = pyc.and %v143, %v1019 : i1
  %v1021 = pyc.or %v1017, %v1020 : i1
  pyc.assign %v139, %v1021 : i1
  %v1022 = pyc.constant 1 : i3
  %v1023 = pyc.zext %v1022 : i3 -> i5
  %v1024 = pyc.add %v920, %v1023 : i5
  %v1025 = pyc.constant 1 : i3
  %v1026 = pyc.sub %v163, %v1025 : i3
  %v1027 = pyc.constant 0 : i3
  %v1028 = pyc.mux %v143, %v1026, %v1027 : i3
  %v1029 = pyc.zext %v1028 : i3 -> i5
  %v1030 = pyc.mux %v1017, %v1024, %v1029 : i5
  %v1031 = pyc.alias %v1030 {pyc.name = "new_timer__fastfwd_v3_2__L122"} : i5
  %v1032 = pyc.trunc %v1031 : i5 -> i3
  pyc.assign %v159, %v1032 : i3
  %v1033 = pyc.zext %v183 : i6 -> i16
  %v1034 = pyc.mux %v1017, %v930, %v1033 : i16
  %v1035 = pyc.trunc %v1034 : i16 -> i6
  pyc.assign %v179, %v1035 : i6
  %v1036 = pyc.mux %v1017, %v107, %v203 : i16
  pyc.assign %v199, %v1036 : i16
  pyc.assign %v219, %v1017 : i1
  %v1037 = pyc.constant 0 : i128
  %v1038 = pyc.mux %v1017, %v67, %v1037 : i128
  pyc.assign %v239, %v1038 : i128
  %v1039 = pyc.constant 0 : i2
  %v1040 = pyc.zext %v1039 : i2 -> i5
  %v1041 = pyc.mux %v1017, %v920, %v1040 : i5
  %v1042 = pyc.trunc %v1041 : i5 -> i2
  pyc.assign %v259, %v1042 : i2
  %v1043 = pyc.and %v1011, %v1017 : i1
  pyc.assign %v279, %v1043 : i1
  %v1044 = pyc.and %v1011, %v1017 : i1
  %v1045 = pyc.constant 0 : i128
  %v1046 = pyc.mux %v1044, %v1006, %v1045 : i128
  pyc.assign %v299, %v1046 : i128
  %v1047 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v1048 = pyc.constant 1 : i1
  %v1049 = pyc.constant 0 : i1
  %v1050 = pyc.reg %clk, %rst, %v1048, %v1047, %v1049 : i1
  %v1051 = pyc.alias %v1050 {pyc.name = "rob0_valid"} : i1
  %v1052 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v1053 = pyc.constant 1 : i1
  %v1054 = pyc.constant 0 : i1
  %v1055 = pyc.reg %clk, %rst, %v1053, %v1052, %v1054 : i1
  %v1056 = pyc.alias %v1055 {pyc.name = "rob1_valid"} : i1
  %v1057 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v1058 = pyc.constant 1 : i1
  %v1059 = pyc.constant 0 : i1
  %v1060 = pyc.reg %clk, %rst, %v1058, %v1057, %v1059 : i1
  %v1061 = pyc.alias %v1060 {pyc.name = "rob2_valid"} : i1
  %v1062 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v1063 = pyc.constant 1 : i1
  %v1064 = pyc.constant 0 : i1
  %v1065 = pyc.reg %clk, %rst, %v1063, %v1062, %v1064 : i1
  %v1066 = pyc.alias %v1065 {pyc.name = "rob3_valid"} : i1
  %v1067 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v1068 = pyc.constant 1 : i1
  %v1069 = pyc.constant 0 : i1
  %v1070 = pyc.reg %clk, %rst, %v1068, %v1067, %v1069 : i1
  %v1071 = pyc.alias %v1070 {pyc.name = "rob4_valid"} : i1
  %v1072 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v1073 = pyc.constant 1 : i1
  %v1074 = pyc.constant 0 : i1
  %v1075 = pyc.reg %clk, %rst, %v1073, %v1072, %v1074 : i1
  %v1076 = pyc.alias %v1075 {pyc.name = "rob5_valid"} : i1
  %v1077 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v1078 = pyc.constant 1 : i1
  %v1079 = pyc.constant 0 : i1
  %v1080 = pyc.reg %clk, %rst, %v1078, %v1077, %v1079 : i1
  %v1081 = pyc.alias %v1080 {pyc.name = "rob6_valid"} : i1
  %v1082 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v1083 = pyc.constant 1 : i1
  %v1084 = pyc.constant 0 : i1
  %v1085 = pyc.reg %clk, %rst, %v1083, %v1082, %v1084 : i1
  %v1086 = pyc.alias %v1085 {pyc.name = "rob7_valid"} : i1
  %v1087 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v1088 = pyc.constant 1 : i1
  %v1089 = pyc.constant 0 : i128
  %v1090 = pyc.reg %clk, %rst, %v1088, %v1087, %v1089 : i128
  %v1091 = pyc.alias %v1090 {pyc.name = "rob0_data"} : i128
  %v1092 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v1093 = pyc.constant 1 : i1
  %v1094 = pyc.constant 0 : i128
  %v1095 = pyc.reg %clk, %rst, %v1093, %v1092, %v1094 : i128
  %v1096 = pyc.alias %v1095 {pyc.name = "rob1_data"} : i128
  %v1097 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v1098 = pyc.constant 1 : i1
  %v1099 = pyc.constant 0 : i128
  %v1100 = pyc.reg %clk, %rst, %v1098, %v1097, %v1099 : i128
  %v1101 = pyc.alias %v1100 {pyc.name = "rob2_data"} : i128
  %v1102 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v1103 = pyc.constant 1 : i1
  %v1104 = pyc.constant 0 : i128
  %v1105 = pyc.reg %clk, %rst, %v1103, %v1102, %v1104 : i128
  %v1106 = pyc.alias %v1105 {pyc.name = "rob3_data"} : i128
  %v1107 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v1108 = pyc.constant 1 : i1
  %v1109 = pyc.constant 0 : i128
  %v1110 = pyc.reg %clk, %rst, %v1108, %v1107, %v1109 : i128
  %v1111 = pyc.alias %v1110 {pyc.name = "rob4_data"} : i128
  %v1112 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v1113 = pyc.constant 1 : i1
  %v1114 = pyc.constant 0 : i128
  %v1115 = pyc.reg %clk, %rst, %v1113, %v1112, %v1114 : i128
  %v1116 = pyc.alias %v1115 {pyc.name = "rob5_data"} : i128
  %v1117 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v1118 = pyc.constant 1 : i1
  %v1119 = pyc.constant 0 : i128
  %v1120 = pyc.reg %clk, %rst, %v1118, %v1117, %v1119 : i128
  %v1121 = pyc.alias %v1120 {pyc.name = "rob6_data"} : i128
  %v1122 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v1123 = pyc.constant 1 : i1
  %v1124 = pyc.constant 0 : i128
  %v1125 = pyc.reg %clk, %rst, %v1123, %v1122, %v1124 : i128
  %v1126 = pyc.alias %v1125 {pyc.name = "rob7_data"} : i128
  %v1127 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v1128 = pyc.constant 1 : i1
  %v1129 = pyc.constant 0 : i16
  %v1130 = pyc.reg %clk, %rst, %v1128, %v1127, %v1129 : i16
  %v1131 = pyc.alias %v1130 {pyc.name = "rob0_seq"} : i16
  %v1132 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v1133 = pyc.constant 1 : i1
  %v1134 = pyc.constant 0 : i16
  %v1135 = pyc.reg %clk, %rst, %v1133, %v1132, %v1134 : i16
  %v1136 = pyc.alias %v1135 {pyc.name = "rob1_seq"} : i16
  %v1137 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v1138 = pyc.constant 1 : i1
  %v1139 = pyc.constant 0 : i16
  %v1140 = pyc.reg %clk, %rst, %v1138, %v1137, %v1139 : i16
  %v1141 = pyc.alias %v1140 {pyc.name = "rob2_seq"} : i16
  %v1142 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v1143 = pyc.constant 1 : i1
  %v1144 = pyc.constant 0 : i16
  %v1145 = pyc.reg %clk, %rst, %v1143, %v1142, %v1144 : i16
  %v1146 = pyc.alias %v1145 {pyc.name = "rob3_seq"} : i16
  %v1147 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v1148 = pyc.constant 1 : i1
  %v1149 = pyc.constant 0 : i16
  %v1150 = pyc.reg %clk, %rst, %v1148, %v1147, %v1149 : i16
  %v1151 = pyc.alias %v1150 {pyc.name = "rob4_seq"} : i16
  %v1152 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v1153 = pyc.constant 1 : i1
  %v1154 = pyc.constant 0 : i16
  %v1155 = pyc.reg %clk, %rst, %v1153, %v1152, %v1154 : i16
  %v1156 = pyc.alias %v1155 {pyc.name = "rob5_seq"} : i16
  %v1157 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v1158 = pyc.constant 1 : i1
  %v1159 = pyc.constant 0 : i16
  %v1160 = pyc.reg %clk, %rst, %v1158, %v1157, %v1159 : i16
  %v1161 = pyc.alias %v1160 {pyc.name = "rob6_seq"} : i16
  %v1162 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v1163 = pyc.constant 1 : i1
  %v1164 = pyc.constant 0 : i16
  %v1165 = pyc.reg %clk, %rst, %v1163, %v1162, %v1164 : i16
  %v1166 = pyc.alias %v1165 {pyc.name = "rob7_seq"} : i16
  %v1167 = pyc.wire {pyc.name = "rob_tail__next"} : i3
  %v1168 = pyc.constant 1 : i1
  %v1169 = pyc.constant 0 : i3
  %v1170 = pyc.reg %clk, %rst, %v1168, %v1167, %v1169 : i3
  %v1171 = pyc.alias %v1170 {pyc.name = "rob_tail"} : i3
  %v1172 = pyc.alias %v1171 {pyc.name = "rob_tail__fastfwd_v3_2__L137"} : i3
  %v1173 = pyc.wire {pyc.name = "next_output_seq__next"} : i16
  %v1174 = pyc.constant 1 : i1
  %v1175 = pyc.constant 0 : i16
  %v1176 = pyc.reg %clk, %rst, %v1174, %v1173, %v1175 : i16
  %v1177 = pyc.alias %v1176 {pyc.name = "next_output_seq"} : i16
  %v1178 = pyc.alias %v1177 {pyc.name = "next_output_seq__fastfwd_v3_2__L138"} : i16
  %v1179 = pyc.alias %v1172 {pyc.name = "tail_ptr__fastfwd_v3_2__L140"} : i3
  %v1180 = pyc.constant 0 : i3
  %v1181 = pyc.eq %v1179, %v1180 : i3
  %v1182 = pyc.and %v462, %v1181 : i1
  %v1183 = pyc.alias %v1182 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1184 = pyc.or %v1183, %v1051 : i1
  pyc.assign %v1047, %v1184 : i1
  %v1185 = pyc.mux %v1183, %v465, %v1091 : i128
  pyc.assign %v1087, %v1185 : i128
  %v1186 = pyc.mux %v1183, %v468, %v1131 : i16
  pyc.assign %v1127, %v1186 : i16
  %v1187 = pyc.constant 1 : i3
  %v1188 = pyc.eq %v1179, %v1187 : i3
  %v1189 = pyc.and %v462, %v1188 : i1
  %v1190 = pyc.alias %v1189 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1191 = pyc.or %v1190, %v1056 : i1
  pyc.assign %v1052, %v1191 : i1
  %v1192 = pyc.mux %v1190, %v465, %v1096 : i128
  pyc.assign %v1092, %v1192 : i128
  %v1193 = pyc.mux %v1190, %v468, %v1136 : i16
  pyc.assign %v1132, %v1193 : i16
  %v1194 = pyc.constant 2 : i3
  %v1195 = pyc.eq %v1179, %v1194 : i3
  %v1196 = pyc.and %v462, %v1195 : i1
  %v1197 = pyc.alias %v1196 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1198 = pyc.or %v1197, %v1061 : i1
  pyc.assign %v1057, %v1198 : i1
  %v1199 = pyc.mux %v1197, %v465, %v1101 : i128
  pyc.assign %v1097, %v1199 : i128
  %v1200 = pyc.mux %v1197, %v468, %v1141 : i16
  pyc.assign %v1137, %v1200 : i16
  %v1201 = pyc.constant 3 : i3
  %v1202 = pyc.eq %v1179, %v1201 : i3
  %v1203 = pyc.and %v462, %v1202 : i1
  %v1204 = pyc.alias %v1203 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1205 = pyc.or %v1204, %v1066 : i1
  pyc.assign %v1062, %v1205 : i1
  %v1206 = pyc.mux %v1204, %v465, %v1106 : i128
  pyc.assign %v1102, %v1206 : i128
  %v1207 = pyc.mux %v1204, %v468, %v1146 : i16
  pyc.assign %v1142, %v1207 : i16
  %v1208 = pyc.constant 4 : i3
  %v1209 = pyc.eq %v1179, %v1208 : i3
  %v1210 = pyc.and %v462, %v1209 : i1
  %v1211 = pyc.alias %v1210 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1212 = pyc.or %v1211, %v1071 : i1
  pyc.assign %v1067, %v1212 : i1
  %v1213 = pyc.mux %v1211, %v465, %v1111 : i128
  pyc.assign %v1107, %v1213 : i128
  %v1214 = pyc.mux %v1211, %v468, %v1151 : i16
  pyc.assign %v1147, %v1214 : i16
  %v1215 = pyc.constant 5 : i3
  %v1216 = pyc.eq %v1179, %v1215 : i3
  %v1217 = pyc.and %v462, %v1216 : i1
  %v1218 = pyc.alias %v1217 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1219 = pyc.or %v1218, %v1076 : i1
  pyc.assign %v1072, %v1219 : i1
  %v1220 = pyc.mux %v1218, %v465, %v1116 : i128
  pyc.assign %v1112, %v1220 : i128
  %v1221 = pyc.mux %v1218, %v468, %v1156 : i16
  pyc.assign %v1152, %v1221 : i16
  %v1222 = pyc.constant 6 : i3
  %v1223 = pyc.eq %v1179, %v1222 : i3
  %v1224 = pyc.and %v462, %v1223 : i1
  %v1225 = pyc.alias %v1224 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1226 = pyc.or %v1225, %v1081 : i1
  pyc.assign %v1077, %v1226 : i1
  %v1227 = pyc.mux %v1225, %v465, %v1121 : i128
  pyc.assign %v1117, %v1227 : i128
  %v1228 = pyc.mux %v1225, %v468, %v1161 : i16
  pyc.assign %v1157, %v1228 : i16
  %v1229 = pyc.constant 7 : i3
  %v1230 = pyc.eq %v1179, %v1229 : i3
  %v1231 = pyc.and %v462, %v1230 : i1
  %v1232 = pyc.alias %v1231 {pyc.name = "should_write__fastfwd_v3_2__L142"} : i1
  %v1233 = pyc.or %v1232, %v1086 : i1
  pyc.assign %v1082, %v1233 : i1
  %v1234 = pyc.mux %v1232, %v465, %v1126 : i128
  pyc.assign %v1122, %v1234 : i128
  %v1235 = pyc.mux %v1232, %v468, %v1166 : i16
  pyc.assign %v1162, %v1235 : i16
  %v1236 = pyc.constant 1 : i3
  %v1237 = pyc.add %v1179, %v1236 : i3
  %v1238 = pyc.constant 7 : i3
  %v1239 = pyc.and %v1237, %v1238 : i3
  %v1240 = pyc.mux %v462, %v1239, %v1179 : i3
  pyc.assign %v1167, %v1240 : i3
  %v1241 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1242 = pyc.constant 1 : i1
  %v1243 = pyc.constant 0 : i1
  %v1244 = pyc.reg %clk, %rst, %v1242, %v1241, %v1243 : i1
  %v1245 = pyc.alias %v1244 {pyc.name = "lane0_out_vld"} : i1
  %v1246 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1247 = pyc.constant 1 : i1
  %v1248 = pyc.constant 0 : i1
  %v1249 = pyc.reg %clk, %rst, %v1247, %v1246, %v1248 : i1
  %v1250 = pyc.alias %v1249 {pyc.name = "lane1_out_vld"} : i1
  %v1251 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1252 = pyc.constant 1 : i1
  %v1253 = pyc.constant 0 : i1
  %v1254 = pyc.reg %clk, %rst, %v1252, %v1251, %v1253 : i1
  %v1255 = pyc.alias %v1254 {pyc.name = "lane2_out_vld"} : i1
  %v1256 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1257 = pyc.constant 1 : i1
  %v1258 = pyc.constant 0 : i1
  %v1259 = pyc.reg %clk, %rst, %v1257, %v1256, %v1258 : i1
  %v1260 = pyc.alias %v1259 {pyc.name = "lane3_out_vld"} : i1
  %v1261 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1262 = pyc.constant 1 : i1
  %v1263 = pyc.constant 0 : i128
  %v1264 = pyc.reg %clk, %rst, %v1262, %v1261, %v1263 : i128
  %v1265 = pyc.alias %v1264 {pyc.name = "lane0_out_data"} : i128
  %v1266 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1267 = pyc.constant 1 : i1
  %v1268 = pyc.constant 0 : i128
  %v1269 = pyc.reg %clk, %rst, %v1267, %v1266, %v1268 : i128
  %v1270 = pyc.alias %v1269 {pyc.name = "lane1_out_data"} : i128
  %v1271 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1272 = pyc.constant 1 : i1
  %v1273 = pyc.constant 0 : i128
  %v1274 = pyc.reg %clk, %rst, %v1272, %v1271, %v1273 : i128
  %v1275 = pyc.alias %v1274 {pyc.name = "lane2_out_data"} : i128
  %v1276 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1277 = pyc.constant 1 : i1
  %v1278 = pyc.constant 0 : i128
  %v1279 = pyc.reg %clk, %rst, %v1277, %v1276, %v1278 : i128
  %v1280 = pyc.alias %v1279 {pyc.name = "lane3_out_data"} : i128
  %v1281 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_2__L153"} : i2
  %v1282 = pyc.alias %v1178 {pyc.name = "next_seq__fastfwd_v3_2__L154"} : i16
  %v1283 = pyc.eq %v1131, %v1282 : i16
  %v1284 = pyc.and %v1051, %v1283 : i1
  %v1285 = pyc.alias %v1284 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1286 = pyc.constant 0 : i1
  %v1287 = pyc.or %v1285, %v1286 : i1
  %v1288 = pyc.alias %v1287 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1289 = pyc.not %v1285 : i1
  %v1290 = pyc.constant 0 : i128
  %v1291 = pyc.mux %v1289, %v1290, %v1091 : i128
  %v1292 = pyc.alias %v1291 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1293 = pyc.eq %v1136, %v1282 : i16
  %v1294 = pyc.and %v1056, %v1293 : i1
  %v1295 = pyc.alias %v1294 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1296 = pyc.or %v1288, %v1295 : i1
  %v1297 = pyc.alias %v1296 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1298 = pyc.not %v1295 : i1
  %v1299 = pyc.mux %v1298, %v1292, %v1096 : i128
  %v1300 = pyc.alias %v1299 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1301 = pyc.eq %v1141, %v1282 : i16
  %v1302 = pyc.and %v1061, %v1301 : i1
  %v1303 = pyc.alias %v1302 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1304 = pyc.or %v1297, %v1303 : i1
  %v1305 = pyc.alias %v1304 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1306 = pyc.not %v1303 : i1
  %v1307 = pyc.mux %v1306, %v1300, %v1101 : i128
  %v1308 = pyc.alias %v1307 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1309 = pyc.eq %v1146, %v1282 : i16
  %v1310 = pyc.and %v1066, %v1309 : i1
  %v1311 = pyc.alias %v1310 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1312 = pyc.or %v1305, %v1311 : i1
  %v1313 = pyc.alias %v1312 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1314 = pyc.not %v1311 : i1
  %v1315 = pyc.mux %v1314, %v1308, %v1106 : i128
  %v1316 = pyc.alias %v1315 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1317 = pyc.eq %v1151, %v1282 : i16
  %v1318 = pyc.and %v1071, %v1317 : i1
  %v1319 = pyc.alias %v1318 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1320 = pyc.or %v1313, %v1319 : i1
  %v1321 = pyc.alias %v1320 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1322 = pyc.not %v1319 : i1
  %v1323 = pyc.mux %v1322, %v1316, %v1111 : i128
  %v1324 = pyc.alias %v1323 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1325 = pyc.eq %v1156, %v1282 : i16
  %v1326 = pyc.and %v1076, %v1325 : i1
  %v1327 = pyc.alias %v1326 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1328 = pyc.or %v1321, %v1327 : i1
  %v1329 = pyc.alias %v1328 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1330 = pyc.not %v1327 : i1
  %v1331 = pyc.mux %v1330, %v1324, %v1116 : i128
  %v1332 = pyc.alias %v1331 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1333 = pyc.eq %v1161, %v1282 : i16
  %v1334 = pyc.and %v1081, %v1333 : i1
  %v1335 = pyc.alias %v1334 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1336 = pyc.or %v1329, %v1335 : i1
  %v1337 = pyc.alias %v1336 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1338 = pyc.not %v1335 : i1
  %v1339 = pyc.mux %v1338, %v1332, %v1121 : i128
  %v1340 = pyc.alias %v1339 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1341 = pyc.eq %v1166, %v1282 : i16
  %v1342 = pyc.and %v1086, %v1341 : i1
  %v1343 = pyc.alias %v1342 {pyc.name = "match__fastfwd_v3_2__L159"} : i1
  %v1344 = pyc.or %v1337, %v1343 : i1
  %v1345 = pyc.alias %v1344 {pyc.name = "has_next_seq__fastfwd_v3_2__L160"} : i1
  %v1346 = pyc.not %v1343 : i1
  %v1347 = pyc.mux %v1346, %v1340, %v1126 : i128
  %v1348 = pyc.alias %v1347 {pyc.name = "next_seq_data__fastfwd_v3_2__L161"} : i128
  %v1349 = pyc.constant 0 : i2
  %v1350 = pyc.eq %v1281, %v1349 : i2
  %v1351 = pyc.alias %v1350 {pyc.name = "this_lane__fastfwd_v3_2__L164"} : i1
  %v1352 = pyc.and %v1351, %v1345 : i1
  %v1353 = pyc.alias %v1352 {pyc.name = "should_output__fastfwd_v3_2__L165"} : i1
  pyc.assign %v1241, %v1353 : i1
  %v1354 = pyc.constant 0 : i128
  %v1355 = pyc.mux %v1353, %v1348, %v1354 : i128
  pyc.assign %v1261, %v1355 : i128
  %v1356 = pyc.constant 1 : i2
  %v1357 = pyc.eq %v1281, %v1356 : i2
  %v1358 = pyc.alias %v1357 {pyc.name = "this_lane__fastfwd_v3_2__L164"} : i1
  %v1359 = pyc.and %v1358, %v1345 : i1
  %v1360 = pyc.alias %v1359 {pyc.name = "should_output__fastfwd_v3_2__L165"} : i1
  pyc.assign %v1246, %v1360 : i1
  %v1361 = pyc.constant 0 : i128
  %v1362 = pyc.mux %v1360, %v1348, %v1361 : i128
  pyc.assign %v1266, %v1362 : i128
  %v1363 = pyc.constant 2 : i2
  %v1364 = pyc.eq %v1281, %v1363 : i2
  %v1365 = pyc.alias %v1364 {pyc.name = "this_lane__fastfwd_v3_2__L164"} : i1
  %v1366 = pyc.and %v1365, %v1345 : i1
  %v1367 = pyc.alias %v1366 {pyc.name = "should_output__fastfwd_v3_2__L165"} : i1
  pyc.assign %v1251, %v1367 : i1
  %v1368 = pyc.constant 0 : i128
  %v1369 = pyc.mux %v1367, %v1348, %v1368 : i128
  pyc.assign %v1271, %v1369 : i128
  %v1370 = pyc.constant 3 : i2
  %v1371 = pyc.eq %v1281, %v1370 : i2
  %v1372 = pyc.alias %v1371 {pyc.name = "this_lane__fastfwd_v3_2__L164"} : i1
  %v1373 = pyc.and %v1372, %v1345 : i1
  %v1374 = pyc.alias %v1373 {pyc.name = "should_output__fastfwd_v3_2__L165"} : i1
  pyc.assign %v1256, %v1374 : i1
  %v1375 = pyc.constant 0 : i128
  %v1376 = pyc.mux %v1374, %v1348, %v1375 : i128
  pyc.assign %v1276, %v1376 : i128
  %v1377 = pyc.or %v1245, %v1250 : i1
  %v1378 = pyc.or %v1377, %v1255 : i1
  %v1379 = pyc.or %v1378, %v1260 : i1
  %v1380 = pyc.alias %v1379 {pyc.name = "any_output__fastfwd_v3_2__L169"} : i1
  %v1381 = pyc.constant 1 : i2
  %v1382 = pyc.add %v1281, %v1381 : i2
  %v1383 = pyc.constant 3 : i2
  %v1384 = pyc.and %v1382, %v1383 : i2
  %v1385 = pyc.mux %v1380, %v1384, %v1281 : i2
  pyc.assign %v7, %v1385 : i2
  %v1386 = pyc.constant 1 : i16
  %v1387 = pyc.add %v1282, %v1386 : i16
  %v1388 = pyc.mux %v1380, %v1387, %v1282 : i16
  pyc.assign %v1173, %v1388 : i16
  %v1389 = pyc.eq %v1131, %v1282 : i16
  %v1390 = pyc.and %v1380, %v1389 : i1
  %v1391 = pyc.alias %v1390 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1392 = pyc.constant 0 : i1
  %v1393 = pyc.mux %v1391, %v1392, %v1051 : i1
  pyc.assign %v1047, %v1393 : i1
  %v1394 = pyc.eq %v1136, %v1282 : i16
  %v1395 = pyc.and %v1380, %v1394 : i1
  %v1396 = pyc.alias %v1395 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1397 = pyc.constant 0 : i1
  %v1398 = pyc.mux %v1396, %v1397, %v1056 : i1
  pyc.assign %v1052, %v1398 : i1
  %v1399 = pyc.eq %v1141, %v1282 : i16
  %v1400 = pyc.and %v1380, %v1399 : i1
  %v1401 = pyc.alias %v1400 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1402 = pyc.constant 0 : i1
  %v1403 = pyc.mux %v1401, %v1402, %v1061 : i1
  pyc.assign %v1057, %v1403 : i1
  %v1404 = pyc.eq %v1146, %v1282 : i16
  %v1405 = pyc.and %v1380, %v1404 : i1
  %v1406 = pyc.alias %v1405 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1407 = pyc.constant 0 : i1
  %v1408 = pyc.mux %v1406, %v1407, %v1066 : i1
  pyc.assign %v1062, %v1408 : i1
  %v1409 = pyc.eq %v1151, %v1282 : i16
  %v1410 = pyc.and %v1380, %v1409 : i1
  %v1411 = pyc.alias %v1410 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1412 = pyc.constant 0 : i1
  %v1413 = pyc.mux %v1411, %v1412, %v1071 : i1
  pyc.assign %v1067, %v1413 : i1
  %v1414 = pyc.eq %v1156, %v1282 : i16
  %v1415 = pyc.and %v1380, %v1414 : i1
  %v1416 = pyc.alias %v1415 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1417 = pyc.constant 0 : i1
  %v1418 = pyc.mux %v1416, %v1417, %v1076 : i1
  pyc.assign %v1072, %v1418 : i1
  %v1419 = pyc.eq %v1161, %v1282 : i16
  %v1420 = pyc.and %v1380, %v1419 : i1
  %v1421 = pyc.alias %v1420 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1422 = pyc.constant 0 : i1
  %v1423 = pyc.mux %v1421, %v1422, %v1081 : i1
  pyc.assign %v1077, %v1423 : i1
  %v1424 = pyc.eq %v1166, %v1282 : i16
  %v1425 = pyc.and %v1380, %v1424 : i1
  %v1426 = pyc.alias %v1425 {pyc.name = "should_clear__fastfwd_v3_2__L174"} : i1
  %v1427 = pyc.constant 0 : i1
  %v1428 = pyc.mux %v1426, %v1427, %v1086 : i1
  pyc.assign %v1082, %v1428 : i1
  %v1429 = pyc.constant 0 : i1
  %v1430 = pyc.add %v32, %v1429 : i1
  %v1431 = pyc.add %v1430, %v37 : i1
  %v1432 = pyc.add %v1431, %v42 : i1
  %v1433 = pyc.add %v1432, %v47 : i1
  %v1434 = pyc.alias %v1433 {pyc.name = "pending_cnt__fastfwd_v3_2__L178"} : i1
  %v1435 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1436 = pyc.constant 1 : i1
  %v1437 = pyc.constant 0 : i1
  %v1438 = pyc.reg %clk, %rst, %v1436, %v1435, %v1437 : i1
  %v1439 = pyc.alias %v1438 {pyc.name = "bkpr_reg"} : i1
  %v1440 = pyc.alias %v1439 {pyc.name = "bkpr__fastfwd_v3_2__L179"} : i1
  %v1441 = pyc.constant 10 : i4
  %v1442 = pyc.zext %v1434 : i1 -> i4
  %v1443 = pyc.ult %v1442, %v1441 : i4
  %v1444 = pyc.not %v1443 : i1
  pyc.assign %v1435, %v1444 : i1
  func.return %v1245, %v1265, %v1250, %v1270, %v1255, %v1275, %v1260, %v1280, %v1440 : i1, i128, i1, i128, i1, i128, i1, i128, i1
}

}

