module attributes {pyc.top = @fastfwd_v3, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_integrated__L64"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v3_integrated__L65"} : i2
  %v13 = pyc.wire {pyc.name = "cycle_cnt__next"} : i16
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i16
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i16
  %v17 = pyc.alias %v16 {pyc.name = "cycle_cnt"} : i16
  %v18 = pyc.alias %v17 {pyc.name = "cycle_cnt__fastfwd_v3_integrated__L66"} : i16
  %v19 = pyc.constant 1 : i16
  %v20 = pyc.add %v18, %v19 : i16
  pyc.assign %v13, %v20 : i16
  %v21 = pyc.alias %v18 {pyc.name = "current_cycle__fastfwd_v3_integrated__L69"} : i16
  %v22 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_integrated__L75"} : i16
  %v23 = pyc.alias %lane0_pkt_in_vld {pyc.name = "offset_1__fastfwd_v3_integrated__L79"} : i1
  %v24 = pyc.add %v23, %lane1_pkt_in_vld : i1
  %v25 = pyc.alias %v24 {pyc.name = "offset_2__fastfwd_v3_integrated__L80"} : i1
  %v26 = pyc.add %v25, %lane2_pkt_in_vld : i1
  %v27 = pyc.alias %v26 {pyc.name = "offset_3__fastfwd_v3_integrated__L81"} : i1
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
  %v116 = pyc.add %lane0_pkt_in_vld, %lane1_pkt_in_vld : i1
  %v117 = pyc.add %v116, %lane2_pkt_in_vld : i1
  %v118 = pyc.add %v117, %lane3_pkt_in_vld : i1
  %v119 = pyc.alias %v118 {pyc.name = "total_input__fastfwd_v3_integrated__L97"} : i1
  %v120 = pyc.zext %v119 : i1 -> i16
  %v121 = pyc.add %v22, %v120 : i16
  pyc.assign %v1, %v121 : i16
  %v122 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v123 = pyc.constant 1 : i1
  %v124 = pyc.constant 0 : i1
  %v125 = pyc.reg %clk, %rst, %v123, %v122, %v124 : i1
  %v126 = pyc.alias %v125 {pyc.name = "fe0_busy"} : i1
  %v127 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v128 = pyc.constant 1 : i1
  %v129 = pyc.constant 0 : i1
  %v130 = pyc.reg %clk, %rst, %v128, %v127, %v129 : i1
  %v131 = pyc.alias %v130 {pyc.name = "fe1_busy"} : i1
  %v132 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v133 = pyc.constant 1 : i1
  %v134 = pyc.constant 0 : i1
  %v135 = pyc.reg %clk, %rst, %v133, %v132, %v134 : i1
  %v136 = pyc.alias %v135 {pyc.name = "fe2_busy"} : i1
  %v137 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v138 = pyc.constant 1 : i1
  %v139 = pyc.constant 0 : i1
  %v140 = pyc.reg %clk, %rst, %v138, %v137, %v139 : i1
  %v141 = pyc.alias %v140 {pyc.name = "fe3_busy"} : i1
  %v142 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v143 = pyc.constant 1 : i1
  %v144 = pyc.constant 0 : i3
  %v145 = pyc.reg %clk, %rst, %v143, %v142, %v144 : i3
  %v146 = pyc.alias %v145 {pyc.name = "fe0_timer"} : i3
  %v147 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v148 = pyc.constant 1 : i1
  %v149 = pyc.constant 0 : i3
  %v150 = pyc.reg %clk, %rst, %v148, %v147, %v149 : i3
  %v151 = pyc.alias %v150 {pyc.name = "fe1_timer"} : i3
  %v152 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v153 = pyc.constant 1 : i1
  %v154 = pyc.constant 0 : i3
  %v155 = pyc.reg %clk, %rst, %v153, %v152, %v154 : i3
  %v156 = pyc.alias %v155 {pyc.name = "fe2_timer"} : i3
  %v157 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v158 = pyc.constant 1 : i1
  %v159 = pyc.constant 0 : i3
  %v160 = pyc.reg %clk, %rst, %v158, %v157, %v159 : i3
  %v161 = pyc.alias %v160 {pyc.name = "fe3_timer"} : i3
  %v162 = pyc.wire {pyc.name = "fe0_last_finish__next"} : i6
  %v163 = pyc.constant 1 : i1
  %v164 = pyc.constant 0 : i6
  %v165 = pyc.reg %clk, %rst, %v163, %v162, %v164 : i6
  %v166 = pyc.alias %v165 {pyc.name = "fe0_last_finish"} : i6
  %v167 = pyc.wire {pyc.name = "fe1_last_finish__next"} : i6
  %v168 = pyc.constant 1 : i1
  %v169 = pyc.constant 0 : i6
  %v170 = pyc.reg %clk, %rst, %v168, %v167, %v169 : i6
  %v171 = pyc.alias %v170 {pyc.name = "fe1_last_finish"} : i6
  %v172 = pyc.wire {pyc.name = "fe2_last_finish__next"} : i6
  %v173 = pyc.constant 1 : i1
  %v174 = pyc.constant 0 : i6
  %v175 = pyc.reg %clk, %rst, %v173, %v172, %v174 : i6
  %v176 = pyc.alias %v175 {pyc.name = "fe2_last_finish"} : i6
  %v177 = pyc.wire {pyc.name = "fe3_last_finish__next"} : i6
  %v178 = pyc.constant 1 : i1
  %v179 = pyc.constant 0 : i6
  %v180 = pyc.reg %clk, %rst, %v178, %v177, %v179 : i6
  %v181 = pyc.alias %v180 {pyc.name = "fe3_last_finish"} : i6
  %v182 = pyc.wire {pyc.name = "fwd0_pkt_data_vld__next"} : i1
  %v183 = pyc.constant 1 : i1
  %v184 = pyc.constant 0 : i1
  %v185 = pyc.reg %clk, %rst, %v183, %v182, %v184 : i1
  %v186 = pyc.alias %v185 {pyc.name = "fwd0_pkt_data_vld"} : i1
  %v187 = pyc.wire {pyc.name = "fwd1_pkt_data_vld__next"} : i1
  %v188 = pyc.constant 1 : i1
  %v189 = pyc.constant 0 : i1
  %v190 = pyc.reg %clk, %rst, %v188, %v187, %v189 : i1
  %v191 = pyc.alias %v190 {pyc.name = "fwd1_pkt_data_vld"} : i1
  %v192 = pyc.wire {pyc.name = "fwd2_pkt_data_vld__next"} : i1
  %v193 = pyc.constant 1 : i1
  %v194 = pyc.constant 0 : i1
  %v195 = pyc.reg %clk, %rst, %v193, %v192, %v194 : i1
  %v196 = pyc.alias %v195 {pyc.name = "fwd2_pkt_data_vld"} : i1
  %v197 = pyc.wire {pyc.name = "fwd3_pkt_data_vld__next"} : i1
  %v198 = pyc.constant 1 : i1
  %v199 = pyc.constant 0 : i1
  %v200 = pyc.reg %clk, %rst, %v198, %v197, %v199 : i1
  %v201 = pyc.alias %v200 {pyc.name = "fwd3_pkt_data_vld"} : i1
  %v202 = pyc.wire {pyc.name = "fwd0_pkt_data__next"} : i128
  %v203 = pyc.constant 1 : i1
  %v204 = pyc.constant 0 : i128
  %v205 = pyc.reg %clk, %rst, %v203, %v202, %v204 : i128
  %v206 = pyc.alias %v205 {pyc.name = "fwd0_pkt_data"} : i128
  %v207 = pyc.wire {pyc.name = "fwd1_pkt_data__next"} : i128
  %v208 = pyc.constant 1 : i1
  %v209 = pyc.constant 0 : i128
  %v210 = pyc.reg %clk, %rst, %v208, %v207, %v209 : i128
  %v211 = pyc.alias %v210 {pyc.name = "fwd1_pkt_data"} : i128
  %v212 = pyc.wire {pyc.name = "fwd2_pkt_data__next"} : i128
  %v213 = pyc.constant 1 : i1
  %v214 = pyc.constant 0 : i128
  %v215 = pyc.reg %clk, %rst, %v213, %v212, %v214 : i128
  %v216 = pyc.alias %v215 {pyc.name = "fwd2_pkt_data"} : i128
  %v217 = pyc.wire {pyc.name = "fwd3_pkt_data__next"} : i128
  %v218 = pyc.constant 1 : i1
  %v219 = pyc.constant 0 : i128
  %v220 = pyc.reg %clk, %rst, %v218, %v217, %v219 : i128
  %v221 = pyc.alias %v220 {pyc.name = "fwd3_pkt_data"} : i128
  %v222 = pyc.wire {pyc.name = "fwd0_pkt_lat__next"} : i2
  %v223 = pyc.constant 1 : i1
  %v224 = pyc.constant 0 : i2
  %v225 = pyc.reg %clk, %rst, %v223, %v222, %v224 : i2
  %v226 = pyc.alias %v225 {pyc.name = "fwd0_pkt_lat"} : i2
  %v227 = pyc.wire {pyc.name = "fwd1_pkt_lat__next"} : i2
  %v228 = pyc.constant 1 : i1
  %v229 = pyc.constant 0 : i2
  %v230 = pyc.reg %clk, %rst, %v228, %v227, %v229 : i2
  %v231 = pyc.alias %v230 {pyc.name = "fwd1_pkt_lat"} : i2
  %v232 = pyc.wire {pyc.name = "fwd2_pkt_lat__next"} : i2
  %v233 = pyc.constant 1 : i1
  %v234 = pyc.constant 0 : i2
  %v235 = pyc.reg %clk, %rst, %v233, %v232, %v234 : i2
  %v236 = pyc.alias %v235 {pyc.name = "fwd2_pkt_lat"} : i2
  %v237 = pyc.wire {pyc.name = "fwd3_pkt_lat__next"} : i2
  %v238 = pyc.constant 1 : i1
  %v239 = pyc.constant 0 : i2
  %v240 = pyc.reg %clk, %rst, %v238, %v237, %v239 : i2
  %v241 = pyc.alias %v240 {pyc.name = "fwd3_pkt_lat"} : i2
  %v242 = pyc.wire {pyc.name = "fwd0_pkt_dp_vld__next"} : i1
  %v243 = pyc.constant 1 : i1
  %v244 = pyc.constant 0 : i1
  %v245 = pyc.reg %clk, %rst, %v243, %v242, %v244 : i1
  %v246 = pyc.alias %v245 {pyc.name = "fwd0_pkt_dp_vld"} : i1
  %v247 = pyc.wire {pyc.name = "fwd1_pkt_dp_vld__next"} : i1
  %v248 = pyc.constant 1 : i1
  %v249 = pyc.constant 0 : i1
  %v250 = pyc.reg %clk, %rst, %v248, %v247, %v249 : i1
  %v251 = pyc.alias %v250 {pyc.name = "fwd1_pkt_dp_vld"} : i1
  %v252 = pyc.wire {pyc.name = "fwd2_pkt_dp_vld__next"} : i1
  %v253 = pyc.constant 1 : i1
  %v254 = pyc.constant 0 : i1
  %v255 = pyc.reg %clk, %rst, %v253, %v252, %v254 : i1
  %v256 = pyc.alias %v255 {pyc.name = "fwd2_pkt_dp_vld"} : i1
  %v257 = pyc.wire {pyc.name = "fwd3_pkt_dp_vld__next"} : i1
  %v258 = pyc.constant 1 : i1
  %v259 = pyc.constant 0 : i1
  %v260 = pyc.reg %clk, %rst, %v258, %v257, %v259 : i1
  %v261 = pyc.alias %v260 {pyc.name = "fwd3_pkt_dp_vld"} : i1
  %v262 = pyc.wire {pyc.name = "fwd0_pkt_dp_data__next"} : i128
  %v263 = pyc.constant 1 : i1
  %v264 = pyc.constant 0 : i128
  %v265 = pyc.reg %clk, %rst, %v263, %v262, %v264 : i128
  %v266 = pyc.alias %v265 {pyc.name = "fwd0_pkt_dp_data"} : i128
  %v267 = pyc.wire {pyc.name = "fwd1_pkt_dp_data__next"} : i128
  %v268 = pyc.constant 1 : i1
  %v269 = pyc.constant 0 : i128
  %v270 = pyc.reg %clk, %rst, %v268, %v267, %v269 : i128
  %v271 = pyc.alias %v270 {pyc.name = "fwd1_pkt_dp_data"} : i128
  %v272 = pyc.wire {pyc.name = "fwd2_pkt_dp_data__next"} : i128
  %v273 = pyc.constant 1 : i1
  %v274 = pyc.constant 0 : i128
  %v275 = pyc.reg %clk, %rst, %v273, %v272, %v274 : i128
  %v276 = pyc.alias %v275 {pyc.name = "fwd2_pkt_dp_data"} : i128
  %v277 = pyc.wire {pyc.name = "fwd3_pkt_dp_data__next"} : i128
  %v278 = pyc.constant 1 : i1
  %v279 = pyc.constant 0 : i128
  %v280 = pyc.reg %clk, %rst, %v278, %v277, %v279 : i128
  %v281 = pyc.alias %v280 {pyc.name = "fwd3_pkt_dp_data"} : i128
  %v282 = pyc.wire {pyc.name = "fe0_pkt_vld__next"} : i1
  %v283 = pyc.constant 1 : i1
  %v284 = pyc.constant 0 : i1
  %v285 = pyc.reg %clk, %rst, %v283, %v282, %v284 : i1
  %v286 = pyc.alias %v285 {pyc.name = "fe0_pkt_vld"} : i1
  %v287 = pyc.wire {pyc.name = "fe1_pkt_vld__next"} : i1
  %v288 = pyc.constant 1 : i1
  %v289 = pyc.constant 0 : i1
  %v290 = pyc.reg %clk, %rst, %v288, %v287, %v289 : i1
  %v291 = pyc.alias %v290 {pyc.name = "fe1_pkt_vld"} : i1
  %v292 = pyc.wire {pyc.name = "fe2_pkt_vld__next"} : i1
  %v293 = pyc.constant 1 : i1
  %v294 = pyc.constant 0 : i1
  %v295 = pyc.reg %clk, %rst, %v293, %v292, %v294 : i1
  %v296 = pyc.alias %v295 {pyc.name = "fe2_pkt_vld"} : i1
  %v297 = pyc.wire {pyc.name = "fe3_pkt_vld__next"} : i1
  %v298 = pyc.constant 1 : i1
  %v299 = pyc.constant 0 : i1
  %v300 = pyc.reg %clk, %rst, %v298, %v297, %v299 : i1
  %v301 = pyc.alias %v300 {pyc.name = "fe3_pkt_vld"} : i1
  %v302 = pyc.wire {pyc.name = "fe0_pkt_data__next"} : i128
  %v303 = pyc.constant 1 : i1
  %v304 = pyc.constant 0 : i128
  %v305 = pyc.reg %clk, %rst, %v303, %v302, %v304 : i128
  %v306 = pyc.alias %v305 {pyc.name = "fe0_pkt_data"} : i128
  %v307 = pyc.wire {pyc.name = "fe1_pkt_data__next"} : i128
  %v308 = pyc.constant 1 : i1
  %v309 = pyc.constant 0 : i128
  %v310 = pyc.reg %clk, %rst, %v308, %v307, %v309 : i128
  %v311 = pyc.alias %v310 {pyc.name = "fe1_pkt_data"} : i128
  %v312 = pyc.wire {pyc.name = "fe2_pkt_data__next"} : i128
  %v313 = pyc.constant 1 : i1
  %v314 = pyc.constant 0 : i128
  %v315 = pyc.reg %clk, %rst, %v313, %v312, %v314 : i128
  %v316 = pyc.alias %v315 {pyc.name = "fe2_pkt_data"} : i128
  %v317 = pyc.wire {pyc.name = "fe3_pkt_data__next"} : i128
  %v318 = pyc.constant 1 : i1
  %v319 = pyc.constant 0 : i128
  %v320 = pyc.reg %clk, %rst, %v318, %v317, %v319 : i128
  %v321 = pyc.alias %v320 {pyc.name = "fe3_pkt_data"} : i128
  %v322 = pyc.wire {pyc.name = "fe0_pkt_seq__next"} : i16
  %v323 = pyc.constant 1 : i1
  %v324 = pyc.constant 0 : i16
  %v325 = pyc.reg %clk, %rst, %v323, %v322, %v324 : i16
  %v326 = pyc.alias %v325 {pyc.name = "fe0_pkt_seq"} : i16
  %v327 = pyc.wire {pyc.name = "fe1_pkt_seq__next"} : i16
  %v328 = pyc.constant 1 : i1
  %v329 = pyc.constant 0 : i16
  %v330 = pyc.reg %clk, %rst, %v328, %v327, %v329 : i16
  %v331 = pyc.alias %v330 {pyc.name = "fe1_pkt_seq"} : i16
  %v332 = pyc.wire {pyc.name = "fe2_pkt_seq__next"} : i16
  %v333 = pyc.constant 1 : i1
  %v334 = pyc.constant 0 : i16
  %v335 = pyc.reg %clk, %rst, %v333, %v332, %v334 : i16
  %v336 = pyc.alias %v335 {pyc.name = "fe2_pkt_seq"} : i16
  %v337 = pyc.wire {pyc.name = "fe3_pkt_seq__next"} : i16
  %v338 = pyc.constant 1 : i1
  %v339 = pyc.constant 0 : i16
  %v340 = pyc.reg %clk, %rst, %v338, %v337, %v339 : i16
  %v341 = pyc.alias %v340 {pyc.name = "fe3_pkt_seq"} : i16
  %v342 = pyc.wire {pyc.name = "fe0_pkt_lat__next"} : i2
  %v343 = pyc.constant 1 : i1
  %v344 = pyc.constant 0 : i2
  %v345 = pyc.reg %clk, %rst, %v343, %v342, %v344 : i2
  %v346 = pyc.alias %v345 {pyc.name = "fe0_pkt_lat"} : i2
  %v347 = pyc.wire {pyc.name = "fe1_pkt_lat__next"} : i2
  %v348 = pyc.constant 1 : i1
  %v349 = pyc.constant 0 : i2
  %v350 = pyc.reg %clk, %rst, %v348, %v347, %v349 : i2
  %v351 = pyc.alias %v350 {pyc.name = "fe1_pkt_lat"} : i2
  %v352 = pyc.wire {pyc.name = "fe2_pkt_lat__next"} : i2
  %v353 = pyc.constant 1 : i1
  %v354 = pyc.constant 0 : i2
  %v355 = pyc.reg %clk, %rst, %v353, %v352, %v354 : i2
  %v356 = pyc.alias %v355 {pyc.name = "fe2_pkt_lat"} : i2
  %v357 = pyc.wire {pyc.name = "fe3_pkt_lat__next"} : i2
  %v358 = pyc.constant 1 : i1
  %v359 = pyc.constant 0 : i2
  %v360 = pyc.reg %clk, %rst, %v358, %v357, %v359 : i2
  %v361 = pyc.alias %v360 {pyc.name = "fe3_pkt_lat"} : i2
  %v362 = pyc.wire {pyc.name = "fe0_pkt_dep__next"} : i3
  %v363 = pyc.constant 1 : i1
  %v364 = pyc.constant 0 : i3
  %v365 = pyc.reg %clk, %rst, %v363, %v362, %v364 : i3
  %v366 = pyc.alias %v365 {pyc.name = "fe0_pkt_dep"} : i3
  %v367 = pyc.wire {pyc.name = "fe1_pkt_dep__next"} : i3
  %v368 = pyc.constant 1 : i1
  %v369 = pyc.constant 0 : i3
  %v370 = pyc.reg %clk, %rst, %v368, %v367, %v369 : i3
  %v371 = pyc.alias %v370 {pyc.name = "fe1_pkt_dep"} : i3
  %v372 = pyc.wire {pyc.name = "fe2_pkt_dep__next"} : i3
  %v373 = pyc.constant 1 : i1
  %v374 = pyc.constant 0 : i3
  %v375 = pyc.reg %clk, %rst, %v373, %v372, %v374 : i3
  %v376 = pyc.alias %v375 {pyc.name = "fe2_pkt_dep"} : i3
  %v377 = pyc.wire {pyc.name = "fe3_pkt_dep__next"} : i3
  %v378 = pyc.constant 1 : i1
  %v379 = pyc.constant 0 : i3
  %v380 = pyc.reg %clk, %rst, %v378, %v377, %v379 : i3
  %v381 = pyc.alias %v380 {pyc.name = "fe3_pkt_dep"} : i3
  %v382 = pyc.constant 3 : i5
  %v383 = pyc.and %v72, %v382 : i5
  %v384 = pyc.alias %v383 {pyc.name = "lat__fastfwd_v3_integrated__L126"} : i5
  %v385 = pyc.lshri %v72 {amount = 2} : i5
  %v386 = pyc.constant 7 : i5
  %v387 = pyc.and %v385, %v386 : i5
  %v388 = pyc.alias %v387 {pyc.name = "dep__fastfwd_v3_integrated__L127"} : i5
  %v389 = pyc.constant 2 : i6
  %v390 = pyc.zext %v389 : i6 -> i16
  %v391 = pyc.add %v21, %v390 : i16
  %v392 = pyc.zext %v384 : i5 -> i16
  %v393 = pyc.add %v391, %v392 : i16
  %v394 = pyc.alias %v393 {pyc.name = "finish_cycle__fastfwd_v3_integrated__L128"} : i16
  %v395 = pyc.zext %v166 : i6 -> i16
  %v396 = pyc.ult %v395, %v394 : i16
  %v397 = pyc.alias %v396 {pyc.name = "constraint_ok__fastfwd_v3_integrated__L131"} : i1
  %v398 = pyc.not %v126 : i1
  %v399 = pyc.and %v398, %v32 : i1
  %v400 = pyc.and %v399, %v397 : i1
  %v401 = pyc.alias %v400 {pyc.name = "can_schedule__fastfwd_v3_integrated__L132"} : i1
  %v402 = pyc.constant 1 : i3
  %v403 = pyc.ult %v402, %v146 : i3
  %v404 = pyc.and %v126, %v403 : i1
  %v405 = pyc.or %v401, %v404 : i1
  %v406 = pyc.alias %v405 {pyc.name = "new_busy__fastfwd_v3_integrated__L135"} : i1
  pyc.assign %v122, %v406 : i1
  %v407 = pyc.constant 1 : i3
  %v408 = pyc.zext %v407 : i3 -> i5
  %v409 = pyc.add %v384, %v408 : i5
  %v410 = pyc.constant 1 : i3
  %v411 = pyc.sub %v146, %v410 : i3
  %v412 = pyc.constant 0 : i3
  %v413 = pyc.mux %v126, %v411, %v412 : i3
  %v414 = pyc.zext %v413 : i3 -> i5
  %v415 = pyc.mux %v401, %v409, %v414 : i5
  %v416 = pyc.alias %v415 {pyc.name = "new_timer__fastfwd_v3_integrated__L138"} : i5
  %v417 = pyc.trunc %v416 : i5 -> i3
  pyc.assign %v142, %v417 : i3
  %v418 = pyc.zext %v166 : i6 -> i16
  %v419 = pyc.mux %v401, %v394, %v418 : i16
  %v420 = pyc.alias %v419 {pyc.name = "new_last_finish__fastfwd_v3_integrated__L142"} : i16
  %v421 = pyc.trunc %v420 : i16 -> i6
  pyc.assign %v162, %v421 : i6
  pyc.assign %v282, %v401 : i1
  %v422 = pyc.mux %v401, %v52, %v306 : i128
  pyc.assign %v302, %v422 : i128
  %v423 = pyc.mux %v401, %v92, %v326 : i16
  pyc.assign %v322, %v423 : i16
  %v424 = pyc.zext %v346 : i2 -> i5
  %v425 = pyc.mux %v401, %v384, %v424 : i5
  %v426 = pyc.trunc %v425 : i5 -> i2
  pyc.assign %v342, %v426 : i2
  %v427 = pyc.zext %v366 : i3 -> i5
  %v428 = pyc.mux %v401, %v388, %v427 : i5
  %v429 = pyc.trunc %v428 : i5 -> i3
  pyc.assign %v362, %v429 : i3
  pyc.assign %v182, %v401 : i1
  %v430 = pyc.constant 0 : i128
  %v431 = pyc.mux %v401, %v52, %v430 : i128
  pyc.assign %v202, %v431 : i128
  %v432 = pyc.constant 0 : i2
  %v433 = pyc.zext %v432 : i2 -> i5
  %v434 = pyc.mux %v401, %v384, %v433 : i5
  %v435 = pyc.trunc %v434 : i5 -> i2
  pyc.assign %v222, %v435 : i2
  %v436 = pyc.constant 0 : i3
  %v437 = pyc.zext %v436 : i3 -> i5
  %v438 = pyc.eq %v388, %v437 : i5
  %v439 = pyc.not %v438 : i1
  %v440 = pyc.alias %v439 {pyc.name = "has_dep__fastfwd_v3_integrated__L158"} : i1
  %v441 = pyc.and %v440, %v401 : i1
  pyc.assign %v242, %v441 : i1
  %v442 = pyc.constant 0 : i128
  pyc.assign %v262, %v442 : i128
  %v443 = pyc.constant 3 : i5
  %v444 = pyc.and %v77, %v443 : i5
  %v445 = pyc.alias %v444 {pyc.name = "lat__fastfwd_v3_integrated__L126"} : i5
  %v446 = pyc.lshri %v77 {amount = 2} : i5
  %v447 = pyc.constant 7 : i5
  %v448 = pyc.and %v446, %v447 : i5
  %v449 = pyc.alias %v448 {pyc.name = "dep__fastfwd_v3_integrated__L127"} : i5
  %v450 = pyc.constant 2 : i6
  %v451 = pyc.zext %v450 : i6 -> i16
  %v452 = pyc.add %v21, %v451 : i16
  %v453 = pyc.zext %v445 : i5 -> i16
  %v454 = pyc.add %v452, %v453 : i16
  %v455 = pyc.alias %v454 {pyc.name = "finish_cycle__fastfwd_v3_integrated__L128"} : i16
  %v456 = pyc.zext %v171 : i6 -> i16
  %v457 = pyc.ult %v456, %v455 : i16
  %v458 = pyc.alias %v457 {pyc.name = "constraint_ok__fastfwd_v3_integrated__L131"} : i1
  %v459 = pyc.not %v131 : i1
  %v460 = pyc.and %v459, %v37 : i1
  %v461 = pyc.and %v460, %v458 : i1
  %v462 = pyc.alias %v461 {pyc.name = "can_schedule__fastfwd_v3_integrated__L132"} : i1
  %v463 = pyc.constant 1 : i3
  %v464 = pyc.ult %v463, %v151 : i3
  %v465 = pyc.and %v131, %v464 : i1
  %v466 = pyc.or %v462, %v465 : i1
  %v467 = pyc.alias %v466 {pyc.name = "new_busy__fastfwd_v3_integrated__L135"} : i1
  pyc.assign %v127, %v467 : i1
  %v468 = pyc.constant 1 : i3
  %v469 = pyc.zext %v468 : i3 -> i5
  %v470 = pyc.add %v445, %v469 : i5
  %v471 = pyc.constant 1 : i3
  %v472 = pyc.sub %v151, %v471 : i3
  %v473 = pyc.constant 0 : i3
  %v474 = pyc.mux %v131, %v472, %v473 : i3
  %v475 = pyc.zext %v474 : i3 -> i5
  %v476 = pyc.mux %v462, %v470, %v475 : i5
  %v477 = pyc.alias %v476 {pyc.name = "new_timer__fastfwd_v3_integrated__L138"} : i5
  %v478 = pyc.trunc %v477 : i5 -> i3
  pyc.assign %v147, %v478 : i3
  %v479 = pyc.zext %v171 : i6 -> i16
  %v480 = pyc.mux %v462, %v455, %v479 : i16
  %v481 = pyc.alias %v480 {pyc.name = "new_last_finish__fastfwd_v3_integrated__L142"} : i16
  %v482 = pyc.trunc %v481 : i16 -> i6
  pyc.assign %v167, %v482 : i6
  pyc.assign %v287, %v462 : i1
  %v483 = pyc.mux %v462, %v57, %v311 : i128
  pyc.assign %v307, %v483 : i128
  %v484 = pyc.mux %v462, %v97, %v331 : i16
  pyc.assign %v327, %v484 : i16
  %v485 = pyc.zext %v351 : i2 -> i5
  %v486 = pyc.mux %v462, %v445, %v485 : i5
  %v487 = pyc.trunc %v486 : i5 -> i2
  pyc.assign %v347, %v487 : i2
  %v488 = pyc.zext %v371 : i3 -> i5
  %v489 = pyc.mux %v462, %v449, %v488 : i5
  %v490 = pyc.trunc %v489 : i5 -> i3
  pyc.assign %v367, %v490 : i3
  pyc.assign %v187, %v462 : i1
  %v491 = pyc.constant 0 : i128
  %v492 = pyc.mux %v462, %v57, %v491 : i128
  pyc.assign %v207, %v492 : i128
  %v493 = pyc.constant 0 : i2
  %v494 = pyc.zext %v493 : i2 -> i5
  %v495 = pyc.mux %v462, %v445, %v494 : i5
  %v496 = pyc.trunc %v495 : i5 -> i2
  pyc.assign %v227, %v496 : i2
  %v497 = pyc.constant 0 : i3
  %v498 = pyc.zext %v497 : i3 -> i5
  %v499 = pyc.eq %v449, %v498 : i5
  %v500 = pyc.not %v499 : i1
  %v501 = pyc.alias %v500 {pyc.name = "has_dep__fastfwd_v3_integrated__L158"} : i1
  %v502 = pyc.and %v501, %v462 : i1
  pyc.assign %v247, %v502 : i1
  %v503 = pyc.constant 0 : i128
  pyc.assign %v267, %v503 : i128
  %v504 = pyc.constant 3 : i5
  %v505 = pyc.and %v82, %v504 : i5
  %v506 = pyc.alias %v505 {pyc.name = "lat__fastfwd_v3_integrated__L126"} : i5
  %v507 = pyc.lshri %v82 {amount = 2} : i5
  %v508 = pyc.constant 7 : i5
  %v509 = pyc.and %v507, %v508 : i5
  %v510 = pyc.alias %v509 {pyc.name = "dep__fastfwd_v3_integrated__L127"} : i5
  %v511 = pyc.constant 2 : i6
  %v512 = pyc.zext %v511 : i6 -> i16
  %v513 = pyc.add %v21, %v512 : i16
  %v514 = pyc.zext %v506 : i5 -> i16
  %v515 = pyc.add %v513, %v514 : i16
  %v516 = pyc.alias %v515 {pyc.name = "finish_cycle__fastfwd_v3_integrated__L128"} : i16
  %v517 = pyc.zext %v176 : i6 -> i16
  %v518 = pyc.ult %v517, %v516 : i16
  %v519 = pyc.alias %v518 {pyc.name = "constraint_ok__fastfwd_v3_integrated__L131"} : i1
  %v520 = pyc.not %v136 : i1
  %v521 = pyc.and %v520, %v42 : i1
  %v522 = pyc.and %v521, %v519 : i1
  %v523 = pyc.alias %v522 {pyc.name = "can_schedule__fastfwd_v3_integrated__L132"} : i1
  %v524 = pyc.constant 1 : i3
  %v525 = pyc.ult %v524, %v156 : i3
  %v526 = pyc.and %v136, %v525 : i1
  %v527 = pyc.or %v523, %v526 : i1
  %v528 = pyc.alias %v527 {pyc.name = "new_busy__fastfwd_v3_integrated__L135"} : i1
  pyc.assign %v132, %v528 : i1
  %v529 = pyc.constant 1 : i3
  %v530 = pyc.zext %v529 : i3 -> i5
  %v531 = pyc.add %v506, %v530 : i5
  %v532 = pyc.constant 1 : i3
  %v533 = pyc.sub %v156, %v532 : i3
  %v534 = pyc.constant 0 : i3
  %v535 = pyc.mux %v136, %v533, %v534 : i3
  %v536 = pyc.zext %v535 : i3 -> i5
  %v537 = pyc.mux %v523, %v531, %v536 : i5
  %v538 = pyc.alias %v537 {pyc.name = "new_timer__fastfwd_v3_integrated__L138"} : i5
  %v539 = pyc.trunc %v538 : i5 -> i3
  pyc.assign %v152, %v539 : i3
  %v540 = pyc.zext %v176 : i6 -> i16
  %v541 = pyc.mux %v523, %v516, %v540 : i16
  %v542 = pyc.alias %v541 {pyc.name = "new_last_finish__fastfwd_v3_integrated__L142"} : i16
  %v543 = pyc.trunc %v542 : i16 -> i6
  pyc.assign %v172, %v543 : i6
  pyc.assign %v292, %v523 : i1
  %v544 = pyc.mux %v523, %v62, %v316 : i128
  pyc.assign %v312, %v544 : i128
  %v545 = pyc.mux %v523, %v102, %v336 : i16
  pyc.assign %v332, %v545 : i16
  %v546 = pyc.zext %v356 : i2 -> i5
  %v547 = pyc.mux %v523, %v506, %v546 : i5
  %v548 = pyc.trunc %v547 : i5 -> i2
  pyc.assign %v352, %v548 : i2
  %v549 = pyc.zext %v376 : i3 -> i5
  %v550 = pyc.mux %v523, %v510, %v549 : i5
  %v551 = pyc.trunc %v550 : i5 -> i3
  pyc.assign %v372, %v551 : i3
  pyc.assign %v192, %v523 : i1
  %v552 = pyc.constant 0 : i128
  %v553 = pyc.mux %v523, %v62, %v552 : i128
  pyc.assign %v212, %v553 : i128
  %v554 = pyc.constant 0 : i2
  %v555 = pyc.zext %v554 : i2 -> i5
  %v556 = pyc.mux %v523, %v506, %v555 : i5
  %v557 = pyc.trunc %v556 : i5 -> i2
  pyc.assign %v232, %v557 : i2
  %v558 = pyc.constant 0 : i3
  %v559 = pyc.zext %v558 : i3 -> i5
  %v560 = pyc.eq %v510, %v559 : i5
  %v561 = pyc.not %v560 : i1
  %v562 = pyc.alias %v561 {pyc.name = "has_dep__fastfwd_v3_integrated__L158"} : i1
  %v563 = pyc.and %v562, %v523 : i1
  pyc.assign %v252, %v563 : i1
  %v564 = pyc.constant 0 : i128
  pyc.assign %v272, %v564 : i128
  %v565 = pyc.constant 3 : i5
  %v566 = pyc.and %v87, %v565 : i5
  %v567 = pyc.alias %v566 {pyc.name = "lat__fastfwd_v3_integrated__L126"} : i5
  %v568 = pyc.lshri %v87 {amount = 2} : i5
  %v569 = pyc.constant 7 : i5
  %v570 = pyc.and %v568, %v569 : i5
  %v571 = pyc.alias %v570 {pyc.name = "dep__fastfwd_v3_integrated__L127"} : i5
  %v572 = pyc.constant 2 : i6
  %v573 = pyc.zext %v572 : i6 -> i16
  %v574 = pyc.add %v21, %v573 : i16
  %v575 = pyc.zext %v567 : i5 -> i16
  %v576 = pyc.add %v574, %v575 : i16
  %v577 = pyc.alias %v576 {pyc.name = "finish_cycle__fastfwd_v3_integrated__L128"} : i16
  %v578 = pyc.zext %v181 : i6 -> i16
  %v579 = pyc.ult %v578, %v577 : i16
  %v580 = pyc.alias %v579 {pyc.name = "constraint_ok__fastfwd_v3_integrated__L131"} : i1
  %v581 = pyc.not %v141 : i1
  %v582 = pyc.and %v581, %v47 : i1
  %v583 = pyc.and %v582, %v580 : i1
  %v584 = pyc.alias %v583 {pyc.name = "can_schedule__fastfwd_v3_integrated__L132"} : i1
  %v585 = pyc.constant 1 : i3
  %v586 = pyc.ult %v585, %v161 : i3
  %v587 = pyc.and %v141, %v586 : i1
  %v588 = pyc.or %v584, %v587 : i1
  %v589 = pyc.alias %v588 {pyc.name = "new_busy__fastfwd_v3_integrated__L135"} : i1
  pyc.assign %v137, %v589 : i1
  %v590 = pyc.constant 1 : i3
  %v591 = pyc.zext %v590 : i3 -> i5
  %v592 = pyc.add %v567, %v591 : i5
  %v593 = pyc.constant 1 : i3
  %v594 = pyc.sub %v161, %v593 : i3
  %v595 = pyc.constant 0 : i3
  %v596 = pyc.mux %v141, %v594, %v595 : i3
  %v597 = pyc.zext %v596 : i3 -> i5
  %v598 = pyc.mux %v584, %v592, %v597 : i5
  %v599 = pyc.alias %v598 {pyc.name = "new_timer__fastfwd_v3_integrated__L138"} : i5
  %v600 = pyc.trunc %v599 : i5 -> i3
  pyc.assign %v157, %v600 : i3
  %v601 = pyc.zext %v181 : i6 -> i16
  %v602 = pyc.mux %v584, %v577, %v601 : i16
  %v603 = pyc.alias %v602 {pyc.name = "new_last_finish__fastfwd_v3_integrated__L142"} : i16
  %v604 = pyc.trunc %v603 : i16 -> i6
  pyc.assign %v177, %v604 : i6
  pyc.assign %v297, %v584 : i1
  %v605 = pyc.mux %v584, %v67, %v321 : i128
  pyc.assign %v317, %v605 : i128
  %v606 = pyc.mux %v584, %v107, %v341 : i16
  pyc.assign %v337, %v606 : i16
  %v607 = pyc.zext %v361 : i2 -> i5
  %v608 = pyc.mux %v584, %v567, %v607 : i5
  %v609 = pyc.trunc %v608 : i5 -> i2
  pyc.assign %v357, %v609 : i2
  %v610 = pyc.zext %v381 : i3 -> i5
  %v611 = pyc.mux %v584, %v571, %v610 : i5
  %v612 = pyc.trunc %v611 : i5 -> i3
  pyc.assign %v377, %v612 : i3
  pyc.assign %v197, %v584 : i1
  %v613 = pyc.constant 0 : i128
  %v614 = pyc.mux %v584, %v67, %v613 : i128
  pyc.assign %v217, %v614 : i128
  %v615 = pyc.constant 0 : i2
  %v616 = pyc.zext %v615 : i2 -> i5
  %v617 = pyc.mux %v584, %v567, %v616 : i5
  %v618 = pyc.trunc %v617 : i5 -> i2
  pyc.assign %v237, %v618 : i2
  %v619 = pyc.constant 0 : i3
  %v620 = pyc.zext %v619 : i3 -> i5
  %v621 = pyc.eq %v571, %v620 : i5
  %v622 = pyc.not %v621 : i1
  %v623 = pyc.alias %v622 {pyc.name = "has_dep__fastfwd_v3_integrated__L158"} : i1
  %v624 = pyc.and %v623, %v584 : i1
  pyc.assign %v257, %v624 : i1
  %v625 = pyc.constant 0 : i128
  pyc.assign %v277, %v625 : i128
  %v626 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v627 = pyc.constant 1 : i1
  %v628 = pyc.constant 0 : i1
  %v629 = pyc.reg %clk, %rst, %v627, %v626, %v628 : i1
  %v630 = pyc.alias %v629 {pyc.name = "dep0_valid"} : i1
  %v631 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v632 = pyc.constant 1 : i1
  %v633 = pyc.constant 0 : i1
  %v634 = pyc.reg %clk, %rst, %v632, %v631, %v633 : i1
  %v635 = pyc.alias %v634 {pyc.name = "dep1_valid"} : i1
  %v636 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v637 = pyc.constant 1 : i1
  %v638 = pyc.constant 0 : i1
  %v639 = pyc.reg %clk, %rst, %v637, %v636, %v638 : i1
  %v640 = pyc.alias %v639 {pyc.name = "dep2_valid"} : i1
  %v641 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v642 = pyc.constant 1 : i1
  %v643 = pyc.constant 0 : i1
  %v644 = pyc.reg %clk, %rst, %v642, %v641, %v643 : i1
  %v645 = pyc.alias %v644 {pyc.name = "dep3_valid"} : i1
  %v646 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v647 = pyc.constant 1 : i1
  %v648 = pyc.constant 0 : i1
  %v649 = pyc.reg %clk, %rst, %v647, %v646, %v648 : i1
  %v650 = pyc.alias %v649 {pyc.name = "dep4_valid"} : i1
  %v651 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v652 = pyc.constant 1 : i1
  %v653 = pyc.constant 0 : i1
  %v654 = pyc.reg %clk, %rst, %v652, %v651, %v653 : i1
  %v655 = pyc.alias %v654 {pyc.name = "dep5_valid"} : i1
  %v656 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v657 = pyc.constant 1 : i1
  %v658 = pyc.constant 0 : i1
  %v659 = pyc.reg %clk, %rst, %v657, %v656, %v658 : i1
  %v660 = pyc.alias %v659 {pyc.name = "dep6_valid"} : i1
  %v661 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v662 = pyc.constant 1 : i1
  %v663 = pyc.constant 0 : i1
  %v664 = pyc.reg %clk, %rst, %v662, %v661, %v663 : i1
  %v665 = pyc.alias %v664 {pyc.name = "dep7_valid"} : i1
  %v666 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v667 = pyc.constant 1 : i1
  %v668 = pyc.constant 0 : i128
  %v669 = pyc.reg %clk, %rst, %v667, %v666, %v668 : i128
  %v670 = pyc.alias %v669 {pyc.name = "dep0_data"} : i128
  %v671 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v672 = pyc.constant 1 : i1
  %v673 = pyc.constant 0 : i128
  %v674 = pyc.reg %clk, %rst, %v672, %v671, %v673 : i128
  %v675 = pyc.alias %v674 {pyc.name = "dep1_data"} : i128
  %v676 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v677 = pyc.constant 1 : i1
  %v678 = pyc.constant 0 : i128
  %v679 = pyc.reg %clk, %rst, %v677, %v676, %v678 : i128
  %v680 = pyc.alias %v679 {pyc.name = "dep2_data"} : i128
  %v681 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v682 = pyc.constant 1 : i1
  %v683 = pyc.constant 0 : i128
  %v684 = pyc.reg %clk, %rst, %v682, %v681, %v683 : i128
  %v685 = pyc.alias %v684 {pyc.name = "dep3_data"} : i128
  %v686 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v687 = pyc.constant 1 : i1
  %v688 = pyc.constant 0 : i128
  %v689 = pyc.reg %clk, %rst, %v687, %v686, %v688 : i128
  %v690 = pyc.alias %v689 {pyc.name = "dep4_data"} : i128
  %v691 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v692 = pyc.constant 1 : i1
  %v693 = pyc.constant 0 : i128
  %v694 = pyc.reg %clk, %rst, %v692, %v691, %v693 : i128
  %v695 = pyc.alias %v694 {pyc.name = "dep5_data"} : i128
  %v696 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v697 = pyc.constant 1 : i1
  %v698 = pyc.constant 0 : i128
  %v699 = pyc.reg %clk, %rst, %v697, %v696, %v698 : i128
  %v700 = pyc.alias %v699 {pyc.name = "dep6_data"} : i128
  %v701 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v702 = pyc.constant 1 : i1
  %v703 = pyc.constant 0 : i128
  %v704 = pyc.reg %clk, %rst, %v702, %v701, %v703 : i128
  %v705 = pyc.alias %v704 {pyc.name = "dep7_data"} : i128
  %v706 = pyc.wire {pyc.name = "dep0_seq__next"} : i16
  %v707 = pyc.constant 1 : i1
  %v708 = pyc.constant 0 : i16
  %v709 = pyc.reg %clk, %rst, %v707, %v706, %v708 : i16
  %v710 = pyc.alias %v709 {pyc.name = "dep0_seq"} : i16
  %v711 = pyc.wire {pyc.name = "dep1_seq__next"} : i16
  %v712 = pyc.constant 1 : i1
  %v713 = pyc.constant 0 : i16
  %v714 = pyc.reg %clk, %rst, %v712, %v711, %v713 : i16
  %v715 = pyc.alias %v714 {pyc.name = "dep1_seq"} : i16
  %v716 = pyc.wire {pyc.name = "dep2_seq__next"} : i16
  %v717 = pyc.constant 1 : i1
  %v718 = pyc.constant 0 : i16
  %v719 = pyc.reg %clk, %rst, %v717, %v716, %v718 : i16
  %v720 = pyc.alias %v719 {pyc.name = "dep2_seq"} : i16
  %v721 = pyc.wire {pyc.name = "dep3_seq__next"} : i16
  %v722 = pyc.constant 1 : i1
  %v723 = pyc.constant 0 : i16
  %v724 = pyc.reg %clk, %rst, %v722, %v721, %v723 : i16
  %v725 = pyc.alias %v724 {pyc.name = "dep3_seq"} : i16
  %v726 = pyc.wire {pyc.name = "dep4_seq__next"} : i16
  %v727 = pyc.constant 1 : i1
  %v728 = pyc.constant 0 : i16
  %v729 = pyc.reg %clk, %rst, %v727, %v726, %v728 : i16
  %v730 = pyc.alias %v729 {pyc.name = "dep4_seq"} : i16
  %v731 = pyc.wire {pyc.name = "dep5_seq__next"} : i16
  %v732 = pyc.constant 1 : i1
  %v733 = pyc.constant 0 : i16
  %v734 = pyc.reg %clk, %rst, %v732, %v731, %v733 : i16
  %v735 = pyc.alias %v734 {pyc.name = "dep5_seq"} : i16
  %v736 = pyc.wire {pyc.name = "dep6_seq__next"} : i16
  %v737 = pyc.constant 1 : i1
  %v738 = pyc.constant 0 : i16
  %v739 = pyc.reg %clk, %rst, %v737, %v736, %v738 : i16
  %v740 = pyc.alias %v739 {pyc.name = "dep6_seq"} : i16
  %v741 = pyc.wire {pyc.name = "dep7_seq__next"} : i16
  %v742 = pyc.constant 1 : i1
  %v743 = pyc.constant 0 : i16
  %v744 = pyc.reg %clk, %rst, %v742, %v741, %v743 : i16
  %v745 = pyc.alias %v744 {pyc.name = "dep7_seq"} : i16
  %v746 = pyc.wire {pyc.name = "dep_write_ptr__next"} : i3
  %v747 = pyc.constant 1 : i1
  %v748 = pyc.constant 0 : i3
  %v749 = pyc.reg %clk, %rst, %v747, %v746, %v748 : i3
  %v750 = pyc.alias %v749 {pyc.name = "dep_write_ptr"} : i3
  %v751 = pyc.alias %v750 {pyc.name = "dep_write_ptr__fastfwd_v3_integrated__L177"} : i3
  %v752 = pyc.or %fwded0_pkt_data_vld, %fwded1_pkt_data_vld : i1
  %v753 = pyc.or %v752, %fwded2_pkt_data_vld : i1
  %v754 = pyc.or %v753, %fwded3_pkt_data_vld : i1
  %v755 = pyc.alias %v754 {pyc.name = "any_fwded__fastfwd_v3_integrated__L179"} : i1
  %v756 = pyc.constant 0 : i3
  %v757 = pyc.eq %v751, %v756 : i3
  %v758 = pyc.and %fwded0_pkt_data_vld, %v757 : i1
  %v759 = pyc.alias %v758 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v760 = pyc.or %v759, %v630 : i1
  pyc.assign %v626, %v760 : i1
  %v761 = pyc.mux %v759, %fwded0_pkt_data, %v670 : i128
  pyc.assign %v666, %v761 : i128
  %v762 = pyc.mux %v759, %v326, %v710 : i16
  pyc.assign %v706, %v762 : i16
  %v763 = pyc.constant 1 : i3
  %v764 = pyc.eq %v751, %v763 : i3
  %v765 = pyc.and %fwded0_pkt_data_vld, %v764 : i1
  %v766 = pyc.alias %v765 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v767 = pyc.or %v766, %v635 : i1
  pyc.assign %v631, %v767 : i1
  %v768 = pyc.mux %v766, %fwded0_pkt_data, %v675 : i128
  pyc.assign %v671, %v768 : i128
  %v769 = pyc.mux %v766, %v326, %v715 : i16
  pyc.assign %v711, %v769 : i16
  %v770 = pyc.constant 2 : i3
  %v771 = pyc.eq %v751, %v770 : i3
  %v772 = pyc.and %fwded0_pkt_data_vld, %v771 : i1
  %v773 = pyc.alias %v772 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v774 = pyc.or %v773, %v640 : i1
  pyc.assign %v636, %v774 : i1
  %v775 = pyc.mux %v773, %fwded0_pkt_data, %v680 : i128
  pyc.assign %v676, %v775 : i128
  %v776 = pyc.mux %v773, %v326, %v720 : i16
  pyc.assign %v716, %v776 : i16
  %v777 = pyc.constant 3 : i3
  %v778 = pyc.eq %v751, %v777 : i3
  %v779 = pyc.and %fwded0_pkt_data_vld, %v778 : i1
  %v780 = pyc.alias %v779 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v781 = pyc.or %v780, %v645 : i1
  pyc.assign %v641, %v781 : i1
  %v782 = pyc.mux %v780, %fwded0_pkt_data, %v685 : i128
  pyc.assign %v681, %v782 : i128
  %v783 = pyc.mux %v780, %v326, %v725 : i16
  pyc.assign %v721, %v783 : i16
  %v784 = pyc.constant 4 : i3
  %v785 = pyc.eq %v751, %v784 : i3
  %v786 = pyc.and %fwded0_pkt_data_vld, %v785 : i1
  %v787 = pyc.alias %v786 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v788 = pyc.or %v787, %v650 : i1
  pyc.assign %v646, %v788 : i1
  %v789 = pyc.mux %v787, %fwded0_pkt_data, %v690 : i128
  pyc.assign %v686, %v789 : i128
  %v790 = pyc.mux %v787, %v326, %v730 : i16
  pyc.assign %v726, %v790 : i16
  %v791 = pyc.constant 5 : i3
  %v792 = pyc.eq %v751, %v791 : i3
  %v793 = pyc.and %fwded0_pkt_data_vld, %v792 : i1
  %v794 = pyc.alias %v793 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v795 = pyc.or %v794, %v655 : i1
  pyc.assign %v651, %v795 : i1
  %v796 = pyc.mux %v794, %fwded0_pkt_data, %v695 : i128
  pyc.assign %v691, %v796 : i128
  %v797 = pyc.mux %v794, %v326, %v735 : i16
  pyc.assign %v731, %v797 : i16
  %v798 = pyc.constant 6 : i3
  %v799 = pyc.eq %v751, %v798 : i3
  %v800 = pyc.and %fwded0_pkt_data_vld, %v799 : i1
  %v801 = pyc.alias %v800 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v802 = pyc.or %v801, %v660 : i1
  pyc.assign %v656, %v802 : i1
  %v803 = pyc.mux %v801, %fwded0_pkt_data, %v700 : i128
  pyc.assign %v696, %v803 : i128
  %v804 = pyc.mux %v801, %v326, %v740 : i16
  pyc.assign %v736, %v804 : i16
  %v805 = pyc.constant 7 : i3
  %v806 = pyc.eq %v751, %v805 : i3
  %v807 = pyc.and %fwded0_pkt_data_vld, %v806 : i1
  %v808 = pyc.alias %v807 {pyc.name = "should_write__fastfwd_v3_integrated__L183"} : i1
  %v809 = pyc.or %v808, %v665 : i1
  pyc.assign %v661, %v809 : i1
  %v810 = pyc.mux %v808, %fwded0_pkt_data, %v705 : i128
  pyc.assign %v701, %v810 : i128
  %v811 = pyc.mux %v808, %v326, %v745 : i16
  pyc.assign %v741, %v811 : i16
  %v812 = pyc.constant 1 : i3
  %v813 = pyc.add %v751, %v812 : i3
  %v814 = pyc.constant 7 : i3
  %v815 = pyc.and %v813, %v814 : i3
  %v816 = pyc.alias %v815 {pyc.name = "new_dep_ptr__fastfwd_v3_integrated__L188"} : i3
  %v817 = pyc.mux %v755, %v816, %v751 : i3
  pyc.assign %v746, %v817 : i3
  %v818 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v819 = pyc.constant 1 : i1
  %v820 = pyc.constant 0 : i1
  %v821 = pyc.reg %clk, %rst, %v819, %v818, %v820 : i1
  %v822 = pyc.alias %v821 {pyc.name = "rob0_valid"} : i1
  %v823 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v824 = pyc.constant 1 : i1
  %v825 = pyc.constant 0 : i1
  %v826 = pyc.reg %clk, %rst, %v824, %v823, %v825 : i1
  %v827 = pyc.alias %v826 {pyc.name = "rob1_valid"} : i1
  %v828 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v829 = pyc.constant 1 : i1
  %v830 = pyc.constant 0 : i1
  %v831 = pyc.reg %clk, %rst, %v829, %v828, %v830 : i1
  %v832 = pyc.alias %v831 {pyc.name = "rob2_valid"} : i1
  %v833 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v834 = pyc.constant 1 : i1
  %v835 = pyc.constant 0 : i1
  %v836 = pyc.reg %clk, %rst, %v834, %v833, %v835 : i1
  %v837 = pyc.alias %v836 {pyc.name = "rob3_valid"} : i1
  %v838 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v839 = pyc.constant 1 : i1
  %v840 = pyc.constant 0 : i1
  %v841 = pyc.reg %clk, %rst, %v839, %v838, %v840 : i1
  %v842 = pyc.alias %v841 {pyc.name = "rob4_valid"} : i1
  %v843 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v844 = pyc.constant 1 : i1
  %v845 = pyc.constant 0 : i1
  %v846 = pyc.reg %clk, %rst, %v844, %v843, %v845 : i1
  %v847 = pyc.alias %v846 {pyc.name = "rob5_valid"} : i1
  %v848 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v849 = pyc.constant 1 : i1
  %v850 = pyc.constant 0 : i1
  %v851 = pyc.reg %clk, %rst, %v849, %v848, %v850 : i1
  %v852 = pyc.alias %v851 {pyc.name = "rob6_valid"} : i1
  %v853 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v854 = pyc.constant 1 : i1
  %v855 = pyc.constant 0 : i1
  %v856 = pyc.reg %clk, %rst, %v854, %v853, %v855 : i1
  %v857 = pyc.alias %v856 {pyc.name = "rob7_valid"} : i1
  %v858 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v859 = pyc.constant 1 : i1
  %v860 = pyc.constant 0 : i128
  %v861 = pyc.reg %clk, %rst, %v859, %v858, %v860 : i128
  %v862 = pyc.alias %v861 {pyc.name = "rob0_data"} : i128
  %v863 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v864 = pyc.constant 1 : i1
  %v865 = pyc.constant 0 : i128
  %v866 = pyc.reg %clk, %rst, %v864, %v863, %v865 : i128
  %v867 = pyc.alias %v866 {pyc.name = "rob1_data"} : i128
  %v868 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v869 = pyc.constant 1 : i1
  %v870 = pyc.constant 0 : i128
  %v871 = pyc.reg %clk, %rst, %v869, %v868, %v870 : i128
  %v872 = pyc.alias %v871 {pyc.name = "rob2_data"} : i128
  %v873 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v874 = pyc.constant 1 : i1
  %v875 = pyc.constant 0 : i128
  %v876 = pyc.reg %clk, %rst, %v874, %v873, %v875 : i128
  %v877 = pyc.alias %v876 {pyc.name = "rob3_data"} : i128
  %v878 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v879 = pyc.constant 1 : i1
  %v880 = pyc.constant 0 : i128
  %v881 = pyc.reg %clk, %rst, %v879, %v878, %v880 : i128
  %v882 = pyc.alias %v881 {pyc.name = "rob4_data"} : i128
  %v883 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v884 = pyc.constant 1 : i1
  %v885 = pyc.constant 0 : i128
  %v886 = pyc.reg %clk, %rst, %v884, %v883, %v885 : i128
  %v887 = pyc.alias %v886 {pyc.name = "rob5_data"} : i128
  %v888 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v889 = pyc.constant 1 : i1
  %v890 = pyc.constant 0 : i128
  %v891 = pyc.reg %clk, %rst, %v889, %v888, %v890 : i128
  %v892 = pyc.alias %v891 {pyc.name = "rob6_data"} : i128
  %v893 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v894 = pyc.constant 1 : i1
  %v895 = pyc.constant 0 : i128
  %v896 = pyc.reg %clk, %rst, %v894, %v893, %v895 : i128
  %v897 = pyc.alias %v896 {pyc.name = "rob7_data"} : i128
  %v898 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v899 = pyc.constant 1 : i1
  %v900 = pyc.constant 0 : i16
  %v901 = pyc.reg %clk, %rst, %v899, %v898, %v900 : i16
  %v902 = pyc.alias %v901 {pyc.name = "rob0_seq"} : i16
  %v903 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v904 = pyc.constant 1 : i1
  %v905 = pyc.constant 0 : i16
  %v906 = pyc.reg %clk, %rst, %v904, %v903, %v905 : i16
  %v907 = pyc.alias %v906 {pyc.name = "rob1_seq"} : i16
  %v908 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v909 = pyc.constant 1 : i1
  %v910 = pyc.constant 0 : i16
  %v911 = pyc.reg %clk, %rst, %v909, %v908, %v910 : i16
  %v912 = pyc.alias %v911 {pyc.name = "rob2_seq"} : i16
  %v913 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v914 = pyc.constant 1 : i1
  %v915 = pyc.constant 0 : i16
  %v916 = pyc.reg %clk, %rst, %v914, %v913, %v915 : i16
  %v917 = pyc.alias %v916 {pyc.name = "rob3_seq"} : i16
  %v918 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v919 = pyc.constant 1 : i1
  %v920 = pyc.constant 0 : i16
  %v921 = pyc.reg %clk, %rst, %v919, %v918, %v920 : i16
  %v922 = pyc.alias %v921 {pyc.name = "rob4_seq"} : i16
  %v923 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v924 = pyc.constant 1 : i1
  %v925 = pyc.constant 0 : i16
  %v926 = pyc.reg %clk, %rst, %v924, %v923, %v925 : i16
  %v927 = pyc.alias %v926 {pyc.name = "rob5_seq"} : i16
  %v928 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v929 = pyc.constant 1 : i1
  %v930 = pyc.constant 0 : i16
  %v931 = pyc.reg %clk, %rst, %v929, %v928, %v930 : i16
  %v932 = pyc.alias %v931 {pyc.name = "rob6_seq"} : i16
  %v933 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v934 = pyc.constant 1 : i1
  %v935 = pyc.constant 0 : i16
  %v936 = pyc.reg %clk, %rst, %v934, %v933, %v935 : i16
  %v937 = pyc.alias %v936 {pyc.name = "rob7_seq"} : i16
  %v938 = pyc.wire {pyc.name = "rob_head__next"} : i3
  %v939 = pyc.constant 1 : i1
  %v940 = pyc.constant 0 : i3
  %v941 = pyc.reg %clk, %rst, %v939, %v938, %v940 : i3
  %v942 = pyc.alias %v941 {pyc.name = "rob_head"} : i3
  %v943 = pyc.alias %v942 {pyc.name = "rob_head__fastfwd_v3_integrated__L200"} : i3
  %v944 = pyc.wire {pyc.name = "rob_tail__next"} : i3
  %v945 = pyc.constant 1 : i1
  %v946 = pyc.constant 0 : i3
  %v947 = pyc.reg %clk, %rst, %v945, %v944, %v946 : i3
  %v948 = pyc.alias %v947 {pyc.name = "rob_tail"} : i3
  %v949 = pyc.alias %v948 {pyc.name = "rob_tail__fastfwd_v3_integrated__L201"} : i3
  %v950 = pyc.wire {pyc.name = "next_output_seq__next"} : i16
  %v951 = pyc.constant 1 : i1
  %v952 = pyc.constant 0 : i16
  %v953 = pyc.reg %clk, %rst, %v951, %v950, %v952 : i16
  %v954 = pyc.alias %v953 {pyc.name = "next_output_seq"} : i16
  %v955 = pyc.alias %v954 {pyc.name = "next_output_seq__fastfwd_v3_integrated__L202"} : i16
  %v956 = pyc.alias %v949 {pyc.name = "tail_ptr__fastfwd_v3_integrated__L205"} : i3
  %v957 = pyc.constant 0 : i3
  %v958 = pyc.eq %v956, %v957 : i3
  %v959 = pyc.and %fwded0_pkt_data_vld, %v958 : i1
  %v960 = pyc.alias %v959 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v961 = pyc.or %v960, %v822 : i1
  pyc.assign %v818, %v961 : i1
  %v962 = pyc.mux %v960, %fwded0_pkt_data, %v862 : i128
  pyc.assign %v858, %v962 : i128
  %v963 = pyc.mux %v960, %v326, %v902 : i16
  pyc.assign %v898, %v963 : i16
  %v964 = pyc.constant 1 : i3
  %v965 = pyc.eq %v956, %v964 : i3
  %v966 = pyc.and %fwded0_pkt_data_vld, %v965 : i1
  %v967 = pyc.alias %v966 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v968 = pyc.or %v967, %v827 : i1
  pyc.assign %v823, %v968 : i1
  %v969 = pyc.mux %v967, %fwded0_pkt_data, %v867 : i128
  pyc.assign %v863, %v969 : i128
  %v970 = pyc.mux %v967, %v326, %v907 : i16
  pyc.assign %v903, %v970 : i16
  %v971 = pyc.constant 2 : i3
  %v972 = pyc.eq %v956, %v971 : i3
  %v973 = pyc.and %fwded0_pkt_data_vld, %v972 : i1
  %v974 = pyc.alias %v973 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v975 = pyc.or %v974, %v832 : i1
  pyc.assign %v828, %v975 : i1
  %v976 = pyc.mux %v974, %fwded0_pkt_data, %v872 : i128
  pyc.assign %v868, %v976 : i128
  %v977 = pyc.mux %v974, %v326, %v912 : i16
  pyc.assign %v908, %v977 : i16
  %v978 = pyc.constant 3 : i3
  %v979 = pyc.eq %v956, %v978 : i3
  %v980 = pyc.and %fwded0_pkt_data_vld, %v979 : i1
  %v981 = pyc.alias %v980 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v982 = pyc.or %v981, %v837 : i1
  pyc.assign %v833, %v982 : i1
  %v983 = pyc.mux %v981, %fwded0_pkt_data, %v877 : i128
  pyc.assign %v873, %v983 : i128
  %v984 = pyc.mux %v981, %v326, %v917 : i16
  pyc.assign %v913, %v984 : i16
  %v985 = pyc.constant 4 : i3
  %v986 = pyc.eq %v956, %v985 : i3
  %v987 = pyc.and %fwded0_pkt_data_vld, %v986 : i1
  %v988 = pyc.alias %v987 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v989 = pyc.or %v988, %v842 : i1
  pyc.assign %v838, %v989 : i1
  %v990 = pyc.mux %v988, %fwded0_pkt_data, %v882 : i128
  pyc.assign %v878, %v990 : i128
  %v991 = pyc.mux %v988, %v326, %v922 : i16
  pyc.assign %v918, %v991 : i16
  %v992 = pyc.constant 5 : i3
  %v993 = pyc.eq %v956, %v992 : i3
  %v994 = pyc.and %fwded0_pkt_data_vld, %v993 : i1
  %v995 = pyc.alias %v994 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v996 = pyc.or %v995, %v847 : i1
  pyc.assign %v843, %v996 : i1
  %v997 = pyc.mux %v995, %fwded0_pkt_data, %v887 : i128
  pyc.assign %v883, %v997 : i128
  %v998 = pyc.mux %v995, %v326, %v927 : i16
  pyc.assign %v923, %v998 : i16
  %v999 = pyc.constant 6 : i3
  %v1000 = pyc.eq %v956, %v999 : i3
  %v1001 = pyc.and %fwded0_pkt_data_vld, %v1000 : i1
  %v1002 = pyc.alias %v1001 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v1003 = pyc.or %v1002, %v852 : i1
  pyc.assign %v848, %v1003 : i1
  %v1004 = pyc.mux %v1002, %fwded0_pkt_data, %v892 : i128
  pyc.assign %v888, %v1004 : i128
  %v1005 = pyc.mux %v1002, %v326, %v932 : i16
  pyc.assign %v928, %v1005 : i16
  %v1006 = pyc.constant 7 : i3
  %v1007 = pyc.eq %v956, %v1006 : i3
  %v1008 = pyc.and %fwded0_pkt_data_vld, %v1007 : i1
  %v1009 = pyc.alias %v1008 {pyc.name = "should_write__fastfwd_v3_integrated__L207"} : i1
  %v1010 = pyc.or %v1009, %v857 : i1
  pyc.assign %v853, %v1010 : i1
  %v1011 = pyc.mux %v1009, %fwded0_pkt_data, %v897 : i128
  pyc.assign %v893, %v1011 : i128
  %v1012 = pyc.mux %v1009, %v326, %v937 : i16
  pyc.assign %v933, %v1012 : i16
  %v1013 = pyc.constant 1 : i3
  %v1014 = pyc.add %v956, %v1013 : i3
  %v1015 = pyc.constant 7 : i3
  %v1016 = pyc.and %v1014, %v1015 : i3
  %v1017 = pyc.alias %v1016 {pyc.name = "new_tail__fastfwd_v3_integrated__L212"} : i3
  %v1018 = pyc.mux %fwded0_pkt_data_vld, %v1017, %v956 : i3
  pyc.assign %v944, %v1018 : i3
  %v1019 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1020 = pyc.constant 1 : i1
  %v1021 = pyc.constant 0 : i1
  %v1022 = pyc.reg %clk, %rst, %v1020, %v1019, %v1021 : i1
  %v1023 = pyc.alias %v1022 {pyc.name = "lane0_out_vld"} : i1
  %v1024 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1025 = pyc.constant 1 : i1
  %v1026 = pyc.constant 0 : i1
  %v1027 = pyc.reg %clk, %rst, %v1025, %v1024, %v1026 : i1
  %v1028 = pyc.alias %v1027 {pyc.name = "lane1_out_vld"} : i1
  %v1029 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1030 = pyc.constant 1 : i1
  %v1031 = pyc.constant 0 : i1
  %v1032 = pyc.reg %clk, %rst, %v1030, %v1029, %v1031 : i1
  %v1033 = pyc.alias %v1032 {pyc.name = "lane2_out_vld"} : i1
  %v1034 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1035 = pyc.constant 1 : i1
  %v1036 = pyc.constant 0 : i1
  %v1037 = pyc.reg %clk, %rst, %v1035, %v1034, %v1036 : i1
  %v1038 = pyc.alias %v1037 {pyc.name = "lane3_out_vld"} : i1
  %v1039 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1040 = pyc.constant 1 : i1
  %v1041 = pyc.constant 0 : i128
  %v1042 = pyc.reg %clk, %rst, %v1040, %v1039, %v1041 : i128
  %v1043 = pyc.alias %v1042 {pyc.name = "lane0_out_data"} : i128
  %v1044 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1045 = pyc.constant 1 : i1
  %v1046 = pyc.constant 0 : i128
  %v1047 = pyc.reg %clk, %rst, %v1045, %v1044, %v1046 : i128
  %v1048 = pyc.alias %v1047 {pyc.name = "lane1_out_data"} : i128
  %v1049 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1050 = pyc.constant 1 : i1
  %v1051 = pyc.constant 0 : i128
  %v1052 = pyc.reg %clk, %rst, %v1050, %v1049, %v1051 : i128
  %v1053 = pyc.alias %v1052 {pyc.name = "lane2_out_data"} : i128
  %v1054 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1055 = pyc.constant 1 : i1
  %v1056 = pyc.constant 0 : i128
  %v1057 = pyc.reg %clk, %rst, %v1055, %v1054, %v1056 : i128
  %v1058 = pyc.alias %v1057 {pyc.name = "lane3_out_data"} : i128
  %v1059 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_integrated__L223"} : i2
  %v1060 = pyc.alias %v955 {pyc.name = "next_seq__fastfwd_v3_integrated__L224"} : i16
  %v1061 = pyc.eq %v902, %v1060 : i16
  %v1062 = pyc.and %v822, %v1061 : i1
  %v1063 = pyc.alias %v1062 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1064 = pyc.constant 0 : i1
  %v1065 = pyc.or %v1063, %v1064 : i1
  %v1066 = pyc.alias %v1065 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1067 = pyc.not %v1063 : i1
  %v1068 = pyc.constant 0 : i128
  %v1069 = pyc.mux %v1067, %v1068, %v862 : i128
  %v1070 = pyc.alias %v1069 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1071 = pyc.eq %v907, %v1060 : i16
  %v1072 = pyc.and %v827, %v1071 : i1
  %v1073 = pyc.alias %v1072 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1074 = pyc.or %v1066, %v1073 : i1
  %v1075 = pyc.alias %v1074 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1076 = pyc.not %v1073 : i1
  %v1077 = pyc.mux %v1076, %v1070, %v867 : i128
  %v1078 = pyc.alias %v1077 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1079 = pyc.eq %v912, %v1060 : i16
  %v1080 = pyc.and %v832, %v1079 : i1
  %v1081 = pyc.alias %v1080 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1082 = pyc.or %v1075, %v1081 : i1
  %v1083 = pyc.alias %v1082 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1084 = pyc.not %v1081 : i1
  %v1085 = pyc.mux %v1084, %v1078, %v872 : i128
  %v1086 = pyc.alias %v1085 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1087 = pyc.eq %v917, %v1060 : i16
  %v1088 = pyc.and %v837, %v1087 : i1
  %v1089 = pyc.alias %v1088 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1090 = pyc.or %v1083, %v1089 : i1
  %v1091 = pyc.alias %v1090 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1092 = pyc.not %v1089 : i1
  %v1093 = pyc.mux %v1092, %v1086, %v877 : i128
  %v1094 = pyc.alias %v1093 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1095 = pyc.eq %v922, %v1060 : i16
  %v1096 = pyc.and %v842, %v1095 : i1
  %v1097 = pyc.alias %v1096 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1098 = pyc.or %v1091, %v1097 : i1
  %v1099 = pyc.alias %v1098 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1100 = pyc.not %v1097 : i1
  %v1101 = pyc.mux %v1100, %v1094, %v882 : i128
  %v1102 = pyc.alias %v1101 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1103 = pyc.eq %v927, %v1060 : i16
  %v1104 = pyc.and %v847, %v1103 : i1
  %v1105 = pyc.alias %v1104 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1106 = pyc.or %v1099, %v1105 : i1
  %v1107 = pyc.alias %v1106 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1108 = pyc.not %v1105 : i1
  %v1109 = pyc.mux %v1108, %v1102, %v887 : i128
  %v1110 = pyc.alias %v1109 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1111 = pyc.eq %v932, %v1060 : i16
  %v1112 = pyc.and %v852, %v1111 : i1
  %v1113 = pyc.alias %v1112 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1114 = pyc.or %v1107, %v1113 : i1
  %v1115 = pyc.alias %v1114 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1116 = pyc.not %v1113 : i1
  %v1117 = pyc.mux %v1116, %v1110, %v892 : i128
  %v1118 = pyc.alias %v1117 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1119 = pyc.eq %v937, %v1060 : i16
  %v1120 = pyc.and %v857, %v1119 : i1
  %v1121 = pyc.alias %v1120 {pyc.name = "match__fastfwd_v3_integrated__L230"} : i1
  %v1122 = pyc.or %v1115, %v1121 : i1
  %v1123 = pyc.alias %v1122 {pyc.name = "has_next_seq__fastfwd_v3_integrated__L231"} : i1
  %v1124 = pyc.not %v1121 : i1
  %v1125 = pyc.mux %v1124, %v1118, %v897 : i128
  %v1126 = pyc.alias %v1125 {pyc.name = "next_seq_data__fastfwd_v3_integrated__L232"} : i128
  %v1127 = pyc.constant 0 : i2
  %v1128 = pyc.eq %v1059, %v1127 : i2
  %v1129 = pyc.alias %v1128 {pyc.name = "this_lane__fastfwd_v3_integrated__L236"} : i1
  %v1130 = pyc.and %v1129, %v1123 : i1
  %v1131 = pyc.alias %v1130 {pyc.name = "should_output__fastfwd_v3_integrated__L237"} : i1
  pyc.assign %v1019, %v1131 : i1
  %v1132 = pyc.constant 0 : i128
  %v1133 = pyc.mux %v1131, %v1126, %v1132 : i128
  pyc.assign %v1039, %v1133 : i128
  %v1134 = pyc.constant 1 : i2
  %v1135 = pyc.eq %v1059, %v1134 : i2
  %v1136 = pyc.alias %v1135 {pyc.name = "this_lane__fastfwd_v3_integrated__L236"} : i1
  %v1137 = pyc.and %v1136, %v1123 : i1
  %v1138 = pyc.alias %v1137 {pyc.name = "should_output__fastfwd_v3_integrated__L237"} : i1
  pyc.assign %v1024, %v1138 : i1
  %v1139 = pyc.constant 0 : i128
  %v1140 = pyc.mux %v1138, %v1126, %v1139 : i128
  pyc.assign %v1044, %v1140 : i128
  %v1141 = pyc.constant 2 : i2
  %v1142 = pyc.eq %v1059, %v1141 : i2
  %v1143 = pyc.alias %v1142 {pyc.name = "this_lane__fastfwd_v3_integrated__L236"} : i1
  %v1144 = pyc.and %v1143, %v1123 : i1
  %v1145 = pyc.alias %v1144 {pyc.name = "should_output__fastfwd_v3_integrated__L237"} : i1
  pyc.assign %v1029, %v1145 : i1
  %v1146 = pyc.constant 0 : i128
  %v1147 = pyc.mux %v1145, %v1126, %v1146 : i128
  pyc.assign %v1049, %v1147 : i128
  %v1148 = pyc.constant 3 : i2
  %v1149 = pyc.eq %v1059, %v1148 : i2
  %v1150 = pyc.alias %v1149 {pyc.name = "this_lane__fastfwd_v3_integrated__L236"} : i1
  %v1151 = pyc.and %v1150, %v1123 : i1
  %v1152 = pyc.alias %v1151 {pyc.name = "should_output__fastfwd_v3_integrated__L237"} : i1
  pyc.assign %v1034, %v1152 : i1
  %v1153 = pyc.constant 0 : i128
  %v1154 = pyc.mux %v1152, %v1126, %v1153 : i128
  pyc.assign %v1054, %v1154 : i128
  %v1155 = pyc.or %v1023, %v1028 : i1
  %v1156 = pyc.or %v1155, %v1033 : i1
  %v1157 = pyc.or %v1156, %v1038 : i1
  %v1158 = pyc.alias %v1157 {pyc.name = "any_output__fastfwd_v3_integrated__L243"} : i1
  %v1159 = pyc.constant 1 : i2
  %v1160 = pyc.add %v1059, %v1159 : i2
  %v1161 = pyc.constant 3 : i2
  %v1162 = pyc.and %v1160, %v1161 : i2
  %v1163 = pyc.alias %v1162 {pyc.name = "new_ptr__fastfwd_v3_integrated__L244"} : i2
  %v1164 = pyc.mux %v1158, %v1163, %v1059 : i2
  pyc.assign %v7, %v1164 : i2
  %v1165 = pyc.constant 1 : i16
  %v1166 = pyc.add %v1060, %v1165 : i16
  %v1167 = pyc.alias %v1166 {pyc.name = "new_next_seq__fastfwd_v3_integrated__L247"} : i16
  %v1168 = pyc.mux %v1158, %v1167, %v1060 : i16
  pyc.assign %v950, %v1168 : i16
  %v1169 = pyc.eq %v902, %v1060 : i16
  %v1170 = pyc.and %v1158, %v1169 : i1
  %v1171 = pyc.alias %v1170 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1172 = pyc.constant 0 : i1
  %v1173 = pyc.mux %v1171, %v1172, %v822 : i1
  pyc.assign %v818, %v1173 : i1
  %v1174 = pyc.eq %v907, %v1060 : i16
  %v1175 = pyc.and %v1158, %v1174 : i1
  %v1176 = pyc.alias %v1175 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1177 = pyc.constant 0 : i1
  %v1178 = pyc.mux %v1176, %v1177, %v827 : i1
  pyc.assign %v823, %v1178 : i1
  %v1179 = pyc.eq %v912, %v1060 : i16
  %v1180 = pyc.and %v1158, %v1179 : i1
  %v1181 = pyc.alias %v1180 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1182 = pyc.constant 0 : i1
  %v1183 = pyc.mux %v1181, %v1182, %v832 : i1
  pyc.assign %v828, %v1183 : i1
  %v1184 = pyc.eq %v917, %v1060 : i16
  %v1185 = pyc.and %v1158, %v1184 : i1
  %v1186 = pyc.alias %v1185 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1187 = pyc.constant 0 : i1
  %v1188 = pyc.mux %v1186, %v1187, %v837 : i1
  pyc.assign %v833, %v1188 : i1
  %v1189 = pyc.eq %v922, %v1060 : i16
  %v1190 = pyc.and %v1158, %v1189 : i1
  %v1191 = pyc.alias %v1190 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1192 = pyc.constant 0 : i1
  %v1193 = pyc.mux %v1191, %v1192, %v842 : i1
  pyc.assign %v838, %v1193 : i1
  %v1194 = pyc.eq %v927, %v1060 : i16
  %v1195 = pyc.and %v1158, %v1194 : i1
  %v1196 = pyc.alias %v1195 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1197 = pyc.constant 0 : i1
  %v1198 = pyc.mux %v1196, %v1197, %v847 : i1
  pyc.assign %v843, %v1198 : i1
  %v1199 = pyc.eq %v932, %v1060 : i16
  %v1200 = pyc.and %v1158, %v1199 : i1
  %v1201 = pyc.alias %v1200 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1202 = pyc.constant 0 : i1
  %v1203 = pyc.mux %v1201, %v1202, %v852 : i1
  pyc.assign %v848, %v1203 : i1
  %v1204 = pyc.eq %v937, %v1060 : i16
  %v1205 = pyc.and %v1158, %v1204 : i1
  %v1206 = pyc.alias %v1205 {pyc.name = "should_clear__fastfwd_v3_integrated__L252"} : i1
  %v1207 = pyc.constant 0 : i1
  %v1208 = pyc.mux %v1206, %v1207, %v857 : i1
  pyc.assign %v853, %v1208 : i1
  %v1209 = pyc.constant 0 : i4
  %v1210 = pyc.zext %v32 : i1 -> i4
  %v1211 = pyc.add %v1210, %v1209 : i4
  %v1212 = pyc.alias %v1211 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L262"} : i4
  %v1213 = pyc.zext %v37 : i1 -> i4
  %v1214 = pyc.add %v1212, %v1213 : i4
  %v1215 = pyc.alias %v1214 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L262"} : i4
  %v1216 = pyc.zext %v42 : i1 -> i4
  %v1217 = pyc.add %v1215, %v1216 : i4
  %v1218 = pyc.alias %v1217 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L262"} : i4
  %v1219 = pyc.zext %v47 : i1 -> i4
  %v1220 = pyc.add %v1218, %v1219 : i4
  %v1221 = pyc.alias %v1220 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L262"} : i4
  %v1222 = pyc.zext %v286 : i1 -> i4
  %v1223 = pyc.add %v1221, %v1222 : i4
  %v1224 = pyc.alias %v1223 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L264"} : i4
  %v1225 = pyc.zext %v291 : i1 -> i4
  %v1226 = pyc.add %v1224, %v1225 : i4
  %v1227 = pyc.alias %v1226 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L264"} : i4
  %v1228 = pyc.zext %v296 : i1 -> i4
  %v1229 = pyc.add %v1227, %v1228 : i4
  %v1230 = pyc.alias %v1229 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L264"} : i4
  %v1231 = pyc.zext %v301 : i1 -> i4
  %v1232 = pyc.add %v1230, %v1231 : i4
  %v1233 = pyc.alias %v1232 {pyc.name = "pending_cnt__fastfwd_v3_integrated__L264"} : i4
  %v1234 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1235 = pyc.constant 1 : i1
  %v1236 = pyc.constant 0 : i1
  %v1237 = pyc.reg %clk, %rst, %v1235, %v1234, %v1236 : i1
  %v1238 = pyc.alias %v1237 {pyc.name = "bkpr_reg"} : i1
  %v1239 = pyc.alias %v1238 {pyc.name = "bkpr__fastfwd_v3_integrated__L266"} : i1
  %v1240 = pyc.constant 10 : i4
  %v1241 = pyc.ult %v1233, %v1240 : i4
  %v1242 = pyc.not %v1241 : i1
  pyc.assign %v1234, %v1242 : i1
  func.return %v1023, %v1043, %v1028, %v1048, %v1033, %v1053, %v1038, %v1058, %v1239 : i1, i128, i1, i128, i1, i128, i1, i128, i1
}

}

