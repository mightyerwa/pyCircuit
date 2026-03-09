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
  %v464 = pyc.eq %v463, %v188 : i6
  %v465 = pyc.not %v464 : i1
  %v466 = pyc.alias %v465 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v467 = pyc.not %v148 : i1
  %v468 = pyc.and %v467, %lane0_pkt_in_vld : i1
  %v469 = pyc.and %v468, %v466 : i1
  %v470 = pyc.alias %v469 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v471 = pyc.zext %v457 : i5 -> i16
  %v472 = pyc.sub %v29, %v471 : i16
  %v473 = pyc.alias %v472 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v474 = pyc.eq %v308, %v473 : i16
  %v475 = pyc.and %v228, %v474 : i1
  %v476 = pyc.alias %v475 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v477 = pyc.constant 0 : i1
  %v478 = pyc.or %v476, %v477 : i1
  %v479 = pyc.alias %v478 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v480 = pyc.not %v476 : i1
  %v481 = pyc.constant 0 : i128
  %v482 = pyc.mux %v480, %v481, %v268 : i128
  %v483 = pyc.alias %v482 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v484 = pyc.eq %v313, %v473 : i16
  %v485 = pyc.and %v233, %v484 : i1
  %v486 = pyc.alias %v485 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v487 = pyc.or %v479, %v486 : i1
  %v488 = pyc.alias %v487 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v489 = pyc.not %v486 : i1
  %v490 = pyc.mux %v489, %v483, %v273 : i128
  %v491 = pyc.alias %v490 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v492 = pyc.eq %v318, %v473 : i16
  %v493 = pyc.and %v238, %v492 : i1
  %v494 = pyc.alias %v493 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v495 = pyc.or %v488, %v494 : i1
  %v496 = pyc.alias %v495 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v497 = pyc.not %v494 : i1
  %v498 = pyc.mux %v497, %v491, %v278 : i128
  %v499 = pyc.alias %v498 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v500 = pyc.eq %v323, %v473 : i16
  %v501 = pyc.and %v243, %v500 : i1
  %v502 = pyc.alias %v501 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v503 = pyc.or %v496, %v502 : i1
  %v504 = pyc.alias %v503 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v505 = pyc.not %v502 : i1
  %v506 = pyc.mux %v505, %v499, %v283 : i128
  %v507 = pyc.alias %v506 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v508 = pyc.eq %v328, %v473 : i16
  %v509 = pyc.and %v248, %v508 : i1
  %v510 = pyc.alias %v509 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v511 = pyc.or %v504, %v510 : i1
  %v512 = pyc.alias %v511 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v513 = pyc.not %v510 : i1
  %v514 = pyc.mux %v513, %v507, %v288 : i128
  %v515 = pyc.alias %v514 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v516 = pyc.eq %v333, %v473 : i16
  %v517 = pyc.and %v253, %v516 : i1
  %v518 = pyc.alias %v517 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v519 = pyc.or %v512, %v518 : i1
  %v520 = pyc.alias %v519 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v521 = pyc.not %v518 : i1
  %v522 = pyc.mux %v521, %v515, %v293 : i128
  %v523 = pyc.alias %v522 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v524 = pyc.eq %v338, %v473 : i16
  %v525 = pyc.and %v258, %v524 : i1
  %v526 = pyc.alias %v525 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v527 = pyc.or %v520, %v526 : i1
  %v528 = pyc.alias %v527 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v529 = pyc.not %v526 : i1
  %v530 = pyc.mux %v529, %v523, %v298 : i128
  %v531 = pyc.alias %v530 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v532 = pyc.eq %v343, %v473 : i16
  %v533 = pyc.and %v263, %v532 : i1
  %v534 = pyc.alias %v533 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v535 = pyc.or %v528, %v534 : i1
  %v536 = pyc.alias %v535 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v537 = pyc.not %v534 : i1
  %v538 = pyc.mux %v537, %v531, %v303 : i128
  %v539 = pyc.alias %v538 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v540 = pyc.constant 0 : i3
  %v541 = pyc.zext %v540 : i3 -> i5
  %v542 = pyc.eq %v457, %v541 : i5
  %v543 = pyc.not %v542 : i1
  %v544 = pyc.alias %v543 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v545 = pyc.and %v544, %v536 : i1
  %v546 = pyc.alias %v545 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v547 = pyc.not %v544 : i1
  %v548 = pyc.or %v547, %v546 : i1
  %v549 = pyc.and %v470, %v548 : i1
  %v550 = pyc.alias %v549 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v551 = pyc.constant 1 : i3
  %v552 = pyc.ult %v551, %v168 : i3
  %v553 = pyc.and %v148, %v552 : i1
  %v554 = pyc.or %v550, %v553 : i1
  pyc.assign %v144, %v554 : i1
  %v555 = pyc.constant 1 : i3
  %v556 = pyc.zext %v555 : i3 -> i5
  %v557 = pyc.add %v453, %v556 : i5
  %v558 = pyc.constant 1 : i3
  %v559 = pyc.sub %v168, %v558 : i3
  %v560 = pyc.constant 0 : i3
  %v561 = pyc.mux %v148, %v559, %v560 : i3
  %v562 = pyc.zext %v561 : i3 -> i5
  %v563 = pyc.mux %v550, %v557, %v562 : i5
  %v564 = pyc.alias %v563 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v565 = pyc.trunc %v564 : i5 -> i3
  pyc.assign %v164, %v565 : i3
  %v566 = pyc.mux %v550, %v463, %v188 : i6
  pyc.assign %v184, %v566 : i6
  %v567 = pyc.mux %v550, %v29, %v208 : i16
  pyc.assign %v204, %v567 : i16
  pyc.assign %v44, %v550 : i1
  %v568 = pyc.constant 0 : i128
  %v569 = pyc.mux %v550, %lane0_pkt_in_data, %v568 : i128
  pyc.assign %v64, %v569 : i128
  %v570 = pyc.constant 0 : i2
  %v571 = pyc.zext %v570 : i2 -> i5
  %v572 = pyc.mux %v550, %v453, %v571 : i5
  %v573 = pyc.trunc %v572 : i5 -> i2
  pyc.assign %v84, %v573 : i2
  %v574 = pyc.and %v544, %v550 : i1
  pyc.assign %v104, %v574 : i1
  %v575 = pyc.and %v544, %v550 : i1
  %v576 = pyc.constant 0 : i128
  %v577 = pyc.mux %v575, %v539, %v576 : i128
  pyc.assign %v124, %v577 : i128
  %v578 = pyc.constant 3 : i5
  %v579 = pyc.and %lane1_pkt_in_ctrl, %v578 : i5
  %v580 = pyc.alias %v579 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v581 = pyc.lshri %lane1_pkt_in_ctrl {amount = 2} : i5
  %v582 = pyc.constant 7 : i5
  %v583 = pyc.and %v581, %v582 : i5
  %v584 = pyc.alias %v583 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v585 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v586 = pyc.constant 2 : i6
  %v587 = pyc.add %v585, %v586 : i6
  %v588 = pyc.zext %v580 : i5 -> i6
  %v589 = pyc.add %v587, %v588 : i6
  %v590 = pyc.alias %v589 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v591 = pyc.eq %v590, %v193 : i6
  %v592 = pyc.not %v591 : i1
  %v593 = pyc.alias %v592 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v594 = pyc.not %v153 : i1
  %v595 = pyc.and %v594, %lane1_pkt_in_vld : i1
  %v596 = pyc.and %v595, %v593 : i1
  %v597 = pyc.alias %v596 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v598 = pyc.zext %v584 : i5 -> i16
  %v599 = pyc.sub %v31, %v598 : i16
  %v600 = pyc.alias %v599 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v601 = pyc.eq %v308, %v600 : i16
  %v602 = pyc.and %v228, %v601 : i1
  %v603 = pyc.alias %v602 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v604 = pyc.constant 0 : i1
  %v605 = pyc.or %v603, %v604 : i1
  %v606 = pyc.alias %v605 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v607 = pyc.not %v603 : i1
  %v608 = pyc.constant 0 : i128
  %v609 = pyc.mux %v607, %v608, %v268 : i128
  %v610 = pyc.alias %v609 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v611 = pyc.eq %v313, %v600 : i16
  %v612 = pyc.and %v233, %v611 : i1
  %v613 = pyc.alias %v612 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v614 = pyc.or %v606, %v613 : i1
  %v615 = pyc.alias %v614 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v616 = pyc.not %v613 : i1
  %v617 = pyc.mux %v616, %v610, %v273 : i128
  %v618 = pyc.alias %v617 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v619 = pyc.eq %v318, %v600 : i16
  %v620 = pyc.and %v238, %v619 : i1
  %v621 = pyc.alias %v620 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v622 = pyc.or %v615, %v621 : i1
  %v623 = pyc.alias %v622 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v624 = pyc.not %v621 : i1
  %v625 = pyc.mux %v624, %v618, %v278 : i128
  %v626 = pyc.alias %v625 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v627 = pyc.eq %v323, %v600 : i16
  %v628 = pyc.and %v243, %v627 : i1
  %v629 = pyc.alias %v628 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v630 = pyc.or %v623, %v629 : i1
  %v631 = pyc.alias %v630 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v632 = pyc.not %v629 : i1
  %v633 = pyc.mux %v632, %v626, %v283 : i128
  %v634 = pyc.alias %v633 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v635 = pyc.eq %v328, %v600 : i16
  %v636 = pyc.and %v248, %v635 : i1
  %v637 = pyc.alias %v636 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v638 = pyc.or %v631, %v637 : i1
  %v639 = pyc.alias %v638 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v640 = pyc.not %v637 : i1
  %v641 = pyc.mux %v640, %v634, %v288 : i128
  %v642 = pyc.alias %v641 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v643 = pyc.eq %v333, %v600 : i16
  %v644 = pyc.and %v253, %v643 : i1
  %v645 = pyc.alias %v644 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v646 = pyc.or %v639, %v645 : i1
  %v647 = pyc.alias %v646 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v648 = pyc.not %v645 : i1
  %v649 = pyc.mux %v648, %v642, %v293 : i128
  %v650 = pyc.alias %v649 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v651 = pyc.eq %v338, %v600 : i16
  %v652 = pyc.and %v258, %v651 : i1
  %v653 = pyc.alias %v652 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v654 = pyc.or %v647, %v653 : i1
  %v655 = pyc.alias %v654 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v656 = pyc.not %v653 : i1
  %v657 = pyc.mux %v656, %v650, %v298 : i128
  %v658 = pyc.alias %v657 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v659 = pyc.eq %v343, %v600 : i16
  %v660 = pyc.and %v263, %v659 : i1
  %v661 = pyc.alias %v660 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v662 = pyc.or %v655, %v661 : i1
  %v663 = pyc.alias %v662 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v664 = pyc.not %v661 : i1
  %v665 = pyc.mux %v664, %v658, %v303 : i128
  %v666 = pyc.alias %v665 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v667 = pyc.constant 0 : i3
  %v668 = pyc.zext %v667 : i3 -> i5
  %v669 = pyc.eq %v584, %v668 : i5
  %v670 = pyc.not %v669 : i1
  %v671 = pyc.alias %v670 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v672 = pyc.and %v671, %v663 : i1
  %v673 = pyc.alias %v672 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v674 = pyc.not %v671 : i1
  %v675 = pyc.or %v674, %v673 : i1
  %v676 = pyc.and %v597, %v675 : i1
  %v677 = pyc.alias %v676 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v678 = pyc.constant 1 : i3
  %v679 = pyc.ult %v678, %v173 : i3
  %v680 = pyc.and %v153, %v679 : i1
  %v681 = pyc.or %v677, %v680 : i1
  pyc.assign %v149, %v681 : i1
  %v682 = pyc.constant 1 : i3
  %v683 = pyc.zext %v682 : i3 -> i5
  %v684 = pyc.add %v580, %v683 : i5
  %v685 = pyc.constant 1 : i3
  %v686 = pyc.sub %v173, %v685 : i3
  %v687 = pyc.constant 0 : i3
  %v688 = pyc.mux %v153, %v686, %v687 : i3
  %v689 = pyc.zext %v688 : i3 -> i5
  %v690 = pyc.mux %v677, %v684, %v689 : i5
  %v691 = pyc.alias %v690 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v692 = pyc.trunc %v691 : i5 -> i3
  pyc.assign %v169, %v692 : i3
  %v693 = pyc.mux %v677, %v590, %v193 : i6
  pyc.assign %v189, %v693 : i6
  %v694 = pyc.mux %v677, %v31, %v213 : i16
  pyc.assign %v209, %v694 : i16
  pyc.assign %v49, %v677 : i1
  %v695 = pyc.constant 0 : i128
  %v696 = pyc.mux %v677, %lane1_pkt_in_data, %v695 : i128
  pyc.assign %v69, %v696 : i128
  %v697 = pyc.constant 0 : i2
  %v698 = pyc.zext %v697 : i2 -> i5
  %v699 = pyc.mux %v677, %v580, %v698 : i5
  %v700 = pyc.trunc %v699 : i5 -> i2
  pyc.assign %v89, %v700 : i2
  %v701 = pyc.and %v671, %v677 : i1
  pyc.assign %v109, %v701 : i1
  %v702 = pyc.and %v671, %v677 : i1
  %v703 = pyc.constant 0 : i128
  %v704 = pyc.mux %v702, %v666, %v703 : i128
  pyc.assign %v129, %v704 : i128
  %v705 = pyc.constant 3 : i5
  %v706 = pyc.and %lane2_pkt_in_ctrl, %v705 : i5
  %v707 = pyc.alias %v706 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v708 = pyc.lshri %lane2_pkt_in_ctrl {amount = 2} : i5
  %v709 = pyc.constant 7 : i5
  %v710 = pyc.and %v708, %v709 : i5
  %v711 = pyc.alias %v710 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v712 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v713 = pyc.constant 2 : i6
  %v714 = pyc.add %v712, %v713 : i6
  %v715 = pyc.zext %v707 : i5 -> i6
  %v716 = pyc.add %v714, %v715 : i6
  %v717 = pyc.alias %v716 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v718 = pyc.eq %v717, %v198 : i6
  %v719 = pyc.not %v718 : i1
  %v720 = pyc.alias %v719 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v721 = pyc.not %v158 : i1
  %v722 = pyc.and %v721, %lane2_pkt_in_vld : i1
  %v723 = pyc.and %v722, %v720 : i1
  %v724 = pyc.alias %v723 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v725 = pyc.zext %v711 : i5 -> i16
  %v726 = pyc.sub %v33, %v725 : i16
  %v727 = pyc.alias %v726 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v728 = pyc.eq %v308, %v727 : i16
  %v729 = pyc.and %v228, %v728 : i1
  %v730 = pyc.alias %v729 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v731 = pyc.constant 0 : i1
  %v732 = pyc.or %v730, %v731 : i1
  %v733 = pyc.alias %v732 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v734 = pyc.not %v730 : i1
  %v735 = pyc.constant 0 : i128
  %v736 = pyc.mux %v734, %v735, %v268 : i128
  %v737 = pyc.alias %v736 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v738 = pyc.eq %v313, %v727 : i16
  %v739 = pyc.and %v233, %v738 : i1
  %v740 = pyc.alias %v739 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v741 = pyc.or %v733, %v740 : i1
  %v742 = pyc.alias %v741 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v743 = pyc.not %v740 : i1
  %v744 = pyc.mux %v743, %v737, %v273 : i128
  %v745 = pyc.alias %v744 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v746 = pyc.eq %v318, %v727 : i16
  %v747 = pyc.and %v238, %v746 : i1
  %v748 = pyc.alias %v747 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v749 = pyc.or %v742, %v748 : i1
  %v750 = pyc.alias %v749 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v751 = pyc.not %v748 : i1
  %v752 = pyc.mux %v751, %v745, %v278 : i128
  %v753 = pyc.alias %v752 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v754 = pyc.eq %v323, %v727 : i16
  %v755 = pyc.and %v243, %v754 : i1
  %v756 = pyc.alias %v755 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v757 = pyc.or %v750, %v756 : i1
  %v758 = pyc.alias %v757 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v759 = pyc.not %v756 : i1
  %v760 = pyc.mux %v759, %v753, %v283 : i128
  %v761 = pyc.alias %v760 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v762 = pyc.eq %v328, %v727 : i16
  %v763 = pyc.and %v248, %v762 : i1
  %v764 = pyc.alias %v763 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v765 = pyc.or %v758, %v764 : i1
  %v766 = pyc.alias %v765 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v767 = pyc.not %v764 : i1
  %v768 = pyc.mux %v767, %v761, %v288 : i128
  %v769 = pyc.alias %v768 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v770 = pyc.eq %v333, %v727 : i16
  %v771 = pyc.and %v253, %v770 : i1
  %v772 = pyc.alias %v771 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v773 = pyc.or %v766, %v772 : i1
  %v774 = pyc.alias %v773 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v775 = pyc.not %v772 : i1
  %v776 = pyc.mux %v775, %v769, %v293 : i128
  %v777 = pyc.alias %v776 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v778 = pyc.eq %v338, %v727 : i16
  %v779 = pyc.and %v258, %v778 : i1
  %v780 = pyc.alias %v779 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v781 = pyc.or %v774, %v780 : i1
  %v782 = pyc.alias %v781 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v783 = pyc.not %v780 : i1
  %v784 = pyc.mux %v783, %v777, %v298 : i128
  %v785 = pyc.alias %v784 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v786 = pyc.eq %v343, %v727 : i16
  %v787 = pyc.and %v263, %v786 : i1
  %v788 = pyc.alias %v787 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v789 = pyc.or %v782, %v788 : i1
  %v790 = pyc.alias %v789 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v791 = pyc.not %v788 : i1
  %v792 = pyc.mux %v791, %v785, %v303 : i128
  %v793 = pyc.alias %v792 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v794 = pyc.constant 0 : i3
  %v795 = pyc.zext %v794 : i3 -> i5
  %v796 = pyc.eq %v711, %v795 : i5
  %v797 = pyc.not %v796 : i1
  %v798 = pyc.alias %v797 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v799 = pyc.and %v798, %v790 : i1
  %v800 = pyc.alias %v799 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v801 = pyc.not %v798 : i1
  %v802 = pyc.or %v801, %v800 : i1
  %v803 = pyc.and %v724, %v802 : i1
  %v804 = pyc.alias %v803 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v805 = pyc.constant 1 : i3
  %v806 = pyc.ult %v805, %v178 : i3
  %v807 = pyc.and %v158, %v806 : i1
  %v808 = pyc.or %v804, %v807 : i1
  pyc.assign %v154, %v808 : i1
  %v809 = pyc.constant 1 : i3
  %v810 = pyc.zext %v809 : i3 -> i5
  %v811 = pyc.add %v707, %v810 : i5
  %v812 = pyc.constant 1 : i3
  %v813 = pyc.sub %v178, %v812 : i3
  %v814 = pyc.constant 0 : i3
  %v815 = pyc.mux %v158, %v813, %v814 : i3
  %v816 = pyc.zext %v815 : i3 -> i5
  %v817 = pyc.mux %v804, %v811, %v816 : i5
  %v818 = pyc.alias %v817 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v819 = pyc.trunc %v818 : i5 -> i3
  pyc.assign %v174, %v819 : i3
  %v820 = pyc.mux %v804, %v717, %v198 : i6
  pyc.assign %v194, %v820 : i6
  %v821 = pyc.mux %v804, %v33, %v218 : i16
  pyc.assign %v214, %v821 : i16
  pyc.assign %v54, %v804 : i1
  %v822 = pyc.constant 0 : i128
  %v823 = pyc.mux %v804, %lane2_pkt_in_data, %v822 : i128
  pyc.assign %v74, %v823 : i128
  %v824 = pyc.constant 0 : i2
  %v825 = pyc.zext %v824 : i2 -> i5
  %v826 = pyc.mux %v804, %v707, %v825 : i5
  %v827 = pyc.trunc %v826 : i5 -> i2
  pyc.assign %v94, %v827 : i2
  %v828 = pyc.and %v798, %v804 : i1
  pyc.assign %v114, %v828 : i1
  %v829 = pyc.and %v798, %v804 : i1
  %v830 = pyc.constant 0 : i128
  %v831 = pyc.mux %v829, %v793, %v830 : i128
  pyc.assign %v134, %v831 : i128
  %v832 = pyc.constant 3 : i5
  %v833 = pyc.and %lane3_pkt_in_ctrl, %v832 : i5
  %v834 = pyc.alias %v833 {pyc.name = "lat__fastfwd_v3_4__L112"} : i5
  %v835 = pyc.lshri %lane3_pkt_in_ctrl {amount = 2} : i5
  %v836 = pyc.constant 7 : i5
  %v837 = pyc.and %v835, %v836 : i5
  %v838 = pyc.alias %v837 {pyc.name = "dep__fastfwd_v3_4__L113"} : i5
  %v839 = pyc.extract %v21 {lsb = 0} : i16 -> i6
  %v840 = pyc.constant 2 : i6
  %v841 = pyc.add %v839, %v840 : i6
  %v842 = pyc.zext %v834 : i5 -> i6
  %v843 = pyc.add %v841, %v842 : i6
  %v844 = pyc.alias %v843 {pyc.name = "finish_cycle__fastfwd_v3_4__L114"} : i6
  %v845 = pyc.eq %v844, %v203 : i6
  %v846 = pyc.not %v845 : i1
  %v847 = pyc.alias %v846 {pyc.name = "constraint_ok__fastfwd_v3_4__L115"} : i1
  %v848 = pyc.not %v163 : i1
  %v849 = pyc.and %v848, %lane3_pkt_in_vld : i1
  %v850 = pyc.and %v849, %v847 : i1
  %v851 = pyc.alias %v850 {pyc.name = "can_schedule__fastfwd_v3_4__L116"} : i1
  %v852 = pyc.zext %v838 : i5 -> i16
  %v853 = pyc.sub %v35, %v852 : i16
  %v854 = pyc.alias %v853 {pyc.name = "target_seq__fastfwd_v3_4__L119"} : i16
  %v855 = pyc.eq %v308, %v854 : i16
  %v856 = pyc.and %v228, %v855 : i1
  %v857 = pyc.alias %v856 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v858 = pyc.constant 0 : i1
  %v859 = pyc.or %v857, %v858 : i1
  %v860 = pyc.alias %v859 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v861 = pyc.not %v857 : i1
  %v862 = pyc.constant 0 : i128
  %v863 = pyc.mux %v861, %v862, %v268 : i128
  %v864 = pyc.alias %v863 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v865 = pyc.eq %v313, %v854 : i16
  %v866 = pyc.and %v233, %v865 : i1
  %v867 = pyc.alias %v866 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v868 = pyc.or %v860, %v867 : i1
  %v869 = pyc.alias %v868 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v870 = pyc.not %v867 : i1
  %v871 = pyc.mux %v870, %v864, %v273 : i128
  %v872 = pyc.alias %v871 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v873 = pyc.eq %v318, %v854 : i16
  %v874 = pyc.and %v238, %v873 : i1
  %v875 = pyc.alias %v874 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v876 = pyc.or %v869, %v875 : i1
  %v877 = pyc.alias %v876 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v878 = pyc.not %v875 : i1
  %v879 = pyc.mux %v878, %v872, %v278 : i128
  %v880 = pyc.alias %v879 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v881 = pyc.eq %v323, %v854 : i16
  %v882 = pyc.and %v243, %v881 : i1
  %v883 = pyc.alias %v882 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v884 = pyc.or %v877, %v883 : i1
  %v885 = pyc.alias %v884 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v886 = pyc.not %v883 : i1
  %v887 = pyc.mux %v886, %v880, %v283 : i128
  %v888 = pyc.alias %v887 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v889 = pyc.eq %v328, %v854 : i16
  %v890 = pyc.and %v248, %v889 : i1
  %v891 = pyc.alias %v890 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v892 = pyc.or %v885, %v891 : i1
  %v893 = pyc.alias %v892 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v894 = pyc.not %v891 : i1
  %v895 = pyc.mux %v894, %v888, %v288 : i128
  %v896 = pyc.alias %v895 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v897 = pyc.eq %v333, %v854 : i16
  %v898 = pyc.and %v253, %v897 : i1
  %v899 = pyc.alias %v898 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v900 = pyc.or %v893, %v899 : i1
  %v901 = pyc.alias %v900 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v902 = pyc.not %v899 : i1
  %v903 = pyc.mux %v902, %v896, %v293 : i128
  %v904 = pyc.alias %v903 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v905 = pyc.eq %v338, %v854 : i16
  %v906 = pyc.and %v258, %v905 : i1
  %v907 = pyc.alias %v906 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v908 = pyc.or %v901, %v907 : i1
  %v909 = pyc.alias %v908 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v910 = pyc.not %v907 : i1
  %v911 = pyc.mux %v910, %v904, %v298 : i128
  %v912 = pyc.alias %v911 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v913 = pyc.eq %v343, %v854 : i16
  %v914 = pyc.and %v263, %v913 : i1
  %v915 = pyc.alias %v914 {pyc.name = "match__fastfwd_v3_4__L123"} : i1
  %v916 = pyc.or %v909, %v915 : i1
  %v917 = pyc.alias %v916 {pyc.name = "dep_found__fastfwd_v3_4__L124"} : i1
  %v918 = pyc.not %v915 : i1
  %v919 = pyc.mux %v918, %v912, %v303 : i128
  %v920 = pyc.alias %v919 {pyc.name = "dep_value__fastfwd_v3_4__L125"} : i128
  %v921 = pyc.constant 0 : i3
  %v922 = pyc.zext %v921 : i3 -> i5
  %v923 = pyc.eq %v838, %v922 : i5
  %v924 = pyc.not %v923 : i1
  %v925 = pyc.alias %v924 {pyc.name = "has_dep__fastfwd_v3_4__L127"} : i1
  %v926 = pyc.and %v925, %v917 : i1
  %v927 = pyc.alias %v926 {pyc.name = "dep_ready__fastfwd_v3_4__L128"} : i1
  %v928 = pyc.not %v925 : i1
  %v929 = pyc.or %v928, %v927 : i1
  %v930 = pyc.and %v851, %v929 : i1
  %v931 = pyc.alias %v930 {pyc.name = "can_schedule__fastfwd_v3_4__L129"} : i1
  %v932 = pyc.constant 1 : i3
  %v933 = pyc.ult %v932, %v183 : i3
  %v934 = pyc.and %v163, %v933 : i1
  %v935 = pyc.or %v931, %v934 : i1
  pyc.assign %v159, %v935 : i1
  %v936 = pyc.constant 1 : i3
  %v937 = pyc.zext %v936 : i3 -> i5
  %v938 = pyc.add %v834, %v937 : i5
  %v939 = pyc.constant 1 : i3
  %v940 = pyc.sub %v183, %v939 : i3
  %v941 = pyc.constant 0 : i3
  %v942 = pyc.mux %v163, %v940, %v941 : i3
  %v943 = pyc.zext %v942 : i3 -> i5
  %v944 = pyc.mux %v931, %v938, %v943 : i5
  %v945 = pyc.alias %v944 {pyc.name = "new_timer__fastfwd_v3_4__L133"} : i5
  %v946 = pyc.trunc %v945 : i5 -> i3
  pyc.assign %v179, %v946 : i3
  %v947 = pyc.mux %v931, %v844, %v203 : i6
  pyc.assign %v199, %v947 : i6
  %v948 = pyc.mux %v931, %v35, %v223 : i16
  pyc.assign %v219, %v948 : i16
  pyc.assign %v59, %v931 : i1
  %v949 = pyc.constant 0 : i128
  %v950 = pyc.mux %v931, %lane3_pkt_in_data, %v949 : i128
  pyc.assign %v79, %v950 : i128
  %v951 = pyc.constant 0 : i2
  %v952 = pyc.zext %v951 : i2 -> i5
  %v953 = pyc.mux %v931, %v834, %v952 : i5
  %v954 = pyc.trunc %v953 : i5 -> i2
  pyc.assign %v99, %v954 : i2
  %v955 = pyc.and %v925, %v931 : i1
  pyc.assign %v119, %v955 : i1
  %v956 = pyc.and %v925, %v931 : i1
  %v957 = pyc.constant 0 : i128
  %v958 = pyc.mux %v956, %v920, %v957 : i128
  pyc.assign %v139, %v958 : i128
  %v959 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v960 = pyc.constant 1 : i1
  %v961 = pyc.constant 0 : i1
  %v962 = pyc.reg %clk, %rst, %v960, %v959, %v961 : i1
  %v963 = pyc.alias %v962 {pyc.name = "rob0_valid"} : i1
  %v964 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v965 = pyc.constant 1 : i1
  %v966 = pyc.constant 0 : i1
  %v967 = pyc.reg %clk, %rst, %v965, %v964, %v966 : i1
  %v968 = pyc.alias %v967 {pyc.name = "rob1_valid"} : i1
  %v969 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v970 = pyc.constant 1 : i1
  %v971 = pyc.constant 0 : i1
  %v972 = pyc.reg %clk, %rst, %v970, %v969, %v971 : i1
  %v973 = pyc.alias %v972 {pyc.name = "rob2_valid"} : i1
  %v974 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v975 = pyc.constant 1 : i1
  %v976 = pyc.constant 0 : i1
  %v977 = pyc.reg %clk, %rst, %v975, %v974, %v976 : i1
  %v978 = pyc.alias %v977 {pyc.name = "rob3_valid"} : i1
  %v979 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v980 = pyc.constant 1 : i1
  %v981 = pyc.constant 0 : i1
  %v982 = pyc.reg %clk, %rst, %v980, %v979, %v981 : i1
  %v983 = pyc.alias %v982 {pyc.name = "rob4_valid"} : i1
  %v984 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v985 = pyc.constant 1 : i1
  %v986 = pyc.constant 0 : i1
  %v987 = pyc.reg %clk, %rst, %v985, %v984, %v986 : i1
  %v988 = pyc.alias %v987 {pyc.name = "rob5_valid"} : i1
  %v989 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v990 = pyc.constant 1 : i1
  %v991 = pyc.constant 0 : i1
  %v992 = pyc.reg %clk, %rst, %v990, %v989, %v991 : i1
  %v993 = pyc.alias %v992 {pyc.name = "rob6_valid"} : i1
  %v994 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v995 = pyc.constant 1 : i1
  %v996 = pyc.constant 0 : i1
  %v997 = pyc.reg %clk, %rst, %v995, %v994, %v996 : i1
  %v998 = pyc.alias %v997 {pyc.name = "rob7_valid"} : i1
  %v999 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v1000 = pyc.constant 1 : i1
  %v1001 = pyc.constant 0 : i128
  %v1002 = pyc.reg %clk, %rst, %v1000, %v999, %v1001 : i128
  %v1003 = pyc.alias %v1002 {pyc.name = "rob0_data"} : i128
  %v1004 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v1005 = pyc.constant 1 : i1
  %v1006 = pyc.constant 0 : i128
  %v1007 = pyc.reg %clk, %rst, %v1005, %v1004, %v1006 : i128
  %v1008 = pyc.alias %v1007 {pyc.name = "rob1_data"} : i128
  %v1009 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v1010 = pyc.constant 1 : i1
  %v1011 = pyc.constant 0 : i128
  %v1012 = pyc.reg %clk, %rst, %v1010, %v1009, %v1011 : i128
  %v1013 = pyc.alias %v1012 {pyc.name = "rob2_data"} : i128
  %v1014 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v1015 = pyc.constant 1 : i1
  %v1016 = pyc.constant 0 : i128
  %v1017 = pyc.reg %clk, %rst, %v1015, %v1014, %v1016 : i128
  %v1018 = pyc.alias %v1017 {pyc.name = "rob3_data"} : i128
  %v1019 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v1020 = pyc.constant 1 : i1
  %v1021 = pyc.constant 0 : i128
  %v1022 = pyc.reg %clk, %rst, %v1020, %v1019, %v1021 : i128
  %v1023 = pyc.alias %v1022 {pyc.name = "rob4_data"} : i128
  %v1024 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v1025 = pyc.constant 1 : i1
  %v1026 = pyc.constant 0 : i128
  %v1027 = pyc.reg %clk, %rst, %v1025, %v1024, %v1026 : i128
  %v1028 = pyc.alias %v1027 {pyc.name = "rob5_data"} : i128
  %v1029 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v1030 = pyc.constant 1 : i1
  %v1031 = pyc.constant 0 : i128
  %v1032 = pyc.reg %clk, %rst, %v1030, %v1029, %v1031 : i128
  %v1033 = pyc.alias %v1032 {pyc.name = "rob6_data"} : i128
  %v1034 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v1035 = pyc.constant 1 : i1
  %v1036 = pyc.constant 0 : i128
  %v1037 = pyc.reg %clk, %rst, %v1035, %v1034, %v1036 : i128
  %v1038 = pyc.alias %v1037 {pyc.name = "rob7_data"} : i128
  %v1039 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v1040 = pyc.constant 1 : i1
  %v1041 = pyc.constant 0 : i16
  %v1042 = pyc.reg %clk, %rst, %v1040, %v1039, %v1041 : i16
  %v1043 = pyc.alias %v1042 {pyc.name = "rob0_seq"} : i16
  %v1044 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v1045 = pyc.constant 1 : i1
  %v1046 = pyc.constant 0 : i16
  %v1047 = pyc.reg %clk, %rst, %v1045, %v1044, %v1046 : i16
  %v1048 = pyc.alias %v1047 {pyc.name = "rob1_seq"} : i16
  %v1049 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v1050 = pyc.constant 1 : i1
  %v1051 = pyc.constant 0 : i16
  %v1052 = pyc.reg %clk, %rst, %v1050, %v1049, %v1051 : i16
  %v1053 = pyc.alias %v1052 {pyc.name = "rob2_seq"} : i16
  %v1054 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v1055 = pyc.constant 1 : i1
  %v1056 = pyc.constant 0 : i16
  %v1057 = pyc.reg %clk, %rst, %v1055, %v1054, %v1056 : i16
  %v1058 = pyc.alias %v1057 {pyc.name = "rob3_seq"} : i16
  %v1059 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v1060 = pyc.constant 1 : i1
  %v1061 = pyc.constant 0 : i16
  %v1062 = pyc.reg %clk, %rst, %v1060, %v1059, %v1061 : i16
  %v1063 = pyc.alias %v1062 {pyc.name = "rob4_seq"} : i16
  %v1064 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v1065 = pyc.constant 1 : i1
  %v1066 = pyc.constant 0 : i16
  %v1067 = pyc.reg %clk, %rst, %v1065, %v1064, %v1066 : i16
  %v1068 = pyc.alias %v1067 {pyc.name = "rob5_seq"} : i16
  %v1069 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v1070 = pyc.constant 1 : i1
  %v1071 = pyc.constant 0 : i16
  %v1072 = pyc.reg %clk, %rst, %v1070, %v1069, %v1071 : i16
  %v1073 = pyc.alias %v1072 {pyc.name = "rob6_seq"} : i16
  %v1074 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v1075 = pyc.constant 1 : i1
  %v1076 = pyc.constant 0 : i16
  %v1077 = pyc.reg %clk, %rst, %v1075, %v1074, %v1076 : i16
  %v1078 = pyc.alias %v1077 {pyc.name = "rob7_seq"} : i16
  %v1079 = pyc.wire {pyc.name = "rob_tail__next"} : i3
  %v1080 = pyc.constant 1 : i1
  %v1081 = pyc.constant 0 : i3
  %v1082 = pyc.reg %clk, %rst, %v1080, %v1079, %v1081 : i3
  %v1083 = pyc.alias %v1082 {pyc.name = "rob_tail"} : i3
  %v1084 = pyc.alias %v1083 {pyc.name = "rob_tail__fastfwd_v3_4__L150"} : i3
  %v1085 = pyc.wire {pyc.name = "next_output_seq__next"} : i16
  %v1086 = pyc.constant 1 : i1
  %v1087 = pyc.constant 0 : i16
  %v1088 = pyc.reg %clk, %rst, %v1086, %v1085, %v1087 : i16
  %v1089 = pyc.alias %v1088 {pyc.name = "next_output_seq"} : i16
  %v1090 = pyc.alias %v1089 {pyc.name = "next_output_seq__fastfwd_v3_4__L151"} : i16
  %v1091 = pyc.constant 0 : i3
  %v1092 = pyc.eq %v1084, %v1091 : i3
  %v1093 = pyc.and %v382, %v1092 : i1
  %v1094 = pyc.alias %v1093 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1095 = pyc.or %v1094, %v963 : i1
  pyc.assign %v959, %v1095 : i1
  %v1096 = pyc.mux %v1094, %v385, %v1003 : i128
  pyc.assign %v999, %v1096 : i128
  %v1097 = pyc.mux %v1094, %v388, %v1043 : i16
  pyc.assign %v1039, %v1097 : i16
  %v1098 = pyc.constant 1 : i3
  %v1099 = pyc.eq %v1084, %v1098 : i3
  %v1100 = pyc.and %v382, %v1099 : i1
  %v1101 = pyc.alias %v1100 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1102 = pyc.or %v1101, %v968 : i1
  pyc.assign %v964, %v1102 : i1
  %v1103 = pyc.mux %v1101, %v385, %v1008 : i128
  pyc.assign %v1004, %v1103 : i128
  %v1104 = pyc.mux %v1101, %v388, %v1048 : i16
  pyc.assign %v1044, %v1104 : i16
  %v1105 = pyc.constant 2 : i3
  %v1106 = pyc.eq %v1084, %v1105 : i3
  %v1107 = pyc.and %v382, %v1106 : i1
  %v1108 = pyc.alias %v1107 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1109 = pyc.or %v1108, %v973 : i1
  pyc.assign %v969, %v1109 : i1
  %v1110 = pyc.mux %v1108, %v385, %v1013 : i128
  pyc.assign %v1009, %v1110 : i128
  %v1111 = pyc.mux %v1108, %v388, %v1053 : i16
  pyc.assign %v1049, %v1111 : i16
  %v1112 = pyc.constant 3 : i3
  %v1113 = pyc.eq %v1084, %v1112 : i3
  %v1114 = pyc.and %v382, %v1113 : i1
  %v1115 = pyc.alias %v1114 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1116 = pyc.or %v1115, %v978 : i1
  pyc.assign %v974, %v1116 : i1
  %v1117 = pyc.mux %v1115, %v385, %v1018 : i128
  pyc.assign %v1014, %v1117 : i128
  %v1118 = pyc.mux %v1115, %v388, %v1058 : i16
  pyc.assign %v1054, %v1118 : i16
  %v1119 = pyc.constant 4 : i3
  %v1120 = pyc.eq %v1084, %v1119 : i3
  %v1121 = pyc.and %v382, %v1120 : i1
  %v1122 = pyc.alias %v1121 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1123 = pyc.or %v1122, %v983 : i1
  pyc.assign %v979, %v1123 : i1
  %v1124 = pyc.mux %v1122, %v385, %v1023 : i128
  pyc.assign %v1019, %v1124 : i128
  %v1125 = pyc.mux %v1122, %v388, %v1063 : i16
  pyc.assign %v1059, %v1125 : i16
  %v1126 = pyc.constant 5 : i3
  %v1127 = pyc.eq %v1084, %v1126 : i3
  %v1128 = pyc.and %v382, %v1127 : i1
  %v1129 = pyc.alias %v1128 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1130 = pyc.or %v1129, %v988 : i1
  pyc.assign %v984, %v1130 : i1
  %v1131 = pyc.mux %v1129, %v385, %v1028 : i128
  pyc.assign %v1024, %v1131 : i128
  %v1132 = pyc.mux %v1129, %v388, %v1068 : i16
  pyc.assign %v1064, %v1132 : i16
  %v1133 = pyc.constant 6 : i3
  %v1134 = pyc.eq %v1084, %v1133 : i3
  %v1135 = pyc.and %v382, %v1134 : i1
  %v1136 = pyc.alias %v1135 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1137 = pyc.or %v1136, %v993 : i1
  pyc.assign %v989, %v1137 : i1
  %v1138 = pyc.mux %v1136, %v385, %v1033 : i128
  pyc.assign %v1029, %v1138 : i128
  %v1139 = pyc.mux %v1136, %v388, %v1073 : i16
  pyc.assign %v1069, %v1139 : i16
  %v1140 = pyc.constant 7 : i3
  %v1141 = pyc.eq %v1084, %v1140 : i3
  %v1142 = pyc.and %v382, %v1141 : i1
  %v1143 = pyc.alias %v1142 {pyc.name = "should_write__fastfwd_v3_4__L154"} : i1
  %v1144 = pyc.or %v1143, %v998 : i1
  pyc.assign %v994, %v1144 : i1
  %v1145 = pyc.mux %v1143, %v385, %v1038 : i128
  pyc.assign %v1034, %v1145 : i128
  %v1146 = pyc.mux %v1143, %v388, %v1078 : i16
  pyc.assign %v1074, %v1146 : i16
  %v1147 = pyc.constant 1 : i3
  %v1148 = pyc.add %v1084, %v1147 : i3
  %v1149 = pyc.constant 7 : i3
  %v1150 = pyc.and %v1148, %v1149 : i3
  %v1151 = pyc.mux %v382, %v1150, %v1084 : i3
  pyc.assign %v1079, %v1151 : i3
  %v1152 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_4__L164"} : i2
  %v1153 = pyc.alias %v1090 {pyc.name = "next_seq__fastfwd_v3_4__L165"} : i16
  %v1154 = pyc.eq %v1043, %v1153 : i16
  %v1155 = pyc.and %v963, %v1154 : i1
  %v1156 = pyc.alias %v1155 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1157 = pyc.constant 0 : i1
  %v1158 = pyc.or %v1156, %v1157 : i1
  %v1159 = pyc.alias %v1158 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1160 = pyc.not %v1156 : i1
  %v1161 = pyc.constant 0 : i128
  %v1162 = pyc.mux %v1160, %v1161, %v1003 : i128
  %v1163 = pyc.alias %v1162 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1164 = pyc.eq %v1048, %v1153 : i16
  %v1165 = pyc.and %v968, %v1164 : i1
  %v1166 = pyc.alias %v1165 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1167 = pyc.or %v1159, %v1166 : i1
  %v1168 = pyc.alias %v1167 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1169 = pyc.not %v1166 : i1
  %v1170 = pyc.mux %v1169, %v1163, %v1008 : i128
  %v1171 = pyc.alias %v1170 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1172 = pyc.eq %v1053, %v1153 : i16
  %v1173 = pyc.and %v973, %v1172 : i1
  %v1174 = pyc.alias %v1173 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1175 = pyc.or %v1168, %v1174 : i1
  %v1176 = pyc.alias %v1175 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1177 = pyc.not %v1174 : i1
  %v1178 = pyc.mux %v1177, %v1171, %v1013 : i128
  %v1179 = pyc.alias %v1178 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1180 = pyc.eq %v1058, %v1153 : i16
  %v1181 = pyc.and %v978, %v1180 : i1
  %v1182 = pyc.alias %v1181 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1183 = pyc.or %v1176, %v1182 : i1
  %v1184 = pyc.alias %v1183 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1185 = pyc.not %v1182 : i1
  %v1186 = pyc.mux %v1185, %v1179, %v1018 : i128
  %v1187 = pyc.alias %v1186 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1188 = pyc.eq %v1063, %v1153 : i16
  %v1189 = pyc.and %v983, %v1188 : i1
  %v1190 = pyc.alias %v1189 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1191 = pyc.or %v1184, %v1190 : i1
  %v1192 = pyc.alias %v1191 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1193 = pyc.not %v1190 : i1
  %v1194 = pyc.mux %v1193, %v1187, %v1023 : i128
  %v1195 = pyc.alias %v1194 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1196 = pyc.eq %v1068, %v1153 : i16
  %v1197 = pyc.and %v988, %v1196 : i1
  %v1198 = pyc.alias %v1197 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1199 = pyc.or %v1192, %v1198 : i1
  %v1200 = pyc.alias %v1199 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1201 = pyc.not %v1198 : i1
  %v1202 = pyc.mux %v1201, %v1195, %v1028 : i128
  %v1203 = pyc.alias %v1202 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1204 = pyc.eq %v1073, %v1153 : i16
  %v1205 = pyc.and %v993, %v1204 : i1
  %v1206 = pyc.alias %v1205 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1207 = pyc.or %v1200, %v1206 : i1
  %v1208 = pyc.alias %v1207 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1209 = pyc.not %v1206 : i1
  %v1210 = pyc.mux %v1209, %v1203, %v1033 : i128
  %v1211 = pyc.alias %v1210 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1212 = pyc.eq %v1078, %v1153 : i16
  %v1213 = pyc.and %v998, %v1212 : i1
  %v1214 = pyc.alias %v1213 {pyc.name = "match__fastfwd_v3_4__L170"} : i1
  %v1215 = pyc.or %v1208, %v1214 : i1
  %v1216 = pyc.alias %v1215 {pyc.name = "has_next_seq__fastfwd_v3_4__L171"} : i1
  %v1217 = pyc.not %v1214 : i1
  %v1218 = pyc.mux %v1217, %v1211, %v1038 : i128
  %v1219 = pyc.alias %v1218 {pyc.name = "next_seq_data__fastfwd_v3_4__L172"} : i128
  %v1220 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1221 = pyc.constant 1 : i1
  %v1222 = pyc.constant 0 : i1
  %v1223 = pyc.reg %clk, %rst, %v1221, %v1220, %v1222 : i1
  %v1224 = pyc.alias %v1223 {pyc.name = "lane0_out_vld"} : i1
  %v1225 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1226 = pyc.constant 1 : i1
  %v1227 = pyc.constant 0 : i1
  %v1228 = pyc.reg %clk, %rst, %v1226, %v1225, %v1227 : i1
  %v1229 = pyc.alias %v1228 {pyc.name = "lane1_out_vld"} : i1
  %v1230 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1231 = pyc.constant 1 : i1
  %v1232 = pyc.constant 0 : i1
  %v1233 = pyc.reg %clk, %rst, %v1231, %v1230, %v1232 : i1
  %v1234 = pyc.alias %v1233 {pyc.name = "lane2_out_vld"} : i1
  %v1235 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1236 = pyc.constant 1 : i1
  %v1237 = pyc.constant 0 : i1
  %v1238 = pyc.reg %clk, %rst, %v1236, %v1235, %v1237 : i1
  %v1239 = pyc.alias %v1238 {pyc.name = "lane3_out_vld"} : i1
  %v1240 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1241 = pyc.constant 1 : i1
  %v1242 = pyc.constant 0 : i128
  %v1243 = pyc.reg %clk, %rst, %v1241, %v1240, %v1242 : i128
  %v1244 = pyc.alias %v1243 {pyc.name = "lane0_out_data"} : i128
  %v1245 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1246 = pyc.constant 1 : i1
  %v1247 = pyc.constant 0 : i128
  %v1248 = pyc.reg %clk, %rst, %v1246, %v1245, %v1247 : i128
  %v1249 = pyc.alias %v1248 {pyc.name = "lane1_out_data"} : i128
  %v1250 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1251 = pyc.constant 1 : i1
  %v1252 = pyc.constant 0 : i128
  %v1253 = pyc.reg %clk, %rst, %v1251, %v1250, %v1252 : i128
  %v1254 = pyc.alias %v1253 {pyc.name = "lane2_out_data"} : i128
  %v1255 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1256 = pyc.constant 1 : i1
  %v1257 = pyc.constant 0 : i128
  %v1258 = pyc.reg %clk, %rst, %v1256, %v1255, %v1257 : i128
  %v1259 = pyc.alias %v1258 {pyc.name = "lane3_out_data"} : i128
  %v1260 = pyc.constant 0 : i2
  %v1261 = pyc.eq %v1152, %v1260 : i2
  %v1262 = pyc.alias %v1261 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1263 = pyc.and %v1262, %v1216 : i1
  %v1264 = pyc.alias %v1263 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1220, %v1264 : i1
  %v1265 = pyc.constant 0 : i128
  %v1266 = pyc.mux %v1264, %v1219, %v1265 : i128
  pyc.assign %v1240, %v1266 : i128
  %v1267 = pyc.constant 1 : i2
  %v1268 = pyc.eq %v1152, %v1267 : i2
  %v1269 = pyc.alias %v1268 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1270 = pyc.and %v1269, %v1216 : i1
  %v1271 = pyc.alias %v1270 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1225, %v1271 : i1
  %v1272 = pyc.constant 0 : i128
  %v1273 = pyc.mux %v1271, %v1219, %v1272 : i128
  pyc.assign %v1245, %v1273 : i128
  %v1274 = pyc.constant 2 : i2
  %v1275 = pyc.eq %v1152, %v1274 : i2
  %v1276 = pyc.alias %v1275 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1277 = pyc.and %v1276, %v1216 : i1
  %v1278 = pyc.alias %v1277 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1230, %v1278 : i1
  %v1279 = pyc.constant 0 : i128
  %v1280 = pyc.mux %v1278, %v1219, %v1279 : i128
  pyc.assign %v1250, %v1280 : i128
  %v1281 = pyc.constant 3 : i2
  %v1282 = pyc.eq %v1152, %v1281 : i2
  %v1283 = pyc.alias %v1282 {pyc.name = "this_lane__fastfwd_v3_4__L178"} : i1
  %v1284 = pyc.and %v1283, %v1216 : i1
  %v1285 = pyc.alias %v1284 {pyc.name = "should_output__fastfwd_v3_4__L179"} : i1
  pyc.assign %v1235, %v1285 : i1
  %v1286 = pyc.constant 0 : i128
  %v1287 = pyc.mux %v1285, %v1219, %v1286 : i128
  pyc.assign %v1255, %v1287 : i128
  %v1288 = pyc.or %v1224, %v1229 : i1
  %v1289 = pyc.or %v1288, %v1234 : i1
  %v1290 = pyc.or %v1289, %v1239 : i1
  %v1291 = pyc.alias %v1290 {pyc.name = "any_output__fastfwd_v3_4__L183"} : i1
  %v1292 = pyc.constant 1 : i2
  %v1293 = pyc.add %v1152, %v1292 : i2
  %v1294 = pyc.constant 3 : i2
  %v1295 = pyc.and %v1293, %v1294 : i2
  %v1296 = pyc.mux %v1291, %v1295, %v1152 : i2
  pyc.assign %v7, %v1296 : i2
  %v1297 = pyc.constant 1 : i16
  %v1298 = pyc.add %v1153, %v1297 : i16
  %v1299 = pyc.mux %v1291, %v1298, %v1153 : i16
  pyc.assign %v1085, %v1299 : i16
  %v1300 = pyc.eq %v1043, %v1153 : i16
  %v1301 = pyc.and %v1291, %v1300 : i1
  %v1302 = pyc.alias %v1301 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1303 = pyc.constant 0 : i1
  %v1304 = pyc.mux %v1302, %v1303, %v963 : i1
  pyc.assign %v959, %v1304 : i1
  %v1305 = pyc.eq %v1048, %v1153 : i16
  %v1306 = pyc.and %v1291, %v1305 : i1
  %v1307 = pyc.alias %v1306 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1308 = pyc.constant 0 : i1
  %v1309 = pyc.mux %v1307, %v1308, %v968 : i1
  pyc.assign %v964, %v1309 : i1
  %v1310 = pyc.eq %v1053, %v1153 : i16
  %v1311 = pyc.and %v1291, %v1310 : i1
  %v1312 = pyc.alias %v1311 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1313 = pyc.constant 0 : i1
  %v1314 = pyc.mux %v1312, %v1313, %v973 : i1
  pyc.assign %v969, %v1314 : i1
  %v1315 = pyc.eq %v1058, %v1153 : i16
  %v1316 = pyc.and %v1291, %v1315 : i1
  %v1317 = pyc.alias %v1316 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1318 = pyc.constant 0 : i1
  %v1319 = pyc.mux %v1317, %v1318, %v978 : i1
  pyc.assign %v974, %v1319 : i1
  %v1320 = pyc.eq %v1063, %v1153 : i16
  %v1321 = pyc.and %v1291, %v1320 : i1
  %v1322 = pyc.alias %v1321 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1323 = pyc.constant 0 : i1
  %v1324 = pyc.mux %v1322, %v1323, %v983 : i1
  pyc.assign %v979, %v1324 : i1
  %v1325 = pyc.eq %v1068, %v1153 : i16
  %v1326 = pyc.and %v1291, %v1325 : i1
  %v1327 = pyc.alias %v1326 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1328 = pyc.constant 0 : i1
  %v1329 = pyc.mux %v1327, %v1328, %v988 : i1
  pyc.assign %v984, %v1329 : i1
  %v1330 = pyc.eq %v1073, %v1153 : i16
  %v1331 = pyc.and %v1291, %v1330 : i1
  %v1332 = pyc.alias %v1331 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1333 = pyc.constant 0 : i1
  %v1334 = pyc.mux %v1332, %v1333, %v993 : i1
  pyc.assign %v989, %v1334 : i1
  %v1335 = pyc.eq %v1078, %v1153 : i16
  %v1336 = pyc.and %v1291, %v1335 : i1
  %v1337 = pyc.alias %v1336 {pyc.name = "should_clear__fastfwd_v3_4__L188"} : i1
  %v1338 = pyc.constant 0 : i1
  %v1339 = pyc.mux %v1337, %v1338, %v998 : i1
  pyc.assign %v994, %v1339 : i1
  %v1340 = pyc.constant 0 : i1
  %v1341 = pyc.add %lane0_pkt_in_vld, %v1340 : i1
  %v1342 = pyc.add %v1341, %lane1_pkt_in_vld : i1
  %v1343 = pyc.add %v1342, %lane2_pkt_in_vld : i1
  %v1344 = pyc.add %v1343, %lane3_pkt_in_vld : i1
  %v1345 = pyc.alias %v1344 {pyc.name = "pending_cnt__fastfwd_v3_4__L194"} : i1
  %v1346 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1347 = pyc.constant 1 : i1
  %v1348 = pyc.constant 0 : i1
  %v1349 = pyc.reg %clk, %rst, %v1347, %v1346, %v1348 : i1
  %v1350 = pyc.alias %v1349 {pyc.name = "bkpr_reg"} : i1
  %v1351 = pyc.alias %v1350 {pyc.name = "bkpr__fastfwd_v3_4__L195"} : i1
  %v1352 = pyc.constant 10 : i4
  %v1353 = pyc.zext %v1345 : i1 -> i4
  %v1354 = pyc.ult %v1353, %v1352 : i4
  %v1355 = pyc.not %v1354 : i1
  pyc.assign %v1346, %v1355 : i1
  func.return %v1224, %v1244, %v1229, %v1249, %v1234, %v1254, %v1239, %v1259, %v1351, %v48, %v68, %v88, %v108, %v128, %v53, %v73, %v93, %v113, %v133, %v58, %v78, %v98, %v118, %v138, %v63, %v83, %v103, %v123, %v143 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128
}

}

