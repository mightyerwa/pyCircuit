module attributes {pyc.top = @fastfwd_v3_4, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3_4(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "pkt_in_bkpr", "fwd0_pkt_data_vld", "fwd0_pkt_data", "fwd0_pkt_lat", "fwd0_pkt_dp_vld", "fwd0_pkt_dp_data", "fwd1_pkt_data_vld", "fwd1_pkt_data", "fwd1_pkt_lat", "fwd1_pkt_dp_vld", "fwd1_pkt_dp_data", "fwd2_pkt_data_vld", "fwd2_pkt_data", "fwd2_pkt_lat", "fwd2_pkt_dp_vld", "fwd2_pkt_dp_data", "fwd3_pkt_data_vld", "fwd3_pkt_data", "fwd3_pkt_lat", "fwd3_pkt_dp_vld", "fwd3_pkt_dp_data"], pyc.base = "fastfwd_v3_4", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_4__L35"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v3_4__L36"} : i2
  %v13 = pyc.wire {pyc.name = "cycle_cnt__next"} : i16
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i16
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i16
  %v17 = pyc.alias %v16 {pyc.name = "cycle_cnt"} : i16
  %v18 = pyc.alias %v17 {pyc.name = "cycle_cnt__fastfwd_v3_4__L37"} : i16
  %v19 = pyc.constant 1 : i16
  %v20 = pyc.add %v18, %v19 : i16
  pyc.assign %v13, %v20 : i16
  %v21 = pyc.alias %v18 {pyc.name = "current_cycle__fastfwd_v3_4__L39"} : i16
  %v22 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_4__L44"} : i16
  %v23 = pyc.alias %lane0_pkt_in_vld {pyc.name = "offset_1__fastfwd_v3_4__L46"} : i1
  %v24 = pyc.add %v23, %lane1_pkt_in_vld : i1
  %v25 = pyc.alias %v24 {pyc.name = "offset_2__fastfwd_v3_4__L47"} : i1
  %v26 = pyc.add %v25, %lane2_pkt_in_vld : i1
  %v27 = pyc.alias %v26 {pyc.name = "offset_3__fastfwd_v3_4__L48"} : i1
  %v28 = pyc.constant 0 : i16
  %v29 = pyc.add %v22, %v28 : i16
  %v30 = pyc.zext %v23 : i1 -> i16
  %v31 = pyc.add %v22, %v30 : i16
  %v32 = pyc.zext %v25 : i1 -> i16
  %v33 = pyc.add %v22, %v32 : i16
  %v34 = pyc.zext %v27 : i1 -> i16
  %v35 = pyc.add %v22, %v34 : i16
  %v36 = pyc.constant 0 : i1
  %v37 = pyc.add %lane0_pkt_in_vld, %v36 : i1
  %v38 = pyc.add %v37, %lane1_pkt_in_vld : i1
  %v39 = pyc.add %v38, %lane2_pkt_in_vld : i1
  %v40 = pyc.add %v39, %lane3_pkt_in_vld : i1
  %v41 = pyc.alias %v40 {pyc.name = "total_input__fastfwd_v3_4__L56"} : i1
  %v42 = pyc.zext %v41 : i1 -> i16
  %v43 = pyc.add %v22, %v42 : i16
  pyc.assign %v1, %v43 : i16
  %v44 = pyc.wire {pyc.name = "fwd0_pkt_data_vld__next"} : i1
  %v45 = pyc.constant 1 : i1
  %v46 = pyc.constant 0 : i1
  %v47 = pyc.reg %clk, %rst, %v45, %v44, %v46 : i1
  %v48 = pyc.alias %v47 {pyc.name = "fwd0_pkt_data_vld"} : i1
  %v49 = pyc.wire {pyc.name = "fwd1_pkt_data_vld__next"} : i1
  %v50 = pyc.constant 1 : i1
  %v51 = pyc.constant 0 : i1
  %v52 = pyc.reg %clk, %rst, %v50, %v49, %v51 : i1
  %v53 = pyc.alias %v52 {pyc.name = "fwd1_pkt_data_vld"} : i1
  %v54 = pyc.wire {pyc.name = "fwd2_pkt_data_vld__next"} : i1
  %v55 = pyc.constant 1 : i1
  %v56 = pyc.constant 0 : i1
  %v57 = pyc.reg %clk, %rst, %v55, %v54, %v56 : i1
  %v58 = pyc.alias %v57 {pyc.name = "fwd2_pkt_data_vld"} : i1
  %v59 = pyc.wire {pyc.name = "fwd3_pkt_data_vld__next"} : i1
  %v60 = pyc.constant 1 : i1
  %v61 = pyc.constant 0 : i1
  %v62 = pyc.reg %clk, %rst, %v60, %v59, %v61 : i1
  %v63 = pyc.alias %v62 {pyc.name = "fwd3_pkt_data_vld"} : i1
  %v64 = pyc.wire {pyc.name = "fwd0_pkt_data__next"} : i128
  %v65 = pyc.constant 1 : i1
  %v66 = pyc.constant 0 : i128
  %v67 = pyc.reg %clk, %rst, %v65, %v64, %v66 : i128
  %v68 = pyc.alias %v67 {pyc.name = "fwd0_pkt_data"} : i128
  %v69 = pyc.wire {pyc.name = "fwd1_pkt_data__next"} : i128
  %v70 = pyc.constant 1 : i1
  %v71 = pyc.constant 0 : i128
  %v72 = pyc.reg %clk, %rst, %v70, %v69, %v71 : i128
  %v73 = pyc.alias %v72 {pyc.name = "fwd1_pkt_data"} : i128
  %v74 = pyc.wire {pyc.name = "fwd2_pkt_data__next"} : i128
  %v75 = pyc.constant 1 : i1
  %v76 = pyc.constant 0 : i128
  %v77 = pyc.reg %clk, %rst, %v75, %v74, %v76 : i128
  %v78 = pyc.alias %v77 {pyc.name = "fwd2_pkt_data"} : i128
  %v79 = pyc.wire {pyc.name = "fwd3_pkt_data__next"} : i128
  %v80 = pyc.constant 1 : i1
  %v81 = pyc.constant 0 : i128
  %v82 = pyc.reg %clk, %rst, %v80, %v79, %v81 : i128
  %v83 = pyc.alias %v82 {pyc.name = "fwd3_pkt_data"} : i128
  %v84 = pyc.wire {pyc.name = "fwd0_pkt_lat__next"} : i2
  %v85 = pyc.constant 1 : i1
  %v86 = pyc.constant 0 : i2
  %v87 = pyc.reg %clk, %rst, %v85, %v84, %v86 : i2
  %v88 = pyc.alias %v87 {pyc.name = "fwd0_pkt_lat"} : i2
  %v89 = pyc.wire {pyc.name = "fwd1_pkt_lat__next"} : i2
  %v90 = pyc.constant 1 : i1
  %v91 = pyc.constant 0 : i2
  %v92 = pyc.reg %clk, %rst, %v90, %v89, %v91 : i2
  %v93 = pyc.alias %v92 {pyc.name = "fwd1_pkt_lat"} : i2
  %v94 = pyc.wire {pyc.name = "fwd2_pkt_lat__next"} : i2
  %v95 = pyc.constant 1 : i1
  %v96 = pyc.constant 0 : i2
  %v97 = pyc.reg %clk, %rst, %v95, %v94, %v96 : i2
  %v98 = pyc.alias %v97 {pyc.name = "fwd2_pkt_lat"} : i2
  %v99 = pyc.wire {pyc.name = "fwd3_pkt_lat__next"} : i2
  %v100 = pyc.constant 1 : i1
  %v101 = pyc.constant 0 : i2
  %v102 = pyc.reg %clk, %rst, %v100, %v99, %v101 : i2
  %v103 = pyc.alias %v102 {pyc.name = "fwd3_pkt_lat"} : i2
  %v104 = pyc.wire {pyc.name = "fwd0_pkt_dp_vld__next"} : i1
  %v105 = pyc.constant 1 : i1
  %v106 = pyc.constant 0 : i1
  %v107 = pyc.reg %clk, %rst, %v105, %v104, %v106 : i1
  %v108 = pyc.alias %v107 {pyc.name = "fwd0_pkt_dp_vld"} : i1
  %v109 = pyc.wire {pyc.name = "fwd1_pkt_dp_vld__next"} : i1
  %v110 = pyc.constant 1 : i1
  %v111 = pyc.constant 0 : i1
  %v112 = pyc.reg %clk, %rst, %v110, %v109, %v111 : i1
  %v113 = pyc.alias %v112 {pyc.name = "fwd1_pkt_dp_vld"} : i1
  %v114 = pyc.wire {pyc.name = "fwd2_pkt_dp_vld__next"} : i1
  %v115 = pyc.constant 1 : i1
  %v116 = pyc.constant 0 : i1
  %v117 = pyc.reg %clk, %rst, %v115, %v114, %v116 : i1
  %v118 = pyc.alias %v117 {pyc.name = "fwd2_pkt_dp_vld"} : i1
  %v119 = pyc.wire {pyc.name = "fwd3_pkt_dp_vld__next"} : i1
  %v120 = pyc.constant 1 : i1
  %v121 = pyc.constant 0 : i1
  %v122 = pyc.reg %clk, %rst, %v120, %v119, %v121 : i1
  %v123 = pyc.alias %v122 {pyc.name = "fwd3_pkt_dp_vld"} : i1
  %v124 = pyc.wire {pyc.name = "fwd0_pkt_dp_data__next"} : i128
  %v125 = pyc.constant 1 : i1
  %v126 = pyc.constant 0 : i128
  %v127 = pyc.reg %clk, %rst, %v125, %v124, %v126 : i128
  %v128 = pyc.alias %v127 {pyc.name = "fwd0_pkt_dp_data"} : i128
  %v129 = pyc.wire {pyc.name = "fwd1_pkt_dp_data__next"} : i128
  %v130 = pyc.constant 1 : i1
  %v131 = pyc.constant 0 : i128
  %v132 = pyc.reg %clk, %rst, %v130, %v129, %v131 : i128
  %v133 = pyc.alias %v132 {pyc.name = "fwd1_pkt_dp_data"} : i128
  %v134 = pyc.wire {pyc.name = "fwd2_pkt_dp_data__next"} : i128
  %v135 = pyc.constant 1 : i1
  %v136 = pyc.constant 0 : i128
  %v137 = pyc.reg %clk, %rst, %v135, %v134, %v136 : i128
  %v138 = pyc.alias %v137 {pyc.name = "fwd2_pkt_dp_data"} : i128
  %v139 = pyc.wire {pyc.name = "fwd3_pkt_dp_data__next"} : i128
  %v140 = pyc.constant 1 : i1
  %v141 = pyc.constant 0 : i128
  %v142 = pyc.reg %clk, %rst, %v140, %v139, %v141 : i128
  %v143 = pyc.alias %v142 {pyc.name = "fwd3_pkt_dp_data"} : i128
  %v144 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v145 = pyc.constant 1 : i1
  %v146 = pyc.constant 0 : i1
  %v147 = pyc.reg %clk, %rst, %v145, %v144, %v146 : i1
  %v148 = pyc.alias %v147 {pyc.name = "fe0_busy"} : i1
  %v149 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v150 = pyc.constant 1 : i1
  %v151 = pyc.constant 0 : i1
  %v152 = pyc.reg %clk, %rst, %v150, %v149, %v151 : i1
  %v153 = pyc.alias %v152 {pyc.name = "fe1_busy"} : i1
  %v154 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v155 = pyc.constant 1 : i1
  %v156 = pyc.constant 0 : i1
  %v157 = pyc.reg %clk, %rst, %v155, %v154, %v156 : i1
  %v158 = pyc.alias %v157 {pyc.name = "fe2_busy"} : i1
  %v159 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v160 = pyc.constant 1 : i1
  %v161 = pyc.constant 0 : i1
  %v162 = pyc.reg %clk, %rst, %v160, %v159, %v161 : i1
  %v163 = pyc.alias %v162 {pyc.name = "fe3_busy"} : i1
  %v164 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v165 = pyc.constant 1 : i1
  %v166 = pyc.constant 0 : i3
  %v167 = pyc.reg %clk, %rst, %v165, %v164, %v166 : i3
  %v168 = pyc.alias %v167 {pyc.name = "fe0_timer"} : i3
  %v169 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v170 = pyc.constant 1 : i1
  %v171 = pyc.constant 0 : i3
  %v172 = pyc.reg %clk, %rst, %v170, %v169, %v171 : i3
  %v173 = pyc.alias %v172 {pyc.name = "fe1_timer"} : i3
  %v174 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v175 = pyc.constant 1 : i1
  %v176 = pyc.constant 0 : i3
  %v177 = pyc.reg %clk, %rst, %v175, %v174, %v176 : i3
  %v178 = pyc.alias %v177 {pyc.name = "fe2_timer"} : i3
  %v179 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v180 = pyc.constant 1 : i1
  %v181 = pyc.constant 0 : i3
  %v182 = pyc.reg %clk, %rst, %v180, %v179, %v181 : i3
  %v183 = pyc.alias %v182 {pyc.name = "fe3_timer"} : i3
  %v184 = pyc.wire {pyc.name = "fe0_last_finish__next"} : i6
  %v185 = pyc.constant 1 : i1
  %v186 = pyc.constant 0 : i6
  %v187 = pyc.reg %clk, %rst, %v185, %v184, %v186 : i6
  %v188 = pyc.alias %v187 {pyc.name = "fe0_last_finish"} : i6
  %v189 = pyc.wire {pyc.name = "fe1_last_finish__next"} : i6
  %v190 = pyc.constant 1 : i1
  %v191 = pyc.constant 0 : i6
  %v192 = pyc.reg %clk, %rst, %v190, %v189, %v191 : i6
  %v193 = pyc.alias %v192 {pyc.name = "fe1_last_finish"} : i6
  %v194 = pyc.wire {pyc.name = "fe2_last_finish__next"} : i6
  %v195 = pyc.constant 1 : i1
  %v196 = pyc.constant 0 : i6
  %v197 = pyc.reg %clk, %rst, %v195, %v194, %v196 : i6
  %v198 = pyc.alias %v197 {pyc.name = "fe2_last_finish"} : i6
  %v199 = pyc.wire {pyc.name = "fe3_last_finish__next"} : i6
  %v200 = pyc.constant 1 : i1
  %v201 = pyc.constant 0 : i6
  %v202 = pyc.reg %clk, %rst, %v200, %v199, %v201 : i6
  %v203 = pyc.alias %v202 {pyc.name = "fe3_last_finish"} : i6
  %v204 = pyc.wire {pyc.name = "fe0_pkt_seq__next"} : i16
  %v205 = pyc.constant 1 : i1
  %v206 = pyc.constant 0 : i16
  %v207 = pyc.reg %clk, %rst, %v205, %v204, %v206 : i16
  %v208 = pyc.alias %v207 {pyc.name = "fe0_pkt_seq"} : i16
  %v209 = pyc.wire {pyc.name = "fe1_pkt_seq__next"} : i16
  %v210 = pyc.constant 1 : i1
  %v211 = pyc.constant 0 : i16
  %v212 = pyc.reg %clk, %rst, %v210, %v209, %v211 : i16
  %v213 = pyc.alias %v212 {pyc.name = "fe1_pkt_seq"} : i16
  %v214 = pyc.wire {pyc.name = "fe2_pkt_seq__next"} : i16
  %v215 = pyc.constant 1 : i1
  %v216 = pyc.constant 0 : i16
  %v217 = pyc.reg %clk, %rst, %v215, %v214, %v216 : i16
  %v218 = pyc.alias %v217 {pyc.name = "fe2_pkt_seq"} : i16
  %v219 = pyc.wire {pyc.name = "fe3_pkt_seq__next"} : i16
  %v220 = pyc.constant 1 : i1
  %v221 = pyc.constant 0 : i16
  %v222 = pyc.reg %clk, %rst, %v220, %v219, %v221 : i16
  %v223 = pyc.alias %v222 {pyc.name = "fe3_pkt_seq"} : i16
  %v224 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v225 = pyc.constant 1 : i1
  %v226 = pyc.constant 0 : i1
  %v227 = pyc.reg %clk, %rst, %v225, %v224, %v226 : i1
  %v228 = pyc.alias %v227 {pyc.name = "dep0_valid"} : i1
  %v229 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v230 = pyc.constant 1 : i1
  %v231 = pyc.constant 0 : i1
  %v232 = pyc.reg %clk, %rst, %v230, %v229, %v231 : i1
  %v233 = pyc.alias %v232 {pyc.name = "dep1_valid"} : i1
  %v234 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v235 = pyc.constant 1 : i1
  %v236 = pyc.constant 0 : i1
  %v237 = pyc.reg %clk, %rst, %v235, %v234, %v236 : i1
  %v238 = pyc.alias %v237 {pyc.name = "dep2_valid"} : i1
  %v239 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v240 = pyc.constant 1 : i1
  %v241 = pyc.constant 0 : i1
  %v242 = pyc.reg %clk, %rst, %v240, %v239, %v241 : i1
  %v243 = pyc.alias %v242 {pyc.name = "dep3_valid"} : i1
  %v244 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v245 = pyc.constant 1 : i1
  %v246 = pyc.constant 0 : i1
  %v247 = pyc.reg %clk, %rst, %v245, %v244, %v246 : i1
  %v248 = pyc.alias %v247 {pyc.name = "dep4_valid"} : i1
  %v249 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v250 = pyc.constant 1 : i1
  %v251 = pyc.constant 0 : i1
  %v252 = pyc.reg %clk, %rst, %v250, %v249, %v251 : i1
  %v253 = pyc.alias %v252 {pyc.name = "dep5_valid"} : i1
  %v254 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v255 = pyc.constant 1 : i1
  %v256 = pyc.constant 0 : i1
  %v257 = pyc.reg %clk, %rst, %v255, %v254, %v256 : i1
  %v258 = pyc.alias %v257 {pyc.name = "dep6_valid"} : i1
  %v259 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v260 = pyc.constant 1 : i1
  %v261 = pyc.constant 0 : i1
  %v262 = pyc.reg %clk, %rst, %v260, %v259, %v261 : i1
  %v263 = pyc.alias %v262 {pyc.name = "dep7_valid"} : i1
  %v264 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v265 = pyc.constant 1 : i1
  %v266 = pyc.constant 0 : i128
  %v267 = pyc.reg %clk, %rst, %v265, %v264, %v266 : i128
  %v268 = pyc.alias %v267 {pyc.name = "dep0_data"} : i128
  %v269 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v270 = pyc.constant 1 : i1
  %v271 = pyc.constant 0 : i128
  %v272 = pyc.reg %clk, %rst, %v270, %v269, %v271 : i128
  %v273 = pyc.alias %v272 {pyc.name = "dep1_data"} : i128
  %v274 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v275 = pyc.constant 1 : i1
  %v276 = pyc.constant 0 : i128
  %v277 = pyc.reg %clk, %rst, %v275, %v274, %v276 : i128
  %v278 = pyc.alias %v277 {pyc.name = "dep2_data"} : i128
  %v279 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v280 = pyc.constant 1 : i1
  %v281 = pyc.constant 0 : i128
  %v282 = pyc.reg %clk, %rst, %v280, %v279, %v281 : i128
  %v283 = pyc.alias %v282 {pyc.name = "dep3_data"} : i128
  %v284 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v285 = pyc.constant 1 : i1
  %v286 = pyc.constant 0 : i128
  %v287 = pyc.reg %clk, %rst, %v285, %v284, %v286 : i128
  %v288 = pyc.alias %v287 {pyc.name = "dep4_data"} : i128
  %v289 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v290 = pyc.constant 1 : i1
  %v291 = pyc.constant 0 : i128
  %v292 = pyc.reg %clk, %rst, %v290, %v289, %v291 : i128
  %v293 = pyc.alias %v292 {pyc.name = "dep5_data"} : i128
  %v294 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v295 = pyc.constant 1 : i1
  %v296 = pyc.constant 0 : i128
  %v297 = pyc.reg %clk, %rst, %v295, %v294, %v296 : i128
  %v298 = pyc.alias %v297 {pyc.name = "dep6_data"} : i128
  %v299 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v300 = pyc.constant 1 : i1
  %v301 = pyc.constant 0 : i128
  %v302 = pyc.reg %clk, %rst, %v300, %v299, %v301 : i128
  %v303 = pyc.alias %v302 {pyc.name = "dep7_data"} : i128
  %v304 = pyc.wire {pyc.name = "dep0_seq__next"} : i16
  %v305 = pyc.constant 1 : i1
  %v306 = pyc.constant 0 : i16
  %v307 = pyc.reg %clk, %rst, %v305, %v304, %v306 : i16
  %v308 = pyc.alias %v307 {pyc.name = "dep0_seq"} : i16
  %v309 = pyc.wire {pyc.name = "dep1_seq__next"} : i16
  %v310 = pyc.constant 1 : i1
  %v311 = pyc.constant 0 : i16
  %v312 = pyc.reg %clk, %rst, %v310, %v309, %v311 : i16
  %v313 = pyc.alias %v312 {pyc.name = "dep1_seq"} : i16
  %v314 = pyc.wire {pyc.name = "dep2_seq__next"} : i16
  %v315 = pyc.constant 1 : i1
  %v316 = pyc.constant 0 : i16
  %v317 = pyc.reg %clk, %rst, %v315, %v314, %v316 : i16
  %v318 = pyc.alias %v317 {pyc.name = "dep2_seq"} : i16
  %v319 = pyc.wire {pyc.name = "dep3_seq__next"} : i16
  %v320 = pyc.constant 1 : i1
  %v321 = pyc.constant 0 : i16
  %v322 = pyc.reg %clk, %rst, %v320, %v319, %v321 : i16
  %v323 = pyc.alias %v322 {pyc.name = "dep3_seq"} : i16
  %v324 = pyc.wire {pyc.name = "dep4_seq__next"} : i16
  %v325 = pyc.constant 1 : i1
  %v326 = pyc.constant 0 : i16
  %v327 = pyc.reg %clk, %rst, %v325, %v324, %v326 : i16
  %v328 = pyc.alias %v327 {pyc.name = "dep4_seq"} : i16
  %v329 = pyc.wire {pyc.name = "dep5_seq__next"} : i16
  %v330 = pyc.constant 1 : i1
  %v331 = pyc.constant 0 : i16
  %v332 = pyc.reg %clk, %rst, %v330, %v329, %v331 : i16
  %v333 = pyc.alias %v332 {pyc.name = "dep5_seq"} : i16
  %v334 = pyc.wire {pyc.name = "dep6_seq__next"} : i16
  %v335 = pyc.constant 1 : i1
  %v336 = pyc.constant 0 : i16
  %v337 = pyc.reg %clk, %rst, %v335, %v334, %v336 : i16
  %v338 = pyc.alias %v337 {pyc.name = "dep6_seq"} : i16
  %v339 = pyc.wire {pyc.name = "dep7_seq__next"} : i16
  %v340 = pyc.constant 1 : i1
  %v341 = pyc.constant 0 : i16
  %v342 = pyc.reg %clk, %rst, %v340, %v339, %v341 : i16
  %v343 = pyc.alias %v342 {pyc.name = "dep7_seq"} : i16
  %v344 = pyc.wire {pyc.name = "dep_write_ptr__next"} : i3
  %v345 = pyc.constant 1 : i1
  %v346 = pyc.constant 0 : i3
  %v347 = pyc.reg %clk, %rst, %v345, %v344, %v346 : i3
  %v348 = pyc.alias %v347 {pyc.name = "dep_write_ptr"} : i3
  %v349 = pyc.alias %v348 {pyc.name = "dep_write_ptr__fastfwd_v3_4__L86"} : i3
  %v350 = pyc.alias %fwded0_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_4__L94"} : i1
  %v351 = pyc.constant 0 : i1
  %v352 = pyc.or %v350, %v351 : i1
  %v353 = pyc.alias %v352 {pyc.name = "fe_done__fastfwd_v3_4__L95"} : i1
  %v354 = pyc.not %v350 : i1
  %v355 = pyc.constant 0 : i128
  %v356 = pyc.mux %v354, %v355, %fwded0_pkt_data : i128
  %v357 = pyc.alias %v356 {pyc.name = "fe_done_data__fastfwd_v3_4__L96"} : i128
  %v358 = pyc.not %v350 : i1
  %v359 = pyc.constant 0 : i16
  %v360 = pyc.mux %v358, %v359, %v208 : i16
  %v361 = pyc.alias %v360 {pyc.name = "fe_done_seq__fastfwd_v3_4__L97"} : i16
  %v362 = pyc.alias %fwded1_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_4__L94"} : i1
  %v363 = pyc.or %v353, %v362 : i1
  %v364 = pyc.alias %v363 {pyc.name = "fe_done__fastfwd_v3_4__L95"} : i1
  %v365 = pyc.not %v362 : i1
  %v366 = pyc.mux %v365, %v357, %fwded1_pkt_data : i128
  %v367 = pyc.alias %v366 {pyc.name = "fe_done_data__fastfwd_v3_4__L96"} : i128
  %v368 = pyc.not %v362 : i1
  %v369 = pyc.mux %v368, %v361, %v213 : i16
  %v370 = pyc.alias %v369 {pyc.name = "fe_done_seq__fastfwd_v3_4__L97"} : i16
  %v371 = pyc.alias %fwded2_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_4__L94"} : i1
  %v372 = pyc.or %v364, %v371 : i1
  %v373 = pyc.alias %v372 {pyc.name = "fe_done__fastfwd_v3_4__L95"} : i1
  %v374 = pyc.not %v371 : i1
  %v375 = pyc.mux %v374, %v367, %fwded2_pkt_data : i128
  %v376 = pyc.alias %v375 {pyc.name = "fe_done_data__fastfwd_v3_4__L96"} : i128
  %v377 = pyc.not %v371 : i1
  %v378 = pyc.mux %v377, %v370, %v218 : i16
  %v379 = pyc.alias %v378 {pyc.name = "fe_done_seq__fastfwd_v3_4__L97"} : i16
  %v380 = pyc.alias %fwded3_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_4__L94"} : i1
  %v381 = pyc.or %v373, %v380 : i1
  %v382 = pyc.alias %v381 {pyc.name = "fe_done__fastfwd_v3_4__L95"} : i1
  %v383 = pyc.not %v380 : i1
  %v384 = pyc.mux %v383, %v376, %fwded3_pkt_data : i128
  %v385 = pyc.alias %v384 {pyc.name = "fe_done_data__fastfwd_v3_4__L96"} : i128
  %v386 = pyc.not %v380 : i1
  %v387 = pyc.mux %v386, %v379, %v223 : i16
  %v388 = pyc.alias %v387 {pyc.name = "fe_done_seq__fastfwd_v3_4__L97"} : i16
  %v389 = pyc.constant 0 : i3
  %v390 = pyc.eq %v349, %v389 : i3
  %v391 = pyc.and %v382, %v390 : i1
  %v392 = pyc.alias %v391 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v393 = pyc.or %v392, %v228 : i1
  pyc.assign %v224, %v393 : i1
  %v394 = pyc.mux %v392, %v385, %v268 : i128
  pyc.assign %v264, %v394 : i128
  %v395 = pyc.mux %v392, %v388, %v308 : i16
  pyc.assign %v304, %v395 : i16
  %v396 = pyc.constant 1 : i3
  %v397 = pyc.eq %v349, %v396 : i3
  %v398 = pyc.and %v382, %v397 : i1
  %v399 = pyc.alias %v398 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v400 = pyc.or %v399, %v233 : i1
  pyc.assign %v229, %v400 : i1
  %v401 = pyc.mux %v399, %v385, %v273 : i128
  pyc.assign %v269, %v401 : i128
  %v402 = pyc.mux %v399, %v388, %v313 : i16
  pyc.assign %v309, %v402 : i16
  %v403 = pyc.constant 2 : i3
  %v404 = pyc.eq %v349, %v403 : i3
  %v405 = pyc.and %v382, %v404 : i1
  %v406 = pyc.alias %v405 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v407 = pyc.or %v406, %v238 : i1
  pyc.assign %v234, %v407 : i1
  %v408 = pyc.mux %v406, %v385, %v278 : i128
  pyc.assign %v274, %v408 : i128
  %v409 = pyc.mux %v406, %v388, %v318 : i16
  pyc.assign %v314, %v409 : i16
  %v410 = pyc.constant 3 : i3
  %v411 = pyc.eq %v349, %v410 : i3
  %v412 = pyc.and %v382, %v411 : i1
  %v413 = pyc.alias %v412 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v414 = pyc.or %v413, %v243 : i1
  pyc.assign %v239, %v414 : i1
  %v415 = pyc.mux %v413, %v385, %v283 : i128
  pyc.assign %v279, %v415 : i128
  %v416 = pyc.mux %v413, %v388, %v323 : i16
  pyc.assign %v319, %v416 : i16
  %v417 = pyc.constant 4 : i3
  %v418 = pyc.eq %v349, %v417 : i3
  %v419 = pyc.and %v382, %v418 : i1
  %v420 = pyc.alias %v419 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v421 = pyc.or %v420, %v248 : i1
  pyc.assign %v244, %v421 : i1
  %v422 = pyc.mux %v420, %v385, %v288 : i128
  pyc.assign %v284, %v422 : i128
  %v423 = pyc.mux %v420, %v388, %v328 : i16
  pyc.assign %v324, %v423 : i16
  %v424 = pyc.constant 5 : i3
  %v425 = pyc.eq %v349, %v424 : i3
  %v426 = pyc.and %v382, %v425 : i1
  %v427 = pyc.alias %v426 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v428 = pyc.or %v427, %v253 : i1
  pyc.assign %v249, %v428 : i1
  %v429 = pyc.mux %v427, %v385, %v293 : i128
  pyc.assign %v289, %v429 : i128
  %v430 = pyc.mux %v427, %v388, %v333 : i16
  pyc.assign %v329, %v430 : i16
  %v431 = pyc.constant 6 : i3
  %v432 = pyc.eq %v349, %v431 : i3
  %v433 = pyc.and %v382, %v432 : i1
  %v434 = pyc.alias %v433 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v435 = pyc.or %v434, %v258 : i1
  pyc.assign %v254, %v435 : i1
  %v436 = pyc.mux %v434, %v385, %v298 : i128
  pyc.assign %v294, %v436 : i128
  %v437 = pyc.mux %v434, %v388, %v338 : i16
  pyc.assign %v334, %v437 : i16
  %v438 = pyc.constant 7 : i3
  %v439 = pyc.eq %v349, %v438 : i3
  %v440 = pyc.and %v382, %v439 : i1
  %v441 = pyc.alias %v440 {pyc.name = "should_write__fastfwd_v3_4__L100"} : i1
  %v442 = pyc.or %v441, %v263 : i1
  pyc.assign %v259, %v442 : i1
  %v443 = pyc.mux %v441, %v385, %v303 : i128
  pyc.assign %v299, %v443 : i128
  %v444 = pyc.mux %v441, %v388, %v343 : i16
  pyc.assign %v339, %v444 : i16
  %v445 = pyc.constant 1 : i3
  %v446 = pyc.add %v349, %v445 : i3
  %v447 = pyc.constant 7 : i3
  %v448 = pyc.and %v446, %v447 : i3
  %v449 = pyc.alias %v448 {pyc.name = "new_dep_ptr__fastfwd_v3_4__L105"} : i3
  %v450 = pyc.mux %v382, %v449, %v349 : i3
  pyc.assign %v344, %v450 : i3
  %v451 = pyc.constant 3 : i5
  %v452 = pyc.and %lane0_pkt_in_ctrl, %v451 : i5
  %v453 = pyc.alias %v452 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v454 = pyc.lshri %lane0_pkt_in_ctrl {amount = 2} : i5
  %v455 = pyc.constant 7 : i5
  %v456 = pyc.and %v454, %v455 : i5
  %v457 = pyc.alias %v456 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v458 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v459 = pyc.constant 2 : i6
  %v460 = pyc.add %v458, %v459 : i6
  %v461 = pyc.zext %v453 : i5 -> i6
  %v462 = pyc.add %v460, %v461 : i6
  %v463 = pyc.alias %v462 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v464 = pyc.ult %v188, %v463 : i6
  %v465 = pyc.alias %v464 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v466 = pyc.not %v148 : i1
  %v467 = pyc.and %v466, %lane0_pkt_in_vld : i1
  %v468 = pyc.and %v467, %v465 : i1
  %v469 = pyc.alias %v468 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v470 = pyc.zext %v457 : i5 -> i16
  %v471 = pyc.sub %v29, %v470 : i16
  %v472 = pyc.alias %v471 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v473 = pyc.eq %v308, %v472 : i16
  %v474 = pyc.and %v228, %v473 : i1
  %v475 = pyc.alias %v474 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v476 = pyc.constant 0 : i1
  %v477 = pyc.or %v475, %v476 : i1
  %v478 = pyc.alias %v477 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v479 = pyc.not %v475 : i1
  %v480 = pyc.constant 0 : i128
  %v481 = pyc.mux %v479, %v480, %v268 : i128
  %v482 = pyc.alias %v481 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v483 = pyc.eq %v313, %v472 : i16
  %v484 = pyc.and %v233, %v483 : i1
  %v485 = pyc.alias %v484 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v486 = pyc.or %v478, %v485 : i1
  %v487 = pyc.alias %v486 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v488 = pyc.not %v485 : i1
  %v489 = pyc.mux %v488, %v482, %v273 : i128
  %v490 = pyc.alias %v489 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v491 = pyc.eq %v318, %v472 : i16
  %v492 = pyc.and %v238, %v491 : i1
  %v493 = pyc.alias %v492 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v494 = pyc.or %v487, %v493 : i1
  %v495 = pyc.alias %v494 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v496 = pyc.not %v493 : i1
  %v497 = pyc.mux %v496, %v490, %v278 : i128
  %v498 = pyc.alias %v497 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v499 = pyc.eq %v323, %v472 : i16
  %v500 = pyc.and %v243, %v499 : i1
  %v501 = pyc.alias %v500 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v502 = pyc.or %v495, %v501 : i1
  %v503 = pyc.alias %v502 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v504 = pyc.not %v501 : i1
  %v505 = pyc.mux %v504, %v498, %v283 : i128
  %v506 = pyc.alias %v505 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v507 = pyc.eq %v328, %v472 : i16
  %v508 = pyc.and %v248, %v507 : i1
  %v509 = pyc.alias %v508 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v510 = pyc.or %v503, %v509 : i1
  %v511 = pyc.alias %v510 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v512 = pyc.not %v509 : i1
  %v513 = pyc.mux %v512, %v506, %v288 : i128
  %v514 = pyc.alias %v513 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v515 = pyc.eq %v333, %v472 : i16
  %v516 = pyc.and %v253, %v515 : i1
  %v517 = pyc.alias %v516 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v518 = pyc.or %v511, %v517 : i1
  %v519 = pyc.alias %v518 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v520 = pyc.not %v517 : i1
  %v521 = pyc.mux %v520, %v514, %v293 : i128
  %v522 = pyc.alias %v521 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v523 = pyc.eq %v338, %v472 : i16
  %v524 = pyc.and %v258, %v523 : i1
  %v525 = pyc.alias %v524 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v526 = pyc.or %v519, %v525 : i1
  %v527 = pyc.alias %v526 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v528 = pyc.not %v525 : i1
  %v529 = pyc.mux %v528, %v522, %v298 : i128
  %v530 = pyc.alias %v529 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v531 = pyc.eq %v343, %v472 : i16
  %v532 = pyc.and %v263, %v531 : i1
  %v533 = pyc.alias %v532 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v534 = pyc.or %v527, %v533 : i1
  %v535 = pyc.alias %v534 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v536 = pyc.not %v533 : i1
  %v537 = pyc.mux %v536, %v530, %v303 : i128
  %v538 = pyc.alias %v537 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v539 = pyc.constant 0 : i3
  %v540 = pyc.zext %v539 : i3 -> i5
  %v541 = pyc.eq %v457, %v540 : i5
  %v542 = pyc.not %v541 : i1
  %v543 = pyc.alias %v542 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v544 = pyc.and %v543, %v535 : i1
  %v545 = pyc.alias %v544 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v546 = pyc.not %v543 : i1
  %v547 = pyc.or %v546, %v545 : i1
  %v548 = pyc.and %v469, %v547 : i1
  %v549 = pyc.alias %v548 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v550 = pyc.constant 1 : i3
  %v551 = pyc.ult %v550, %v168 : i3
  %v552 = pyc.and %v148, %v551 : i1
  %v553 = pyc.or %v549, %v552 : i1
  pyc.assign %v144, %v553 : i1
  %v554 = pyc.constant 1 : i3
  %v555 = pyc.zext %v554 : i3 -> i5
  %v556 = pyc.add %v453, %v555 : i5
  %v557 = pyc.constant 1 : i3
  %v558 = pyc.sub %v168, %v557 : i3
  %v559 = pyc.constant 0 : i3
  %v560 = pyc.mux %v148, %v558, %v559 : i3
  %v561 = pyc.zext %v560 : i3 -> i5
  %v562 = pyc.mux %v549, %v556, %v561 : i5
  %v563 = pyc.alias %v562 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v564 = pyc.trunc %v563 : i5 -> i3
  pyc.assign %v164, %v564 : i3
  %v565 = pyc.mux %v549, %v463, %v188 : i6
  pyc.assign %v184, %v565 : i6
  %v566 = pyc.mux %v549, %v29, %v208 : i16
  pyc.assign %v204, %v566 : i16
  pyc.assign %v44, %v549 : i1
  %v567 = pyc.constant 0 : i128
  %v568 = pyc.mux %v549, %lane0_pkt_in_data, %v567 : i128
  pyc.assign %v64, %v568 : i128
  %v569 = pyc.constant 0 : i2
  %v570 = pyc.zext %v569 : i2 -> i5
  %v571 = pyc.mux %v549, %v453, %v570 : i5
  %v572 = pyc.trunc %v571 : i5 -> i2
  pyc.assign %v84, %v572 : i2
  %v573 = pyc.and %v543, %v549 : i1
  pyc.assign %v104, %v573 : i1
  %v574 = pyc.and %v543, %v549 : i1
  %v575 = pyc.constant 0 : i128
  %v576 = pyc.mux %v574, %v538, %v575 : i128
  pyc.assign %v124, %v576 : i128
  %v577 = pyc.constant 3 : i5
  %v578 = pyc.and %lane1_pkt_in_ctrl, %v577 : i5
  %v579 = pyc.alias %v578 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v580 = pyc.lshri %lane1_pkt_in_ctrl {amount = 2} : i5
  %v581 = pyc.constant 7 : i5
  %v582 = pyc.and %v580, %v581 : i5
  %v583 = pyc.alias %v582 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v584 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v585 = pyc.constant 2 : i6
  %v586 = pyc.add %v584, %v585 : i6
  %v587 = pyc.zext %v579 : i5 -> i6
  %v588 = pyc.add %v586, %v587 : i6
  %v589 = pyc.alias %v588 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v590 = pyc.ult %v193, %v589 : i6
  %v591 = pyc.alias %v590 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v592 = pyc.not %v153 : i1
  %v593 = pyc.and %v592, %lane1_pkt_in_vld : i1
  %v594 = pyc.and %v593, %v591 : i1
  %v595 = pyc.alias %v594 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v596 = pyc.zext %v583 : i5 -> i16
  %v597 = pyc.sub %v31, %v596 : i16
  %v598 = pyc.alias %v597 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v599 = pyc.eq %v308, %v598 : i16
  %v600 = pyc.and %v228, %v599 : i1
  %v601 = pyc.alias %v600 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v602 = pyc.constant 0 : i1
  %v603 = pyc.or %v601, %v602 : i1
  %v604 = pyc.alias %v603 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v605 = pyc.not %v601 : i1
  %v606 = pyc.constant 0 : i128
  %v607 = pyc.mux %v605, %v606, %v268 : i128
  %v608 = pyc.alias %v607 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v609 = pyc.eq %v313, %v598 : i16
  %v610 = pyc.and %v233, %v609 : i1
  %v611 = pyc.alias %v610 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v612 = pyc.or %v604, %v611 : i1
  %v613 = pyc.alias %v612 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v614 = pyc.not %v611 : i1
  %v615 = pyc.mux %v614, %v608, %v273 : i128
  %v616 = pyc.alias %v615 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v617 = pyc.eq %v318, %v598 : i16
  %v618 = pyc.and %v238, %v617 : i1
  %v619 = pyc.alias %v618 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v620 = pyc.or %v613, %v619 : i1
  %v621 = pyc.alias %v620 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v622 = pyc.not %v619 : i1
  %v623 = pyc.mux %v622, %v616, %v278 : i128
  %v624 = pyc.alias %v623 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v625 = pyc.eq %v323, %v598 : i16
  %v626 = pyc.and %v243, %v625 : i1
  %v627 = pyc.alias %v626 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v628 = pyc.or %v621, %v627 : i1
  %v629 = pyc.alias %v628 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v630 = pyc.not %v627 : i1
  %v631 = pyc.mux %v630, %v624, %v283 : i128
  %v632 = pyc.alias %v631 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v633 = pyc.eq %v328, %v598 : i16
  %v634 = pyc.and %v248, %v633 : i1
  %v635 = pyc.alias %v634 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v636 = pyc.or %v629, %v635 : i1
  %v637 = pyc.alias %v636 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v638 = pyc.not %v635 : i1
  %v639 = pyc.mux %v638, %v632, %v288 : i128
  %v640 = pyc.alias %v639 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v641 = pyc.eq %v333, %v598 : i16
  %v642 = pyc.and %v253, %v641 : i1
  %v643 = pyc.alias %v642 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v644 = pyc.or %v637, %v643 : i1
  %v645 = pyc.alias %v644 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v646 = pyc.not %v643 : i1
  %v647 = pyc.mux %v646, %v640, %v293 : i128
  %v648 = pyc.alias %v647 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v649 = pyc.eq %v338, %v598 : i16
  %v650 = pyc.and %v258, %v649 : i1
  %v651 = pyc.alias %v650 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v652 = pyc.or %v645, %v651 : i1
  %v653 = pyc.alias %v652 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v654 = pyc.not %v651 : i1
  %v655 = pyc.mux %v654, %v648, %v298 : i128
  %v656 = pyc.alias %v655 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v657 = pyc.eq %v343, %v598 : i16
  %v658 = pyc.and %v263, %v657 : i1
  %v659 = pyc.alias %v658 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v660 = pyc.or %v653, %v659 : i1
  %v661 = pyc.alias %v660 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v662 = pyc.not %v659 : i1
  %v663 = pyc.mux %v662, %v656, %v303 : i128
  %v664 = pyc.alias %v663 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v665 = pyc.constant 0 : i3
  %v666 = pyc.zext %v665 : i3 -> i5
  %v667 = pyc.eq %v583, %v666 : i5
  %v668 = pyc.not %v667 : i1
  %v669 = pyc.alias %v668 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v670 = pyc.and %v669, %v661 : i1
  %v671 = pyc.alias %v670 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v672 = pyc.not %v669 : i1
  %v673 = pyc.or %v672, %v671 : i1
  %v674 = pyc.and %v595, %v673 : i1
  %v675 = pyc.alias %v674 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v676 = pyc.constant 1 : i3
  %v677 = pyc.ult %v676, %v173 : i3
  %v678 = pyc.and %v153, %v677 : i1
  %v679 = pyc.or %v675, %v678 : i1
  pyc.assign %v149, %v679 : i1
  %v680 = pyc.constant 1 : i3
  %v681 = pyc.zext %v680 : i3 -> i5
  %v682 = pyc.add %v579, %v681 : i5
  %v683 = pyc.constant 1 : i3
  %v684 = pyc.sub %v173, %v683 : i3
  %v685 = pyc.constant 0 : i3
  %v686 = pyc.mux %v153, %v684, %v685 : i3
  %v687 = pyc.zext %v686 : i3 -> i5
  %v688 = pyc.mux %v675, %v682, %v687 : i5
  %v689 = pyc.alias %v688 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v690 = pyc.trunc %v689 : i5 -> i3
  pyc.assign %v169, %v690 : i3
  %v691 = pyc.mux %v675, %v589, %v193 : i6
  pyc.assign %v189, %v691 : i6
  %v692 = pyc.mux %v675, %v31, %v213 : i16
  pyc.assign %v209, %v692 : i16
  pyc.assign %v49, %v675 : i1
  %v693 = pyc.constant 0 : i128
  %v694 = pyc.mux %v675, %lane1_pkt_in_data, %v693 : i128
  pyc.assign %v69, %v694 : i128
  %v695 = pyc.constant 0 : i2
  %v696 = pyc.zext %v695 : i2 -> i5
  %v697 = pyc.mux %v675, %v579, %v696 : i5
  %v698 = pyc.trunc %v697 : i5 -> i2
  pyc.assign %v89, %v698 : i2
  %v699 = pyc.and %v669, %v675 : i1
  pyc.assign %v109, %v699 : i1
  %v700 = pyc.and %v669, %v675 : i1
  %v701 = pyc.constant 0 : i128
  %v702 = pyc.mux %v700, %v664, %v701 : i128
  pyc.assign %v129, %v702 : i128
  %v703 = pyc.constant 3 : i5
  %v704 = pyc.and %lane2_pkt_in_ctrl, %v703 : i5
  %v705 = pyc.alias %v704 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v706 = pyc.lshri %lane2_pkt_in_ctrl {amount = 2} : i5
  %v707 = pyc.constant 7 : i5
  %v708 = pyc.and %v706, %v707 : i5
  %v709 = pyc.alias %v708 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v710 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v711 = pyc.constant 2 : i6
  %v712 = pyc.add %v710, %v711 : i6
  %v713 = pyc.zext %v705 : i5 -> i6
  %v714 = pyc.add %v712, %v713 : i6
  %v715 = pyc.alias %v714 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v716 = pyc.ult %v198, %v715 : i6
  %v717 = pyc.alias %v716 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v718 = pyc.not %v158 : i1
  %v719 = pyc.and %v718, %lane2_pkt_in_vld : i1
  %v720 = pyc.and %v719, %v717 : i1
  %v721 = pyc.alias %v720 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v722 = pyc.zext %v709 : i5 -> i16
  %v723 = pyc.sub %v33, %v722 : i16
  %v724 = pyc.alias %v723 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v725 = pyc.eq %v308, %v724 : i16
  %v726 = pyc.and %v228, %v725 : i1
  %v727 = pyc.alias %v726 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v728 = pyc.constant 0 : i1
  %v729 = pyc.or %v727, %v728 : i1
  %v730 = pyc.alias %v729 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v731 = pyc.not %v727 : i1
  %v732 = pyc.constant 0 : i128
  %v733 = pyc.mux %v731, %v732, %v268 : i128
  %v734 = pyc.alias %v733 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v735 = pyc.eq %v313, %v724 : i16
  %v736 = pyc.and %v233, %v735 : i1
  %v737 = pyc.alias %v736 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v738 = pyc.or %v730, %v737 : i1
  %v739 = pyc.alias %v738 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v740 = pyc.not %v737 : i1
  %v741 = pyc.mux %v740, %v734, %v273 : i128
  %v742 = pyc.alias %v741 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v743 = pyc.eq %v318, %v724 : i16
  %v744 = pyc.and %v238, %v743 : i1
  %v745 = pyc.alias %v744 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v746 = pyc.or %v739, %v745 : i1
  %v747 = pyc.alias %v746 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v748 = pyc.not %v745 : i1
  %v749 = pyc.mux %v748, %v742, %v278 : i128
  %v750 = pyc.alias %v749 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v751 = pyc.eq %v323, %v724 : i16
  %v752 = pyc.and %v243, %v751 : i1
  %v753 = pyc.alias %v752 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v754 = pyc.or %v747, %v753 : i1
  %v755 = pyc.alias %v754 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v756 = pyc.not %v753 : i1
  %v757 = pyc.mux %v756, %v750, %v283 : i128
  %v758 = pyc.alias %v757 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v759 = pyc.eq %v328, %v724 : i16
  %v760 = pyc.and %v248, %v759 : i1
  %v761 = pyc.alias %v760 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v762 = pyc.or %v755, %v761 : i1
  %v763 = pyc.alias %v762 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v764 = pyc.not %v761 : i1
  %v765 = pyc.mux %v764, %v758, %v288 : i128
  %v766 = pyc.alias %v765 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v767 = pyc.eq %v333, %v724 : i16
  %v768 = pyc.and %v253, %v767 : i1
  %v769 = pyc.alias %v768 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v770 = pyc.or %v763, %v769 : i1
  %v771 = pyc.alias %v770 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v772 = pyc.not %v769 : i1
  %v773 = pyc.mux %v772, %v766, %v293 : i128
  %v774 = pyc.alias %v773 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v775 = pyc.eq %v338, %v724 : i16
  %v776 = pyc.and %v258, %v775 : i1
  %v777 = pyc.alias %v776 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v778 = pyc.or %v771, %v777 : i1
  %v779 = pyc.alias %v778 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v780 = pyc.not %v777 : i1
  %v781 = pyc.mux %v780, %v774, %v298 : i128
  %v782 = pyc.alias %v781 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v783 = pyc.eq %v343, %v724 : i16
  %v784 = pyc.and %v263, %v783 : i1
  %v785 = pyc.alias %v784 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v786 = pyc.or %v779, %v785 : i1
  %v787 = pyc.alias %v786 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v788 = pyc.not %v785 : i1
  %v789 = pyc.mux %v788, %v782, %v303 : i128
  %v790 = pyc.alias %v789 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v791 = pyc.constant 0 : i3
  %v792 = pyc.zext %v791 : i3 -> i5
  %v793 = pyc.eq %v709, %v792 : i5
  %v794 = pyc.not %v793 : i1
  %v795 = pyc.alias %v794 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v796 = pyc.and %v795, %v787 : i1
  %v797 = pyc.alias %v796 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v798 = pyc.not %v795 : i1
  %v799 = pyc.or %v798, %v797 : i1
  %v800 = pyc.and %v721, %v799 : i1
  %v801 = pyc.alias %v800 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v802 = pyc.constant 1 : i3
  %v803 = pyc.ult %v802, %v178 : i3
  %v804 = pyc.and %v158, %v803 : i1
  %v805 = pyc.or %v801, %v804 : i1
  pyc.assign %v154, %v805 : i1
  %v806 = pyc.constant 1 : i3
  %v807 = pyc.zext %v806 : i3 -> i5
  %v808 = pyc.add %v705, %v807 : i5
  %v809 = pyc.constant 1 : i3
  %v810 = pyc.sub %v178, %v809 : i3
  %v811 = pyc.constant 0 : i3
  %v812 = pyc.mux %v158, %v810, %v811 : i3
  %v813 = pyc.zext %v812 : i3 -> i5
  %v814 = pyc.mux %v801, %v808, %v813 : i5
  %v815 = pyc.alias %v814 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v816 = pyc.trunc %v815 : i5 -> i3
  pyc.assign %v174, %v816 : i3
  %v817 = pyc.mux %v801, %v715, %v198 : i6
  pyc.assign %v194, %v817 : i6
  %v818 = pyc.mux %v801, %v33, %v218 : i16
  pyc.assign %v214, %v818 : i16
  pyc.assign %v54, %v801 : i1
  %v819 = pyc.constant 0 : i128
  %v820 = pyc.mux %v801, %lane2_pkt_in_data, %v819 : i128
  pyc.assign %v74, %v820 : i128
  %v821 = pyc.constant 0 : i2
  %v822 = pyc.zext %v821 : i2 -> i5
  %v823 = pyc.mux %v801, %v705, %v822 : i5
  %v824 = pyc.trunc %v823 : i5 -> i2
  pyc.assign %v94, %v824 : i2
  %v825 = pyc.and %v795, %v801 : i1
  pyc.assign %v114, %v825 : i1
  %v826 = pyc.and %v795, %v801 : i1
  %v827 = pyc.constant 0 : i128
  %v828 = pyc.mux %v826, %v790, %v827 : i128
  pyc.assign %v134, %v828 : i128
  %v829 = pyc.constant 3 : i5
  %v830 = pyc.and %lane3_pkt_in_ctrl, %v829 : i5
  %v831 = pyc.alias %v830 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v832 = pyc.lshri %lane3_pkt_in_ctrl {amount = 2} : i5
  %v833 = pyc.constant 7 : i5
  %v834 = pyc.and %v832, %v833 : i5
  %v835 = pyc.alias %v834 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v836 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v837 = pyc.constant 2 : i6
  %v838 = pyc.add %v836, %v837 : i6
  %v839 = pyc.zext %v831 : i5 -> i6
  %v840 = pyc.add %v838, %v839 : i6
  %v841 = pyc.alias %v840 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v842 = pyc.ult %v203, %v841 : i6
  %v843 = pyc.alias %v842 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v844 = pyc.not %v163 : i1
  %v845 = pyc.and %v844, %lane3_pkt_in_vld : i1
  %v846 = pyc.and %v845, %v843 : i1
  %v847 = pyc.alias %v846 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v848 = pyc.zext %v835 : i5 -> i16
  %v849 = pyc.sub %v35, %v848 : i16
  %v850 = pyc.alias %v849 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v851 = pyc.eq %v308, %v850 : i16
  %v852 = pyc.and %v228, %v851 : i1
  %v853 = pyc.alias %v852 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v854 = pyc.constant 0 : i1
  %v855 = pyc.or %v853, %v854 : i1
  %v856 = pyc.alias %v855 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v857 = pyc.not %v853 : i1
  %v858 = pyc.constant 0 : i128
  %v859 = pyc.mux %v857, %v858, %v268 : i128
  %v860 = pyc.alias %v859 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v861 = pyc.eq %v313, %v850 : i16
  %v862 = pyc.and %v233, %v861 : i1
  %v863 = pyc.alias %v862 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v864 = pyc.or %v856, %v863 : i1
  %v865 = pyc.alias %v864 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v866 = pyc.not %v863 : i1
  %v867 = pyc.mux %v866, %v860, %v273 : i128
  %v868 = pyc.alias %v867 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v869 = pyc.eq %v318, %v850 : i16
  %v870 = pyc.and %v238, %v869 : i1
  %v871 = pyc.alias %v870 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v872 = pyc.or %v865, %v871 : i1
  %v873 = pyc.alias %v872 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v874 = pyc.not %v871 : i1
  %v875 = pyc.mux %v874, %v868, %v278 : i128
  %v876 = pyc.alias %v875 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v877 = pyc.eq %v323, %v850 : i16
  %v878 = pyc.and %v243, %v877 : i1
  %v879 = pyc.alias %v878 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v880 = pyc.or %v873, %v879 : i1
  %v881 = pyc.alias %v880 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v882 = pyc.not %v879 : i1
  %v883 = pyc.mux %v882, %v876, %v283 : i128
  %v884 = pyc.alias %v883 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v885 = pyc.eq %v328, %v850 : i16
  %v886 = pyc.and %v248, %v885 : i1
  %v887 = pyc.alias %v886 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v888 = pyc.or %v881, %v887 : i1
  %v889 = pyc.alias %v888 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v890 = pyc.not %v887 : i1
  %v891 = pyc.mux %v890, %v884, %v288 : i128
  %v892 = pyc.alias %v891 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v893 = pyc.eq %v333, %v850 : i16
  %v894 = pyc.and %v253, %v893 : i1
  %v895 = pyc.alias %v894 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v896 = pyc.or %v889, %v895 : i1
  %v897 = pyc.alias %v896 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v898 = pyc.not %v895 : i1
  %v899 = pyc.mux %v898, %v892, %v293 : i128
  %v900 = pyc.alias %v899 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v901 = pyc.eq %v338, %v850 : i16
  %v902 = pyc.and %v258, %v901 : i1
  %v903 = pyc.alias %v902 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v904 = pyc.or %v897, %v903 : i1
  %v905 = pyc.alias %v904 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v906 = pyc.not %v903 : i1
  %v907 = pyc.mux %v906, %v900, %v298 : i128
  %v908 = pyc.alias %v907 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v909 = pyc.eq %v343, %v850 : i16
  %v910 = pyc.and %v263, %v909 : i1
  %v911 = pyc.alias %v910 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v912 = pyc.or %v905, %v911 : i1
  %v913 = pyc.alias %v912 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v914 = pyc.not %v911 : i1
  %v915 = pyc.mux %v914, %v908, %v303 : i128
  %v916 = pyc.alias %v915 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v917 = pyc.constant 0 : i3
  %v918 = pyc.zext %v917 : i3 -> i5
  %v919 = pyc.eq %v835, %v918 : i5
  %v920 = pyc.not %v919 : i1
  %v921 = pyc.alias %v920 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v922 = pyc.and %v921, %v913 : i1
  %v923 = pyc.alias %v922 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v924 = pyc.not %v921 : i1
  %v925 = pyc.or %v924, %v923 : i1
  %v926 = pyc.and %v847, %v925 : i1
  %v927 = pyc.alias %v926 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v928 = pyc.constant 1 : i3
  %v929 = pyc.ult %v928, %v183 : i3
  %v930 = pyc.and %v163, %v929 : i1
  %v931 = pyc.or %v927, %v930 : i1
  pyc.assign %v159, %v931 : i1
  %v932 = pyc.constant 1 : i3
  %v933 = pyc.zext %v932 : i3 -> i5
  %v934 = pyc.add %v831, %v933 : i5
  %v935 = pyc.constant 1 : i3
  %v936 = pyc.sub %v183, %v935 : i3
  %v937 = pyc.constant 0 : i3
  %v938 = pyc.mux %v163, %v936, %v937 : i3
  %v939 = pyc.zext %v938 : i3 -> i5
  %v940 = pyc.mux %v927, %v934, %v939 : i5
  %v941 = pyc.alias %v940 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v942 = pyc.trunc %v941 : i5 -> i3
  pyc.assign %v179, %v942 : i3
  %v943 = pyc.mux %v927, %v841, %v203 : i6
  pyc.assign %v199, %v943 : i6
  %v944 = pyc.mux %v927, %v35, %v223 : i16
  pyc.assign %v219, %v944 : i16
  pyc.assign %v59, %v927 : i1
  %v945 = pyc.constant 0 : i128
  %v946 = pyc.mux %v927, %lane3_pkt_in_data, %v945 : i128
  pyc.assign %v79, %v946 : i128
  %v947 = pyc.constant 0 : i2
  %v948 = pyc.zext %v947 : i2 -> i5
  %v949 = pyc.mux %v927, %v831, %v948 : i5
  %v950 = pyc.trunc %v949 : i5 -> i2
  pyc.assign %v99, %v950 : i2
  %v951 = pyc.and %v921, %v927 : i1
  pyc.assign %v119, %v951 : i1
  %v952 = pyc.and %v921, %v927 : i1
  %v953 = pyc.constant 0 : i128
  %v954 = pyc.mux %v952, %v916, %v953 : i128
  pyc.assign %v139, %v954 : i128
  %v955 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v956 = pyc.constant 1 : i1
  %v957 = pyc.constant 0 : i1
  %v958 = pyc.reg %clk, %rst, %v956, %v955, %v957 : i1
  %v959 = pyc.alias %v958 {pyc.name = "rob0_valid"} : i1
  %v960 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v961 = pyc.constant 1 : i1
  %v962 = pyc.constant 0 : i1
  %v963 = pyc.reg %clk, %rst, %v961, %v960, %v962 : i1
  %v964 = pyc.alias %v963 {pyc.name = "rob1_valid"} : i1
  %v965 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v966 = pyc.constant 1 : i1
  %v967 = pyc.constant 0 : i1
  %v968 = pyc.reg %clk, %rst, %v966, %v965, %v967 : i1
  %v969 = pyc.alias %v968 {pyc.name = "rob2_valid"} : i1
  %v970 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v971 = pyc.constant 1 : i1
  %v972 = pyc.constant 0 : i1
  %v973 = pyc.reg %clk, %rst, %v971, %v970, %v972 : i1
  %v974 = pyc.alias %v973 {pyc.name = "rob3_valid"} : i1
  %v975 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v976 = pyc.constant 1 : i1
  %v977 = pyc.constant 0 : i1
  %v978 = pyc.reg %clk, %rst, %v976, %v975, %v977 : i1
  %v979 = pyc.alias %v978 {pyc.name = "rob4_valid"} : i1
  %v980 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v981 = pyc.constant 1 : i1
  %v982 = pyc.constant 0 : i1
  %v983 = pyc.reg %clk, %rst, %v981, %v980, %v982 : i1
  %v984 = pyc.alias %v983 {pyc.name = "rob5_valid"} : i1
  %v985 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v986 = pyc.constant 1 : i1
  %v987 = pyc.constant 0 : i1
  %v988 = pyc.reg %clk, %rst, %v986, %v985, %v987 : i1
  %v989 = pyc.alias %v988 {pyc.name = "rob6_valid"} : i1
  %v990 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v991 = pyc.constant 1 : i1
  %v992 = pyc.constant 0 : i1
  %v993 = pyc.reg %clk, %rst, %v991, %v990, %v992 : i1
  %v994 = pyc.alias %v993 {pyc.name = "rob7_valid"} : i1
  %v995 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v996 = pyc.constant 1 : i1
  %v997 = pyc.constant 0 : i128
  %v998 = pyc.reg %clk, %rst, %v996, %v995, %v997 : i128
  %v999 = pyc.alias %v998 {pyc.name = "rob0_data"} : i128
  %v1000 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v1001 = pyc.constant 1 : i1
  %v1002 = pyc.constant 0 : i128
  %v1003 = pyc.reg %clk, %rst, %v1001, %v1000, %v1002 : i128
  %v1004 = pyc.alias %v1003 {pyc.name = "rob1_data"} : i128
  %v1005 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v1006 = pyc.constant 1 : i1
  %v1007 = pyc.constant 0 : i128
  %v1008 = pyc.reg %clk, %rst, %v1006, %v1005, %v1007 : i128
  %v1009 = pyc.alias %v1008 {pyc.name = "rob2_data"} : i128
  %v1010 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v1011 = pyc.constant 1 : i1
  %v1012 = pyc.constant 0 : i128
  %v1013 = pyc.reg %clk, %rst, %v1011, %v1010, %v1012 : i128
  %v1014 = pyc.alias %v1013 {pyc.name = "rob3_data"} : i128
  %v1015 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v1016 = pyc.constant 1 : i1
  %v1017 = pyc.constant 0 : i128
  %v1018 = pyc.reg %clk, %rst, %v1016, %v1015, %v1017 : i128
  %v1019 = pyc.alias %v1018 {pyc.name = "rob4_data"} : i128
  %v1020 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v1021 = pyc.constant 1 : i1
  %v1022 = pyc.constant 0 : i128
  %v1023 = pyc.reg %clk, %rst, %v1021, %v1020, %v1022 : i128
  %v1024 = pyc.alias %v1023 {pyc.name = "rob5_data"} : i128
  %v1025 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v1026 = pyc.constant 1 : i1
  %v1027 = pyc.constant 0 : i128
  %v1028 = pyc.reg %clk, %rst, %v1026, %v1025, %v1027 : i128
  %v1029 = pyc.alias %v1028 {pyc.name = "rob6_data"} : i128
  %v1030 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v1031 = pyc.constant 1 : i1
  %v1032 = pyc.constant 0 : i128
  %v1033 = pyc.reg %clk, %rst, %v1031, %v1030, %v1032 : i128
  %v1034 = pyc.alias %v1033 {pyc.name = "rob7_data"} : i128
  %v1035 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v1036 = pyc.constant 1 : i1
  %v1037 = pyc.constant 0 : i16
  %v1038 = pyc.reg %clk, %rst, %v1036, %v1035, %v1037 : i16
  %v1039 = pyc.alias %v1038 {pyc.name = "rob0_seq"} : i16
  %v1040 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v1041 = pyc.constant 1 : i1
  %v1042 = pyc.constant 0 : i16
  %v1043 = pyc.reg %clk, %rst, %v1041, %v1040, %v1042 : i16
  %v1044 = pyc.alias %v1043 {pyc.name = "rob1_seq"} : i16
  %v1045 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v1046 = pyc.constant 1 : i1
  %v1047 = pyc.constant 0 : i16
  %v1048 = pyc.reg %clk, %rst, %v1046, %v1045, %v1047 : i16
  %v1049 = pyc.alias %v1048 {pyc.name = "rob2_seq"} : i16
  %v1050 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v1051 = pyc.constant 1 : i1
  %v1052 = pyc.constant 0 : i16
  %v1053 = pyc.reg %clk, %rst, %v1051, %v1050, %v1052 : i16
  %v1054 = pyc.alias %v1053 {pyc.name = "rob3_seq"} : i16
  %v1055 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v1056 = pyc.constant 1 : i1
  %v1057 = pyc.constant 0 : i16
  %v1058 = pyc.reg %clk, %rst, %v1056, %v1055, %v1057 : i16
  %v1059 = pyc.alias %v1058 {pyc.name = "rob4_seq"} : i16
  %v1060 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v1061 = pyc.constant 1 : i1
  %v1062 = pyc.constant 0 : i16
  %v1063 = pyc.reg %clk, %rst, %v1061, %v1060, %v1062 : i16
  %v1064 = pyc.alias %v1063 {pyc.name = "rob5_seq"} : i16
  %v1065 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v1066 = pyc.constant 1 : i1
  %v1067 = pyc.constant 0 : i16
  %v1068 = pyc.reg %clk, %rst, %v1066, %v1065, %v1067 : i16
  %v1069 = pyc.alias %v1068 {pyc.name = "rob6_seq"} : i16
  %v1070 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v1071 = pyc.constant 1 : i1
  %v1072 = pyc.constant 0 : i16
  %v1073 = pyc.reg %clk, %rst, %v1071, %v1070, %v1072 : i16
  %v1074 = pyc.alias %v1073 {pyc.name = "rob7_seq"} : i16
  %v1075 = pyc.wire {pyc.name = "rob_tail__next"} : i3
  %v1076 = pyc.constant 1 : i1
  %v1077 = pyc.constant 0 : i3
  %v1078 = pyc.reg %clk, %rst, %v1076, %v1075, %v1077 : i3
  %v1079 = pyc.alias %v1078 {pyc.name = "rob_tail"} : i3
  %v1080 = pyc.alias %v1079 {pyc.name = "rob_tail__fastfwd_v3_4__L150"} : i3
  %v1081 = pyc.wire {pyc.name = "next_output_seq__next"} : i16
  %v1082 = pyc.constant 1 : i1
  %v1083 = pyc.constant 0 : i16
  %v1084 = pyc.reg %clk, %rst, %v1082, %v1081, %v1083 : i16
  %v1085 = pyc.alias %v1084 {pyc.name = "next_output_seq"} : i16
  %v1086 = pyc.alias %v1085 {pyc.name = "next_output_seq__fastfwd_v3_4__L151"} : i16
  %v1087 = pyc.constant 0 : i3
  %v1088 = pyc.eq %v1080, %v1087 : i3
  %v1089 = pyc.and %v382, %v1088 : i1
  %v1090 = pyc.alias %v1089 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1091 = pyc.or %v1090, %v959 : i1
  pyc.assign %v955, %v1091 : i1
  %v1092 = pyc.mux %v1090, %v385, %v999 : i128
  pyc.assign %v995, %v1092 : i128
  %v1093 = pyc.mux %v1090, %v388, %v1039 : i16
  pyc.assign %v1035, %v1093 : i16
  %v1094 = pyc.constant 1 : i3
  %v1095 = pyc.eq %v1080, %v1094 : i3
  %v1096 = pyc.and %v382, %v1095 : i1
  %v1097 = pyc.alias %v1096 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1098 = pyc.or %v1097, %v964 : i1
  pyc.assign %v960, %v1098 : i1
  %v1099 = pyc.mux %v1097, %v385, %v1004 : i128
  pyc.assign %v1000, %v1099 : i128
  %v1100 = pyc.mux %v1097, %v388, %v1044 : i16
  pyc.assign %v1040, %v1100 : i16
  %v1101 = pyc.constant 2 : i3
  %v1102 = pyc.eq %v1080, %v1101 : i3
  %v1103 = pyc.and %v382, %v1102 : i1
  %v1104 = pyc.alias %v1103 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1105 = pyc.or %v1104, %v969 : i1
  pyc.assign %v965, %v1105 : i1
  %v1106 = pyc.mux %v1104, %v385, %v1009 : i128
  pyc.assign %v1005, %v1106 : i128
  %v1107 = pyc.mux %v1104, %v388, %v1049 : i16
  pyc.assign %v1045, %v1107 : i16
  %v1108 = pyc.constant 3 : i3
  %v1109 = pyc.eq %v1080, %v1108 : i3
  %v1110 = pyc.and %v382, %v1109 : i1
  %v1111 = pyc.alias %v1110 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1112 = pyc.or %v1111, %v974 : i1
  pyc.assign %v970, %v1112 : i1
  %v1113 = pyc.mux %v1111, %v385, %v1014 : i128
  pyc.assign %v1010, %v1113 : i128
  %v1114 = pyc.mux %v1111, %v388, %v1054 : i16
  pyc.assign %v1050, %v1114 : i16
  %v1115 = pyc.constant 4 : i3
  %v1116 = pyc.eq %v1080, %v1115 : i3
  %v1117 = pyc.and %v382, %v1116 : i1
  %v1118 = pyc.alias %v1117 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1119 = pyc.or %v1118, %v979 : i1
  pyc.assign %v975, %v1119 : i1
  %v1120 = pyc.mux %v1118, %v385, %v1019 : i128
  pyc.assign %v1015, %v1120 : i128
  %v1121 = pyc.mux %v1118, %v388, %v1059 : i16
  pyc.assign %v1055, %v1121 : i16
  %v1122 = pyc.constant 5 : i3
  %v1123 = pyc.eq %v1080, %v1122 : i3
  %v1124 = pyc.and %v382, %v1123 : i1
  %v1125 = pyc.alias %v1124 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1126 = pyc.or %v1125, %v984 : i1
  pyc.assign %v980, %v1126 : i1
  %v1127 = pyc.mux %v1125, %v385, %v1024 : i128
  pyc.assign %v1020, %v1127 : i128
  %v1128 = pyc.mux %v1125, %v388, %v1064 : i16
  pyc.assign %v1060, %v1128 : i16
  %v1129 = pyc.constant 6 : i3
  %v1130 = pyc.eq %v1080, %v1129 : i3
  %v1131 = pyc.and %v382, %v1130 : i1
  %v1132 = pyc.alias %v1131 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1133 = pyc.or %v1132, %v989 : i1
  pyc.assign %v985, %v1133 : i1
  %v1134 = pyc.mux %v1132, %v385, %v1029 : i128
  pyc.assign %v1025, %v1134 : i128
  %v1135 = pyc.mux %v1132, %v388, %v1069 : i16
  pyc.assign %v1065, %v1135 : i16
  %v1136 = pyc.constant 7 : i3
  %v1137 = pyc.eq %v1080, %v1136 : i3
  %v1138 = pyc.and %v382, %v1137 : i1
  %v1139 = pyc.alias %v1138 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1140 = pyc.or %v1139, %v994 : i1
  pyc.assign %v990, %v1140 : i1
  %v1141 = pyc.mux %v1139, %v385, %v1034 : i128
  pyc.assign %v1030, %v1141 : i128
  %v1142 = pyc.mux %v1139, %v388, %v1074 : i16
  pyc.assign %v1070, %v1142 : i16
  %v1143 = pyc.constant 1 : i3
  %v1144 = pyc.add %v1080, %v1143 : i3
  %v1145 = pyc.constant 7 : i3
  %v1146 = pyc.and %v1144, %v1145 : i3
  %v1147 = pyc.mux %v382, %v1146, %v1080 : i3
  pyc.assign %v1075, %v1147 : i3
  %v1148 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_4__L164"} : i2
  %v1149 = pyc.alias %v1086 {pyc.name = "next_seq__fastfwd_v3_4__L165"} : i16
  %v1150 = pyc.eq %v1039, %v1149 : i16
  %v1151 = pyc.and %v959, %v1150 : i1
  %v1152 = pyc.alias %v1151 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1153 = pyc.constant 0 : i1
  %v1154 = pyc.or %v1152, %v1153 : i1
  %v1155 = pyc.alias %v1154 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1156 = pyc.not %v1152 : i1
  %v1157 = pyc.constant 0 : i128
  %v1158 = pyc.mux %v1156, %v1157, %v999 : i128
  %v1159 = pyc.alias %v1158 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1160 = pyc.eq %v1044, %v1149 : i16
  %v1161 = pyc.and %v964, %v1160 : i1
  %v1162 = pyc.alias %v1161 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1163 = pyc.or %v1155, %v1162 : i1
  %v1164 = pyc.alias %v1163 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1165 = pyc.not %v1162 : i1
  %v1166 = pyc.mux %v1165, %v1159, %v1004 : i128
  %v1167 = pyc.alias %v1166 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1168 = pyc.eq %v1049, %v1149 : i16
  %v1169 = pyc.and %v969, %v1168 : i1
  %v1170 = pyc.alias %v1169 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1171 = pyc.or %v1164, %v1170 : i1
  %v1172 = pyc.alias %v1171 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1173 = pyc.not %v1170 : i1
  %v1174 = pyc.mux %v1173, %v1167, %v1009 : i128
  %v1175 = pyc.alias %v1174 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1176 = pyc.eq %v1054, %v1149 : i16
  %v1177 = pyc.and %v974, %v1176 : i1
  %v1178 = pyc.alias %v1177 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1179 = pyc.or %v1172, %v1178 : i1
  %v1180 = pyc.alias %v1179 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1181 = pyc.not %v1178 : i1
  %v1182 = pyc.mux %v1181, %v1175, %v1014 : i128
  %v1183 = pyc.alias %v1182 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1184 = pyc.eq %v1059, %v1149 : i16
  %v1185 = pyc.and %v979, %v1184 : i1
  %v1186 = pyc.alias %v1185 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1187 = pyc.or %v1180, %v1186 : i1
  %v1188 = pyc.alias %v1187 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1189 = pyc.not %v1186 : i1
  %v1190 = pyc.mux %v1189, %v1183, %v1019 : i128
  %v1191 = pyc.alias %v1190 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1192 = pyc.eq %v1064, %v1149 : i16
  %v1193 = pyc.and %v984, %v1192 : i1
  %v1194 = pyc.alias %v1193 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1195 = pyc.or %v1188, %v1194 : i1
  %v1196 = pyc.alias %v1195 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1197 = pyc.not %v1194 : i1
  %v1198 = pyc.mux %v1197, %v1191, %v1024 : i128
  %v1199 = pyc.alias %v1198 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1200 = pyc.eq %v1069, %v1149 : i16
  %v1201 = pyc.and %v989, %v1200 : i1
  %v1202 = pyc.alias %v1201 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1203 = pyc.or %v1196, %v1202 : i1
  %v1204 = pyc.alias %v1203 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1205 = pyc.not %v1202 : i1
  %v1206 = pyc.mux %v1205, %v1199, %v1029 : i128
  %v1207 = pyc.alias %v1206 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1208 = pyc.eq %v1074, %v1149 : i16
  %v1209 = pyc.and %v994, %v1208 : i1
  %v1210 = pyc.alias %v1209 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1211 = pyc.or %v1204, %v1210 : i1
  %v1212 = pyc.alias %v1211 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1213 = pyc.not %v1210 : i1
  %v1214 = pyc.mux %v1213, %v1207, %v1034 : i128
  %v1215 = pyc.alias %v1214 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1216 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1217 = pyc.constant 1 : i1
  %v1218 = pyc.constant 0 : i1
  %v1219 = pyc.reg %clk, %rst, %v1217, %v1216, %v1218 : i1
  %v1220 = pyc.alias %v1219 {pyc.name = "lane0_out_vld"} : i1
  %v1221 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1222 = pyc.constant 1 : i1
  %v1223 = pyc.constant 0 : i1
  %v1224 = pyc.reg %clk, %rst, %v1222, %v1221, %v1223 : i1
  %v1225 = pyc.alias %v1224 {pyc.name = "lane1_out_vld"} : i1
  %v1226 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1227 = pyc.constant 1 : i1
  %v1228 = pyc.constant 0 : i1
  %v1229 = pyc.reg %clk, %rst, %v1227, %v1226, %v1228 : i1
  %v1230 = pyc.alias %v1229 {pyc.name = "lane2_out_vld"} : i1
  %v1231 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1232 = pyc.constant 1 : i1
  %v1233 = pyc.constant 0 : i1
  %v1234 = pyc.reg %clk, %rst, %v1232, %v1231, %v1233 : i1
  %v1235 = pyc.alias %v1234 {pyc.name = "lane3_out_vld"} : i1
  %v1236 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1237 = pyc.constant 1 : i1
  %v1238 = pyc.constant 0 : i128
  %v1239 = pyc.reg %clk, %rst, %v1237, %v1236, %v1238 : i128
  %v1240 = pyc.alias %v1239 {pyc.name = "lane0_out_data"} : i128
  %v1241 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1242 = pyc.constant 1 : i1
  %v1243 = pyc.constant 0 : i128
  %v1244 = pyc.reg %clk, %rst, %v1242, %v1241, %v1243 : i128
  %v1245 = pyc.alias %v1244 {pyc.name = "lane1_out_data"} : i128
  %v1246 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1247 = pyc.constant 1 : i1
  %v1248 = pyc.constant 0 : i128
  %v1249 = pyc.reg %clk, %rst, %v1247, %v1246, %v1248 : i128
  %v1250 = pyc.alias %v1249 {pyc.name = "lane2_out_data"} : i128
  %v1251 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1252 = pyc.constant 1 : i1
  %v1253 = pyc.constant 0 : i128
  %v1254 = pyc.reg %clk, %rst, %v1252, %v1251, %v1253 : i128
  %v1255 = pyc.alias %v1254 {pyc.name = "lane3_out_data"} : i128
  %v1256 = pyc.constant 0 : i2
  %v1257 = pyc.eq %v1148, %v1256 : i2
  %v1258 = pyc.alias %v1257 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1259 = pyc.and %v1258, %v1212 : i1
  %v1260 = pyc.alias %v1259 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1216, %v1260 : i1
  %v1261 = pyc.constant 0 : i128
  %v1262 = pyc.mux %v1260, %v1215, %v1261 : i128
  pyc.assign %v1236, %v1262 : i128
  %v1263 = pyc.constant 1 : i2
  %v1264 = pyc.eq %v1148, %v1263 : i2
  %v1265 = pyc.alias %v1264 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1266 = pyc.and %v1265, %v1212 : i1
  %v1267 = pyc.alias %v1266 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1221, %v1267 : i1
  %v1268 = pyc.constant 0 : i128
  %v1269 = pyc.mux %v1267, %v1215, %v1268 : i128
  pyc.assign %v1241, %v1269 : i128
  %v1270 = pyc.constant 2 : i2
  %v1271 = pyc.eq %v1148, %v1270 : i2
  %v1272 = pyc.alias %v1271 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1273 = pyc.and %v1272, %v1212 : i1
  %v1274 = pyc.alias %v1273 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1226, %v1274 : i1
  %v1275 = pyc.constant 0 : i128
  %v1276 = pyc.mux %v1274, %v1215, %v1275 : i128
  pyc.assign %v1246, %v1276 : i128
  %v1277 = pyc.constant 3 : i2
  %v1278 = pyc.eq %v1148, %v1277 : i2
  %v1279 = pyc.alias %v1278 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1280 = pyc.and %v1279, %v1212 : i1
  %v1281 = pyc.alias %v1280 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1231, %v1281 : i1
  %v1282 = pyc.constant 0 : i128
  %v1283 = pyc.mux %v1281, %v1215, %v1282 : i128
  pyc.assign %v1251, %v1283 : i128
  %v1284 = pyc.or %v1220, %v1225 : i1
  %v1285 = pyc.or %v1284, %v1230 : i1
  %v1286 = pyc.or %v1285, %v1235 : i1
  %v1287 = pyc.alias %v1286 {pyc.name = "any_output__fastfwd_v3_4__L183"} : i1
  %v1288 = pyc.constant 1 : i2
  %v1289 = pyc.add %v1148, %v1288 : i2
  %v1290 = pyc.constant 3 : i2
  %v1291 = pyc.and %v1289, %v1290 : i2
  %v1292 = pyc.mux %v1287, %v1291, %v1148 : i2
  pyc.assign %v7, %v1292 : i2
  %v1293 = pyc.constant 1 : i16
  %v1294 = pyc.add %v1149, %v1293 : i16
  %v1295 = pyc.mux %v1287, %v1294, %v1149 : i16
  pyc.assign %v1081, %v1295 : i16
  %v1296 = pyc.eq %v1039, %v1149 : i16
  %v1297 = pyc.and %v1287, %v1296 : i1
  %v1298 = pyc.alias %v1297 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1299 = pyc.constant 0 : i1
  %v1300 = pyc.mux %v1298, %v1299, %v959 : i1
  pyc.assign %v955, %v1300 : i1
  %v1301 = pyc.eq %v1044, %v1149 : i16
  %v1302 = pyc.and %v1287, %v1301 : i1
  %v1303 = pyc.alias %v1302 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1304 = pyc.constant 0 : i1
  %v1305 = pyc.mux %v1303, %v1304, %v964 : i1
  pyc.assign %v960, %v1305 : i1
  %v1306 = pyc.eq %v1049, %v1149 : i16
  %v1307 = pyc.and %v1287, %v1306 : i1
  %v1308 = pyc.alias %v1307 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1309 = pyc.constant 0 : i1
  %v1310 = pyc.mux %v1308, %v1309, %v969 : i1
  pyc.assign %v965, %v1310 : i1
  %v1311 = pyc.eq %v1054, %v1149 : i16
  %v1312 = pyc.and %v1287, %v1311 : i1
  %v1313 = pyc.alias %v1312 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1314 = pyc.constant 0 : i1
  %v1315 = pyc.mux %v1313, %v1314, %v974 : i1
  pyc.assign %v970, %v1315 : i1
  %v1316 = pyc.eq %v1059, %v1149 : i16
  %v1317 = pyc.and %v1287, %v1316 : i1
  %v1318 = pyc.alias %v1317 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1319 = pyc.constant 0 : i1
  %v1320 = pyc.mux %v1318, %v1319, %v979 : i1
  pyc.assign %v975, %v1320 : i1
  %v1321 = pyc.eq %v1064, %v1149 : i16
  %v1322 = pyc.and %v1287, %v1321 : i1
  %v1323 = pyc.alias %v1322 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1324 = pyc.constant 0 : i1
  %v1325 = pyc.mux %v1323, %v1324, %v984 : i1
  pyc.assign %v980, %v1325 : i1
  %v1326 = pyc.eq %v1069, %v1149 : i16
  %v1327 = pyc.and %v1287, %v1326 : i1
  %v1328 = pyc.alias %v1327 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1329 = pyc.constant 0 : i1
  %v1330 = pyc.mux %v1328, %v1329, %v989 : i1
  pyc.assign %v985, %v1330 : i1
  %v1331 = pyc.eq %v1074, %v1149 : i16
  %v1332 = pyc.and %v1287, %v1331 : i1
  %v1333 = pyc.alias %v1332 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1334 = pyc.constant 0 : i1
  %v1335 = pyc.mux %v1333, %v1334, %v994 : i1
  pyc.assign %v990, %v1335 : i1
  %v1336 = pyc.constant 0 : i1
  %v1337 = pyc.add %lane0_pkt_in_vld, %v1336 : i1
  %v1338 = pyc.add %v1337, %lane1_pkt_in_vld : i1
  %v1339 = pyc.add %v1338, %lane2_pkt_in_vld : i1
  %v1340 = pyc.add %v1339, %lane3_pkt_in_vld : i1
  %v1341 = pyc.alias %v1340 {pyc.name = "pending_cnt__fastfwd_v3_4__L194"} : i1
  %v1342 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1343 = pyc.constant 1 : i1
  %v1344 = pyc.constant 0 : i1
  %v1345 = pyc.reg %clk, %rst, %v1343, %v1342, %v1344 : i1
  %v1346 = pyc.alias %v1345 {pyc.name = "bkpr_reg"} : i1
  %v1347 = pyc.alias %v1346 {pyc.name = "bkpr__fastfwd_v3_4__L195"} : i1
  %v1348 = pyc.constant 10 : i4
  %v1349 = pyc.zext %v1341 : i1 -> i4
  %v1350 = pyc.ult %v1349, %v1348 : i4
  %v1351 = pyc.not %v1350 : i1
  pyc.assign %v1342, %v1351 : i1
  func.return %v1220, %v1240, %v1225, %v1245, %v1230, %v1250, %v1235, %v1255, %v1347, %v48, %v68, %v88, %v108, %v128, %v53, %v73, %v93, %v113, %v133, %v58, %v78, %v98, %v118, %v138, %v63, %v83, %v103, %v123, %v143 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128
}

}

