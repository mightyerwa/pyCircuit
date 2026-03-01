module attributes {pyc.top = @fastfwd_v2_1, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v2_1(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "fwd0_pkt_data_vld", "fwd0_pkt_data", "fwd0_pkt_lat", "fwd0_pkt_dp_vld", "fwd0_pkt_dp_data", "fwd1_pkt_data_vld", "fwd1_pkt_data", "fwd1_pkt_lat", "fwd1_pkt_dp_vld", "fwd1_pkt_dp_data", "fwd2_pkt_data_vld", "fwd2_pkt_data", "fwd2_pkt_lat", "fwd2_pkt_dp_vld", "fwd2_pkt_dp_data", "fwd3_pkt_data_vld", "fwd3_pkt_data", "fwd3_pkt_lat", "fwd3_pkt_dp_vld", "fwd3_pkt_dp_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v2_1", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v2_1__L59"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v2_1__L60"} : i2
  %v13 = pyc.wire {pyc.name = "lane0_has_pkt__next"} : i1
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i1
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i1
  %v17 = pyc.alias %v16 {pyc.name = "lane0_has_pkt"} : i1
  %v18 = pyc.wire {pyc.name = "lane1_has_pkt__next"} : i1
  %v19 = pyc.constant 1 : i1
  %v20 = pyc.constant 0 : i1
  %v21 = pyc.reg %clk, %rst, %v19, %v18, %v20 : i1
  %v22 = pyc.alias %v21 {pyc.name = "lane1_has_pkt"} : i1
  %v23 = pyc.wire {pyc.name = "lane2_has_pkt__next"} : i1
  %v24 = pyc.constant 1 : i1
  %v25 = pyc.constant 0 : i1
  %v26 = pyc.reg %clk, %rst, %v24, %v23, %v25 : i1
  %v27 = pyc.alias %v26 {pyc.name = "lane2_has_pkt"} : i1
  %v28 = pyc.wire {pyc.name = "lane3_has_pkt__next"} : i1
  %v29 = pyc.constant 1 : i1
  %v30 = pyc.constant 0 : i1
  %v31 = pyc.reg %clk, %rst, %v29, %v28, %v30 : i1
  %v32 = pyc.alias %v31 {pyc.name = "lane3_has_pkt"} : i1
  %v33 = pyc.wire {pyc.name = "lane0_pkt_data__next"} : i128
  %v34 = pyc.constant 1 : i1
  %v35 = pyc.constant 0 : i128
  %v36 = pyc.reg %clk, %rst, %v34, %v33, %v35 : i128
  %v37 = pyc.alias %v36 {pyc.name = "lane0_pkt_data"} : i128
  %v38 = pyc.wire {pyc.name = "lane1_pkt_data__next"} : i128
  %v39 = pyc.constant 1 : i1
  %v40 = pyc.constant 0 : i128
  %v41 = pyc.reg %clk, %rst, %v39, %v38, %v40 : i128
  %v42 = pyc.alias %v41 {pyc.name = "lane1_pkt_data"} : i128
  %v43 = pyc.wire {pyc.name = "lane2_pkt_data__next"} : i128
  %v44 = pyc.constant 1 : i1
  %v45 = pyc.constant 0 : i128
  %v46 = pyc.reg %clk, %rst, %v44, %v43, %v45 : i128
  %v47 = pyc.alias %v46 {pyc.name = "lane2_pkt_data"} : i128
  %v48 = pyc.wire {pyc.name = "lane3_pkt_data__next"} : i128
  %v49 = pyc.constant 1 : i1
  %v50 = pyc.constant 0 : i128
  %v51 = pyc.reg %clk, %rst, %v49, %v48, %v50 : i128
  %v52 = pyc.alias %v51 {pyc.name = "lane3_pkt_data"} : i128
  %v53 = pyc.wire {pyc.name = "lane0_pkt_seq__next"} : i16
  %v54 = pyc.constant 1 : i1
  %v55 = pyc.constant 0 : i16
  %v56 = pyc.reg %clk, %rst, %v54, %v53, %v55 : i16
  %v57 = pyc.alias %v56 {pyc.name = "lane0_pkt_seq"} : i16
  %v58 = pyc.wire {pyc.name = "lane1_pkt_seq__next"} : i16
  %v59 = pyc.constant 1 : i1
  %v60 = pyc.constant 0 : i16
  %v61 = pyc.reg %clk, %rst, %v59, %v58, %v60 : i16
  %v62 = pyc.alias %v61 {pyc.name = "lane1_pkt_seq"} : i16
  %v63 = pyc.wire {pyc.name = "lane2_pkt_seq__next"} : i16
  %v64 = pyc.constant 1 : i1
  %v65 = pyc.constant 0 : i16
  %v66 = pyc.reg %clk, %rst, %v64, %v63, %v65 : i16
  %v67 = pyc.alias %v66 {pyc.name = "lane2_pkt_seq"} : i16
  %v68 = pyc.wire {pyc.name = "lane3_pkt_seq__next"} : i16
  %v69 = pyc.constant 1 : i1
  %v70 = pyc.constant 0 : i16
  %v71 = pyc.reg %clk, %rst, %v69, %v68, %v70 : i16
  %v72 = pyc.alias %v71 {pyc.name = "lane3_pkt_seq"} : i16
  %v73 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v2_1__L77"} : i16
  %v74 = pyc.alias %lane0_pkt_in_vld {pyc.name = "has_0__fastfwd_v2_1__L80"} : i1
  %v75 = pyc.constant 1 : i16
  %v76 = pyc.add %v73, %v75 : i16
  %v77 = pyc.alias %v76 {pyc.name = "new_seq_0__fastfwd_v2_1__L81"} : i16
  pyc.assign %v13, %v74 : i1
  %v78 = pyc.mux %v74, %lane0_pkt_in_data, %v37 : i128
  pyc.assign %v33, %v78 : i128
  %v79 = pyc.mux %v74, %v73, %v57 : i16
  pyc.assign %v53, %v79 : i16
  %v80 = pyc.mux %v74, %v77, %v73 : i16
  %v81 = pyc.alias %v80 {pyc.name = "seq_after_0__fastfwd_v2_1__L87"} : i16
  %v82 = pyc.alias %lane1_pkt_in_vld {pyc.name = "has_1__fastfwd_v2_1__L90"} : i1
  %v83 = pyc.constant 1 : i16
  %v84 = pyc.add %v81, %v83 : i16
  %v85 = pyc.alias %v84 {pyc.name = "new_seq_1__fastfwd_v2_1__L91"} : i16
  pyc.assign %v18, %v82 : i1
  %v86 = pyc.mux %v82, %lane1_pkt_in_data, %v42 : i128
  pyc.assign %v38, %v86 : i128
  %v87 = pyc.mux %v82, %v81, %v62 : i16
  pyc.assign %v58, %v87 : i16
  %v88 = pyc.mux %v82, %v85, %v81 : i16
  %v89 = pyc.alias %v88 {pyc.name = "seq_after_1__fastfwd_v2_1__L97"} : i16
  %v90 = pyc.alias %lane2_pkt_in_vld {pyc.name = "has_2__fastfwd_v2_1__L100"} : i1
  %v91 = pyc.constant 1 : i16
  %v92 = pyc.add %v89, %v91 : i16
  %v93 = pyc.alias %v92 {pyc.name = "new_seq_2__fastfwd_v2_1__L101"} : i16
  pyc.assign %v23, %v90 : i1
  %v94 = pyc.mux %v90, %lane2_pkt_in_data, %v47 : i128
  pyc.assign %v43, %v94 : i128
  %v95 = pyc.mux %v90, %v89, %v67 : i16
  pyc.assign %v63, %v95 : i16
  %v96 = pyc.mux %v90, %v93, %v89 : i16
  %v97 = pyc.alias %v96 {pyc.name = "seq_after_2__fastfwd_v2_1__L107"} : i16
  %v98 = pyc.alias %lane3_pkt_in_vld {pyc.name = "has_3__fastfwd_v2_1__L110"} : i1
  %v99 = pyc.constant 1 : i16
  %v100 = pyc.add %v97, %v99 : i16
  %v101 = pyc.alias %v100 {pyc.name = "new_seq_3__fastfwd_v2_1__L111"} : i16
  pyc.assign %v28, %v98 : i1
  %v102 = pyc.mux %v98, %lane3_pkt_in_data, %v52 : i128
  pyc.assign %v48, %v102 : i128
  %v103 = pyc.mux %v98, %v97, %v72 : i16
  pyc.assign %v68, %v103 : i16
  %v104 = pyc.mux %v98, %v101, %v97 : i16
  pyc.assign %v1, %v104 : i16
  %v105 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v106 = pyc.constant 1 : i1
  %v107 = pyc.constant 0 : i1
  %v108 = pyc.reg %clk, %rst, %v106, %v105, %v107 : i1
  %v109 = pyc.alias %v108 {pyc.name = "lane0_out_vld"} : i1
  %v110 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v111 = pyc.constant 1 : i1
  %v112 = pyc.constant 0 : i1
  %v113 = pyc.reg %clk, %rst, %v111, %v110, %v112 : i1
  %v114 = pyc.alias %v113 {pyc.name = "lane1_out_vld"} : i1
  %v115 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v116 = pyc.constant 1 : i1
  %v117 = pyc.constant 0 : i1
  %v118 = pyc.reg %clk, %rst, %v116, %v115, %v117 : i1
  %v119 = pyc.alias %v118 {pyc.name = "lane2_out_vld"} : i1
  %v120 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v121 = pyc.constant 1 : i1
  %v122 = pyc.constant 0 : i1
  %v123 = pyc.reg %clk, %rst, %v121, %v120, %v122 : i1
  %v124 = pyc.alias %v123 {pyc.name = "lane3_out_vld"} : i1
  %v125 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v126 = pyc.constant 1 : i1
  %v127 = pyc.constant 0 : i128
  %v128 = pyc.reg %clk, %rst, %v126, %v125, %v127 : i128
  %v129 = pyc.alias %v128 {pyc.name = "lane0_out_data"} : i128
  %v130 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v131 = pyc.constant 1 : i1
  %v132 = pyc.constant 0 : i128
  %v133 = pyc.reg %clk, %rst, %v131, %v130, %v132 : i128
  %v134 = pyc.alias %v133 {pyc.name = "lane1_out_data"} : i128
  %v135 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v136 = pyc.constant 1 : i1
  %v137 = pyc.constant 0 : i128
  %v138 = pyc.reg %clk, %rst, %v136, %v135, %v137 : i128
  %v139 = pyc.alias %v138 {pyc.name = "lane2_out_data"} : i128
  %v140 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v141 = pyc.constant 1 : i1
  %v142 = pyc.constant 0 : i128
  %v143 = pyc.reg %clk, %rst, %v141, %v140, %v142 : i128
  %v144 = pyc.alias %v143 {pyc.name = "lane3_out_data"} : i128
  %v145 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v2_1__L132"} : i2
  %v146 = pyc.alias %v145 {pyc.name = "ptr_int__fastfwd_v2_1__L138"} : i2
  %v147 = pyc.constant 0 : i2
  %v148 = pyc.eq %v146, %v147 : i2
  %v149 = pyc.and %v148, %v17 : i1
  %v150 = pyc.alias %v149 {pyc.name = "sel_0__fastfwd_v2_1__L141"} : i1
  %v151 = pyc.constant 1 : i2
  %v152 = pyc.eq %v146, %v151 : i2
  %v153 = pyc.and %v152, %v22 : i1
  %v154 = pyc.alias %v153 {pyc.name = "sel_1__fastfwd_v2_1__L142"} : i1
  %v155 = pyc.constant 2 : i2
  %v156 = pyc.eq %v146, %v155 : i2
  %v157 = pyc.and %v156, %v27 : i1
  %v158 = pyc.alias %v157 {pyc.name = "sel_2__fastfwd_v2_1__L143"} : i1
  %v159 = pyc.constant 3 : i2
  %v160 = pyc.eq %v146, %v159 : i2
  %v161 = pyc.and %v160, %v32 : i1
  %v162 = pyc.alias %v161 {pyc.name = "sel_3__fastfwd_v2_1__L144"} : i1
  %v163 = pyc.or %v150, %v154 : i1
  %v164 = pyc.or %v163, %v158 : i1
  %v165 = pyc.or %v164, %v162 : i1
  %v166 = pyc.alias %v165 {pyc.name = "any_sel__fastfwd_v2_1__L146"} : i1
  %v167 = pyc.constant 0 : i128
  %v168 = pyc.mux %v150, %v37, %v167 : i128
  %v169 = pyc.alias %v168 {pyc.name = "out_data_sel__fastfwd_v2_1__L150"} : i128
  %v170 = pyc.mux %v154, %v42, %v169 : i128
  %v171 = pyc.alias %v170 {pyc.name = "out_data_sel__fastfwd_v2_1__L151"} : i128
  %v172 = pyc.mux %v158, %v47, %v171 : i128
  %v173 = pyc.alias %v172 {pyc.name = "out_data_sel__fastfwd_v2_1__L152"} : i128
  %v174 = pyc.mux %v162, %v52, %v173 : i128
  %v175 = pyc.alias %v174 {pyc.name = "out_data_sel__fastfwd_v2_1__L153"} : i128
  %v176 = pyc.constant 0 : i2
  %v177 = pyc.eq %v146, %v176 : i2
  %v178 = pyc.and %v177, %v17 : i1
  %v179 = pyc.alias %v178 {pyc.name = "this_sel__fastfwd_v2_1__L157"} : i1
  pyc.assign %v105, %v179 : i1
  %v180 = pyc.constant 0 : i128
  %v181 = pyc.mux %v179, %v37, %v180 : i128
  pyc.assign %v125, %v181 : i128
  %v182 = pyc.constant 1 : i2
  %v183 = pyc.eq %v146, %v182 : i2
  %v184 = pyc.and %v183, %v22 : i1
  %v185 = pyc.alias %v184 {pyc.name = "this_sel__fastfwd_v2_1__L157"} : i1
  pyc.assign %v110, %v185 : i1
  %v186 = pyc.constant 0 : i128
  %v187 = pyc.mux %v185, %v42, %v186 : i128
  pyc.assign %v130, %v187 : i128
  %v188 = pyc.constant 2 : i2
  %v189 = pyc.eq %v146, %v188 : i2
  %v190 = pyc.and %v189, %v27 : i1
  %v191 = pyc.alias %v190 {pyc.name = "this_sel__fastfwd_v2_1__L157"} : i1
  pyc.assign %v115, %v191 : i1
  %v192 = pyc.constant 0 : i128
  %v193 = pyc.mux %v191, %v47, %v192 : i128
  pyc.assign %v135, %v193 : i128
  %v194 = pyc.constant 3 : i2
  %v195 = pyc.eq %v146, %v194 : i2
  %v196 = pyc.and %v195, %v32 : i1
  %v197 = pyc.alias %v196 {pyc.name = "this_sel__fastfwd_v2_1__L157"} : i1
  pyc.assign %v120, %v197 : i1
  %v198 = pyc.constant 0 : i128
  %v199 = pyc.mux %v197, %v52, %v198 : i128
  pyc.assign %v140, %v199 : i128
  %v200 = pyc.constant 1 : i2
  %v201 = pyc.add %v145, %v200 : i2
  %v202 = pyc.constant 3 : i2
  %v203 = pyc.and %v201, %v202 : i2
  %v204 = pyc.alias %v203 {pyc.name = "new_ptr__fastfwd_v2_1__L162"} : i2
  %v205 = pyc.mux %v166, %v204, %v145 : i2
  pyc.assign %v7, %v205 : i2
  %v206 = pyc.constant 0 : i2
  %v207 = pyc.eq %v146, %v206 : i2
  %v208 = pyc.and %v207, %v17 : i1
  %v209 = pyc.alias %v208 {pyc.name = "this_sel__fastfwd_v2_1__L167"} : i1
  %v210 = pyc.constant 0 : i1
  %v211 = pyc.mux %v209, %v210, %v17 : i1
  pyc.assign %v13, %v211 : i1
  %v212 = pyc.constant 1 : i2
  %v213 = pyc.eq %v146, %v212 : i2
  %v214 = pyc.and %v213, %v22 : i1
  %v215 = pyc.alias %v214 {pyc.name = "this_sel__fastfwd_v2_1__L167"} : i1
  %v216 = pyc.constant 0 : i1
  %v217 = pyc.mux %v215, %v216, %v22 : i1
  pyc.assign %v18, %v217 : i1
  %v218 = pyc.constant 2 : i2
  %v219 = pyc.eq %v146, %v218 : i2
  %v220 = pyc.and %v219, %v27 : i1
  %v221 = pyc.alias %v220 {pyc.name = "this_sel__fastfwd_v2_1__L167"} : i1
  %v222 = pyc.constant 0 : i1
  %v223 = pyc.mux %v221, %v222, %v27 : i1
  pyc.assign %v23, %v223 : i1
  %v224 = pyc.constant 3 : i2
  %v225 = pyc.eq %v146, %v224 : i2
  %v226 = pyc.and %v225, %v32 : i1
  %v227 = pyc.alias %v226 {pyc.name = "this_sel__fastfwd_v2_1__L167"} : i1
  %v228 = pyc.constant 0 : i1
  %v229 = pyc.mux %v227, %v228, %v32 : i1
  pyc.assign %v28, %v229 : i1
  %v230 = pyc.wire {pyc.name = "pkt_in_bkpr_reg__next"} : i1
  %v231 = pyc.constant 1 : i1
  %v232 = pyc.constant 0 : i1
  %v233 = pyc.reg %clk, %rst, %v231, %v230, %v232 : i1
  %v234 = pyc.alias %v233 {pyc.name = "pkt_in_bkpr_reg"} : i1
  %v235 = pyc.alias %v234 {pyc.name = "bkpr__fastfwd_v2_1__L173"} : i1
  %v236 = pyc.constant 0 : i3
  %v237 = pyc.zext %v17 : i1 -> i3
  %v238 = pyc.add %v237, %v236 : i3
  %v239 = pyc.alias %v238 {pyc.name = "pending_cnt__fastfwd_v2_1__L178"} : i3
  %v240 = pyc.zext %v22 : i1 -> i3
  %v241 = pyc.add %v239, %v240 : i3
  %v242 = pyc.alias %v241 {pyc.name = "pending_cnt__fastfwd_v2_1__L178"} : i3
  %v243 = pyc.zext %v27 : i1 -> i3
  %v244 = pyc.add %v242, %v243 : i3
  %v245 = pyc.alias %v244 {pyc.name = "pending_cnt__fastfwd_v2_1__L178"} : i3
  %v246 = pyc.zext %v32 : i1 -> i3
  %v247 = pyc.add %v245, %v246 : i3
  %v248 = pyc.alias %v247 {pyc.name = "pending_cnt__fastfwd_v2_1__L178"} : i3
  %v249 = pyc.constant 3 : i3
  %v250 = pyc.ult %v248, %v249 : i3
  %v251 = pyc.not %v250 : i1
  pyc.assign %v230, %v251 : i1
  %v252 = pyc.constant 0 : i1
  %v253 = pyc.constant 0 : i128
  %v254 = pyc.constant 0 : i2
  %v255 = pyc.constant 0 : i1
  %v256 = pyc.constant 0 : i128
  %v257 = pyc.constant 0 : i1
  %v258 = pyc.constant 0 : i128
  %v259 = pyc.constant 0 : i2
  %v260 = pyc.constant 0 : i1
  %v261 = pyc.constant 0 : i128
  %v262 = pyc.constant 0 : i1
  %v263 = pyc.constant 0 : i128
  %v264 = pyc.constant 0 : i2
  %v265 = pyc.constant 0 : i1
  %v266 = pyc.constant 0 : i128
  %v267 = pyc.constant 0 : i1
  %v268 = pyc.constant 0 : i128
  %v269 = pyc.constant 0 : i2
  %v270 = pyc.constant 0 : i1
  %v271 = pyc.constant 0 : i128
  func.return %v109, %v129, %v114, %v134, %v119, %v139, %v124, %v144, %v252, %v253, %v254, %v255, %v256, %v257, %v258, %v259, %v260, %v261, %v262, %v263, %v264, %v265, %v266, %v267, %v268, %v269, %v270, %v271, %v235 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1
}

}

