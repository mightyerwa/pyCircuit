module attributes {pyc.top = @fastfwd_v3_1, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3_1(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3_1", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_1__L33"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v3_1__L34"} : i2
  %v13 = pyc.wire {pyc.name = "cycle_cnt__next"} : i16
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i16
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i16
  %v17 = pyc.alias %v16 {pyc.name = "cycle_cnt"} : i16
  %v18 = pyc.alias %v17 {pyc.name = "cycle_cnt__fastfwd_v3_1__L35"} : i16
  %v19 = pyc.constant 1 : i16
  %v20 = pyc.add %v18, %v19 : i16
  pyc.assign %v13, %v20 : i16
  %v21 = pyc.alias %v18 {pyc.name = "current_cycle__fastfwd_v3_1__L37"} : i16
  %v22 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_1__L40"} : i16
  %v23 = pyc.alias %lane0_pkt_in_vld {pyc.name = "offset_1__fastfwd_v3_1__L42"} : i1
  %v24 = pyc.add %v23, %lane1_pkt_in_vld : i1
  %v25 = pyc.alias %v24 {pyc.name = "offset_2__fastfwd_v3_1__L43"} : i1
  %v26 = pyc.add %v25, %lane2_pkt_in_vld : i1
  %v27 = pyc.alias %v26 {pyc.name = "offset_3__fastfwd_v3_1__L44"} : i1
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
  %v121 = pyc.alias %v120 {pyc.name = "total_input__fastfwd_v3_1__L58"} : i1
  %v122 = pyc.zext %v121 : i1 -> i16
  %v123 = pyc.add %v22, %v122 : i16
  pyc.assign %v1, %v123 : i16
  %v124 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v125 = pyc.constant 1 : i1
  %v126 = pyc.constant 0 : i1
  %v127 = pyc.reg %clk, %rst, %v125, %v124, %v126 : i1
  %v128 = pyc.alias %v127 {pyc.name = "dep0_valid"} : i1
  %v129 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v130 = pyc.constant 1 : i1
  %v131 = pyc.constant 0 : i1
  %v132 = pyc.reg %clk, %rst, %v130, %v129, %v131 : i1
  %v133 = pyc.alias %v132 {pyc.name = "dep1_valid"} : i1
  %v134 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v135 = pyc.constant 1 : i1
  %v136 = pyc.constant 0 : i1
  %v137 = pyc.reg %clk, %rst, %v135, %v134, %v136 : i1
  %v138 = pyc.alias %v137 {pyc.name = "dep2_valid"} : i1
  %v139 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v140 = pyc.constant 1 : i1
  %v141 = pyc.constant 0 : i1
  %v142 = pyc.reg %clk, %rst, %v140, %v139, %v141 : i1
  %v143 = pyc.alias %v142 {pyc.name = "dep3_valid"} : i1
  %v144 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v145 = pyc.constant 1 : i1
  %v146 = pyc.constant 0 : i1
  %v147 = pyc.reg %clk, %rst, %v145, %v144, %v146 : i1
  %v148 = pyc.alias %v147 {pyc.name = "dep4_valid"} : i1
  %v149 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v150 = pyc.constant 1 : i1
  %v151 = pyc.constant 0 : i1
  %v152 = pyc.reg %clk, %rst, %v150, %v149, %v151 : i1
  %v153 = pyc.alias %v152 {pyc.name = "dep5_valid"} : i1
  %v154 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v155 = pyc.constant 1 : i1
  %v156 = pyc.constant 0 : i1
  %v157 = pyc.reg %clk, %rst, %v155, %v154, %v156 : i1
  %v158 = pyc.alias %v157 {pyc.name = "dep6_valid"} : i1
  %v159 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v160 = pyc.constant 1 : i1
  %v161 = pyc.constant 0 : i1
  %v162 = pyc.reg %clk, %rst, %v160, %v159, %v161 : i1
  %v163 = pyc.alias %v162 {pyc.name = "dep7_valid"} : i1
  %v164 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v165 = pyc.constant 1 : i1
  %v166 = pyc.constant 0 : i128
  %v167 = pyc.reg %clk, %rst, %v165, %v164, %v166 : i128
  %v168 = pyc.alias %v167 {pyc.name = "dep0_data"} : i128
  %v169 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v170 = pyc.constant 1 : i1
  %v171 = pyc.constant 0 : i128
  %v172 = pyc.reg %clk, %rst, %v170, %v169, %v171 : i128
  %v173 = pyc.alias %v172 {pyc.name = "dep1_data"} : i128
  %v174 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v175 = pyc.constant 1 : i1
  %v176 = pyc.constant 0 : i128
  %v177 = pyc.reg %clk, %rst, %v175, %v174, %v176 : i128
  %v178 = pyc.alias %v177 {pyc.name = "dep2_data"} : i128
  %v179 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v180 = pyc.constant 1 : i1
  %v181 = pyc.constant 0 : i128
  %v182 = pyc.reg %clk, %rst, %v180, %v179, %v181 : i128
  %v183 = pyc.alias %v182 {pyc.name = "dep3_data"} : i128
  %v184 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v185 = pyc.constant 1 : i1
  %v186 = pyc.constant 0 : i128
  %v187 = pyc.reg %clk, %rst, %v185, %v184, %v186 : i128
  %v188 = pyc.alias %v187 {pyc.name = "dep4_data"} : i128
  %v189 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v190 = pyc.constant 1 : i1
  %v191 = pyc.constant 0 : i128
  %v192 = pyc.reg %clk, %rst, %v190, %v189, %v191 : i128
  %v193 = pyc.alias %v192 {pyc.name = "dep5_data"} : i128
  %v194 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v195 = pyc.constant 1 : i1
  %v196 = pyc.constant 0 : i128
  %v197 = pyc.reg %clk, %rst, %v195, %v194, %v196 : i128
  %v198 = pyc.alias %v197 {pyc.name = "dep6_data"} : i128
  %v199 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v200 = pyc.constant 1 : i1
  %v201 = pyc.constant 0 : i128
  %v202 = pyc.reg %clk, %rst, %v200, %v199, %v201 : i128
  %v203 = pyc.alias %v202 {pyc.name = "dep7_data"} : i128
  %v204 = pyc.wire {pyc.name = "dep0_seq__next"} : i16
  %v205 = pyc.constant 1 : i1
  %v206 = pyc.constant 0 : i16
  %v207 = pyc.reg %clk, %rst, %v205, %v204, %v206 : i16
  %v208 = pyc.alias %v207 {pyc.name = "dep0_seq"} : i16
  %v209 = pyc.wire {pyc.name = "dep1_seq__next"} : i16
  %v210 = pyc.constant 1 : i1
  %v211 = pyc.constant 0 : i16
  %v212 = pyc.reg %clk, %rst, %v210, %v209, %v211 : i16
  %v213 = pyc.alias %v212 {pyc.name = "dep1_seq"} : i16
  %v214 = pyc.wire {pyc.name = "dep2_seq__next"} : i16
  %v215 = pyc.constant 1 : i1
  %v216 = pyc.constant 0 : i16
  %v217 = pyc.reg %clk, %rst, %v215, %v214, %v216 : i16
  %v218 = pyc.alias %v217 {pyc.name = "dep2_seq"} : i16
  %v219 = pyc.wire {pyc.name = "dep3_seq__next"} : i16
  %v220 = pyc.constant 1 : i1
  %v221 = pyc.constant 0 : i16
  %v222 = pyc.reg %clk, %rst, %v220, %v219, %v221 : i16
  %v223 = pyc.alias %v222 {pyc.name = "dep3_seq"} : i16
  %v224 = pyc.wire {pyc.name = "dep4_seq__next"} : i16
  %v225 = pyc.constant 1 : i1
  %v226 = pyc.constant 0 : i16
  %v227 = pyc.reg %clk, %rst, %v225, %v224, %v226 : i16
  %v228 = pyc.alias %v227 {pyc.name = "dep4_seq"} : i16
  %v229 = pyc.wire {pyc.name = "dep5_seq__next"} : i16
  %v230 = pyc.constant 1 : i1
  %v231 = pyc.constant 0 : i16
  %v232 = pyc.reg %clk, %rst, %v230, %v229, %v231 : i16
  %v233 = pyc.alias %v232 {pyc.name = "dep5_seq"} : i16
  %v234 = pyc.wire {pyc.name = "dep6_seq__next"} : i16
  %v235 = pyc.constant 1 : i1
  %v236 = pyc.constant 0 : i16
  %v237 = pyc.reg %clk, %rst, %v235, %v234, %v236 : i16
  %v238 = pyc.alias %v237 {pyc.name = "dep6_seq"} : i16
  %v239 = pyc.wire {pyc.name = "dep7_seq__next"} : i16
  %v240 = pyc.constant 1 : i1
  %v241 = pyc.constant 0 : i16
  %v242 = pyc.reg %clk, %rst, %v240, %v239, %v241 : i16
  %v243 = pyc.alias %v242 {pyc.name = "dep7_seq"} : i16
  %v244 = pyc.wire {pyc.name = "dep_write_ptr__next"} : i3
  %v245 = pyc.constant 1 : i1
  %v246 = pyc.constant 0 : i3
  %v247 = pyc.reg %clk, %rst, %v245, %v244, %v246 : i3
  %v248 = pyc.alias %v247 {pyc.name = "dep_write_ptr"} : i3
  %v249 = pyc.alias %v248 {pyc.name = "dep_write_ptr__fastfwd_v3_1__L65"} : i3
  %v250 = pyc.constant 0 : i3
  %v251 = pyc.eq %v249, %v250 : i3
  %v252 = pyc.and %fwded0_pkt_data_vld, %v251 : i1
  %v253 = pyc.alias %v252 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v254 = pyc.or %v253, %v128 : i1
  pyc.assign %v124, %v254 : i1
  %v255 = pyc.mux %v253, %fwded0_pkt_data, %v168 : i128
  pyc.assign %v164, %v255 : i128
  %v256 = pyc.mux %v253, %v92, %v208 : i16
  pyc.assign %v204, %v256 : i16
  %v257 = pyc.constant 1 : i3
  %v258 = pyc.eq %v249, %v257 : i3
  %v259 = pyc.and %fwded0_pkt_data_vld, %v258 : i1
  %v260 = pyc.alias %v259 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v261 = pyc.or %v260, %v133 : i1
  pyc.assign %v129, %v261 : i1
  %v262 = pyc.mux %v260, %fwded0_pkt_data, %v173 : i128
  pyc.assign %v169, %v262 : i128
  %v263 = pyc.mux %v260, %v92, %v213 : i16
  pyc.assign %v209, %v263 : i16
  %v264 = pyc.constant 2 : i3
  %v265 = pyc.eq %v249, %v264 : i3
  %v266 = pyc.and %fwded0_pkt_data_vld, %v265 : i1
  %v267 = pyc.alias %v266 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v268 = pyc.or %v267, %v138 : i1
  pyc.assign %v134, %v268 : i1
  %v269 = pyc.mux %v267, %fwded0_pkt_data, %v178 : i128
  pyc.assign %v174, %v269 : i128
  %v270 = pyc.mux %v267, %v92, %v218 : i16
  pyc.assign %v214, %v270 : i16
  %v271 = pyc.constant 3 : i3
  %v272 = pyc.eq %v249, %v271 : i3
  %v273 = pyc.and %fwded0_pkt_data_vld, %v272 : i1
  %v274 = pyc.alias %v273 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v275 = pyc.or %v274, %v143 : i1
  pyc.assign %v139, %v275 : i1
  %v276 = pyc.mux %v274, %fwded0_pkt_data, %v183 : i128
  pyc.assign %v179, %v276 : i128
  %v277 = pyc.mux %v274, %v92, %v223 : i16
  pyc.assign %v219, %v277 : i16
  %v278 = pyc.constant 4 : i3
  %v279 = pyc.eq %v249, %v278 : i3
  %v280 = pyc.and %fwded0_pkt_data_vld, %v279 : i1
  %v281 = pyc.alias %v280 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v282 = pyc.or %v281, %v148 : i1
  pyc.assign %v144, %v282 : i1
  %v283 = pyc.mux %v281, %fwded0_pkt_data, %v188 : i128
  pyc.assign %v184, %v283 : i128
  %v284 = pyc.mux %v281, %v92, %v228 : i16
  pyc.assign %v224, %v284 : i16
  %v285 = pyc.constant 5 : i3
  %v286 = pyc.eq %v249, %v285 : i3
  %v287 = pyc.and %fwded0_pkt_data_vld, %v286 : i1
  %v288 = pyc.alias %v287 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v289 = pyc.or %v288, %v153 : i1
  pyc.assign %v149, %v289 : i1
  %v290 = pyc.mux %v288, %fwded0_pkt_data, %v193 : i128
  pyc.assign %v189, %v290 : i128
  %v291 = pyc.mux %v288, %v92, %v233 : i16
  pyc.assign %v229, %v291 : i16
  %v292 = pyc.constant 6 : i3
  %v293 = pyc.eq %v249, %v292 : i3
  %v294 = pyc.and %fwded0_pkt_data_vld, %v293 : i1
  %v295 = pyc.alias %v294 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v296 = pyc.or %v295, %v158 : i1
  pyc.assign %v154, %v296 : i1
  %v297 = pyc.mux %v295, %fwded0_pkt_data, %v198 : i128
  pyc.assign %v194, %v297 : i128
  %v298 = pyc.mux %v295, %v92, %v238 : i16
  pyc.assign %v234, %v298 : i16
  %v299 = pyc.constant 7 : i3
  %v300 = pyc.eq %v249, %v299 : i3
  %v301 = pyc.and %fwded0_pkt_data_vld, %v300 : i1
  %v302 = pyc.alias %v301 {pyc.name = "should_write__fastfwd_v3_1__L68"} : i1
  %v303 = pyc.or %v302, %v163 : i1
  pyc.assign %v159, %v303 : i1
  %v304 = pyc.mux %v302, %fwded0_pkt_data, %v203 : i128
  pyc.assign %v199, %v304 : i128
  %v305 = pyc.mux %v302, %v92, %v243 : i16
  pyc.assign %v239, %v305 : i16
  %v306 = pyc.constant 1 : i3
  %v307 = pyc.add %v249, %v306 : i3
  %v308 = pyc.constant 7 : i3
  %v309 = pyc.and %v307, %v308 : i3
  %v310 = pyc.alias %v309 {pyc.name = "new_dep_ptr__fastfwd_v3_1__L73"} : i3
  %v311 = pyc.mux %fwded0_pkt_data_vld, %v310, %v249 : i3
  pyc.assign %v244, %v311 : i3
  %v312 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v313 = pyc.constant 1 : i1
  %v314 = pyc.constant 0 : i1
  %v315 = pyc.reg %clk, %rst, %v313, %v312, %v314 : i1
  %v316 = pyc.alias %v315 {pyc.name = "fe0_busy"} : i1
  %v317 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v318 = pyc.constant 1 : i1
  %v319 = pyc.constant 0 : i1
  %v320 = pyc.reg %clk, %rst, %v318, %v317, %v319 : i1
  %v321 = pyc.alias %v320 {pyc.name = "fe1_busy"} : i1
  %v322 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v323 = pyc.constant 1 : i1
  %v324 = pyc.constant 0 : i1
  %v325 = pyc.reg %clk, %rst, %v323, %v322, %v324 : i1
  %v326 = pyc.alias %v325 {pyc.name = "fe2_busy"} : i1
  %v327 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v328 = pyc.constant 1 : i1
  %v329 = pyc.constant 0 : i1
  %v330 = pyc.reg %clk, %rst, %v328, %v327, %v329 : i1
  %v331 = pyc.alias %v330 {pyc.name = "fe3_busy"} : i1
  %v332 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v333 = pyc.constant 1 : i1
  %v334 = pyc.constant 0 : i3
  %v335 = pyc.reg %clk, %rst, %v333, %v332, %v334 : i3
  %v336 = pyc.alias %v335 {pyc.name = "fe0_timer"} : i3
  %v337 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v338 = pyc.constant 1 : i1
  %v339 = pyc.constant 0 : i3
  %v340 = pyc.reg %clk, %rst, %v338, %v337, %v339 : i3
  %v341 = pyc.alias %v340 {pyc.name = "fe1_timer"} : i3
  %v342 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v343 = pyc.constant 1 : i1
  %v344 = pyc.constant 0 : i3
  %v345 = pyc.reg %clk, %rst, %v343, %v342, %v344 : i3
  %v346 = pyc.alias %v345 {pyc.name = "fe2_timer"} : i3
  %v347 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v348 = pyc.constant 1 : i1
  %v349 = pyc.constant 0 : i3
  %v350 = pyc.reg %clk, %rst, %v348, %v347, %v349 : i3
  %v351 = pyc.alias %v350 {pyc.name = "fe3_timer"} : i3
  %v352 = pyc.wire {pyc.name = "fe0_last_finish__next"} : i6
  %v353 = pyc.constant 1 : i1
  %v354 = pyc.constant 0 : i6
  %v355 = pyc.reg %clk, %rst, %v353, %v352, %v354 : i6
  %v356 = pyc.alias %v355 {pyc.name = "fe0_last_finish"} : i6
  %v357 = pyc.wire {pyc.name = "fe1_last_finish__next"} : i6
  %v358 = pyc.constant 1 : i1
  %v359 = pyc.constant 0 : i6
  %v360 = pyc.reg %clk, %rst, %v358, %v357, %v359 : i6
  %v361 = pyc.alias %v360 {pyc.name = "fe1_last_finish"} : i6
  %v362 = pyc.wire {pyc.name = "fe2_last_finish__next"} : i6
  %v363 = pyc.constant 1 : i1
  %v364 = pyc.constant 0 : i6
  %v365 = pyc.reg %clk, %rst, %v363, %v362, %v364 : i6
  %v366 = pyc.alias %v365 {pyc.name = "fe2_last_finish"} : i6
  %v367 = pyc.wire {pyc.name = "fe3_last_finish__next"} : i6
  %v368 = pyc.constant 1 : i1
  %v369 = pyc.constant 0 : i6
  %v370 = pyc.reg %clk, %rst, %v368, %v367, %v369 : i6
  %v371 = pyc.alias %v370 {pyc.name = "fe3_last_finish"} : i6
  %v372 = pyc.wire {pyc.name = "fwd0_pkt_data_vld__next"} : i1
  %v373 = pyc.constant 1 : i1
  %v374 = pyc.constant 0 : i1
  %v375 = pyc.reg %clk, %rst, %v373, %v372, %v374 : i1
  %v376 = pyc.alias %v375 {pyc.name = "fwd0_pkt_data_vld"} : i1
  %v377 = pyc.wire {pyc.name = "fwd1_pkt_data_vld__next"} : i1
  %v378 = pyc.constant 1 : i1
  %v379 = pyc.constant 0 : i1
  %v380 = pyc.reg %clk, %rst, %v378, %v377, %v379 : i1
  %v381 = pyc.alias %v380 {pyc.name = "fwd1_pkt_data_vld"} : i1
  %v382 = pyc.wire {pyc.name = "fwd2_pkt_data_vld__next"} : i1
  %v383 = pyc.constant 1 : i1
  %v384 = pyc.constant 0 : i1
  %v385 = pyc.reg %clk, %rst, %v383, %v382, %v384 : i1
  %v386 = pyc.alias %v385 {pyc.name = "fwd2_pkt_data_vld"} : i1
  %v387 = pyc.wire {pyc.name = "fwd3_pkt_data_vld__next"} : i1
  %v388 = pyc.constant 1 : i1
  %v389 = pyc.constant 0 : i1
  %v390 = pyc.reg %clk, %rst, %v388, %v387, %v389 : i1
  %v391 = pyc.alias %v390 {pyc.name = "fwd3_pkt_data_vld"} : i1
  %v392 = pyc.wire {pyc.name = "fwd0_pkt_data__next"} : i128
  %v393 = pyc.constant 1 : i1
  %v394 = pyc.constant 0 : i128
  %v395 = pyc.reg %clk, %rst, %v393, %v392, %v394 : i128
  %v396 = pyc.alias %v395 {pyc.name = "fwd0_pkt_data"} : i128
  %v397 = pyc.wire {pyc.name = "fwd1_pkt_data__next"} : i128
  %v398 = pyc.constant 1 : i1
  %v399 = pyc.constant 0 : i128
  %v400 = pyc.reg %clk, %rst, %v398, %v397, %v399 : i128
  %v401 = pyc.alias %v400 {pyc.name = "fwd1_pkt_data"} : i128
  %v402 = pyc.wire {pyc.name = "fwd2_pkt_data__next"} : i128
  %v403 = pyc.constant 1 : i1
  %v404 = pyc.constant 0 : i128
  %v405 = pyc.reg %clk, %rst, %v403, %v402, %v404 : i128
  %v406 = pyc.alias %v405 {pyc.name = "fwd2_pkt_data"} : i128
  %v407 = pyc.wire {pyc.name = "fwd3_pkt_data__next"} : i128
  %v408 = pyc.constant 1 : i1
  %v409 = pyc.constant 0 : i128
  %v410 = pyc.reg %clk, %rst, %v408, %v407, %v409 : i128
  %v411 = pyc.alias %v410 {pyc.name = "fwd3_pkt_data"} : i128
  %v412 = pyc.wire {pyc.name = "fwd0_pkt_lat__next"} : i2
  %v413 = pyc.constant 1 : i1
  %v414 = pyc.constant 0 : i2
  %v415 = pyc.reg %clk, %rst, %v413, %v412, %v414 : i2
  %v416 = pyc.alias %v415 {pyc.name = "fwd0_pkt_lat"} : i2
  %v417 = pyc.wire {pyc.name = "fwd1_pkt_lat__next"} : i2
  %v418 = pyc.constant 1 : i1
  %v419 = pyc.constant 0 : i2
  %v420 = pyc.reg %clk, %rst, %v418, %v417, %v419 : i2
  %v421 = pyc.alias %v420 {pyc.name = "fwd1_pkt_lat"} : i2
  %v422 = pyc.wire {pyc.name = "fwd2_pkt_lat__next"} : i2
  %v423 = pyc.constant 1 : i1
  %v424 = pyc.constant 0 : i2
  %v425 = pyc.reg %clk, %rst, %v423, %v422, %v424 : i2
  %v426 = pyc.alias %v425 {pyc.name = "fwd2_pkt_lat"} : i2
  %v427 = pyc.wire {pyc.name = "fwd3_pkt_lat__next"} : i2
  %v428 = pyc.constant 1 : i1
  %v429 = pyc.constant 0 : i2
  %v430 = pyc.reg %clk, %rst, %v428, %v427, %v429 : i2
  %v431 = pyc.alias %v430 {pyc.name = "fwd3_pkt_lat"} : i2
  %v432 = pyc.wire {pyc.name = "fwd0_pkt_dp_vld__next"} : i1
  %v433 = pyc.constant 1 : i1
  %v434 = pyc.constant 0 : i1
  %v435 = pyc.reg %clk, %rst, %v433, %v432, %v434 : i1
  %v436 = pyc.alias %v435 {pyc.name = "fwd0_pkt_dp_vld"} : i1
  %v437 = pyc.wire {pyc.name = "fwd1_pkt_dp_vld__next"} : i1
  %v438 = pyc.constant 1 : i1
  %v439 = pyc.constant 0 : i1
  %v440 = pyc.reg %clk, %rst, %v438, %v437, %v439 : i1
  %v441 = pyc.alias %v440 {pyc.name = "fwd1_pkt_dp_vld"} : i1
  %v442 = pyc.wire {pyc.name = "fwd2_pkt_dp_vld__next"} : i1
  %v443 = pyc.constant 1 : i1
  %v444 = pyc.constant 0 : i1
  %v445 = pyc.reg %clk, %rst, %v443, %v442, %v444 : i1
  %v446 = pyc.alias %v445 {pyc.name = "fwd2_pkt_dp_vld"} : i1
  %v447 = pyc.wire {pyc.name = "fwd3_pkt_dp_vld__next"} : i1
  %v448 = pyc.constant 1 : i1
  %v449 = pyc.constant 0 : i1
  %v450 = pyc.reg %clk, %rst, %v448, %v447, %v449 : i1
  %v451 = pyc.alias %v450 {pyc.name = "fwd3_pkt_dp_vld"} : i1
  %v452 = pyc.wire {pyc.name = "fwd0_pkt_dp_data__next"} : i128
  %v453 = pyc.constant 1 : i1
  %v454 = pyc.constant 0 : i128
  %v455 = pyc.reg %clk, %rst, %v453, %v452, %v454 : i128
  %v456 = pyc.alias %v455 {pyc.name = "fwd0_pkt_dp_data"} : i128
  %v457 = pyc.wire {pyc.name = "fwd1_pkt_dp_data__next"} : i128
  %v458 = pyc.constant 1 : i1
  %v459 = pyc.constant 0 : i128
  %v460 = pyc.reg %clk, %rst, %v458, %v457, %v459 : i128
  %v461 = pyc.alias %v460 {pyc.name = "fwd1_pkt_dp_data"} : i128
  %v462 = pyc.wire {pyc.name = "fwd2_pkt_dp_data__next"} : i128
  %v463 = pyc.constant 1 : i1
  %v464 = pyc.constant 0 : i128
  %v465 = pyc.reg %clk, %rst, %v463, %v462, %v464 : i128
  %v466 = pyc.alias %v465 {pyc.name = "fwd2_pkt_dp_data"} : i128
  %v467 = pyc.wire {pyc.name = "fwd3_pkt_dp_data__next"} : i128
  %v468 = pyc.constant 1 : i1
  %v469 = pyc.constant 0 : i128
  %v470 = pyc.reg %clk, %rst, %v468, %v467, %v469 : i128
  %v471 = pyc.alias %v470 {pyc.name = "fwd3_pkt_dp_data"} : i128
  %v472 = pyc.constant 3 : i5
  %v473 = pyc.and %v72, %v472 : i5
  %v474 = pyc.alias %v473 {pyc.name = "lat__fastfwd_v3_1__L88"} : i5
  %v475 = pyc.lshri %v72 {amount = 2} : i5
  %v476 = pyc.constant 7 : i5
  %v477 = pyc.and %v475, %v476 : i5
  %v478 = pyc.alias %v477 {pyc.name = "dep__fastfwd_v3_1__L89"} : i5
  %v479 = pyc.constant 2 : i6
  %v480 = pyc.zext %v479 : i6 -> i16
  %v481 = pyc.add %v21, %v480 : i16
  %v482 = pyc.zext %v474 : i5 -> i16
  %v483 = pyc.add %v481, %v482 : i16
  %v484 = pyc.alias %v483 {pyc.name = "finish_cycle__fastfwd_v3_1__L90"} : i16
  %v485 = pyc.zext %v356 : i6 -> i16
  %v486 = pyc.ult %v485, %v484 : i16
  %v487 = pyc.alias %v486 {pyc.name = "constraint_ok__fastfwd_v3_1__L91"} : i1
  %v488 = pyc.not %v316 : i1
  %v489 = pyc.and %v488, %v32 : i1
  %v490 = pyc.and %v489, %v487 : i1
  %v491 = pyc.alias %v490 {pyc.name = "can_schedule__fastfwd_v3_1__L92"} : i1
  %v492 = pyc.zext %v478 : i5 -> i16
  %v493 = pyc.sub %v92, %v492 : i16
  %v494 = pyc.alias %v493 {pyc.name = "target_seq__fastfwd_v3_1__L95"} : i16
  %v495 = pyc.eq %v208, %v494 : i16
  %v496 = pyc.and %v128, %v495 : i1
  %v497 = pyc.alias %v496 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v498 = pyc.constant 0 : i1
  %v499 = pyc.or %v497, %v498 : i1
  %v500 = pyc.alias %v499 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v501 = pyc.not %v497 : i1
  %v502 = pyc.constant 0 : i128
  %v503 = pyc.mux %v501, %v502, %v168 : i128
  %v504 = pyc.alias %v503 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v505 = pyc.eq %v213, %v494 : i16
  %v506 = pyc.and %v133, %v505 : i1
  %v507 = pyc.alias %v506 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v508 = pyc.or %v500, %v507 : i1
  %v509 = pyc.alias %v508 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v510 = pyc.not %v507 : i1
  %v511 = pyc.mux %v510, %v504, %v173 : i128
  %v512 = pyc.alias %v511 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v513 = pyc.eq %v218, %v494 : i16
  %v514 = pyc.and %v138, %v513 : i1
  %v515 = pyc.alias %v514 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v516 = pyc.or %v509, %v515 : i1
  %v517 = pyc.alias %v516 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v518 = pyc.not %v515 : i1
  %v519 = pyc.mux %v518, %v512, %v178 : i128
  %v520 = pyc.alias %v519 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v521 = pyc.eq %v223, %v494 : i16
  %v522 = pyc.and %v143, %v521 : i1
  %v523 = pyc.alias %v522 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v524 = pyc.or %v517, %v523 : i1
  %v525 = pyc.alias %v524 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v526 = pyc.not %v523 : i1
  %v527 = pyc.mux %v526, %v520, %v183 : i128
  %v528 = pyc.alias %v527 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v529 = pyc.eq %v228, %v494 : i16
  %v530 = pyc.and %v148, %v529 : i1
  %v531 = pyc.alias %v530 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v532 = pyc.or %v525, %v531 : i1
  %v533 = pyc.alias %v532 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v534 = pyc.not %v531 : i1
  %v535 = pyc.mux %v534, %v528, %v188 : i128
  %v536 = pyc.alias %v535 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v537 = pyc.eq %v233, %v494 : i16
  %v538 = pyc.and %v153, %v537 : i1
  %v539 = pyc.alias %v538 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v540 = pyc.or %v533, %v539 : i1
  %v541 = pyc.alias %v540 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v542 = pyc.not %v539 : i1
  %v543 = pyc.mux %v542, %v536, %v193 : i128
  %v544 = pyc.alias %v543 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v545 = pyc.eq %v238, %v494 : i16
  %v546 = pyc.and %v158, %v545 : i1
  %v547 = pyc.alias %v546 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v548 = pyc.or %v541, %v547 : i1
  %v549 = pyc.alias %v548 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v550 = pyc.not %v547 : i1
  %v551 = pyc.mux %v550, %v544, %v198 : i128
  %v552 = pyc.alias %v551 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v553 = pyc.eq %v243, %v494 : i16
  %v554 = pyc.and %v163, %v553 : i1
  %v555 = pyc.alias %v554 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v556 = pyc.or %v549, %v555 : i1
  %v557 = pyc.alias %v556 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v558 = pyc.not %v555 : i1
  %v559 = pyc.mux %v558, %v552, %v203 : i128
  %v560 = pyc.alias %v559 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v561 = pyc.constant 0 : i3
  %v562 = pyc.zext %v561 : i3 -> i5
  %v563 = pyc.eq %v478, %v562 : i5
  %v564 = pyc.not %v563 : i1
  %v565 = pyc.alias %v564 {pyc.name = "has_dep__fastfwd_v3_1__L103"} : i1
  %v566 = pyc.and %v565, %v557 : i1
  %v567 = pyc.alias %v566 {pyc.name = "dep_ready__fastfwd_v3_1__L104"} : i1
  %v568 = pyc.not %v565 : i1
  %v569 = pyc.or %v568, %v567 : i1
  %v570 = pyc.and %v491, %v569 : i1
  %v571 = pyc.alias %v570 {pyc.name = "can_schedule__fastfwd_v3_1__L105"} : i1
  %v572 = pyc.constant 1 : i3
  %v573 = pyc.ult %v572, %v336 : i3
  %v574 = pyc.and %v316, %v573 : i1
  %v575 = pyc.or %v571, %v574 : i1
  pyc.assign %v312, %v575 : i1
  %v576 = pyc.constant 1 : i3
  %v577 = pyc.zext %v576 : i3 -> i5
  %v578 = pyc.add %v474, %v577 : i5
  %v579 = pyc.constant 1 : i3
  %v580 = pyc.sub %v336, %v579 : i3
  %v581 = pyc.constant 0 : i3
  %v582 = pyc.mux %v316, %v580, %v581 : i3
  %v583 = pyc.zext %v582 : i3 -> i5
  %v584 = pyc.mux %v571, %v578, %v583 : i5
  %v585 = pyc.alias %v584 {pyc.name = "new_timer__fastfwd_v3_1__L108"} : i5
  %v586 = pyc.trunc %v585 : i5 -> i3
  pyc.assign %v332, %v586 : i3
  %v587 = pyc.zext %v356 : i6 -> i16
  %v588 = pyc.mux %v571, %v484, %v587 : i16
  %v589 = pyc.trunc %v588 : i16 -> i6
  pyc.assign %v352, %v589 : i6
  pyc.assign %v372, %v571 : i1
  %v590 = pyc.constant 0 : i128
  %v591 = pyc.mux %v571, %v52, %v590 : i128
  pyc.assign %v392, %v591 : i128
  %v592 = pyc.constant 0 : i2
  %v593 = pyc.zext %v592 : i2 -> i5
  %v594 = pyc.mux %v571, %v474, %v593 : i5
  %v595 = pyc.trunc %v594 : i5 -> i2
  pyc.assign %v412, %v595 : i2
  %v596 = pyc.and %v565, %v571 : i1
  pyc.assign %v432, %v596 : i1
  %v597 = pyc.and %v565, %v571 : i1
  %v598 = pyc.constant 0 : i128
  %v599 = pyc.mux %v597, %v560, %v598 : i128
  pyc.assign %v452, %v599 : i128
  %v600 = pyc.constant 3 : i5
  %v601 = pyc.and %v77, %v600 : i5
  %v602 = pyc.alias %v601 {pyc.name = "lat__fastfwd_v3_1__L88"} : i5
  %v603 = pyc.lshri %v77 {amount = 2} : i5
  %v604 = pyc.constant 7 : i5
  %v605 = pyc.and %v603, %v604 : i5
  %v606 = pyc.alias %v605 {pyc.name = "dep__fastfwd_v3_1__L89"} : i5
  %v607 = pyc.constant 2 : i6
  %v608 = pyc.zext %v607 : i6 -> i16
  %v609 = pyc.add %v21, %v608 : i16
  %v610 = pyc.zext %v602 : i5 -> i16
  %v611 = pyc.add %v609, %v610 : i16
  %v612 = pyc.alias %v611 {pyc.name = "finish_cycle__fastfwd_v3_1__L90"} : i16
  %v613 = pyc.zext %v361 : i6 -> i16
  %v614 = pyc.ult %v613, %v612 : i16
  %v615 = pyc.alias %v614 {pyc.name = "constraint_ok__fastfwd_v3_1__L91"} : i1
  %v616 = pyc.not %v321 : i1
  %v617 = pyc.and %v616, %v37 : i1
  %v618 = pyc.and %v617, %v615 : i1
  %v619 = pyc.alias %v618 {pyc.name = "can_schedule__fastfwd_v3_1__L92"} : i1
  %v620 = pyc.zext %v606 : i5 -> i16
  %v621 = pyc.sub %v97, %v620 : i16
  %v622 = pyc.alias %v621 {pyc.name = "target_seq__fastfwd_v3_1__L95"} : i16
  %v623 = pyc.eq %v208, %v622 : i16
  %v624 = pyc.and %v128, %v623 : i1
  %v625 = pyc.alias %v624 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v626 = pyc.constant 0 : i1
  %v627 = pyc.or %v625, %v626 : i1
  %v628 = pyc.alias %v627 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v629 = pyc.not %v625 : i1
  %v630 = pyc.constant 0 : i128
  %v631 = pyc.mux %v629, %v630, %v168 : i128
  %v632 = pyc.alias %v631 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v633 = pyc.eq %v213, %v622 : i16
  %v634 = pyc.and %v133, %v633 : i1
  %v635 = pyc.alias %v634 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v636 = pyc.or %v628, %v635 : i1
  %v637 = pyc.alias %v636 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v638 = pyc.not %v635 : i1
  %v639 = pyc.mux %v638, %v632, %v173 : i128
  %v640 = pyc.alias %v639 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v641 = pyc.eq %v218, %v622 : i16
  %v642 = pyc.and %v138, %v641 : i1
  %v643 = pyc.alias %v642 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v644 = pyc.or %v637, %v643 : i1
  %v645 = pyc.alias %v644 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v646 = pyc.not %v643 : i1
  %v647 = pyc.mux %v646, %v640, %v178 : i128
  %v648 = pyc.alias %v647 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v649 = pyc.eq %v223, %v622 : i16
  %v650 = pyc.and %v143, %v649 : i1
  %v651 = pyc.alias %v650 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v652 = pyc.or %v645, %v651 : i1
  %v653 = pyc.alias %v652 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v654 = pyc.not %v651 : i1
  %v655 = pyc.mux %v654, %v648, %v183 : i128
  %v656 = pyc.alias %v655 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v657 = pyc.eq %v228, %v622 : i16
  %v658 = pyc.and %v148, %v657 : i1
  %v659 = pyc.alias %v658 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v660 = pyc.or %v653, %v659 : i1
  %v661 = pyc.alias %v660 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v662 = pyc.not %v659 : i1
  %v663 = pyc.mux %v662, %v656, %v188 : i128
  %v664 = pyc.alias %v663 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v665 = pyc.eq %v233, %v622 : i16
  %v666 = pyc.and %v153, %v665 : i1
  %v667 = pyc.alias %v666 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v668 = pyc.or %v661, %v667 : i1
  %v669 = pyc.alias %v668 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v670 = pyc.not %v667 : i1
  %v671 = pyc.mux %v670, %v664, %v193 : i128
  %v672 = pyc.alias %v671 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v673 = pyc.eq %v238, %v622 : i16
  %v674 = pyc.and %v158, %v673 : i1
  %v675 = pyc.alias %v674 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v676 = pyc.or %v669, %v675 : i1
  %v677 = pyc.alias %v676 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v678 = pyc.not %v675 : i1
  %v679 = pyc.mux %v678, %v672, %v198 : i128
  %v680 = pyc.alias %v679 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v681 = pyc.eq %v243, %v622 : i16
  %v682 = pyc.and %v163, %v681 : i1
  %v683 = pyc.alias %v682 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v684 = pyc.or %v677, %v683 : i1
  %v685 = pyc.alias %v684 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v686 = pyc.not %v683 : i1
  %v687 = pyc.mux %v686, %v680, %v203 : i128
  %v688 = pyc.alias %v687 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v689 = pyc.constant 0 : i3
  %v690 = pyc.zext %v689 : i3 -> i5
  %v691 = pyc.eq %v606, %v690 : i5
  %v692 = pyc.not %v691 : i1
  %v693 = pyc.alias %v692 {pyc.name = "has_dep__fastfwd_v3_1__L103"} : i1
  %v694 = pyc.and %v693, %v685 : i1
  %v695 = pyc.alias %v694 {pyc.name = "dep_ready__fastfwd_v3_1__L104"} : i1
  %v696 = pyc.not %v693 : i1
  %v697 = pyc.or %v696, %v695 : i1
  %v698 = pyc.and %v619, %v697 : i1
  %v699 = pyc.alias %v698 {pyc.name = "can_schedule__fastfwd_v3_1__L105"} : i1
  %v700 = pyc.constant 1 : i3
  %v701 = pyc.ult %v700, %v341 : i3
  %v702 = pyc.and %v321, %v701 : i1
  %v703 = pyc.or %v699, %v702 : i1
  pyc.assign %v317, %v703 : i1
  %v704 = pyc.constant 1 : i3
  %v705 = pyc.zext %v704 : i3 -> i5
  %v706 = pyc.add %v602, %v705 : i5
  %v707 = pyc.constant 1 : i3
  %v708 = pyc.sub %v341, %v707 : i3
  %v709 = pyc.constant 0 : i3
  %v710 = pyc.mux %v321, %v708, %v709 : i3
  %v711 = pyc.zext %v710 : i3 -> i5
  %v712 = pyc.mux %v699, %v706, %v711 : i5
  %v713 = pyc.alias %v712 {pyc.name = "new_timer__fastfwd_v3_1__L108"} : i5
  %v714 = pyc.trunc %v713 : i5 -> i3
  pyc.assign %v337, %v714 : i3
  %v715 = pyc.zext %v361 : i6 -> i16
  %v716 = pyc.mux %v699, %v612, %v715 : i16
  %v717 = pyc.trunc %v716 : i16 -> i6
  pyc.assign %v357, %v717 : i6
  pyc.assign %v377, %v699 : i1
  %v718 = pyc.constant 0 : i128
  %v719 = pyc.mux %v699, %v57, %v718 : i128
  pyc.assign %v397, %v719 : i128
  %v720 = pyc.constant 0 : i2
  %v721 = pyc.zext %v720 : i2 -> i5
  %v722 = pyc.mux %v699, %v602, %v721 : i5
  %v723 = pyc.trunc %v722 : i5 -> i2
  pyc.assign %v417, %v723 : i2
  %v724 = pyc.and %v693, %v699 : i1
  pyc.assign %v437, %v724 : i1
  %v725 = pyc.and %v693, %v699 : i1
  %v726 = pyc.constant 0 : i128
  %v727 = pyc.mux %v725, %v688, %v726 : i128
  pyc.assign %v457, %v727 : i128
  %v728 = pyc.constant 3 : i5
  %v729 = pyc.and %v82, %v728 : i5
  %v730 = pyc.alias %v729 {pyc.name = "lat__fastfwd_v3_1__L88"} : i5
  %v731 = pyc.lshri %v82 {amount = 2} : i5
  %v732 = pyc.constant 7 : i5
  %v733 = pyc.and %v731, %v732 : i5
  %v734 = pyc.alias %v733 {pyc.name = "dep__fastfwd_v3_1__L89"} : i5
  %v735 = pyc.constant 2 : i6
  %v736 = pyc.zext %v735 : i6 -> i16
  %v737 = pyc.add %v21, %v736 : i16
  %v738 = pyc.zext %v730 : i5 -> i16
  %v739 = pyc.add %v737, %v738 : i16
  %v740 = pyc.alias %v739 {pyc.name = "finish_cycle__fastfwd_v3_1__L90"} : i16
  %v741 = pyc.zext %v366 : i6 -> i16
  %v742 = pyc.ult %v741, %v740 : i16
  %v743 = pyc.alias %v742 {pyc.name = "constraint_ok__fastfwd_v3_1__L91"} : i1
  %v744 = pyc.not %v326 : i1
  %v745 = pyc.and %v744, %v42 : i1
  %v746 = pyc.and %v745, %v743 : i1
  %v747 = pyc.alias %v746 {pyc.name = "can_schedule__fastfwd_v3_1__L92"} : i1
  %v748 = pyc.zext %v734 : i5 -> i16
  %v749 = pyc.sub %v102, %v748 : i16
  %v750 = pyc.alias %v749 {pyc.name = "target_seq__fastfwd_v3_1__L95"} : i16
  %v751 = pyc.eq %v208, %v750 : i16
  %v752 = pyc.and %v128, %v751 : i1
  %v753 = pyc.alias %v752 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v754 = pyc.constant 0 : i1
  %v755 = pyc.or %v753, %v754 : i1
  %v756 = pyc.alias %v755 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v757 = pyc.not %v753 : i1
  %v758 = pyc.constant 0 : i128
  %v759 = pyc.mux %v757, %v758, %v168 : i128
  %v760 = pyc.alias %v759 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v761 = pyc.eq %v213, %v750 : i16
  %v762 = pyc.and %v133, %v761 : i1
  %v763 = pyc.alias %v762 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v764 = pyc.or %v756, %v763 : i1
  %v765 = pyc.alias %v764 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v766 = pyc.not %v763 : i1
  %v767 = pyc.mux %v766, %v760, %v173 : i128
  %v768 = pyc.alias %v767 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v769 = pyc.eq %v218, %v750 : i16
  %v770 = pyc.and %v138, %v769 : i1
  %v771 = pyc.alias %v770 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v772 = pyc.or %v765, %v771 : i1
  %v773 = pyc.alias %v772 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v774 = pyc.not %v771 : i1
  %v775 = pyc.mux %v774, %v768, %v178 : i128
  %v776 = pyc.alias %v775 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v777 = pyc.eq %v223, %v750 : i16
  %v778 = pyc.and %v143, %v777 : i1
  %v779 = pyc.alias %v778 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v780 = pyc.or %v773, %v779 : i1
  %v781 = pyc.alias %v780 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v782 = pyc.not %v779 : i1
  %v783 = pyc.mux %v782, %v776, %v183 : i128
  %v784 = pyc.alias %v783 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v785 = pyc.eq %v228, %v750 : i16
  %v786 = pyc.and %v148, %v785 : i1
  %v787 = pyc.alias %v786 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v788 = pyc.or %v781, %v787 : i1
  %v789 = pyc.alias %v788 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v790 = pyc.not %v787 : i1
  %v791 = pyc.mux %v790, %v784, %v188 : i128
  %v792 = pyc.alias %v791 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v793 = pyc.eq %v233, %v750 : i16
  %v794 = pyc.and %v153, %v793 : i1
  %v795 = pyc.alias %v794 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v796 = pyc.or %v789, %v795 : i1
  %v797 = pyc.alias %v796 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v798 = pyc.not %v795 : i1
  %v799 = pyc.mux %v798, %v792, %v193 : i128
  %v800 = pyc.alias %v799 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v801 = pyc.eq %v238, %v750 : i16
  %v802 = pyc.and %v158, %v801 : i1
  %v803 = pyc.alias %v802 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v804 = pyc.or %v797, %v803 : i1
  %v805 = pyc.alias %v804 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v806 = pyc.not %v803 : i1
  %v807 = pyc.mux %v806, %v800, %v198 : i128
  %v808 = pyc.alias %v807 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v809 = pyc.eq %v243, %v750 : i16
  %v810 = pyc.and %v163, %v809 : i1
  %v811 = pyc.alias %v810 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v812 = pyc.or %v805, %v811 : i1
  %v813 = pyc.alias %v812 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v814 = pyc.not %v811 : i1
  %v815 = pyc.mux %v814, %v808, %v203 : i128
  %v816 = pyc.alias %v815 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v817 = pyc.constant 0 : i3
  %v818 = pyc.zext %v817 : i3 -> i5
  %v819 = pyc.eq %v734, %v818 : i5
  %v820 = pyc.not %v819 : i1
  %v821 = pyc.alias %v820 {pyc.name = "has_dep__fastfwd_v3_1__L103"} : i1
  %v822 = pyc.and %v821, %v813 : i1
  %v823 = pyc.alias %v822 {pyc.name = "dep_ready__fastfwd_v3_1__L104"} : i1
  %v824 = pyc.not %v821 : i1
  %v825 = pyc.or %v824, %v823 : i1
  %v826 = pyc.and %v747, %v825 : i1
  %v827 = pyc.alias %v826 {pyc.name = "can_schedule__fastfwd_v3_1__L105"} : i1
  %v828 = pyc.constant 1 : i3
  %v829 = pyc.ult %v828, %v346 : i3
  %v830 = pyc.and %v326, %v829 : i1
  %v831 = pyc.or %v827, %v830 : i1
  pyc.assign %v322, %v831 : i1
  %v832 = pyc.constant 1 : i3
  %v833 = pyc.zext %v832 : i3 -> i5
  %v834 = pyc.add %v730, %v833 : i5
  %v835 = pyc.constant 1 : i3
  %v836 = pyc.sub %v346, %v835 : i3
  %v837 = pyc.constant 0 : i3
  %v838 = pyc.mux %v326, %v836, %v837 : i3
  %v839 = pyc.zext %v838 : i3 -> i5
  %v840 = pyc.mux %v827, %v834, %v839 : i5
  %v841 = pyc.alias %v840 {pyc.name = "new_timer__fastfwd_v3_1__L108"} : i5
  %v842 = pyc.trunc %v841 : i5 -> i3
  pyc.assign %v342, %v842 : i3
  %v843 = pyc.zext %v366 : i6 -> i16
  %v844 = pyc.mux %v827, %v740, %v843 : i16
  %v845 = pyc.trunc %v844 : i16 -> i6
  pyc.assign %v362, %v845 : i6
  pyc.assign %v382, %v827 : i1
  %v846 = pyc.constant 0 : i128
  %v847 = pyc.mux %v827, %v62, %v846 : i128
  pyc.assign %v402, %v847 : i128
  %v848 = pyc.constant 0 : i2
  %v849 = pyc.zext %v848 : i2 -> i5
  %v850 = pyc.mux %v827, %v730, %v849 : i5
  %v851 = pyc.trunc %v850 : i5 -> i2
  pyc.assign %v422, %v851 : i2
  %v852 = pyc.and %v821, %v827 : i1
  pyc.assign %v442, %v852 : i1
  %v853 = pyc.and %v821, %v827 : i1
  %v854 = pyc.constant 0 : i128
  %v855 = pyc.mux %v853, %v816, %v854 : i128
  pyc.assign %v462, %v855 : i128
  %v856 = pyc.constant 3 : i5
  %v857 = pyc.and %v87, %v856 : i5
  %v858 = pyc.alias %v857 {pyc.name = "lat__fastfwd_v3_1__L88"} : i5
  %v859 = pyc.lshri %v87 {amount = 2} : i5
  %v860 = pyc.constant 7 : i5
  %v861 = pyc.and %v859, %v860 : i5
  %v862 = pyc.alias %v861 {pyc.name = "dep__fastfwd_v3_1__L89"} : i5
  %v863 = pyc.constant 2 : i6
  %v864 = pyc.zext %v863 : i6 -> i16
  %v865 = pyc.add %v21, %v864 : i16
  %v866 = pyc.zext %v858 : i5 -> i16
  %v867 = pyc.add %v865, %v866 : i16
  %v868 = pyc.alias %v867 {pyc.name = "finish_cycle__fastfwd_v3_1__L90"} : i16
  %v869 = pyc.zext %v371 : i6 -> i16
  %v870 = pyc.ult %v869, %v868 : i16
  %v871 = pyc.alias %v870 {pyc.name = "constraint_ok__fastfwd_v3_1__L91"} : i1
  %v872 = pyc.not %v331 : i1
  %v873 = pyc.and %v872, %v47 : i1
  %v874 = pyc.and %v873, %v871 : i1
  %v875 = pyc.alias %v874 {pyc.name = "can_schedule__fastfwd_v3_1__L92"} : i1
  %v876 = pyc.zext %v862 : i5 -> i16
  %v877 = pyc.sub %v107, %v876 : i16
  %v878 = pyc.alias %v877 {pyc.name = "target_seq__fastfwd_v3_1__L95"} : i16
  %v879 = pyc.eq %v208, %v878 : i16
  %v880 = pyc.and %v128, %v879 : i1
  %v881 = pyc.alias %v880 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v882 = pyc.constant 0 : i1
  %v883 = pyc.or %v881, %v882 : i1
  %v884 = pyc.alias %v883 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v885 = pyc.not %v881 : i1
  %v886 = pyc.constant 0 : i128
  %v887 = pyc.mux %v885, %v886, %v168 : i128
  %v888 = pyc.alias %v887 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v889 = pyc.eq %v213, %v878 : i16
  %v890 = pyc.and %v133, %v889 : i1
  %v891 = pyc.alias %v890 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v892 = pyc.or %v884, %v891 : i1
  %v893 = pyc.alias %v892 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v894 = pyc.not %v891 : i1
  %v895 = pyc.mux %v894, %v888, %v173 : i128
  %v896 = pyc.alias %v895 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v897 = pyc.eq %v218, %v878 : i16
  %v898 = pyc.and %v138, %v897 : i1
  %v899 = pyc.alias %v898 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v900 = pyc.or %v893, %v899 : i1
  %v901 = pyc.alias %v900 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v902 = pyc.not %v899 : i1
  %v903 = pyc.mux %v902, %v896, %v178 : i128
  %v904 = pyc.alias %v903 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v905 = pyc.eq %v223, %v878 : i16
  %v906 = pyc.and %v143, %v905 : i1
  %v907 = pyc.alias %v906 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v908 = pyc.or %v901, %v907 : i1
  %v909 = pyc.alias %v908 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v910 = pyc.not %v907 : i1
  %v911 = pyc.mux %v910, %v904, %v183 : i128
  %v912 = pyc.alias %v911 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v913 = pyc.eq %v228, %v878 : i16
  %v914 = pyc.and %v148, %v913 : i1
  %v915 = pyc.alias %v914 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v916 = pyc.or %v909, %v915 : i1
  %v917 = pyc.alias %v916 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v918 = pyc.not %v915 : i1
  %v919 = pyc.mux %v918, %v912, %v188 : i128
  %v920 = pyc.alias %v919 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v921 = pyc.eq %v233, %v878 : i16
  %v922 = pyc.and %v153, %v921 : i1
  %v923 = pyc.alias %v922 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v924 = pyc.or %v917, %v923 : i1
  %v925 = pyc.alias %v924 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v926 = pyc.not %v923 : i1
  %v927 = pyc.mux %v926, %v920, %v193 : i128
  %v928 = pyc.alias %v927 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v929 = pyc.eq %v238, %v878 : i16
  %v930 = pyc.and %v158, %v929 : i1
  %v931 = pyc.alias %v930 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v932 = pyc.or %v925, %v931 : i1
  %v933 = pyc.alias %v932 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v934 = pyc.not %v931 : i1
  %v935 = pyc.mux %v934, %v928, %v198 : i128
  %v936 = pyc.alias %v935 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v937 = pyc.eq %v243, %v878 : i16
  %v938 = pyc.and %v163, %v937 : i1
  %v939 = pyc.alias %v938 {pyc.name = "match__fastfwd_v3_1__L99"} : i1
  %v940 = pyc.or %v933, %v939 : i1
  %v941 = pyc.alias %v940 {pyc.name = "dep_found__fastfwd_v3_1__L100"} : i1
  %v942 = pyc.not %v939 : i1
  %v943 = pyc.mux %v942, %v936, %v203 : i128
  %v944 = pyc.alias %v943 {pyc.name = "dep_value__fastfwd_v3_1__L101"} : i128
  %v945 = pyc.constant 0 : i3
  %v946 = pyc.zext %v945 : i3 -> i5
  %v947 = pyc.eq %v862, %v946 : i5
  %v948 = pyc.not %v947 : i1
  %v949 = pyc.alias %v948 {pyc.name = "has_dep__fastfwd_v3_1__L103"} : i1
  %v950 = pyc.and %v949, %v941 : i1
  %v951 = pyc.alias %v950 {pyc.name = "dep_ready__fastfwd_v3_1__L104"} : i1
  %v952 = pyc.not %v949 : i1
  %v953 = pyc.or %v952, %v951 : i1
  %v954 = pyc.and %v875, %v953 : i1
  %v955 = pyc.alias %v954 {pyc.name = "can_schedule__fastfwd_v3_1__L105"} : i1
  %v956 = pyc.constant 1 : i3
  %v957 = pyc.ult %v956, %v351 : i3
  %v958 = pyc.and %v331, %v957 : i1
  %v959 = pyc.or %v955, %v958 : i1
  pyc.assign %v327, %v959 : i1
  %v960 = pyc.constant 1 : i3
  %v961 = pyc.zext %v960 : i3 -> i5
  %v962 = pyc.add %v858, %v961 : i5
  %v963 = pyc.constant 1 : i3
  %v964 = pyc.sub %v351, %v963 : i3
  %v965 = pyc.constant 0 : i3
  %v966 = pyc.mux %v331, %v964, %v965 : i3
  %v967 = pyc.zext %v966 : i3 -> i5
  %v968 = pyc.mux %v955, %v962, %v967 : i5
  %v969 = pyc.alias %v968 {pyc.name = "new_timer__fastfwd_v3_1__L108"} : i5
  %v970 = pyc.trunc %v969 : i5 -> i3
  pyc.assign %v347, %v970 : i3
  %v971 = pyc.zext %v371 : i6 -> i16
  %v972 = pyc.mux %v955, %v868, %v971 : i16
  %v973 = pyc.trunc %v972 : i16 -> i6
  pyc.assign %v367, %v973 : i6
  pyc.assign %v387, %v955 : i1
  %v974 = pyc.constant 0 : i128
  %v975 = pyc.mux %v955, %v67, %v974 : i128
  pyc.assign %v407, %v975 : i128
  %v976 = pyc.constant 0 : i2
  %v977 = pyc.zext %v976 : i2 -> i5
  %v978 = pyc.mux %v955, %v858, %v977 : i5
  %v979 = pyc.trunc %v978 : i5 -> i2
  pyc.assign %v427, %v979 : i2
  %v980 = pyc.and %v949, %v955 : i1
  pyc.assign %v447, %v980 : i1
  %v981 = pyc.and %v949, %v955 : i1
  %v982 = pyc.constant 0 : i128
  %v983 = pyc.mux %v981, %v944, %v982 : i128
  pyc.assign %v467, %v983 : i128
  %v984 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v985 = pyc.constant 1 : i1
  %v986 = pyc.constant 0 : i1
  %v987 = pyc.reg %clk, %rst, %v985, %v984, %v986 : i1
  %v988 = pyc.alias %v987 {pyc.name = "rob0_valid"} : i1
  %v989 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v990 = pyc.constant 1 : i1
  %v991 = pyc.constant 0 : i1
  %v992 = pyc.reg %clk, %rst, %v990, %v989, %v991 : i1
  %v993 = pyc.alias %v992 {pyc.name = "rob1_valid"} : i1
  %v994 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v995 = pyc.constant 1 : i1
  %v996 = pyc.constant 0 : i1
  %v997 = pyc.reg %clk, %rst, %v995, %v994, %v996 : i1
  %v998 = pyc.alias %v997 {pyc.name = "rob2_valid"} : i1
  %v999 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v1000 = pyc.constant 1 : i1
  %v1001 = pyc.constant 0 : i1
  %v1002 = pyc.reg %clk, %rst, %v1000, %v999, %v1001 : i1
  %v1003 = pyc.alias %v1002 {pyc.name = "rob3_valid"} : i1
  %v1004 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v1005 = pyc.constant 1 : i1
  %v1006 = pyc.constant 0 : i1
  %v1007 = pyc.reg %clk, %rst, %v1005, %v1004, %v1006 : i1
  %v1008 = pyc.alias %v1007 {pyc.name = "rob4_valid"} : i1
  %v1009 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v1010 = pyc.constant 1 : i1
  %v1011 = pyc.constant 0 : i1
  %v1012 = pyc.reg %clk, %rst, %v1010, %v1009, %v1011 : i1
  %v1013 = pyc.alias %v1012 {pyc.name = "rob5_valid"} : i1
  %v1014 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v1015 = pyc.constant 1 : i1
  %v1016 = pyc.constant 0 : i1
  %v1017 = pyc.reg %clk, %rst, %v1015, %v1014, %v1016 : i1
  %v1018 = pyc.alias %v1017 {pyc.name = "rob6_valid"} : i1
  %v1019 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v1020 = pyc.constant 1 : i1
  %v1021 = pyc.constant 0 : i1
  %v1022 = pyc.reg %clk, %rst, %v1020, %v1019, %v1021 : i1
  %v1023 = pyc.alias %v1022 {pyc.name = "rob7_valid"} : i1
  %v1024 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v1025 = pyc.constant 1 : i1
  %v1026 = pyc.constant 0 : i128
  %v1027 = pyc.reg %clk, %rst, %v1025, %v1024, %v1026 : i128
  %v1028 = pyc.alias %v1027 {pyc.name = "rob0_data"} : i128
  %v1029 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v1030 = pyc.constant 1 : i1
  %v1031 = pyc.constant 0 : i128
  %v1032 = pyc.reg %clk, %rst, %v1030, %v1029, %v1031 : i128
  %v1033 = pyc.alias %v1032 {pyc.name = "rob1_data"} : i128
  %v1034 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v1035 = pyc.constant 1 : i1
  %v1036 = pyc.constant 0 : i128
  %v1037 = pyc.reg %clk, %rst, %v1035, %v1034, %v1036 : i128
  %v1038 = pyc.alias %v1037 {pyc.name = "rob2_data"} : i128
  %v1039 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v1040 = pyc.constant 1 : i1
  %v1041 = pyc.constant 0 : i128
  %v1042 = pyc.reg %clk, %rst, %v1040, %v1039, %v1041 : i128
  %v1043 = pyc.alias %v1042 {pyc.name = "rob3_data"} : i128
  %v1044 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v1045 = pyc.constant 1 : i1
  %v1046 = pyc.constant 0 : i128
  %v1047 = pyc.reg %clk, %rst, %v1045, %v1044, %v1046 : i128
  %v1048 = pyc.alias %v1047 {pyc.name = "rob4_data"} : i128
  %v1049 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v1050 = pyc.constant 1 : i1
  %v1051 = pyc.constant 0 : i128
  %v1052 = pyc.reg %clk, %rst, %v1050, %v1049, %v1051 : i128
  %v1053 = pyc.alias %v1052 {pyc.name = "rob5_data"} : i128
  %v1054 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v1055 = pyc.constant 1 : i1
  %v1056 = pyc.constant 0 : i128
  %v1057 = pyc.reg %clk, %rst, %v1055, %v1054, %v1056 : i128
  %v1058 = pyc.alias %v1057 {pyc.name = "rob6_data"} : i128
  %v1059 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v1060 = pyc.constant 1 : i1
  %v1061 = pyc.constant 0 : i128
  %v1062 = pyc.reg %clk, %rst, %v1060, %v1059, %v1061 : i128
  %v1063 = pyc.alias %v1062 {pyc.name = "rob7_data"} : i128
  %v1064 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v1065 = pyc.constant 1 : i1
  %v1066 = pyc.constant 0 : i16
  %v1067 = pyc.reg %clk, %rst, %v1065, %v1064, %v1066 : i16
  %v1068 = pyc.alias %v1067 {pyc.name = "rob0_seq"} : i16
  %v1069 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v1070 = pyc.constant 1 : i1
  %v1071 = pyc.constant 0 : i16
  %v1072 = pyc.reg %clk, %rst, %v1070, %v1069, %v1071 : i16
  %v1073 = pyc.alias %v1072 {pyc.name = "rob1_seq"} : i16
  %v1074 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v1075 = pyc.constant 1 : i1
  %v1076 = pyc.constant 0 : i16
  %v1077 = pyc.reg %clk, %rst, %v1075, %v1074, %v1076 : i16
  %v1078 = pyc.alias %v1077 {pyc.name = "rob2_seq"} : i16
  %v1079 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v1080 = pyc.constant 1 : i1
  %v1081 = pyc.constant 0 : i16
  %v1082 = pyc.reg %clk, %rst, %v1080, %v1079, %v1081 : i16
  %v1083 = pyc.alias %v1082 {pyc.name = "rob3_seq"} : i16
  %v1084 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v1085 = pyc.constant 1 : i1
  %v1086 = pyc.constant 0 : i16
  %v1087 = pyc.reg %clk, %rst, %v1085, %v1084, %v1086 : i16
  %v1088 = pyc.alias %v1087 {pyc.name = "rob4_seq"} : i16
  %v1089 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v1090 = pyc.constant 1 : i1
  %v1091 = pyc.constant 0 : i16
  %v1092 = pyc.reg %clk, %rst, %v1090, %v1089, %v1091 : i16
  %v1093 = pyc.alias %v1092 {pyc.name = "rob5_seq"} : i16
  %v1094 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v1095 = pyc.constant 1 : i1
  %v1096 = pyc.constant 0 : i16
  %v1097 = pyc.reg %clk, %rst, %v1095, %v1094, %v1096 : i16
  %v1098 = pyc.alias %v1097 {pyc.name = "rob6_seq"} : i16
  %v1099 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v1100 = pyc.constant 1 : i1
  %v1101 = pyc.constant 0 : i16
  %v1102 = pyc.reg %clk, %rst, %v1100, %v1099, %v1101 : i16
  %v1103 = pyc.alias %v1102 {pyc.name = "rob7_seq"} : i16
  %v1104 = pyc.wire {pyc.name = "rob_tail__next"} : i3
  %v1105 = pyc.constant 1 : i1
  %v1106 = pyc.constant 0 : i3
  %v1107 = pyc.reg %clk, %rst, %v1105, %v1104, %v1106 : i3
  %v1108 = pyc.alias %v1107 {pyc.name = "rob_tail"} : i3
  %v1109 = pyc.alias %v1108 {pyc.name = "rob_tail__fastfwd_v3_1__L122"} : i3
  %v1110 = pyc.wire {pyc.name = "next_output_seq__next"} : i16
  %v1111 = pyc.constant 1 : i1
  %v1112 = pyc.constant 0 : i16
  %v1113 = pyc.reg %clk, %rst, %v1111, %v1110, %v1112 : i16
  %v1114 = pyc.alias %v1113 {pyc.name = "next_output_seq"} : i16
  %v1115 = pyc.alias %v1114 {pyc.name = "next_output_seq__fastfwd_v3_1__L123"} : i16
  %v1116 = pyc.alias %v1109 {pyc.name = "tail_ptr__fastfwd_v3_1__L125"} : i3
  %v1117 = pyc.constant 0 : i3
  %v1118 = pyc.eq %v1116, %v1117 : i3
  %v1119 = pyc.and %fwded0_pkt_data_vld, %v1118 : i1
  %v1120 = pyc.alias %v1119 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1121 = pyc.or %v1120, %v988 : i1
  pyc.assign %v984, %v1121 : i1
  %v1122 = pyc.mux %v1120, %fwded0_pkt_data, %v1028 : i128
  pyc.assign %v1024, %v1122 : i128
  %v1123 = pyc.mux %v1120, %v92, %v1068 : i16
  pyc.assign %v1064, %v1123 : i16
  %v1124 = pyc.constant 1 : i3
  %v1125 = pyc.eq %v1116, %v1124 : i3
  %v1126 = pyc.and %fwded0_pkt_data_vld, %v1125 : i1
  %v1127 = pyc.alias %v1126 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1128 = pyc.or %v1127, %v993 : i1
  pyc.assign %v989, %v1128 : i1
  %v1129 = pyc.mux %v1127, %fwded0_pkt_data, %v1033 : i128
  pyc.assign %v1029, %v1129 : i128
  %v1130 = pyc.mux %v1127, %v92, %v1073 : i16
  pyc.assign %v1069, %v1130 : i16
  %v1131 = pyc.constant 2 : i3
  %v1132 = pyc.eq %v1116, %v1131 : i3
  %v1133 = pyc.and %fwded0_pkt_data_vld, %v1132 : i1
  %v1134 = pyc.alias %v1133 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1135 = pyc.or %v1134, %v998 : i1
  pyc.assign %v994, %v1135 : i1
  %v1136 = pyc.mux %v1134, %fwded0_pkt_data, %v1038 : i128
  pyc.assign %v1034, %v1136 : i128
  %v1137 = pyc.mux %v1134, %v92, %v1078 : i16
  pyc.assign %v1074, %v1137 : i16
  %v1138 = pyc.constant 3 : i3
  %v1139 = pyc.eq %v1116, %v1138 : i3
  %v1140 = pyc.and %fwded0_pkt_data_vld, %v1139 : i1
  %v1141 = pyc.alias %v1140 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1142 = pyc.or %v1141, %v1003 : i1
  pyc.assign %v999, %v1142 : i1
  %v1143 = pyc.mux %v1141, %fwded0_pkt_data, %v1043 : i128
  pyc.assign %v1039, %v1143 : i128
  %v1144 = pyc.mux %v1141, %v92, %v1083 : i16
  pyc.assign %v1079, %v1144 : i16
  %v1145 = pyc.constant 4 : i3
  %v1146 = pyc.eq %v1116, %v1145 : i3
  %v1147 = pyc.and %fwded0_pkt_data_vld, %v1146 : i1
  %v1148 = pyc.alias %v1147 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1149 = pyc.or %v1148, %v1008 : i1
  pyc.assign %v1004, %v1149 : i1
  %v1150 = pyc.mux %v1148, %fwded0_pkt_data, %v1048 : i128
  pyc.assign %v1044, %v1150 : i128
  %v1151 = pyc.mux %v1148, %v92, %v1088 : i16
  pyc.assign %v1084, %v1151 : i16
  %v1152 = pyc.constant 5 : i3
  %v1153 = pyc.eq %v1116, %v1152 : i3
  %v1154 = pyc.and %fwded0_pkt_data_vld, %v1153 : i1
  %v1155 = pyc.alias %v1154 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1156 = pyc.or %v1155, %v1013 : i1
  pyc.assign %v1009, %v1156 : i1
  %v1157 = pyc.mux %v1155, %fwded0_pkt_data, %v1053 : i128
  pyc.assign %v1049, %v1157 : i128
  %v1158 = pyc.mux %v1155, %v92, %v1093 : i16
  pyc.assign %v1089, %v1158 : i16
  %v1159 = pyc.constant 6 : i3
  %v1160 = pyc.eq %v1116, %v1159 : i3
  %v1161 = pyc.and %fwded0_pkt_data_vld, %v1160 : i1
  %v1162 = pyc.alias %v1161 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1163 = pyc.or %v1162, %v1018 : i1
  pyc.assign %v1014, %v1163 : i1
  %v1164 = pyc.mux %v1162, %fwded0_pkt_data, %v1058 : i128
  pyc.assign %v1054, %v1164 : i128
  %v1165 = pyc.mux %v1162, %v92, %v1098 : i16
  pyc.assign %v1094, %v1165 : i16
  %v1166 = pyc.constant 7 : i3
  %v1167 = pyc.eq %v1116, %v1166 : i3
  %v1168 = pyc.and %fwded0_pkt_data_vld, %v1167 : i1
  %v1169 = pyc.alias %v1168 {pyc.name = "should_write__fastfwd_v3_1__L127"} : i1
  %v1170 = pyc.or %v1169, %v1023 : i1
  pyc.assign %v1019, %v1170 : i1
  %v1171 = pyc.mux %v1169, %fwded0_pkt_data, %v1063 : i128
  pyc.assign %v1059, %v1171 : i128
  %v1172 = pyc.mux %v1169, %v92, %v1103 : i16
  pyc.assign %v1099, %v1172 : i16
  %v1173 = pyc.constant 1 : i3
  %v1174 = pyc.add %v1116, %v1173 : i3
  %v1175 = pyc.constant 7 : i3
  %v1176 = pyc.and %v1174, %v1175 : i3
  %v1177 = pyc.mux %fwded0_pkt_data_vld, %v1176, %v1116 : i3
  pyc.assign %v1104, %v1177 : i3
  %v1178 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1179 = pyc.constant 1 : i1
  %v1180 = pyc.constant 0 : i1
  %v1181 = pyc.reg %clk, %rst, %v1179, %v1178, %v1180 : i1
  %v1182 = pyc.alias %v1181 {pyc.name = "lane0_out_vld"} : i1
  %v1183 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1184 = pyc.constant 1 : i1
  %v1185 = pyc.constant 0 : i1
  %v1186 = pyc.reg %clk, %rst, %v1184, %v1183, %v1185 : i1
  %v1187 = pyc.alias %v1186 {pyc.name = "lane1_out_vld"} : i1
  %v1188 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1189 = pyc.constant 1 : i1
  %v1190 = pyc.constant 0 : i1
  %v1191 = pyc.reg %clk, %rst, %v1189, %v1188, %v1190 : i1
  %v1192 = pyc.alias %v1191 {pyc.name = "lane2_out_vld"} : i1
  %v1193 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1194 = pyc.constant 1 : i1
  %v1195 = pyc.constant 0 : i1
  %v1196 = pyc.reg %clk, %rst, %v1194, %v1193, %v1195 : i1
  %v1197 = pyc.alias %v1196 {pyc.name = "lane3_out_vld"} : i1
  %v1198 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1199 = pyc.constant 1 : i1
  %v1200 = pyc.constant 0 : i128
  %v1201 = pyc.reg %clk, %rst, %v1199, %v1198, %v1200 : i128
  %v1202 = pyc.alias %v1201 {pyc.name = "lane0_out_data"} : i128
  %v1203 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1204 = pyc.constant 1 : i1
  %v1205 = pyc.constant 0 : i128
  %v1206 = pyc.reg %clk, %rst, %v1204, %v1203, %v1205 : i128
  %v1207 = pyc.alias %v1206 {pyc.name = "lane1_out_data"} : i128
  %v1208 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1209 = pyc.constant 1 : i1
  %v1210 = pyc.constant 0 : i128
  %v1211 = pyc.reg %clk, %rst, %v1209, %v1208, %v1210 : i128
  %v1212 = pyc.alias %v1211 {pyc.name = "lane2_out_data"} : i128
  %v1213 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1214 = pyc.constant 1 : i1
  %v1215 = pyc.constant 0 : i128
  %v1216 = pyc.reg %clk, %rst, %v1214, %v1213, %v1215 : i128
  %v1217 = pyc.alias %v1216 {pyc.name = "lane3_out_data"} : i128
  %v1218 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_1__L138"} : i2
  %v1219 = pyc.alias %v1115 {pyc.name = "next_seq__fastfwd_v3_1__L139"} : i16
  %v1220 = pyc.eq %v1068, %v1219 : i16
  %v1221 = pyc.and %v988, %v1220 : i1
  %v1222 = pyc.alias %v1221 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1223 = pyc.constant 0 : i1
  %v1224 = pyc.or %v1222, %v1223 : i1
  %v1225 = pyc.alias %v1224 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1226 = pyc.not %v1222 : i1
  %v1227 = pyc.constant 0 : i128
  %v1228 = pyc.mux %v1226, %v1227, %v1028 : i128
  %v1229 = pyc.alias %v1228 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1230 = pyc.eq %v1073, %v1219 : i16
  %v1231 = pyc.and %v993, %v1230 : i1
  %v1232 = pyc.alias %v1231 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1233 = pyc.or %v1225, %v1232 : i1
  %v1234 = pyc.alias %v1233 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1235 = pyc.not %v1232 : i1
  %v1236 = pyc.mux %v1235, %v1229, %v1033 : i128
  %v1237 = pyc.alias %v1236 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1238 = pyc.eq %v1078, %v1219 : i16
  %v1239 = pyc.and %v998, %v1238 : i1
  %v1240 = pyc.alias %v1239 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1241 = pyc.or %v1234, %v1240 : i1
  %v1242 = pyc.alias %v1241 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1243 = pyc.not %v1240 : i1
  %v1244 = pyc.mux %v1243, %v1237, %v1038 : i128
  %v1245 = pyc.alias %v1244 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1246 = pyc.eq %v1083, %v1219 : i16
  %v1247 = pyc.and %v1003, %v1246 : i1
  %v1248 = pyc.alias %v1247 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1249 = pyc.or %v1242, %v1248 : i1
  %v1250 = pyc.alias %v1249 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1251 = pyc.not %v1248 : i1
  %v1252 = pyc.mux %v1251, %v1245, %v1043 : i128
  %v1253 = pyc.alias %v1252 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1254 = pyc.eq %v1088, %v1219 : i16
  %v1255 = pyc.and %v1008, %v1254 : i1
  %v1256 = pyc.alias %v1255 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1257 = pyc.or %v1250, %v1256 : i1
  %v1258 = pyc.alias %v1257 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1259 = pyc.not %v1256 : i1
  %v1260 = pyc.mux %v1259, %v1253, %v1048 : i128
  %v1261 = pyc.alias %v1260 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1262 = pyc.eq %v1093, %v1219 : i16
  %v1263 = pyc.and %v1013, %v1262 : i1
  %v1264 = pyc.alias %v1263 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1265 = pyc.or %v1258, %v1264 : i1
  %v1266 = pyc.alias %v1265 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1267 = pyc.not %v1264 : i1
  %v1268 = pyc.mux %v1267, %v1261, %v1053 : i128
  %v1269 = pyc.alias %v1268 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1270 = pyc.eq %v1098, %v1219 : i16
  %v1271 = pyc.and %v1018, %v1270 : i1
  %v1272 = pyc.alias %v1271 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1273 = pyc.or %v1266, %v1272 : i1
  %v1274 = pyc.alias %v1273 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1275 = pyc.not %v1272 : i1
  %v1276 = pyc.mux %v1275, %v1269, %v1058 : i128
  %v1277 = pyc.alias %v1276 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1278 = pyc.eq %v1103, %v1219 : i16
  %v1279 = pyc.and %v1023, %v1278 : i1
  %v1280 = pyc.alias %v1279 {pyc.name = "match__fastfwd_v3_1__L144"} : i1
  %v1281 = pyc.or %v1274, %v1280 : i1
  %v1282 = pyc.alias %v1281 {pyc.name = "has_next_seq__fastfwd_v3_1__L145"} : i1
  %v1283 = pyc.not %v1280 : i1
  %v1284 = pyc.mux %v1283, %v1277, %v1063 : i128
  %v1285 = pyc.alias %v1284 {pyc.name = "next_seq_data__fastfwd_v3_1__L146"} : i128
  %v1286 = pyc.constant 0 : i2
  %v1287 = pyc.eq %v1218, %v1286 : i2
  %v1288 = pyc.alias %v1287 {pyc.name = "this_lane__fastfwd_v3_1__L149"} : i1
  %v1289 = pyc.and %v1288, %v1282 : i1
  %v1290 = pyc.alias %v1289 {pyc.name = "should_output__fastfwd_v3_1__L150"} : i1
  pyc.assign %v1178, %v1290 : i1
  %v1291 = pyc.constant 0 : i128
  %v1292 = pyc.mux %v1290, %v1285, %v1291 : i128
  pyc.assign %v1198, %v1292 : i128
  %v1293 = pyc.constant 1 : i2
  %v1294 = pyc.eq %v1218, %v1293 : i2
  %v1295 = pyc.alias %v1294 {pyc.name = "this_lane__fastfwd_v3_1__L149"} : i1
  %v1296 = pyc.and %v1295, %v1282 : i1
  %v1297 = pyc.alias %v1296 {pyc.name = "should_output__fastfwd_v3_1__L150"} : i1
  pyc.assign %v1183, %v1297 : i1
  %v1298 = pyc.constant 0 : i128
  %v1299 = pyc.mux %v1297, %v1285, %v1298 : i128
  pyc.assign %v1203, %v1299 : i128
  %v1300 = pyc.constant 2 : i2
  %v1301 = pyc.eq %v1218, %v1300 : i2
  %v1302 = pyc.alias %v1301 {pyc.name = "this_lane__fastfwd_v3_1__L149"} : i1
  %v1303 = pyc.and %v1302, %v1282 : i1
  %v1304 = pyc.alias %v1303 {pyc.name = "should_output__fastfwd_v3_1__L150"} : i1
  pyc.assign %v1188, %v1304 : i1
  %v1305 = pyc.constant 0 : i128
  %v1306 = pyc.mux %v1304, %v1285, %v1305 : i128
  pyc.assign %v1208, %v1306 : i128
  %v1307 = pyc.constant 3 : i2
  %v1308 = pyc.eq %v1218, %v1307 : i2
  %v1309 = pyc.alias %v1308 {pyc.name = "this_lane__fastfwd_v3_1__L149"} : i1
  %v1310 = pyc.and %v1309, %v1282 : i1
  %v1311 = pyc.alias %v1310 {pyc.name = "should_output__fastfwd_v3_1__L150"} : i1
  pyc.assign %v1193, %v1311 : i1
  %v1312 = pyc.constant 0 : i128
  %v1313 = pyc.mux %v1311, %v1285, %v1312 : i128
  pyc.assign %v1213, %v1313 : i128
  %v1314 = pyc.or %v1182, %v1187 : i1
  %v1315 = pyc.or %v1314, %v1192 : i1
  %v1316 = pyc.or %v1315, %v1197 : i1
  %v1317 = pyc.alias %v1316 {pyc.name = "any_output__fastfwd_v3_1__L154"} : i1
  %v1318 = pyc.constant 1 : i2
  %v1319 = pyc.add %v1218, %v1318 : i2
  %v1320 = pyc.constant 3 : i2
  %v1321 = pyc.and %v1319, %v1320 : i2
  %v1322 = pyc.mux %v1317, %v1321, %v1218 : i2
  pyc.assign %v7, %v1322 : i2
  %v1323 = pyc.constant 1 : i16
  %v1324 = pyc.add %v1219, %v1323 : i16
  %v1325 = pyc.mux %v1317, %v1324, %v1219 : i16
  pyc.assign %v1110, %v1325 : i16
  %v1326 = pyc.eq %v1068, %v1219 : i16
  %v1327 = pyc.and %v1317, %v1326 : i1
  %v1328 = pyc.alias %v1327 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1329 = pyc.constant 0 : i1
  %v1330 = pyc.mux %v1328, %v1329, %v988 : i1
  pyc.assign %v984, %v1330 : i1
  %v1331 = pyc.eq %v1073, %v1219 : i16
  %v1332 = pyc.and %v1317, %v1331 : i1
  %v1333 = pyc.alias %v1332 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1334 = pyc.constant 0 : i1
  %v1335 = pyc.mux %v1333, %v1334, %v993 : i1
  pyc.assign %v989, %v1335 : i1
  %v1336 = pyc.eq %v1078, %v1219 : i16
  %v1337 = pyc.and %v1317, %v1336 : i1
  %v1338 = pyc.alias %v1337 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1339 = pyc.constant 0 : i1
  %v1340 = pyc.mux %v1338, %v1339, %v998 : i1
  pyc.assign %v994, %v1340 : i1
  %v1341 = pyc.eq %v1083, %v1219 : i16
  %v1342 = pyc.and %v1317, %v1341 : i1
  %v1343 = pyc.alias %v1342 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1344 = pyc.constant 0 : i1
  %v1345 = pyc.mux %v1343, %v1344, %v1003 : i1
  pyc.assign %v999, %v1345 : i1
  %v1346 = pyc.eq %v1088, %v1219 : i16
  %v1347 = pyc.and %v1317, %v1346 : i1
  %v1348 = pyc.alias %v1347 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1349 = pyc.constant 0 : i1
  %v1350 = pyc.mux %v1348, %v1349, %v1008 : i1
  pyc.assign %v1004, %v1350 : i1
  %v1351 = pyc.eq %v1093, %v1219 : i16
  %v1352 = pyc.and %v1317, %v1351 : i1
  %v1353 = pyc.alias %v1352 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1354 = pyc.constant 0 : i1
  %v1355 = pyc.mux %v1353, %v1354, %v1013 : i1
  pyc.assign %v1009, %v1355 : i1
  %v1356 = pyc.eq %v1098, %v1219 : i16
  %v1357 = pyc.and %v1317, %v1356 : i1
  %v1358 = pyc.alias %v1357 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1359 = pyc.constant 0 : i1
  %v1360 = pyc.mux %v1358, %v1359, %v1018 : i1
  pyc.assign %v1014, %v1360 : i1
  %v1361 = pyc.eq %v1103, %v1219 : i16
  %v1362 = pyc.and %v1317, %v1361 : i1
  %v1363 = pyc.alias %v1362 {pyc.name = "should_clear__fastfwd_v3_1__L159"} : i1
  %v1364 = pyc.constant 0 : i1
  %v1365 = pyc.mux %v1363, %v1364, %v1023 : i1
  pyc.assign %v1019, %v1365 : i1
  %v1366 = pyc.constant 0 : i1
  %v1367 = pyc.add %v32, %v1366 : i1
  %v1368 = pyc.add %v1367, %v37 : i1
  %v1369 = pyc.add %v1368, %v42 : i1
  %v1370 = pyc.add %v1369, %v47 : i1
  %v1371 = pyc.alias %v1370 {pyc.name = "pending_cnt__fastfwd_v3_1__L163"} : i1
  %v1372 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1373 = pyc.constant 1 : i1
  %v1374 = pyc.constant 0 : i1
  %v1375 = pyc.reg %clk, %rst, %v1373, %v1372, %v1374 : i1
  %v1376 = pyc.alias %v1375 {pyc.name = "bkpr_reg"} : i1
  %v1377 = pyc.alias %v1376 {pyc.name = "bkpr__fastfwd_v3_1__L164"} : i1
  %v1378 = pyc.constant 10 : i4
  %v1379 = pyc.zext %v1371 : i1 -> i4
  %v1380 = pyc.ult %v1379, %v1378 : i4
  %v1381 = pyc.not %v1380 : i1
  pyc.assign %v1372, %v1381 : i1
  func.return %v1182, %v1202, %v1187, %v1207, %v1192, %v1212, %v1197, %v1217, %v1377 : i1, i128, i1, i128, i1, i128, i1, i128, i1
}

}

