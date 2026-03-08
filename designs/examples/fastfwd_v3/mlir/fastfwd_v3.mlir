module attributes {pyc.top = @fastfwd_v3_3, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3_3(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "fwd0_pkt_data_vld", "fwd0_pkt_data", "fwd0_pkt_lat", "fwd0_pkt_dp_vld", "fwd0_pkt_dp_data", "fwd1_pkt_data_vld", "fwd1_pkt_data", "fwd1_pkt_lat", "fwd1_pkt_dp_vld", "fwd1_pkt_dp_data", "fwd2_pkt_data_vld", "fwd2_pkt_data", "fwd2_pkt_lat", "fwd2_pkt_dp_vld", "fwd2_pkt_dp_data", "fwd3_pkt_data_vld", "fwd3_pkt_data", "fwd3_pkt_lat", "fwd3_pkt_dp_vld", "fwd3_pkt_dp_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3_3", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_3__L404"} : i16
  %v7 = pyc.wire {pyc.name = "cycle_cnt__next"} : i16
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i16
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i16
  %v11 = pyc.alias %v10 {pyc.name = "cycle_cnt"} : i16
  %v12 = pyc.alias %v11 {pyc.name = "cycle_cnt__fastfwd_v3_3__L405"} : i16
  %v13 = pyc.constant 1 : i16
  %v14 = pyc.add %v12, %v13 : i16
  pyc.assign %v7, %v14 : i16
  %v15 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_3__L410"} : i16
  %v16 = pyc.alias %lane0_pkt_in_vld {pyc.name = "offset_1__fastfwd_v3_3__L414"} : i1
  %v17 = pyc.add %v16, %lane1_pkt_in_vld : i1
  %v18 = pyc.alias %v17 {pyc.name = "offset_2__fastfwd_v3_3__L415"} : i1
  %v19 = pyc.add %v18, %lane2_pkt_in_vld : i1
  %v20 = pyc.alias %v19 {pyc.name = "offset_3__fastfwd_v3_3__L416"} : i1
  %v21 = pyc.wire {pyc.name = "ic_vld0__next"} : i1
  %v22 = pyc.constant 1 : i1
  %v23 = pyc.constant 0 : i1
  %v24 = pyc.reg %clk, %rst, %v22, %v21, %v23 : i1
  %v25 = pyc.alias %v24 {pyc.name = "ic_vld0"} : i1
  %v26 = pyc.wire {pyc.name = "ic_vld1__next"} : i1
  %v27 = pyc.constant 1 : i1
  %v28 = pyc.constant 0 : i1
  %v29 = pyc.reg %clk, %rst, %v27, %v26, %v28 : i1
  %v30 = pyc.alias %v29 {pyc.name = "ic_vld1"} : i1
  %v31 = pyc.wire {pyc.name = "ic_vld2__next"} : i1
  %v32 = pyc.constant 1 : i1
  %v33 = pyc.constant 0 : i1
  %v34 = pyc.reg %clk, %rst, %v32, %v31, %v33 : i1
  %v35 = pyc.alias %v34 {pyc.name = "ic_vld2"} : i1
  %v36 = pyc.wire {pyc.name = "ic_vld3__next"} : i1
  %v37 = pyc.constant 1 : i1
  %v38 = pyc.constant 0 : i1
  %v39 = pyc.reg %clk, %rst, %v37, %v36, %v38 : i1
  %v40 = pyc.alias %v39 {pyc.name = "ic_vld3"} : i1
  %v41 = pyc.wire {pyc.name = "ic_data0__next"} : i128
  %v42 = pyc.constant 1 : i1
  %v43 = pyc.constant 0 : i128
  %v44 = pyc.reg %clk, %rst, %v42, %v41, %v43 : i128
  %v45 = pyc.alias %v44 {pyc.name = "ic_data0"} : i128
  %v46 = pyc.wire {pyc.name = "ic_data1__next"} : i128
  %v47 = pyc.constant 1 : i1
  %v48 = pyc.constant 0 : i128
  %v49 = pyc.reg %clk, %rst, %v47, %v46, %v48 : i128
  %v50 = pyc.alias %v49 {pyc.name = "ic_data1"} : i128
  %v51 = pyc.wire {pyc.name = "ic_data2__next"} : i128
  %v52 = pyc.constant 1 : i1
  %v53 = pyc.constant 0 : i128
  %v54 = pyc.reg %clk, %rst, %v52, %v51, %v53 : i128
  %v55 = pyc.alias %v54 {pyc.name = "ic_data2"} : i128
  %v56 = pyc.wire {pyc.name = "ic_data3__next"} : i128
  %v57 = pyc.constant 1 : i1
  %v58 = pyc.constant 0 : i128
  %v59 = pyc.reg %clk, %rst, %v57, %v56, %v58 : i128
  %v60 = pyc.alias %v59 {pyc.name = "ic_data3"} : i128
  %v61 = pyc.wire {pyc.name = "ic_ctrl0__next"} : i5
  %v62 = pyc.constant 1 : i1
  %v63 = pyc.constant 0 : i5
  %v64 = pyc.reg %clk, %rst, %v62, %v61, %v63 : i5
  %v65 = pyc.alias %v64 {pyc.name = "ic_ctrl0"} : i5
  %v66 = pyc.wire {pyc.name = "ic_ctrl1__next"} : i5
  %v67 = pyc.constant 1 : i1
  %v68 = pyc.constant 0 : i5
  %v69 = pyc.reg %clk, %rst, %v67, %v66, %v68 : i5
  %v70 = pyc.alias %v69 {pyc.name = "ic_ctrl1"} : i5
  %v71 = pyc.wire {pyc.name = "ic_ctrl2__next"} : i5
  %v72 = pyc.constant 1 : i1
  %v73 = pyc.constant 0 : i5
  %v74 = pyc.reg %clk, %rst, %v72, %v71, %v73 : i5
  %v75 = pyc.alias %v74 {pyc.name = "ic_ctrl2"} : i5
  %v76 = pyc.wire {pyc.name = "ic_ctrl3__next"} : i5
  %v77 = pyc.constant 1 : i1
  %v78 = pyc.constant 0 : i5
  %v79 = pyc.reg %clk, %rst, %v77, %v76, %v78 : i5
  %v80 = pyc.alias %v79 {pyc.name = "ic_ctrl3"} : i5
  %v81 = pyc.wire {pyc.name = "ic_seq0__next"} : i16
  %v82 = pyc.constant 1 : i1
  %v83 = pyc.constant 0 : i16
  %v84 = pyc.reg %clk, %rst, %v82, %v81, %v83 : i16
  %v85 = pyc.alias %v84 {pyc.name = "ic_seq0"} : i16
  %v86 = pyc.wire {pyc.name = "ic_seq1__next"} : i16
  %v87 = pyc.constant 1 : i1
  %v88 = pyc.constant 0 : i16
  %v89 = pyc.reg %clk, %rst, %v87, %v86, %v88 : i16
  %v90 = pyc.alias %v89 {pyc.name = "ic_seq1"} : i16
  %v91 = pyc.wire {pyc.name = "ic_seq2__next"} : i16
  %v92 = pyc.constant 1 : i1
  %v93 = pyc.constant 0 : i16
  %v94 = pyc.reg %clk, %rst, %v92, %v91, %v93 : i16
  %v95 = pyc.alias %v94 {pyc.name = "ic_seq2"} : i16
  %v96 = pyc.wire {pyc.name = "ic_seq3__next"} : i16
  %v97 = pyc.constant 1 : i1
  %v98 = pyc.constant 0 : i16
  %v99 = pyc.reg %clk, %rst, %v97, %v96, %v98 : i16
  %v100 = pyc.alias %v99 {pyc.name = "ic_seq3"} : i16
  pyc.assign %v21, %lane0_pkt_in_vld : i1
  pyc.assign %v41, %lane0_pkt_in_data : i128
  pyc.assign %v61, %lane0_pkt_in_ctrl : i5
  %v101 = pyc.constant 0 : i16
  %v102 = pyc.add %v15, %v101 : i16
  pyc.assign %v81, %v102 : i16
  pyc.assign %v26, %lane1_pkt_in_vld : i1
  pyc.assign %v46, %lane1_pkt_in_data : i128
  pyc.assign %v66, %lane1_pkt_in_ctrl : i5
  %v103 = pyc.zext %v16 : i1 -> i16
  %v104 = pyc.add %v15, %v103 : i16
  pyc.assign %v86, %v104 : i16
  pyc.assign %v31, %lane2_pkt_in_vld : i1
  pyc.assign %v51, %lane2_pkt_in_data : i128
  pyc.assign %v71, %lane2_pkt_in_ctrl : i5
  %v105 = pyc.zext %v18 : i1 -> i16
  %v106 = pyc.add %v15, %v105 : i16
  pyc.assign %v91, %v106 : i16
  pyc.assign %v36, %lane3_pkt_in_vld : i1
  pyc.assign %v56, %lane3_pkt_in_data : i128
  pyc.assign %v76, %lane3_pkt_in_ctrl : i5
  %v107 = pyc.zext %v20 : i1 -> i16
  %v108 = pyc.add %v15, %v107 : i16
  pyc.assign %v96, %v108 : i16
  %v109 = pyc.add %lane0_pkt_in_vld, %lane1_pkt_in_vld : i1
  %v110 = pyc.add %v109, %lane2_pkt_in_vld : i1
  %v111 = pyc.add %v110, %lane3_pkt_in_vld : i1
  %v112 = pyc.alias %v111 {pyc.name = "total_input__fastfwd_v3_3__L431"} : i1
  %v113 = pyc.zext %v112 : i1 -> i16
  %v114 = pyc.add %v15, %v113 : i16
  pyc.assign %v1, %v114 : i16
  %v115 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v116 = pyc.constant 1 : i1
  %v117 = pyc.constant 0 : i1
  %v118 = pyc.reg %clk, %rst, %v116, %v115, %v117 : i1
  %v119 = pyc.alias %v118 {pyc.name = "dep0_valid"} : i1
  %v120 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v121 = pyc.constant 1 : i1
  %v122 = pyc.constant 0 : i1
  %v123 = pyc.reg %clk, %rst, %v121, %v120, %v122 : i1
  %v124 = pyc.alias %v123 {pyc.name = "dep1_valid"} : i1
  %v125 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v126 = pyc.constant 1 : i1
  %v127 = pyc.constant 0 : i1
  %v128 = pyc.reg %clk, %rst, %v126, %v125, %v127 : i1
  %v129 = pyc.alias %v128 {pyc.name = "dep2_valid"} : i1
  %v130 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v131 = pyc.constant 1 : i1
  %v132 = pyc.constant 0 : i1
  %v133 = pyc.reg %clk, %rst, %v131, %v130, %v132 : i1
  %v134 = pyc.alias %v133 {pyc.name = "dep3_valid"} : i1
  %v135 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v136 = pyc.constant 1 : i1
  %v137 = pyc.constant 0 : i1
  %v138 = pyc.reg %clk, %rst, %v136, %v135, %v137 : i1
  %v139 = pyc.alias %v138 {pyc.name = "dep4_valid"} : i1
  %v140 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v141 = pyc.constant 1 : i1
  %v142 = pyc.constant 0 : i1
  %v143 = pyc.reg %clk, %rst, %v141, %v140, %v142 : i1
  %v144 = pyc.alias %v143 {pyc.name = "dep5_valid"} : i1
  %v145 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v146 = pyc.constant 1 : i1
  %v147 = pyc.constant 0 : i1
  %v148 = pyc.reg %clk, %rst, %v146, %v145, %v147 : i1
  %v149 = pyc.alias %v148 {pyc.name = "dep6_valid"} : i1
  %v150 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v151 = pyc.constant 1 : i1
  %v152 = pyc.constant 0 : i1
  %v153 = pyc.reg %clk, %rst, %v151, %v150, %v152 : i1
  %v154 = pyc.alias %v153 {pyc.name = "dep7_valid"} : i1
  %v155 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v156 = pyc.constant 1 : i1
  %v157 = pyc.constant 0 : i128
  %v158 = pyc.reg %clk, %rst, %v156, %v155, %v157 : i128
  %v159 = pyc.alias %v158 {pyc.name = "dep0_data"} : i128
  %v160 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v161 = pyc.constant 1 : i1
  %v162 = pyc.constant 0 : i128
  %v163 = pyc.reg %clk, %rst, %v161, %v160, %v162 : i128
  %v164 = pyc.alias %v163 {pyc.name = "dep1_data"} : i128
  %v165 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v166 = pyc.constant 1 : i1
  %v167 = pyc.constant 0 : i128
  %v168 = pyc.reg %clk, %rst, %v166, %v165, %v167 : i128
  %v169 = pyc.alias %v168 {pyc.name = "dep2_data"} : i128
  %v170 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v171 = pyc.constant 1 : i1
  %v172 = pyc.constant 0 : i128
  %v173 = pyc.reg %clk, %rst, %v171, %v170, %v172 : i128
  %v174 = pyc.alias %v173 {pyc.name = "dep3_data"} : i128
  %v175 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v176 = pyc.constant 1 : i1
  %v177 = pyc.constant 0 : i128
  %v178 = pyc.reg %clk, %rst, %v176, %v175, %v177 : i128
  %v179 = pyc.alias %v178 {pyc.name = "dep4_data"} : i128
  %v180 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v181 = pyc.constant 1 : i1
  %v182 = pyc.constant 0 : i128
  %v183 = pyc.reg %clk, %rst, %v181, %v180, %v182 : i128
  %v184 = pyc.alias %v183 {pyc.name = "dep5_data"} : i128
  %v185 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v186 = pyc.constant 1 : i1
  %v187 = pyc.constant 0 : i128
  %v188 = pyc.reg %clk, %rst, %v186, %v185, %v187 : i128
  %v189 = pyc.alias %v188 {pyc.name = "dep6_data"} : i128
  %v190 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v191 = pyc.constant 1 : i1
  %v192 = pyc.constant 0 : i128
  %v193 = pyc.reg %clk, %rst, %v191, %v190, %v192 : i128
  %v194 = pyc.alias %v193 {pyc.name = "dep7_data"} : i128
  %v195 = pyc.wire {pyc.name = "dep0_seq_r__next"} : i16
  %v196 = pyc.constant 1 : i1
  %v197 = pyc.constant 0 : i16
  %v198 = pyc.reg %clk, %rst, %v196, %v195, %v197 : i16
  %v199 = pyc.alias %v198 {pyc.name = "dep0_seq_r"} : i16
  %v200 = pyc.wire {pyc.name = "dep1_seq_r__next"} : i16
  %v201 = pyc.constant 1 : i1
  %v202 = pyc.constant 0 : i16
  %v203 = pyc.reg %clk, %rst, %v201, %v200, %v202 : i16
  %v204 = pyc.alias %v203 {pyc.name = "dep1_seq_r"} : i16
  %v205 = pyc.wire {pyc.name = "dep2_seq_r__next"} : i16
  %v206 = pyc.constant 1 : i1
  %v207 = pyc.constant 0 : i16
  %v208 = pyc.reg %clk, %rst, %v206, %v205, %v207 : i16
  %v209 = pyc.alias %v208 {pyc.name = "dep2_seq_r"} : i16
  %v210 = pyc.wire {pyc.name = "dep3_seq_r__next"} : i16
  %v211 = pyc.constant 1 : i1
  %v212 = pyc.constant 0 : i16
  %v213 = pyc.reg %clk, %rst, %v211, %v210, %v212 : i16
  %v214 = pyc.alias %v213 {pyc.name = "dep3_seq_r"} : i16
  %v215 = pyc.wire {pyc.name = "dep4_seq_r__next"} : i16
  %v216 = pyc.constant 1 : i1
  %v217 = pyc.constant 0 : i16
  %v218 = pyc.reg %clk, %rst, %v216, %v215, %v217 : i16
  %v219 = pyc.alias %v218 {pyc.name = "dep4_seq_r"} : i16
  %v220 = pyc.wire {pyc.name = "dep5_seq_r__next"} : i16
  %v221 = pyc.constant 1 : i1
  %v222 = pyc.constant 0 : i16
  %v223 = pyc.reg %clk, %rst, %v221, %v220, %v222 : i16
  %v224 = pyc.alias %v223 {pyc.name = "dep5_seq_r"} : i16
  %v225 = pyc.wire {pyc.name = "dep6_seq_r__next"} : i16
  %v226 = pyc.constant 1 : i1
  %v227 = pyc.constant 0 : i16
  %v228 = pyc.reg %clk, %rst, %v226, %v225, %v227 : i16
  %v229 = pyc.alias %v228 {pyc.name = "dep6_seq_r"} : i16
  %v230 = pyc.wire {pyc.name = "dep7_seq_r__next"} : i16
  %v231 = pyc.constant 1 : i1
  %v232 = pyc.constant 0 : i16
  %v233 = pyc.reg %clk, %rst, %v231, %v230, %v232 : i16
  %v234 = pyc.alias %v233 {pyc.name = "dep7_seq_r"} : i16
  %v235 = pyc.wire {pyc.name = "dep_write_ptr__next"} : i3
  %v236 = pyc.constant 1 : i1
  %v237 = pyc.constant 0 : i3
  %v238 = pyc.reg %clk, %rst, %v236, %v235, %v237 : i3
  %v239 = pyc.alias %v238 {pyc.name = "dep_write_ptr"} : i3
  %v240 = pyc.alias %v239 {pyc.name = "dep_write_ptr__fastfwd_v3_3__L438"} : i3
  %v241 = pyc.wire {pyc.name = "fe0_pkt_seq__next"} : i16
  %v242 = pyc.constant 1 : i1
  %v243 = pyc.constant 0 : i16
  %v244 = pyc.reg %clk, %rst, %v242, %v241, %v243 : i16
  %v245 = pyc.alias %v244 {pyc.name = "fe0_pkt_seq"} : i16
  %v246 = pyc.wire {pyc.name = "fe1_pkt_seq__next"} : i16
  %v247 = pyc.constant 1 : i1
  %v248 = pyc.constant 0 : i16
  %v249 = pyc.reg %clk, %rst, %v247, %v246, %v248 : i16
  %v250 = pyc.alias %v249 {pyc.name = "fe1_pkt_seq"} : i16
  %v251 = pyc.wire {pyc.name = "fe2_pkt_seq__next"} : i16
  %v252 = pyc.constant 1 : i1
  %v253 = pyc.constant 0 : i16
  %v254 = pyc.reg %clk, %rst, %v252, %v251, %v253 : i16
  %v255 = pyc.alias %v254 {pyc.name = "fe2_pkt_seq"} : i16
  %v256 = pyc.wire {pyc.name = "fe3_pkt_seq__next"} : i16
  %v257 = pyc.constant 1 : i1
  %v258 = pyc.constant 0 : i16
  %v259 = pyc.reg %clk, %rst, %v257, %v256, %v258 : i16
  %v260 = pyc.alias %v259 {pyc.name = "fe3_pkt_seq"} : i16
  %v261 = pyc.alias %fwded0_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_3__L449"} : i1
  %v262 = pyc.constant 0 : i1
  %v263 = pyc.or %v261, %v262 : i1
  %v264 = pyc.alias %v263 {pyc.name = "fe_done__fastfwd_v3_3__L450"} : i1
  %v265 = pyc.not %v261 : i1
  %v266 = pyc.constant 0 : i128
  %v267 = pyc.mux %v265, %v266, %fwded0_pkt_data : i128
  %v268 = pyc.alias %v267 {pyc.name = "fe_done_data__fastfwd_v3_3__L451"} : i128
  %v269 = pyc.not %v261 : i1
  %v270 = pyc.constant 0 : i16
  %v271 = pyc.mux %v269, %v270, %v245 : i16
  %v272 = pyc.alias %v271 {pyc.name = "fe_done_seq__fastfwd_v3_3__L452"} : i16
  %v273 = pyc.alias %fwded1_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_3__L449"} : i1
  %v274 = pyc.or %v264, %v273 : i1
  %v275 = pyc.alias %v274 {pyc.name = "fe_done__fastfwd_v3_3__L450"} : i1
  %v276 = pyc.not %v273 : i1
  %v277 = pyc.mux %v276, %v268, %fwded1_pkt_data : i128
  %v278 = pyc.alias %v277 {pyc.name = "fe_done_data__fastfwd_v3_3__L451"} : i128
  %v279 = pyc.not %v273 : i1
  %v280 = pyc.mux %v279, %v272, %v250 : i16
  %v281 = pyc.alias %v280 {pyc.name = "fe_done_seq__fastfwd_v3_3__L452"} : i16
  %v282 = pyc.alias %fwded2_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_3__L449"} : i1
  %v283 = pyc.or %v275, %v282 : i1
  %v284 = pyc.alias %v283 {pyc.name = "fe_done__fastfwd_v3_3__L450"} : i1
  %v285 = pyc.not %v282 : i1
  %v286 = pyc.mux %v285, %v278, %fwded2_pkt_data : i128
  %v287 = pyc.alias %v286 {pyc.name = "fe_done_data__fastfwd_v3_3__L451"} : i128
  %v288 = pyc.not %v282 : i1
  %v289 = pyc.mux %v288, %v281, %v255 : i16
  %v290 = pyc.alias %v289 {pyc.name = "fe_done_seq__fastfwd_v3_3__L452"} : i16
  %v291 = pyc.alias %fwded3_pkt_data_vld {pyc.name = "is_done__fastfwd_v3_3__L449"} : i1
  %v292 = pyc.or %v284, %v291 : i1
  %v293 = pyc.alias %v292 {pyc.name = "fe_done__fastfwd_v3_3__L450"} : i1
  %v294 = pyc.not %v291 : i1
  %v295 = pyc.mux %v294, %v287, %fwded3_pkt_data : i128
  %v296 = pyc.alias %v295 {pyc.name = "fe_done_data__fastfwd_v3_3__L451"} : i128
  %v297 = pyc.not %v291 : i1
  %v298 = pyc.mux %v297, %v290, %v260 : i16
  %v299 = pyc.alias %v298 {pyc.name = "fe_done_seq__fastfwd_v3_3__L452"} : i16
  %v300 = pyc.constant 0 : i3
  %v301 = pyc.eq %v240, %v300 : i3
  %v302 = pyc.and %v293, %v301 : i1
  %v303 = pyc.alias %v302 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v304 = pyc.or %v303, %v119 : i1
  pyc.assign %v115, %v304 : i1
  %v305 = pyc.mux %v303, %v296, %v159 : i128
  pyc.assign %v155, %v305 : i128
  %v306 = pyc.mux %v303, %v299, %v199 : i16
  pyc.assign %v195, %v306 : i16
  %v307 = pyc.constant 1 : i3
  %v308 = pyc.eq %v240, %v307 : i3
  %v309 = pyc.and %v293, %v308 : i1
  %v310 = pyc.alias %v309 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v311 = pyc.or %v310, %v124 : i1
  pyc.assign %v120, %v311 : i1
  %v312 = pyc.mux %v310, %v296, %v164 : i128
  pyc.assign %v160, %v312 : i128
  %v313 = pyc.mux %v310, %v299, %v204 : i16
  pyc.assign %v200, %v313 : i16
  %v314 = pyc.constant 2 : i3
  %v315 = pyc.eq %v240, %v314 : i3
  %v316 = pyc.and %v293, %v315 : i1
  %v317 = pyc.alias %v316 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v318 = pyc.or %v317, %v129 : i1
  pyc.assign %v125, %v318 : i1
  %v319 = pyc.mux %v317, %v296, %v169 : i128
  pyc.assign %v165, %v319 : i128
  %v320 = pyc.mux %v317, %v299, %v209 : i16
  pyc.assign %v205, %v320 : i16
  %v321 = pyc.constant 3 : i3
  %v322 = pyc.eq %v240, %v321 : i3
  %v323 = pyc.and %v293, %v322 : i1
  %v324 = pyc.alias %v323 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v325 = pyc.or %v324, %v134 : i1
  pyc.assign %v130, %v325 : i1
  %v326 = pyc.mux %v324, %v296, %v174 : i128
  pyc.assign %v170, %v326 : i128
  %v327 = pyc.mux %v324, %v299, %v214 : i16
  pyc.assign %v210, %v327 : i16
  %v328 = pyc.constant 4 : i3
  %v329 = pyc.eq %v240, %v328 : i3
  %v330 = pyc.and %v293, %v329 : i1
  %v331 = pyc.alias %v330 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v332 = pyc.or %v331, %v139 : i1
  pyc.assign %v135, %v332 : i1
  %v333 = pyc.mux %v331, %v296, %v179 : i128
  pyc.assign %v175, %v333 : i128
  %v334 = pyc.mux %v331, %v299, %v219 : i16
  pyc.assign %v215, %v334 : i16
  %v335 = pyc.constant 5 : i3
  %v336 = pyc.eq %v240, %v335 : i3
  %v337 = pyc.and %v293, %v336 : i1
  %v338 = pyc.alias %v337 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v339 = pyc.or %v338, %v144 : i1
  pyc.assign %v140, %v339 : i1
  %v340 = pyc.mux %v338, %v296, %v184 : i128
  pyc.assign %v180, %v340 : i128
  %v341 = pyc.mux %v338, %v299, %v224 : i16
  pyc.assign %v220, %v341 : i16
  %v342 = pyc.constant 6 : i3
  %v343 = pyc.eq %v240, %v342 : i3
  %v344 = pyc.and %v293, %v343 : i1
  %v345 = pyc.alias %v344 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v346 = pyc.or %v345, %v149 : i1
  pyc.assign %v145, %v346 : i1
  %v347 = pyc.mux %v345, %v296, %v189 : i128
  pyc.assign %v185, %v347 : i128
  %v348 = pyc.mux %v345, %v299, %v229 : i16
  pyc.assign %v225, %v348 : i16
  %v349 = pyc.constant 7 : i3
  %v350 = pyc.eq %v240, %v349 : i3
  %v351 = pyc.and %v293, %v350 : i1
  %v352 = pyc.alias %v351 {pyc.name = "should_write__fastfwd_v3_3__L456"} : i1
  %v353 = pyc.or %v352, %v154 : i1
  pyc.assign %v150, %v353 : i1
  %v354 = pyc.mux %v352, %v296, %v194 : i128
  pyc.assign %v190, %v354 : i128
  %v355 = pyc.mux %v352, %v299, %v234 : i16
  pyc.assign %v230, %v355 : i16
  %v356 = pyc.constant 1 : i3
  %v357 = pyc.add %v240, %v356 : i3
  %v358 = pyc.constant 7 : i3
  %v359 = pyc.and %v357, %v358 : i3
  %v360 = pyc.alias %v359 {pyc.name = "new_dep_ptr__fastfwd_v3_3__L461"} : i3
  %v361 = pyc.mux %v293, %v360, %v240 : i3
  pyc.assign %v235, %v361 : i3
  %v362 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v363 = pyc.constant 1 : i1
  %v364 = pyc.constant 0 : i1
  %v365 = pyc.reg %clk, %rst, %v363, %v362, %v364 : i1
  %v366 = pyc.alias %v365 {pyc.name = "fe0_busy"} : i1
  %v367 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v368 = pyc.constant 1 : i1
  %v369 = pyc.constant 0 : i1
  %v370 = pyc.reg %clk, %rst, %v368, %v367, %v369 : i1
  %v371 = pyc.alias %v370 {pyc.name = "fe1_busy"} : i1
  %v372 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v373 = pyc.constant 1 : i1
  %v374 = pyc.constant 0 : i1
  %v375 = pyc.reg %clk, %rst, %v373, %v372, %v374 : i1
  %v376 = pyc.alias %v375 {pyc.name = "fe2_busy"} : i1
  %v377 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v378 = pyc.constant 1 : i1
  %v379 = pyc.constant 0 : i1
  %v380 = pyc.reg %clk, %rst, %v378, %v377, %v379 : i1
  %v381 = pyc.alias %v380 {pyc.name = "fe3_busy"} : i1
  %v382 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v383 = pyc.constant 1 : i1
  %v384 = pyc.constant 0 : i3
  %v385 = pyc.reg %clk, %rst, %v383, %v382, %v384 : i3
  %v386 = pyc.alias %v385 {pyc.name = "fe0_timer"} : i3
  %v387 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v388 = pyc.constant 1 : i1
  %v389 = pyc.constant 0 : i3
  %v390 = pyc.reg %clk, %rst, %v388, %v387, %v389 : i3
  %v391 = pyc.alias %v390 {pyc.name = "fe1_timer"} : i3
  %v392 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v393 = pyc.constant 1 : i1
  %v394 = pyc.constant 0 : i3
  %v395 = pyc.reg %clk, %rst, %v393, %v392, %v394 : i3
  %v396 = pyc.alias %v395 {pyc.name = "fe2_timer"} : i3
  %v397 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v398 = pyc.constant 1 : i1
  %v399 = pyc.constant 0 : i3
  %v400 = pyc.reg %clk, %rst, %v398, %v397, %v399 : i3
  %v401 = pyc.alias %v400 {pyc.name = "fe3_timer"} : i3
  %v402 = pyc.wire {pyc.name = "fe0_last_finish__next"} : i6
  %v403 = pyc.constant 1 : i1
  %v404 = pyc.constant 0 : i6
  %v405 = pyc.reg %clk, %rst, %v403, %v402, %v404 : i6
  %v406 = pyc.alias %v405 {pyc.name = "fe0_last_finish"} : i6
  %v407 = pyc.wire {pyc.name = "fe1_last_finish__next"} : i6
  %v408 = pyc.constant 1 : i1
  %v409 = pyc.constant 0 : i6
  %v410 = pyc.reg %clk, %rst, %v408, %v407, %v409 : i6
  %v411 = pyc.alias %v410 {pyc.name = "fe1_last_finish"} : i6
  %v412 = pyc.wire {pyc.name = "fe2_last_finish__next"} : i6
  %v413 = pyc.constant 1 : i1
  %v414 = pyc.constant 0 : i6
  %v415 = pyc.reg %clk, %rst, %v413, %v412, %v414 : i6
  %v416 = pyc.alias %v415 {pyc.name = "fe2_last_finish"} : i6
  %v417 = pyc.wire {pyc.name = "fe3_last_finish__next"} : i6
  %v418 = pyc.constant 1 : i1
  %v419 = pyc.constant 0 : i6
  %v420 = pyc.reg %clk, %rst, %v418, %v417, %v419 : i6
  %v421 = pyc.alias %v420 {pyc.name = "fe3_last_finish"} : i6
  %v422 = pyc.wire {pyc.name = "fwd0_vld__next"} : i1
  %v423 = pyc.constant 1 : i1
  %v424 = pyc.constant 0 : i1
  %v425 = pyc.reg %clk, %rst, %v423, %v422, %v424 : i1
  %v426 = pyc.alias %v425 {pyc.name = "fwd0_vld"} : i1
  %v427 = pyc.wire {pyc.name = "fwd1_vld__next"} : i1
  %v428 = pyc.constant 1 : i1
  %v429 = pyc.constant 0 : i1
  %v430 = pyc.reg %clk, %rst, %v428, %v427, %v429 : i1
  %v431 = pyc.alias %v430 {pyc.name = "fwd1_vld"} : i1
  %v432 = pyc.wire {pyc.name = "fwd2_vld__next"} : i1
  %v433 = pyc.constant 1 : i1
  %v434 = pyc.constant 0 : i1
  %v435 = pyc.reg %clk, %rst, %v433, %v432, %v434 : i1
  %v436 = pyc.alias %v435 {pyc.name = "fwd2_vld"} : i1
  %v437 = pyc.wire {pyc.name = "fwd3_vld__next"} : i1
  %v438 = pyc.constant 1 : i1
  %v439 = pyc.constant 0 : i1
  %v440 = pyc.reg %clk, %rst, %v438, %v437, %v439 : i1
  %v441 = pyc.alias %v440 {pyc.name = "fwd3_vld"} : i1
  %v442 = pyc.wire {pyc.name = "fwd0_data__next"} : i128
  %v443 = pyc.constant 1 : i1
  %v444 = pyc.constant 0 : i128
  %v445 = pyc.reg %clk, %rst, %v443, %v442, %v444 : i128
  %v446 = pyc.alias %v445 {pyc.name = "fwd0_data"} : i128
  %v447 = pyc.wire {pyc.name = "fwd1_data__next"} : i128
  %v448 = pyc.constant 1 : i1
  %v449 = pyc.constant 0 : i128
  %v450 = pyc.reg %clk, %rst, %v448, %v447, %v449 : i128
  %v451 = pyc.alias %v450 {pyc.name = "fwd1_data"} : i128
  %v452 = pyc.wire {pyc.name = "fwd2_data__next"} : i128
  %v453 = pyc.constant 1 : i1
  %v454 = pyc.constant 0 : i128
  %v455 = pyc.reg %clk, %rst, %v453, %v452, %v454 : i128
  %v456 = pyc.alias %v455 {pyc.name = "fwd2_data"} : i128
  %v457 = pyc.wire {pyc.name = "fwd3_data__next"} : i128
  %v458 = pyc.constant 1 : i1
  %v459 = pyc.constant 0 : i128
  %v460 = pyc.reg %clk, %rst, %v458, %v457, %v459 : i128
  %v461 = pyc.alias %v460 {pyc.name = "fwd3_data"} : i128
  %v462 = pyc.wire {pyc.name = "fwd0_lat__next"} : i2
  %v463 = pyc.constant 1 : i1
  %v464 = pyc.constant 0 : i2
  %v465 = pyc.reg %clk, %rst, %v463, %v462, %v464 : i2
  %v466 = pyc.alias %v465 {pyc.name = "fwd0_lat"} : i2
  %v467 = pyc.wire {pyc.name = "fwd1_lat__next"} : i2
  %v468 = pyc.constant 1 : i1
  %v469 = pyc.constant 0 : i2
  %v470 = pyc.reg %clk, %rst, %v468, %v467, %v469 : i2
  %v471 = pyc.alias %v470 {pyc.name = "fwd1_lat"} : i2
  %v472 = pyc.wire {pyc.name = "fwd2_lat__next"} : i2
  %v473 = pyc.constant 1 : i1
  %v474 = pyc.constant 0 : i2
  %v475 = pyc.reg %clk, %rst, %v473, %v472, %v474 : i2
  %v476 = pyc.alias %v475 {pyc.name = "fwd2_lat"} : i2
  %v477 = pyc.wire {pyc.name = "fwd3_lat__next"} : i2
  %v478 = pyc.constant 1 : i1
  %v479 = pyc.constant 0 : i2
  %v480 = pyc.reg %clk, %rst, %v478, %v477, %v479 : i2
  %v481 = pyc.alias %v480 {pyc.name = "fwd3_lat"} : i2
  %v482 = pyc.wire {pyc.name = "fwd0_dp_vld__next"} : i1
  %v483 = pyc.constant 1 : i1
  %v484 = pyc.constant 0 : i1
  %v485 = pyc.reg %clk, %rst, %v483, %v482, %v484 : i1
  %v486 = pyc.alias %v485 {pyc.name = "fwd0_dp_vld"} : i1
  %v487 = pyc.wire {pyc.name = "fwd1_dp_vld__next"} : i1
  %v488 = pyc.constant 1 : i1
  %v489 = pyc.constant 0 : i1
  %v490 = pyc.reg %clk, %rst, %v488, %v487, %v489 : i1
  %v491 = pyc.alias %v490 {pyc.name = "fwd1_dp_vld"} : i1
  %v492 = pyc.wire {pyc.name = "fwd2_dp_vld__next"} : i1
  %v493 = pyc.constant 1 : i1
  %v494 = pyc.constant 0 : i1
  %v495 = pyc.reg %clk, %rst, %v493, %v492, %v494 : i1
  %v496 = pyc.alias %v495 {pyc.name = "fwd2_dp_vld"} : i1
  %v497 = pyc.wire {pyc.name = "fwd3_dp_vld__next"} : i1
  %v498 = pyc.constant 1 : i1
  %v499 = pyc.constant 0 : i1
  %v500 = pyc.reg %clk, %rst, %v498, %v497, %v499 : i1
  %v501 = pyc.alias %v500 {pyc.name = "fwd3_dp_vld"} : i1
  %v502 = pyc.wire {pyc.name = "fwd0_dp_data__next"} : i128
  %v503 = pyc.constant 1 : i1
  %v504 = pyc.constant 0 : i128
  %v505 = pyc.reg %clk, %rst, %v503, %v502, %v504 : i128
  %v506 = pyc.alias %v505 {pyc.name = "fwd0_dp_data"} : i128
  %v507 = pyc.wire {pyc.name = "fwd1_dp_data__next"} : i128
  %v508 = pyc.constant 1 : i1
  %v509 = pyc.constant 0 : i128
  %v510 = pyc.reg %clk, %rst, %v508, %v507, %v509 : i128
  %v511 = pyc.alias %v510 {pyc.name = "fwd1_dp_data"} : i128
  %v512 = pyc.wire {pyc.name = "fwd2_dp_data__next"} : i128
  %v513 = pyc.constant 1 : i1
  %v514 = pyc.constant 0 : i128
  %v515 = pyc.reg %clk, %rst, %v513, %v512, %v514 : i128
  %v516 = pyc.alias %v515 {pyc.name = "fwd2_dp_data"} : i128
  %v517 = pyc.wire {pyc.name = "fwd3_dp_data__next"} : i128
  %v518 = pyc.constant 1 : i1
  %v519 = pyc.constant 0 : i128
  %v520 = pyc.reg %clk, %rst, %v518, %v517, %v519 : i128
  %v521 = pyc.alias %v520 {pyc.name = "fwd3_dp_data"} : i128
  %v522 = pyc.alias %v12 {pyc.name = "current_cycle__fastfwd_v3_3__L475"} : i16
  %v523 = pyc.constant 3 : i5
  %v524 = pyc.and %v65, %v523 : i5
  %v525 = pyc.alias %v524 {pyc.name = "lat__fastfwd_v3_3__L479"} : i5
  %v526 = pyc.lshri %v65 {amount = 2} : i5
  %v527 = pyc.constant 7 : i5
  %v528 = pyc.and %v526, %v527 : i5
  %v529 = pyc.alias %v528 {pyc.name = "dep__fastfwd_v3_3__L480"} : i5
  %v530 = pyc.constant 2 : i6
  %v531 = pyc.zext %v530 : i6 -> i16
  %v532 = pyc.add %v522, %v531 : i16
  %v533 = pyc.zext %v525 : i5 -> i16
  %v534 = pyc.add %v532, %v533 : i16
  %v535 = pyc.alias %v534 {pyc.name = "finish_cycle__fastfwd_v3_3__L483"} : i16
  %v536 = pyc.zext %v406 : i6 -> i16
  %v537 = pyc.ult %v536, %v535 : i16
  %v538 = pyc.alias %v537 {pyc.name = "constraint_ok__fastfwd_v3_3__L484"} : i1
  %v539 = pyc.zext %v529 : i5 -> i16
  %v540 = pyc.sub %v85, %v539 : i16
  %v541 = pyc.alias %v540 {pyc.name = "target_seq__fastfwd_v3_3__L487"} : i16
  %v542 = pyc.eq %v199, %v541 : i16
  %v543 = pyc.and %v119, %v542 : i1
  %v544 = pyc.alias %v543 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v545 = pyc.constant 0 : i1
  %v546 = pyc.or %v544, %v545 : i1
  %v547 = pyc.alias %v546 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v548 = pyc.not %v544 : i1
  %v549 = pyc.constant 0 : i128
  %v550 = pyc.mux %v548, %v549, %v159 : i128
  %v551 = pyc.alias %v550 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v552 = pyc.eq %v204, %v541 : i16
  %v553 = pyc.and %v124, %v552 : i1
  %v554 = pyc.alias %v553 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v555 = pyc.or %v547, %v554 : i1
  %v556 = pyc.alias %v555 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v557 = pyc.not %v554 : i1
  %v558 = pyc.mux %v557, %v551, %v164 : i128
  %v559 = pyc.alias %v558 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v560 = pyc.eq %v209, %v541 : i16
  %v561 = pyc.and %v129, %v560 : i1
  %v562 = pyc.alias %v561 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v563 = pyc.or %v556, %v562 : i1
  %v564 = pyc.alias %v563 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v565 = pyc.not %v562 : i1
  %v566 = pyc.mux %v565, %v559, %v169 : i128
  %v567 = pyc.alias %v566 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v568 = pyc.eq %v214, %v541 : i16
  %v569 = pyc.and %v134, %v568 : i1
  %v570 = pyc.alias %v569 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v571 = pyc.or %v564, %v570 : i1
  %v572 = pyc.alias %v571 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v573 = pyc.not %v570 : i1
  %v574 = pyc.mux %v573, %v567, %v174 : i128
  %v575 = pyc.alias %v574 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v576 = pyc.eq %v219, %v541 : i16
  %v577 = pyc.and %v139, %v576 : i1
  %v578 = pyc.alias %v577 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v579 = pyc.or %v572, %v578 : i1
  %v580 = pyc.alias %v579 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v581 = pyc.not %v578 : i1
  %v582 = pyc.mux %v581, %v575, %v179 : i128
  %v583 = pyc.alias %v582 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v584 = pyc.eq %v224, %v541 : i16
  %v585 = pyc.and %v144, %v584 : i1
  %v586 = pyc.alias %v585 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v587 = pyc.or %v580, %v586 : i1
  %v588 = pyc.alias %v587 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v589 = pyc.not %v586 : i1
  %v590 = pyc.mux %v589, %v583, %v184 : i128
  %v591 = pyc.alias %v590 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v592 = pyc.eq %v229, %v541 : i16
  %v593 = pyc.and %v149, %v592 : i1
  %v594 = pyc.alias %v593 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v595 = pyc.or %v588, %v594 : i1
  %v596 = pyc.alias %v595 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v597 = pyc.not %v594 : i1
  %v598 = pyc.mux %v597, %v591, %v189 : i128
  %v599 = pyc.alias %v598 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v600 = pyc.eq %v234, %v541 : i16
  %v601 = pyc.and %v154, %v600 : i1
  %v602 = pyc.alias %v601 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v603 = pyc.or %v596, %v602 : i1
  %v604 = pyc.alias %v603 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v605 = pyc.not %v602 : i1
  %v606 = pyc.mux %v605, %v599, %v194 : i128
  %v607 = pyc.alias %v606 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v608 = pyc.constant 0 : i3
  %v609 = pyc.zext %v608 : i3 -> i5
  %v610 = pyc.eq %v529, %v609 : i5
  %v611 = pyc.not %v610 : i1
  %v612 = pyc.alias %v611 {pyc.name = "has_dep__fastfwd_v3_3__L496"} : i1
  %v613 = pyc.and %v612, %v604 : i1
  %v614 = pyc.alias %v613 {pyc.name = "dep_ready__fastfwd_v3_3__L497"} : i1
  %v615 = pyc.not %v366 : i1
  %v616 = pyc.and %v615, %v25 : i1
  %v617 = pyc.and %v616, %v538 : i1
  %v618 = pyc.not %v612 : i1
  %v619 = pyc.or %v618, %v614 : i1
  %v620 = pyc.and %v617, %v619 : i1
  %v621 = pyc.alias %v620 {pyc.name = "can_schedule__fastfwd_v3_3__L500"} : i1
  %v622 = pyc.constant 1 : i3
  %v623 = pyc.ult %v622, %v386 : i3
  %v624 = pyc.and %v366, %v623 : i1
  %v625 = pyc.or %v621, %v624 : i1
  pyc.assign %v362, %v625 : i1
  %v626 = pyc.constant 1 : i3
  %v627 = pyc.zext %v626 : i3 -> i5
  %v628 = pyc.add %v525, %v627 : i5
  %v629 = pyc.constant 1 : i3
  %v630 = pyc.sub %v386, %v629 : i3
  %v631 = pyc.constant 0 : i3
  %v632 = pyc.mux %v366, %v630, %v631 : i3
  %v633 = pyc.zext %v632 : i3 -> i5
  %v634 = pyc.mux %v621, %v628, %v633 : i5
  %v635 = pyc.alias %v634 {pyc.name = "new_timer__fastfwd_v3_3__L505"} : i5
  %v636 = pyc.trunc %v635 : i5 -> i3
  pyc.assign %v382, %v636 : i3
  %v637 = pyc.zext %v406 : i6 -> i16
  %v638 = pyc.mux %v621, %v535, %v637 : i16
  %v639 = pyc.trunc %v638 : i16 -> i6
  pyc.assign %v402, %v639 : i6
  %v640 = pyc.mux %v621, %v85, %v245 : i16
  pyc.assign %v241, %v640 : i16
  pyc.assign %v422, %v621 : i1
  %v641 = pyc.constant 0 : i128
  %v642 = pyc.mux %v621, %v45, %v641 : i128
  pyc.assign %v442, %v642 : i128
  %v643 = pyc.constant 0 : i2
  %v644 = pyc.zext %v643 : i2 -> i5
  %v645 = pyc.mux %v621, %v525, %v644 : i5
  %v646 = pyc.trunc %v645 : i5 -> i2
  pyc.assign %v462, %v646 : i2
  %v647 = pyc.and %v612, %v621 : i1
  pyc.assign %v482, %v647 : i1
  %v648 = pyc.and %v612, %v621 : i1
  %v649 = pyc.constant 0 : i128
  %v650 = pyc.mux %v648, %v607, %v649 : i128
  pyc.assign %v502, %v650 : i128
  %v651 = pyc.constant 3 : i5
  %v652 = pyc.and %v70, %v651 : i5
  %v653 = pyc.alias %v652 {pyc.name = "lat__fastfwd_v3_3__L479"} : i5
  %v654 = pyc.lshri %v70 {amount = 2} : i5
  %v655 = pyc.constant 7 : i5
  %v656 = pyc.and %v654, %v655 : i5
  %v657 = pyc.alias %v656 {pyc.name = "dep__fastfwd_v3_3__L480"} : i5
  %v658 = pyc.constant 2 : i6
  %v659 = pyc.zext %v658 : i6 -> i16
  %v660 = pyc.add %v522, %v659 : i16
  %v661 = pyc.zext %v653 : i5 -> i16
  %v662 = pyc.add %v660, %v661 : i16
  %v663 = pyc.alias %v662 {pyc.name = "finish_cycle__fastfwd_v3_3__L483"} : i16
  %v664 = pyc.zext %v411 : i6 -> i16
  %v665 = pyc.ult %v664, %v663 : i16
  %v666 = pyc.alias %v665 {pyc.name = "constraint_ok__fastfwd_v3_3__L484"} : i1
  %v667 = pyc.zext %v657 : i5 -> i16
  %v668 = pyc.sub %v90, %v667 : i16
  %v669 = pyc.alias %v668 {pyc.name = "target_seq__fastfwd_v3_3__L487"} : i16
  %v670 = pyc.eq %v199, %v669 : i16
  %v671 = pyc.and %v119, %v670 : i1
  %v672 = pyc.alias %v671 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v673 = pyc.constant 0 : i1
  %v674 = pyc.or %v672, %v673 : i1
  %v675 = pyc.alias %v674 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v676 = pyc.not %v672 : i1
  %v677 = pyc.constant 0 : i128
  %v678 = pyc.mux %v676, %v677, %v159 : i128
  %v679 = pyc.alias %v678 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v680 = pyc.eq %v204, %v669 : i16
  %v681 = pyc.and %v124, %v680 : i1
  %v682 = pyc.alias %v681 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v683 = pyc.or %v675, %v682 : i1
  %v684 = pyc.alias %v683 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v685 = pyc.not %v682 : i1
  %v686 = pyc.mux %v685, %v679, %v164 : i128
  %v687 = pyc.alias %v686 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v688 = pyc.eq %v209, %v669 : i16
  %v689 = pyc.and %v129, %v688 : i1
  %v690 = pyc.alias %v689 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v691 = pyc.or %v684, %v690 : i1
  %v692 = pyc.alias %v691 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v693 = pyc.not %v690 : i1
  %v694 = pyc.mux %v693, %v687, %v169 : i128
  %v695 = pyc.alias %v694 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v696 = pyc.eq %v214, %v669 : i16
  %v697 = pyc.and %v134, %v696 : i1
  %v698 = pyc.alias %v697 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v699 = pyc.or %v692, %v698 : i1
  %v700 = pyc.alias %v699 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v701 = pyc.not %v698 : i1
  %v702 = pyc.mux %v701, %v695, %v174 : i128
  %v703 = pyc.alias %v702 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v704 = pyc.eq %v219, %v669 : i16
  %v705 = pyc.and %v139, %v704 : i1
  %v706 = pyc.alias %v705 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v707 = pyc.or %v700, %v706 : i1
  %v708 = pyc.alias %v707 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v709 = pyc.not %v706 : i1
  %v710 = pyc.mux %v709, %v703, %v179 : i128
  %v711 = pyc.alias %v710 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v712 = pyc.eq %v224, %v669 : i16
  %v713 = pyc.and %v144, %v712 : i1
  %v714 = pyc.alias %v713 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v715 = pyc.or %v708, %v714 : i1
  %v716 = pyc.alias %v715 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v717 = pyc.not %v714 : i1
  %v718 = pyc.mux %v717, %v711, %v184 : i128
  %v719 = pyc.alias %v718 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v720 = pyc.eq %v229, %v669 : i16
  %v721 = pyc.and %v149, %v720 : i1
  %v722 = pyc.alias %v721 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v723 = pyc.or %v716, %v722 : i1
  %v724 = pyc.alias %v723 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v725 = pyc.not %v722 : i1
  %v726 = pyc.mux %v725, %v719, %v189 : i128
  %v727 = pyc.alias %v726 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v728 = pyc.eq %v234, %v669 : i16
  %v729 = pyc.and %v154, %v728 : i1
  %v730 = pyc.alias %v729 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v731 = pyc.or %v724, %v730 : i1
  %v732 = pyc.alias %v731 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v733 = pyc.not %v730 : i1
  %v734 = pyc.mux %v733, %v727, %v194 : i128
  %v735 = pyc.alias %v734 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v736 = pyc.constant 0 : i3
  %v737 = pyc.zext %v736 : i3 -> i5
  %v738 = pyc.eq %v657, %v737 : i5
  %v739 = pyc.not %v738 : i1
  %v740 = pyc.alias %v739 {pyc.name = "has_dep__fastfwd_v3_3__L496"} : i1
  %v741 = pyc.and %v740, %v732 : i1
  %v742 = pyc.alias %v741 {pyc.name = "dep_ready__fastfwd_v3_3__L497"} : i1
  %v743 = pyc.not %v371 : i1
  %v744 = pyc.and %v743, %v30 : i1
  %v745 = pyc.and %v744, %v666 : i1
  %v746 = pyc.not %v740 : i1
  %v747 = pyc.or %v746, %v742 : i1
  %v748 = pyc.and %v745, %v747 : i1
  %v749 = pyc.alias %v748 {pyc.name = "can_schedule__fastfwd_v3_3__L500"} : i1
  %v750 = pyc.constant 1 : i3
  %v751 = pyc.ult %v750, %v391 : i3
  %v752 = pyc.and %v371, %v751 : i1
  %v753 = pyc.or %v749, %v752 : i1
  pyc.assign %v367, %v753 : i1
  %v754 = pyc.constant 1 : i3
  %v755 = pyc.zext %v754 : i3 -> i5
  %v756 = pyc.add %v653, %v755 : i5
  %v757 = pyc.constant 1 : i3
  %v758 = pyc.sub %v391, %v757 : i3
  %v759 = pyc.constant 0 : i3
  %v760 = pyc.mux %v371, %v758, %v759 : i3
  %v761 = pyc.zext %v760 : i3 -> i5
  %v762 = pyc.mux %v749, %v756, %v761 : i5
  %v763 = pyc.alias %v762 {pyc.name = "new_timer__fastfwd_v3_3__L505"} : i5
  %v764 = pyc.trunc %v763 : i5 -> i3
  pyc.assign %v387, %v764 : i3
  %v765 = pyc.zext %v411 : i6 -> i16
  %v766 = pyc.mux %v749, %v663, %v765 : i16
  %v767 = pyc.trunc %v766 : i16 -> i6
  pyc.assign %v407, %v767 : i6
  %v768 = pyc.mux %v749, %v90, %v250 : i16
  pyc.assign %v246, %v768 : i16
  pyc.assign %v427, %v749 : i1
  %v769 = pyc.constant 0 : i128
  %v770 = pyc.mux %v749, %v50, %v769 : i128
  pyc.assign %v447, %v770 : i128
  %v771 = pyc.constant 0 : i2
  %v772 = pyc.zext %v771 : i2 -> i5
  %v773 = pyc.mux %v749, %v653, %v772 : i5
  %v774 = pyc.trunc %v773 : i5 -> i2
  pyc.assign %v467, %v774 : i2
  %v775 = pyc.and %v740, %v749 : i1
  pyc.assign %v487, %v775 : i1
  %v776 = pyc.and %v740, %v749 : i1
  %v777 = pyc.constant 0 : i128
  %v778 = pyc.mux %v776, %v735, %v777 : i128
  pyc.assign %v507, %v778 : i128
  %v779 = pyc.constant 3 : i5
  %v780 = pyc.and %v75, %v779 : i5
  %v781 = pyc.alias %v780 {pyc.name = "lat__fastfwd_v3_3__L479"} : i5
  %v782 = pyc.lshri %v75 {amount = 2} : i5
  %v783 = pyc.constant 7 : i5
  %v784 = pyc.and %v782, %v783 : i5
  %v785 = pyc.alias %v784 {pyc.name = "dep__fastfwd_v3_3__L480"} : i5
  %v786 = pyc.constant 2 : i6
  %v787 = pyc.zext %v786 : i6 -> i16
  %v788 = pyc.add %v522, %v787 : i16
  %v789 = pyc.zext %v781 : i5 -> i16
  %v790 = pyc.add %v788, %v789 : i16
  %v791 = pyc.alias %v790 {pyc.name = "finish_cycle__fastfwd_v3_3__L483"} : i16
  %v792 = pyc.zext %v416 : i6 -> i16
  %v793 = pyc.ult %v792, %v791 : i16
  %v794 = pyc.alias %v793 {pyc.name = "constraint_ok__fastfwd_v3_3__L484"} : i1
  %v795 = pyc.zext %v785 : i5 -> i16
  %v796 = pyc.sub %v95, %v795 : i16
  %v797 = pyc.alias %v796 {pyc.name = "target_seq__fastfwd_v3_3__L487"} : i16
  %v798 = pyc.eq %v199, %v797 : i16
  %v799 = pyc.and %v119, %v798 : i1
  %v800 = pyc.alias %v799 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v801 = pyc.constant 0 : i1
  %v802 = pyc.or %v800, %v801 : i1
  %v803 = pyc.alias %v802 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v804 = pyc.not %v800 : i1
  %v805 = pyc.constant 0 : i128
  %v806 = pyc.mux %v804, %v805, %v159 : i128
  %v807 = pyc.alias %v806 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v808 = pyc.eq %v204, %v797 : i16
  %v809 = pyc.and %v124, %v808 : i1
  %v810 = pyc.alias %v809 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v811 = pyc.or %v803, %v810 : i1
  %v812 = pyc.alias %v811 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v813 = pyc.not %v810 : i1
  %v814 = pyc.mux %v813, %v807, %v164 : i128
  %v815 = pyc.alias %v814 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v816 = pyc.eq %v209, %v797 : i16
  %v817 = pyc.and %v129, %v816 : i1
  %v818 = pyc.alias %v817 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v819 = pyc.or %v812, %v818 : i1
  %v820 = pyc.alias %v819 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v821 = pyc.not %v818 : i1
  %v822 = pyc.mux %v821, %v815, %v169 : i128
  %v823 = pyc.alias %v822 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v824 = pyc.eq %v214, %v797 : i16
  %v825 = pyc.and %v134, %v824 : i1
  %v826 = pyc.alias %v825 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v827 = pyc.or %v820, %v826 : i1
  %v828 = pyc.alias %v827 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v829 = pyc.not %v826 : i1
  %v830 = pyc.mux %v829, %v823, %v174 : i128
  %v831 = pyc.alias %v830 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v832 = pyc.eq %v219, %v797 : i16
  %v833 = pyc.and %v139, %v832 : i1
  %v834 = pyc.alias %v833 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v835 = pyc.or %v828, %v834 : i1
  %v836 = pyc.alias %v835 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v837 = pyc.not %v834 : i1
  %v838 = pyc.mux %v837, %v831, %v179 : i128
  %v839 = pyc.alias %v838 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v840 = pyc.eq %v224, %v797 : i16
  %v841 = pyc.and %v144, %v840 : i1
  %v842 = pyc.alias %v841 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v843 = pyc.or %v836, %v842 : i1
  %v844 = pyc.alias %v843 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v845 = pyc.not %v842 : i1
  %v846 = pyc.mux %v845, %v839, %v184 : i128
  %v847 = pyc.alias %v846 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v848 = pyc.eq %v229, %v797 : i16
  %v849 = pyc.and %v149, %v848 : i1
  %v850 = pyc.alias %v849 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v851 = pyc.or %v844, %v850 : i1
  %v852 = pyc.alias %v851 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v853 = pyc.not %v850 : i1
  %v854 = pyc.mux %v853, %v847, %v189 : i128
  %v855 = pyc.alias %v854 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v856 = pyc.eq %v234, %v797 : i16
  %v857 = pyc.and %v154, %v856 : i1
  %v858 = pyc.alias %v857 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v859 = pyc.or %v852, %v858 : i1
  %v860 = pyc.alias %v859 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v861 = pyc.not %v858 : i1
  %v862 = pyc.mux %v861, %v855, %v194 : i128
  %v863 = pyc.alias %v862 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v864 = pyc.constant 0 : i3
  %v865 = pyc.zext %v864 : i3 -> i5
  %v866 = pyc.eq %v785, %v865 : i5
  %v867 = pyc.not %v866 : i1
  %v868 = pyc.alias %v867 {pyc.name = "has_dep__fastfwd_v3_3__L496"} : i1
  %v869 = pyc.and %v868, %v860 : i1
  %v870 = pyc.alias %v869 {pyc.name = "dep_ready__fastfwd_v3_3__L497"} : i1
  %v871 = pyc.not %v376 : i1
  %v872 = pyc.and %v871, %v35 : i1
  %v873 = pyc.and %v872, %v794 : i1
  %v874 = pyc.not %v868 : i1
  %v875 = pyc.or %v874, %v870 : i1
  %v876 = pyc.and %v873, %v875 : i1
  %v877 = pyc.alias %v876 {pyc.name = "can_schedule__fastfwd_v3_3__L500"} : i1
  %v878 = pyc.constant 1 : i3
  %v879 = pyc.ult %v878, %v396 : i3
  %v880 = pyc.and %v376, %v879 : i1
  %v881 = pyc.or %v877, %v880 : i1
  pyc.assign %v372, %v881 : i1
  %v882 = pyc.constant 1 : i3
  %v883 = pyc.zext %v882 : i3 -> i5
  %v884 = pyc.add %v781, %v883 : i5
  %v885 = pyc.constant 1 : i3
  %v886 = pyc.sub %v396, %v885 : i3
  %v887 = pyc.constant 0 : i3
  %v888 = pyc.mux %v376, %v886, %v887 : i3
  %v889 = pyc.zext %v888 : i3 -> i5
  %v890 = pyc.mux %v877, %v884, %v889 : i5
  %v891 = pyc.alias %v890 {pyc.name = "new_timer__fastfwd_v3_3__L505"} : i5
  %v892 = pyc.trunc %v891 : i5 -> i3
  pyc.assign %v392, %v892 : i3
  %v893 = pyc.zext %v416 : i6 -> i16
  %v894 = pyc.mux %v877, %v791, %v893 : i16
  %v895 = pyc.trunc %v894 : i16 -> i6
  pyc.assign %v412, %v895 : i6
  %v896 = pyc.mux %v877, %v95, %v255 : i16
  pyc.assign %v251, %v896 : i16
  pyc.assign %v432, %v877 : i1
  %v897 = pyc.constant 0 : i128
  %v898 = pyc.mux %v877, %v55, %v897 : i128
  pyc.assign %v452, %v898 : i128
  %v899 = pyc.constant 0 : i2
  %v900 = pyc.zext %v899 : i2 -> i5
  %v901 = pyc.mux %v877, %v781, %v900 : i5
  %v902 = pyc.trunc %v901 : i5 -> i2
  pyc.assign %v472, %v902 : i2
  %v903 = pyc.and %v868, %v877 : i1
  pyc.assign %v492, %v903 : i1
  %v904 = pyc.and %v868, %v877 : i1
  %v905 = pyc.constant 0 : i128
  %v906 = pyc.mux %v904, %v863, %v905 : i128
  pyc.assign %v512, %v906 : i128
  %v907 = pyc.constant 3 : i5
  %v908 = pyc.and %v80, %v907 : i5
  %v909 = pyc.alias %v908 {pyc.name = "lat__fastfwd_v3_3__L479"} : i5
  %v910 = pyc.lshri %v80 {amount = 2} : i5
  %v911 = pyc.constant 7 : i5
  %v912 = pyc.and %v910, %v911 : i5
  %v913 = pyc.alias %v912 {pyc.name = "dep__fastfwd_v3_3__L480"} : i5
  %v914 = pyc.constant 2 : i6
  %v915 = pyc.zext %v914 : i6 -> i16
  %v916 = pyc.add %v522, %v915 : i16
  %v917 = pyc.zext %v909 : i5 -> i16
  %v918 = pyc.add %v916, %v917 : i16
  %v919 = pyc.alias %v918 {pyc.name = "finish_cycle__fastfwd_v3_3__L483"} : i16
  %v920 = pyc.zext %v421 : i6 -> i16
  %v921 = pyc.ult %v920, %v919 : i16
  %v922 = pyc.alias %v921 {pyc.name = "constraint_ok__fastfwd_v3_3__L484"} : i1
  %v923 = pyc.zext %v913 : i5 -> i16
  %v924 = pyc.sub %v100, %v923 : i16
  %v925 = pyc.alias %v924 {pyc.name = "target_seq__fastfwd_v3_3__L487"} : i16
  %v926 = pyc.eq %v199, %v925 : i16
  %v927 = pyc.and %v119, %v926 : i1
  %v928 = pyc.alias %v927 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v929 = pyc.constant 0 : i1
  %v930 = pyc.or %v928, %v929 : i1
  %v931 = pyc.alias %v930 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v932 = pyc.not %v928 : i1
  %v933 = pyc.constant 0 : i128
  %v934 = pyc.mux %v932, %v933, %v159 : i128
  %v935 = pyc.alias %v934 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v936 = pyc.eq %v204, %v925 : i16
  %v937 = pyc.and %v124, %v936 : i1
  %v938 = pyc.alias %v937 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v939 = pyc.or %v931, %v938 : i1
  %v940 = pyc.alias %v939 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v941 = pyc.not %v938 : i1
  %v942 = pyc.mux %v941, %v935, %v164 : i128
  %v943 = pyc.alias %v942 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v944 = pyc.eq %v209, %v925 : i16
  %v945 = pyc.and %v129, %v944 : i1
  %v946 = pyc.alias %v945 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v947 = pyc.or %v940, %v946 : i1
  %v948 = pyc.alias %v947 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v949 = pyc.not %v946 : i1
  %v950 = pyc.mux %v949, %v943, %v169 : i128
  %v951 = pyc.alias %v950 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v952 = pyc.eq %v214, %v925 : i16
  %v953 = pyc.and %v134, %v952 : i1
  %v954 = pyc.alias %v953 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v955 = pyc.or %v948, %v954 : i1
  %v956 = pyc.alias %v955 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v957 = pyc.not %v954 : i1
  %v958 = pyc.mux %v957, %v951, %v174 : i128
  %v959 = pyc.alias %v958 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v960 = pyc.eq %v219, %v925 : i16
  %v961 = pyc.and %v139, %v960 : i1
  %v962 = pyc.alias %v961 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v963 = pyc.or %v956, %v962 : i1
  %v964 = pyc.alias %v963 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v965 = pyc.not %v962 : i1
  %v966 = pyc.mux %v965, %v959, %v179 : i128
  %v967 = pyc.alias %v966 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v968 = pyc.eq %v224, %v925 : i16
  %v969 = pyc.and %v144, %v968 : i1
  %v970 = pyc.alias %v969 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v971 = pyc.or %v964, %v970 : i1
  %v972 = pyc.alias %v971 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v973 = pyc.not %v970 : i1
  %v974 = pyc.mux %v973, %v967, %v184 : i128
  %v975 = pyc.alias %v974 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v976 = pyc.eq %v229, %v925 : i16
  %v977 = pyc.and %v149, %v976 : i1
  %v978 = pyc.alias %v977 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v979 = pyc.or %v972, %v978 : i1
  %v980 = pyc.alias %v979 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v981 = pyc.not %v978 : i1
  %v982 = pyc.mux %v981, %v975, %v189 : i128
  %v983 = pyc.alias %v982 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v984 = pyc.eq %v234, %v925 : i16
  %v985 = pyc.and %v154, %v984 : i1
  %v986 = pyc.alias %v985 {pyc.name = "match__fastfwd_v3_3__L492"} : i1
  %v987 = pyc.or %v980, %v986 : i1
  %v988 = pyc.alias %v987 {pyc.name = "dep_found__fastfwd_v3_3__L493"} : i1
  %v989 = pyc.not %v986 : i1
  %v990 = pyc.mux %v989, %v983, %v194 : i128
  %v991 = pyc.alias %v990 {pyc.name = "dep_value__fastfwd_v3_3__L494"} : i128
  %v992 = pyc.constant 0 : i3
  %v993 = pyc.zext %v992 : i3 -> i5
  %v994 = pyc.eq %v913, %v993 : i5
  %v995 = pyc.not %v994 : i1
  %v996 = pyc.alias %v995 {pyc.name = "has_dep__fastfwd_v3_3__L496"} : i1
  %v997 = pyc.and %v996, %v988 : i1
  %v998 = pyc.alias %v997 {pyc.name = "dep_ready__fastfwd_v3_3__L497"} : i1
  %v999 = pyc.not %v381 : i1
  %v1000 = pyc.and %v999, %v40 : i1
  %v1001 = pyc.and %v1000, %v922 : i1
  %v1002 = pyc.not %v996 : i1
  %v1003 = pyc.or %v1002, %v998 : i1
  %v1004 = pyc.and %v1001, %v1003 : i1
  %v1005 = pyc.alias %v1004 {pyc.name = "can_schedule__fastfwd_v3_3__L500"} : i1
  %v1006 = pyc.constant 1 : i3
  %v1007 = pyc.ult %v1006, %v401 : i3
  %v1008 = pyc.and %v381, %v1007 : i1
  %v1009 = pyc.or %v1005, %v1008 : i1
  pyc.assign %v377, %v1009 : i1
  %v1010 = pyc.constant 1 : i3
  %v1011 = pyc.zext %v1010 : i3 -> i5
  %v1012 = pyc.add %v909, %v1011 : i5
  %v1013 = pyc.constant 1 : i3
  %v1014 = pyc.sub %v401, %v1013 : i3
  %v1015 = pyc.constant 0 : i3
  %v1016 = pyc.mux %v381, %v1014, %v1015 : i3
  %v1017 = pyc.zext %v1016 : i3 -> i5
  %v1018 = pyc.mux %v1005, %v1012, %v1017 : i5
  %v1019 = pyc.alias %v1018 {pyc.name = "new_timer__fastfwd_v3_3__L505"} : i5
  %v1020 = pyc.trunc %v1019 : i5 -> i3
  pyc.assign %v397, %v1020 : i3
  %v1021 = pyc.zext %v421 : i6 -> i16
  %v1022 = pyc.mux %v1005, %v919, %v1021 : i16
  %v1023 = pyc.trunc %v1022 : i16 -> i6
  pyc.assign %v417, %v1023 : i6
  %v1024 = pyc.mux %v1005, %v100, %v260 : i16
  pyc.assign %v256, %v1024 : i16
  pyc.assign %v437, %v1005 : i1
  %v1025 = pyc.constant 0 : i128
  %v1026 = pyc.mux %v1005, %v60, %v1025 : i128
  pyc.assign %v457, %v1026 : i128
  %v1027 = pyc.constant 0 : i2
  %v1028 = pyc.zext %v1027 : i2 -> i5
  %v1029 = pyc.mux %v1005, %v909, %v1028 : i5
  %v1030 = pyc.trunc %v1029 : i5 -> i2
  pyc.assign %v477, %v1030 : i2
  %v1031 = pyc.and %v996, %v1005 : i1
  pyc.assign %v497, %v1031 : i1
  %v1032 = pyc.and %v996, %v1005 : i1
  %v1033 = pyc.constant 0 : i128
  %v1034 = pyc.mux %v1032, %v991, %v1033 : i128
  pyc.assign %v517, %v1034 : i128
  %v1035 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v1036 = pyc.constant 1 : i1
  %v1037 = pyc.constant 0 : i1
  %v1038 = pyc.reg %clk, %rst, %v1036, %v1035, %v1037 : i1
  %v1039 = pyc.alias %v1038 {pyc.name = "rob0_valid"} : i1
  %v1040 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v1041 = pyc.constant 1 : i1
  %v1042 = pyc.constant 0 : i1
  %v1043 = pyc.reg %clk, %rst, %v1041, %v1040, %v1042 : i1
  %v1044 = pyc.alias %v1043 {pyc.name = "rob1_valid"} : i1
  %v1045 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v1046 = pyc.constant 1 : i1
  %v1047 = pyc.constant 0 : i1
  %v1048 = pyc.reg %clk, %rst, %v1046, %v1045, %v1047 : i1
  %v1049 = pyc.alias %v1048 {pyc.name = "rob2_valid"} : i1
  %v1050 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v1051 = pyc.constant 1 : i1
  %v1052 = pyc.constant 0 : i1
  %v1053 = pyc.reg %clk, %rst, %v1051, %v1050, %v1052 : i1
  %v1054 = pyc.alias %v1053 {pyc.name = "rob3_valid"} : i1
  %v1055 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v1056 = pyc.constant 1 : i1
  %v1057 = pyc.constant 0 : i1
  %v1058 = pyc.reg %clk, %rst, %v1056, %v1055, %v1057 : i1
  %v1059 = pyc.alias %v1058 {pyc.name = "rob4_valid"} : i1
  %v1060 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v1061 = pyc.constant 1 : i1
  %v1062 = pyc.constant 0 : i1
  %v1063 = pyc.reg %clk, %rst, %v1061, %v1060, %v1062 : i1
  %v1064 = pyc.alias %v1063 {pyc.name = "rob5_valid"} : i1
  %v1065 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v1066 = pyc.constant 1 : i1
  %v1067 = pyc.constant 0 : i1
  %v1068 = pyc.reg %clk, %rst, %v1066, %v1065, %v1067 : i1
  %v1069 = pyc.alias %v1068 {pyc.name = "rob6_valid"} : i1
  %v1070 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v1071 = pyc.constant 1 : i1
  %v1072 = pyc.constant 0 : i1
  %v1073 = pyc.reg %clk, %rst, %v1071, %v1070, %v1072 : i1
  %v1074 = pyc.alias %v1073 {pyc.name = "rob7_valid"} : i1
  %v1075 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v1076 = pyc.constant 1 : i1
  %v1077 = pyc.constant 0 : i128
  %v1078 = pyc.reg %clk, %rst, %v1076, %v1075, %v1077 : i128
  %v1079 = pyc.alias %v1078 {pyc.name = "rob0_data"} : i128
  %v1080 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v1081 = pyc.constant 1 : i1
  %v1082 = pyc.constant 0 : i128
  %v1083 = pyc.reg %clk, %rst, %v1081, %v1080, %v1082 : i128
  %v1084 = pyc.alias %v1083 {pyc.name = "rob1_data"} : i128
  %v1085 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v1086 = pyc.constant 1 : i1
  %v1087 = pyc.constant 0 : i128
  %v1088 = pyc.reg %clk, %rst, %v1086, %v1085, %v1087 : i128
  %v1089 = pyc.alias %v1088 {pyc.name = "rob2_data"} : i128
  %v1090 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v1091 = pyc.constant 1 : i1
  %v1092 = pyc.constant 0 : i128
  %v1093 = pyc.reg %clk, %rst, %v1091, %v1090, %v1092 : i128
  %v1094 = pyc.alias %v1093 {pyc.name = "rob3_data"} : i128
  %v1095 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v1096 = pyc.constant 1 : i1
  %v1097 = pyc.constant 0 : i128
  %v1098 = pyc.reg %clk, %rst, %v1096, %v1095, %v1097 : i128
  %v1099 = pyc.alias %v1098 {pyc.name = "rob4_data"} : i128
  %v1100 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v1101 = pyc.constant 1 : i1
  %v1102 = pyc.constant 0 : i128
  %v1103 = pyc.reg %clk, %rst, %v1101, %v1100, %v1102 : i128
  %v1104 = pyc.alias %v1103 {pyc.name = "rob5_data"} : i128
  %v1105 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v1106 = pyc.constant 1 : i1
  %v1107 = pyc.constant 0 : i128
  %v1108 = pyc.reg %clk, %rst, %v1106, %v1105, %v1107 : i128
  %v1109 = pyc.alias %v1108 {pyc.name = "rob6_data"} : i128
  %v1110 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v1111 = pyc.constant 1 : i1
  %v1112 = pyc.constant 0 : i128
  %v1113 = pyc.reg %clk, %rst, %v1111, %v1110, %v1112 : i128
  %v1114 = pyc.alias %v1113 {pyc.name = "rob7_data"} : i128
  %v1115 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v1116 = pyc.constant 1 : i1
  %v1117 = pyc.constant 0 : i16
  %v1118 = pyc.reg %clk, %rst, %v1116, %v1115, %v1117 : i16
  %v1119 = pyc.alias %v1118 {pyc.name = "rob0_seq"} : i16
  %v1120 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v1121 = pyc.constant 1 : i1
  %v1122 = pyc.constant 0 : i16
  %v1123 = pyc.reg %clk, %rst, %v1121, %v1120, %v1122 : i16
  %v1124 = pyc.alias %v1123 {pyc.name = "rob1_seq"} : i16
  %v1125 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v1126 = pyc.constant 1 : i1
  %v1127 = pyc.constant 0 : i16
  %v1128 = pyc.reg %clk, %rst, %v1126, %v1125, %v1127 : i16
  %v1129 = pyc.alias %v1128 {pyc.name = "rob2_seq"} : i16
  %v1130 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v1131 = pyc.constant 1 : i1
  %v1132 = pyc.constant 0 : i16
  %v1133 = pyc.reg %clk, %rst, %v1131, %v1130, %v1132 : i16
  %v1134 = pyc.alias %v1133 {pyc.name = "rob3_seq"} : i16
  %v1135 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v1136 = pyc.constant 1 : i1
  %v1137 = pyc.constant 0 : i16
  %v1138 = pyc.reg %clk, %rst, %v1136, %v1135, %v1137 : i16
  %v1139 = pyc.alias %v1138 {pyc.name = "rob4_seq"} : i16
  %v1140 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v1141 = pyc.constant 1 : i1
  %v1142 = pyc.constant 0 : i16
  %v1143 = pyc.reg %clk, %rst, %v1141, %v1140, %v1142 : i16
  %v1144 = pyc.alias %v1143 {pyc.name = "rob5_seq"} : i16
  %v1145 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v1146 = pyc.constant 1 : i1
  %v1147 = pyc.constant 0 : i16
  %v1148 = pyc.reg %clk, %rst, %v1146, %v1145, %v1147 : i16
  %v1149 = pyc.alias %v1148 {pyc.name = "rob6_seq"} : i16
  %v1150 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v1151 = pyc.constant 1 : i1
  %v1152 = pyc.constant 0 : i16
  %v1153 = pyc.reg %clk, %rst, %v1151, %v1150, %v1152 : i16
  %v1154 = pyc.alias %v1153 {pyc.name = "rob7_seq"} : i16
  %v1155 = pyc.wire {pyc.name = "rob_tail__next"} : i3
  %v1156 = pyc.constant 1 : i1
  %v1157 = pyc.constant 0 : i3
  %v1158 = pyc.reg %clk, %rst, %v1156, %v1155, %v1157 : i3
  %v1159 = pyc.alias %v1158 {pyc.name = "rob_tail"} : i3
  %v1160 = pyc.alias %v1159 {pyc.name = "rob_tail__fastfwd_v3_3__L523"} : i3
  %v1161 = pyc.constant 0 : i3
  %v1162 = pyc.eq %v1160, %v1161 : i3
  %v1163 = pyc.and %v293, %v1162 : i1
  %v1164 = pyc.alias %v1163 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1165 = pyc.or %v1164, %v1039 : i1
  pyc.assign %v1035, %v1165 : i1
  %v1166 = pyc.mux %v1164, %v296, %v1079 : i128
  pyc.assign %v1075, %v1166 : i128
  %v1167 = pyc.mux %v1164, %v299, %v1119 : i16
  pyc.assign %v1115, %v1167 : i16
  %v1168 = pyc.constant 1 : i3
  %v1169 = pyc.eq %v1160, %v1168 : i3
  %v1170 = pyc.and %v293, %v1169 : i1
  %v1171 = pyc.alias %v1170 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1172 = pyc.or %v1171, %v1044 : i1
  pyc.assign %v1040, %v1172 : i1
  %v1173 = pyc.mux %v1171, %v296, %v1084 : i128
  pyc.assign %v1080, %v1173 : i128
  %v1174 = pyc.mux %v1171, %v299, %v1124 : i16
  pyc.assign %v1120, %v1174 : i16
  %v1175 = pyc.constant 2 : i3
  %v1176 = pyc.eq %v1160, %v1175 : i3
  %v1177 = pyc.and %v293, %v1176 : i1
  %v1178 = pyc.alias %v1177 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1179 = pyc.or %v1178, %v1049 : i1
  pyc.assign %v1045, %v1179 : i1
  %v1180 = pyc.mux %v1178, %v296, %v1089 : i128
  pyc.assign %v1085, %v1180 : i128
  %v1181 = pyc.mux %v1178, %v299, %v1129 : i16
  pyc.assign %v1125, %v1181 : i16
  %v1182 = pyc.constant 3 : i3
  %v1183 = pyc.eq %v1160, %v1182 : i3
  %v1184 = pyc.and %v293, %v1183 : i1
  %v1185 = pyc.alias %v1184 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1186 = pyc.or %v1185, %v1054 : i1
  pyc.assign %v1050, %v1186 : i1
  %v1187 = pyc.mux %v1185, %v296, %v1094 : i128
  pyc.assign %v1090, %v1187 : i128
  %v1188 = pyc.mux %v1185, %v299, %v1134 : i16
  pyc.assign %v1130, %v1188 : i16
  %v1189 = pyc.constant 4 : i3
  %v1190 = pyc.eq %v1160, %v1189 : i3
  %v1191 = pyc.and %v293, %v1190 : i1
  %v1192 = pyc.alias %v1191 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1193 = pyc.or %v1192, %v1059 : i1
  pyc.assign %v1055, %v1193 : i1
  %v1194 = pyc.mux %v1192, %v296, %v1099 : i128
  pyc.assign %v1095, %v1194 : i128
  %v1195 = pyc.mux %v1192, %v299, %v1139 : i16
  pyc.assign %v1135, %v1195 : i16
  %v1196 = pyc.constant 5 : i3
  %v1197 = pyc.eq %v1160, %v1196 : i3
  %v1198 = pyc.and %v293, %v1197 : i1
  %v1199 = pyc.alias %v1198 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1200 = pyc.or %v1199, %v1064 : i1
  pyc.assign %v1060, %v1200 : i1
  %v1201 = pyc.mux %v1199, %v296, %v1104 : i128
  pyc.assign %v1100, %v1201 : i128
  %v1202 = pyc.mux %v1199, %v299, %v1144 : i16
  pyc.assign %v1140, %v1202 : i16
  %v1203 = pyc.constant 6 : i3
  %v1204 = pyc.eq %v1160, %v1203 : i3
  %v1205 = pyc.and %v293, %v1204 : i1
  %v1206 = pyc.alias %v1205 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1207 = pyc.or %v1206, %v1069 : i1
  pyc.assign %v1065, %v1207 : i1
  %v1208 = pyc.mux %v1206, %v296, %v1109 : i128
  pyc.assign %v1105, %v1208 : i128
  %v1209 = pyc.mux %v1206, %v299, %v1149 : i16
  pyc.assign %v1145, %v1209 : i16
  %v1210 = pyc.constant 7 : i3
  %v1211 = pyc.eq %v1160, %v1210 : i3
  %v1212 = pyc.and %v293, %v1211 : i1
  %v1213 = pyc.alias %v1212 {pyc.name = "should_write__fastfwd_v3_3__L527"} : i1
  %v1214 = pyc.or %v1213, %v1074 : i1
  pyc.assign %v1070, %v1214 : i1
  %v1215 = pyc.mux %v1213, %v296, %v1114 : i128
  pyc.assign %v1110, %v1215 : i128
  %v1216 = pyc.mux %v1213, %v299, %v1154 : i16
  pyc.assign %v1150, %v1216 : i16
  %v1217 = pyc.constant 1 : i3
  %v1218 = pyc.add %v1160, %v1217 : i3
  %v1219 = pyc.constant 7 : i3
  %v1220 = pyc.and %v1218, %v1219 : i3
  %v1221 = pyc.mux %v293, %v1220, %v1160 : i3
  pyc.assign %v1155, %v1221 : i3
  %v1222 = pyc.wire {pyc.name = "next_output_seq__next"} : i16
  %v1223 = pyc.constant 1 : i1
  %v1224 = pyc.constant 0 : i16
  %v1225 = pyc.reg %clk, %rst, %v1223, %v1222, %v1224 : i16
  %v1226 = pyc.alias %v1225 {pyc.name = "next_output_seq"} : i16
  %v1227 = pyc.alias %v1226 {pyc.name = "next_output_seq__fastfwd_v3_3__L535"} : i16
  %v1228 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v1229 = pyc.constant 1 : i1
  %v1230 = pyc.constant 0 : i2
  %v1231 = pyc.reg %clk, %rst, %v1229, %v1228, %v1230 : i2
  %v1232 = pyc.alias %v1231 {pyc.name = "out_ptr"} : i2
  %v1233 = pyc.alias %v1232 {pyc.name = "out_ptr__fastfwd_v3_3__L536"} : i2
  %v1234 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1235 = pyc.constant 1 : i1
  %v1236 = pyc.constant 0 : i1
  %v1237 = pyc.reg %clk, %rst, %v1235, %v1234, %v1236 : i1
  %v1238 = pyc.alias %v1237 {pyc.name = "lane0_out_vld"} : i1
  %v1239 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1240 = pyc.constant 1 : i1
  %v1241 = pyc.constant 0 : i1
  %v1242 = pyc.reg %clk, %rst, %v1240, %v1239, %v1241 : i1
  %v1243 = pyc.alias %v1242 {pyc.name = "lane1_out_vld"} : i1
  %v1244 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1245 = pyc.constant 1 : i1
  %v1246 = pyc.constant 0 : i1
  %v1247 = pyc.reg %clk, %rst, %v1245, %v1244, %v1246 : i1
  %v1248 = pyc.alias %v1247 {pyc.name = "lane2_out_vld"} : i1
  %v1249 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1250 = pyc.constant 1 : i1
  %v1251 = pyc.constant 0 : i1
  %v1252 = pyc.reg %clk, %rst, %v1250, %v1249, %v1251 : i1
  %v1253 = pyc.alias %v1252 {pyc.name = "lane3_out_vld"} : i1
  %v1254 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1255 = pyc.constant 1 : i1
  %v1256 = pyc.constant 0 : i128
  %v1257 = pyc.reg %clk, %rst, %v1255, %v1254, %v1256 : i128
  %v1258 = pyc.alias %v1257 {pyc.name = "lane0_out_data"} : i128
  %v1259 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1260 = pyc.constant 1 : i1
  %v1261 = pyc.constant 0 : i128
  %v1262 = pyc.reg %clk, %rst, %v1260, %v1259, %v1261 : i128
  %v1263 = pyc.alias %v1262 {pyc.name = "lane1_out_data"} : i128
  %v1264 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1265 = pyc.constant 1 : i1
  %v1266 = pyc.constant 0 : i128
  %v1267 = pyc.reg %clk, %rst, %v1265, %v1264, %v1266 : i128
  %v1268 = pyc.alias %v1267 {pyc.name = "lane2_out_data"} : i128
  %v1269 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1270 = pyc.constant 1 : i1
  %v1271 = pyc.constant 0 : i128
  %v1272 = pyc.reg %clk, %rst, %v1270, %v1269, %v1271 : i128
  %v1273 = pyc.alias %v1272 {pyc.name = "lane3_out_data"} : i128
  %v1274 = pyc.alias %v1233 {pyc.name = "ptr__fastfwd_v3_3__L541"} : i2
  %v1275 = pyc.alias %v1227 {pyc.name = "next_seq_val__fastfwd_v3_3__L542"} : i16
  %v1276 = pyc.eq %v1119, %v1275 : i16
  %v1277 = pyc.and %v1039, %v1276 : i1
  %v1278 = pyc.alias %v1277 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1279 = pyc.constant 0 : i1
  %v1280 = pyc.or %v1278, %v1279 : i1
  %v1281 = pyc.alias %v1280 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1282 = pyc.not %v1278 : i1
  %v1283 = pyc.constant 0 : i128
  %v1284 = pyc.mux %v1282, %v1283, %v1079 : i128
  %v1285 = pyc.alias %v1284 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1286 = pyc.eq %v1124, %v1275 : i16
  %v1287 = pyc.and %v1044, %v1286 : i1
  %v1288 = pyc.alias %v1287 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1289 = pyc.or %v1281, %v1288 : i1
  %v1290 = pyc.alias %v1289 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1291 = pyc.not %v1288 : i1
  %v1292 = pyc.mux %v1291, %v1285, %v1084 : i128
  %v1293 = pyc.alias %v1292 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1294 = pyc.eq %v1129, %v1275 : i16
  %v1295 = pyc.and %v1049, %v1294 : i1
  %v1296 = pyc.alias %v1295 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1297 = pyc.or %v1290, %v1296 : i1
  %v1298 = pyc.alias %v1297 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1299 = pyc.not %v1296 : i1
  %v1300 = pyc.mux %v1299, %v1293, %v1089 : i128
  %v1301 = pyc.alias %v1300 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1302 = pyc.eq %v1134, %v1275 : i16
  %v1303 = pyc.and %v1054, %v1302 : i1
  %v1304 = pyc.alias %v1303 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1305 = pyc.or %v1298, %v1304 : i1
  %v1306 = pyc.alias %v1305 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1307 = pyc.not %v1304 : i1
  %v1308 = pyc.mux %v1307, %v1301, %v1094 : i128
  %v1309 = pyc.alias %v1308 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1310 = pyc.eq %v1139, %v1275 : i16
  %v1311 = pyc.and %v1059, %v1310 : i1
  %v1312 = pyc.alias %v1311 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1313 = pyc.or %v1306, %v1312 : i1
  %v1314 = pyc.alias %v1313 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1315 = pyc.not %v1312 : i1
  %v1316 = pyc.mux %v1315, %v1309, %v1099 : i128
  %v1317 = pyc.alias %v1316 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1318 = pyc.eq %v1144, %v1275 : i16
  %v1319 = pyc.and %v1064, %v1318 : i1
  %v1320 = pyc.alias %v1319 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1321 = pyc.or %v1314, %v1320 : i1
  %v1322 = pyc.alias %v1321 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1323 = pyc.not %v1320 : i1
  %v1324 = pyc.mux %v1323, %v1317, %v1104 : i128
  %v1325 = pyc.alias %v1324 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1326 = pyc.eq %v1149, %v1275 : i16
  %v1327 = pyc.and %v1069, %v1326 : i1
  %v1328 = pyc.alias %v1327 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1329 = pyc.or %v1322, %v1328 : i1
  %v1330 = pyc.alias %v1329 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1331 = pyc.not %v1328 : i1
  %v1332 = pyc.mux %v1331, %v1325, %v1109 : i128
  %v1333 = pyc.alias %v1332 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1334 = pyc.eq %v1154, %v1275 : i16
  %v1335 = pyc.and %v1074, %v1334 : i1
  %v1336 = pyc.alias %v1335 {pyc.name = "match__fastfwd_v3_3__L549"} : i1
  %v1337 = pyc.or %v1330, %v1336 : i1
  %v1338 = pyc.alias %v1337 {pyc.name = "has_next__fastfwd_v3_3__L550"} : i1
  %v1339 = pyc.not %v1336 : i1
  %v1340 = pyc.mux %v1339, %v1333, %v1114 : i128
  %v1341 = pyc.alias %v1340 {pyc.name = "next_data_val__fastfwd_v3_3__L551"} : i128
  %v1342 = pyc.constant 0 : i2
  %v1343 = pyc.eq %v1274, %v1342 : i2
  %v1344 = pyc.alias %v1343 {pyc.name = "this_lane__fastfwd_v3_3__L554"} : i1
  %v1345 = pyc.and %v1344, %v1338 : i1
  %v1346 = pyc.alias %v1345 {pyc.name = "should_out__fastfwd_v3_3__L555"} : i1
  pyc.assign %v1234, %v1346 : i1
  %v1347 = pyc.constant 0 : i128
  %v1348 = pyc.mux %v1346, %v1341, %v1347 : i128
  pyc.assign %v1254, %v1348 : i128
  %v1349 = pyc.constant 1 : i2
  %v1350 = pyc.eq %v1274, %v1349 : i2
  %v1351 = pyc.alias %v1350 {pyc.name = "this_lane__fastfwd_v3_3__L554"} : i1
  %v1352 = pyc.and %v1351, %v1338 : i1
  %v1353 = pyc.alias %v1352 {pyc.name = "should_out__fastfwd_v3_3__L555"} : i1
  pyc.assign %v1239, %v1353 : i1
  %v1354 = pyc.constant 0 : i128
  %v1355 = pyc.mux %v1353, %v1341, %v1354 : i128
  pyc.assign %v1259, %v1355 : i128
  %v1356 = pyc.constant 2 : i2
  %v1357 = pyc.eq %v1274, %v1356 : i2
  %v1358 = pyc.alias %v1357 {pyc.name = "this_lane__fastfwd_v3_3__L554"} : i1
  %v1359 = pyc.and %v1358, %v1338 : i1
  %v1360 = pyc.alias %v1359 {pyc.name = "should_out__fastfwd_v3_3__L555"} : i1
  pyc.assign %v1244, %v1360 : i1
  %v1361 = pyc.constant 0 : i128
  %v1362 = pyc.mux %v1360, %v1341, %v1361 : i128
  pyc.assign %v1264, %v1362 : i128
  %v1363 = pyc.constant 3 : i2
  %v1364 = pyc.eq %v1274, %v1363 : i2
  %v1365 = pyc.alias %v1364 {pyc.name = "this_lane__fastfwd_v3_3__L554"} : i1
  %v1366 = pyc.and %v1365, %v1338 : i1
  %v1367 = pyc.alias %v1366 {pyc.name = "should_out__fastfwd_v3_3__L555"} : i1
  pyc.assign %v1249, %v1367 : i1
  %v1368 = pyc.constant 0 : i128
  %v1369 = pyc.mux %v1367, %v1341, %v1368 : i128
  pyc.assign %v1269, %v1369 : i128
  %v1370 = pyc.or %v1238, %v1243 : i1
  %v1371 = pyc.or %v1370, %v1248 : i1
  %v1372 = pyc.or %v1371, %v1253 : i1
  %v1373 = pyc.alias %v1372 {pyc.name = "any_out__fastfwd_v3_3__L559"} : i1
  %v1374 = pyc.constant 1 : i2
  %v1375 = pyc.add %v1274, %v1374 : i2
  %v1376 = pyc.constant 3 : i2
  %v1377 = pyc.and %v1375, %v1376 : i2
  %v1378 = pyc.mux %v1373, %v1377, %v1274 : i2
  pyc.assign %v1228, %v1378 : i2
  %v1379 = pyc.constant 1 : i16
  %v1380 = pyc.add %v1275, %v1379 : i16
  %v1381 = pyc.mux %v1373, %v1380, %v1275 : i16
  pyc.assign %v1222, %v1381 : i16
  %v1382 = pyc.eq %v1119, %v1275 : i16
  %v1383 = pyc.and %v1373, %v1382 : i1
  %v1384 = pyc.alias %v1383 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1385 = pyc.constant 0 : i1
  %v1386 = pyc.mux %v1384, %v1385, %v1039 : i1
  pyc.assign %v1035, %v1386 : i1
  %v1387 = pyc.eq %v1124, %v1275 : i16
  %v1388 = pyc.and %v1373, %v1387 : i1
  %v1389 = pyc.alias %v1388 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1390 = pyc.constant 0 : i1
  %v1391 = pyc.mux %v1389, %v1390, %v1044 : i1
  pyc.assign %v1040, %v1391 : i1
  %v1392 = pyc.eq %v1129, %v1275 : i16
  %v1393 = pyc.and %v1373, %v1392 : i1
  %v1394 = pyc.alias %v1393 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1395 = pyc.constant 0 : i1
  %v1396 = pyc.mux %v1394, %v1395, %v1049 : i1
  pyc.assign %v1045, %v1396 : i1
  %v1397 = pyc.eq %v1134, %v1275 : i16
  %v1398 = pyc.and %v1373, %v1397 : i1
  %v1399 = pyc.alias %v1398 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1400 = pyc.constant 0 : i1
  %v1401 = pyc.mux %v1399, %v1400, %v1054 : i1
  pyc.assign %v1050, %v1401 : i1
  %v1402 = pyc.eq %v1139, %v1275 : i16
  %v1403 = pyc.and %v1373, %v1402 : i1
  %v1404 = pyc.alias %v1403 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1405 = pyc.constant 0 : i1
  %v1406 = pyc.mux %v1404, %v1405, %v1059 : i1
  pyc.assign %v1055, %v1406 : i1
  %v1407 = pyc.eq %v1144, %v1275 : i16
  %v1408 = pyc.and %v1373, %v1407 : i1
  %v1409 = pyc.alias %v1408 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1410 = pyc.constant 0 : i1
  %v1411 = pyc.mux %v1409, %v1410, %v1064 : i1
  pyc.assign %v1060, %v1411 : i1
  %v1412 = pyc.eq %v1149, %v1275 : i16
  %v1413 = pyc.and %v1373, %v1412 : i1
  %v1414 = pyc.alias %v1413 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1415 = pyc.constant 0 : i1
  %v1416 = pyc.mux %v1414, %v1415, %v1069 : i1
  pyc.assign %v1065, %v1416 : i1
  %v1417 = pyc.eq %v1154, %v1275 : i16
  %v1418 = pyc.and %v1373, %v1417 : i1
  %v1419 = pyc.alias %v1418 {pyc.name = "should_clear__fastfwd_v3_3__L565"} : i1
  %v1420 = pyc.constant 0 : i1
  %v1421 = pyc.mux %v1419, %v1420, %v1074 : i1
  pyc.assign %v1070, %v1421 : i1
  %v1422 = pyc.add %v25, %v30 : i1
  %v1423 = pyc.add %v1422, %v35 : i1
  %v1424 = pyc.add %v1423, %v40 : i1
  %v1425 = pyc.alias %v1424 {pyc.name = "pending_cnt__fastfwd_v3_3__L569"} : i1
  %v1426 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1427 = pyc.constant 1 : i1
  %v1428 = pyc.constant 0 : i1
  %v1429 = pyc.reg %clk, %rst, %v1427, %v1426, %v1428 : i1
  %v1430 = pyc.alias %v1429 {pyc.name = "bkpr_reg"} : i1
  %v1431 = pyc.alias %v1430 {pyc.name = "bkpr__fastfwd_v3_3__L570"} : i1
  %v1432 = pyc.constant 10 : i4
  %v1433 = pyc.zext %v1425 : i1 -> i4
  %v1434 = pyc.ult %v1433, %v1432 : i4
  %v1435 = pyc.not %v1434 : i1
  pyc.assign %v1426, %v1435 : i1
  func.return %v1238, %v1258, %v1243, %v1263, %v1248, %v1268, %v1253, %v1273, %v426, %v446, %v466, %v486, %v506, %v431, %v451, %v471, %v491, %v511, %v436, %v456, %v476, %v496, %v516, %v441, %v461, %v481, %v501, %v521, %v1431 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1
}

}
