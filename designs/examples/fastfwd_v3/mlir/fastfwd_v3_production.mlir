module attributes {pyc.top = @fastfwd_v3, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "fwd0_pkt_data_vld", "fwd0_pkt_data", "fwd0_pkt_lat", "fwd0_pkt_dp_vld", "fwd0_pkt_dp_data", "fwd1_pkt_data_vld", "fwd1_pkt_data", "fwd1_pkt_lat", "fwd1_pkt_dp_vld", "fwd1_pkt_dp_data", "fwd2_pkt_data_vld", "fwd2_pkt_data", "fwd2_pkt_lat", "fwd2_pkt_dp_vld", "fwd2_pkt_dp_data", "fwd3_pkt_data_vld", "fwd3_pkt_data", "fwd3_pkt_lat", "fwd3_pkt_dp_vld", "fwd3_pkt_dp_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_production__L65"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v3_production__L66"} : i2
  %v13 = pyc.wire {pyc.name = "in0_valid__next"} : i1
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i1
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i1
  %v17 = pyc.alias %v16 {pyc.name = "in0_valid"} : i1
  %v18 = pyc.wire {pyc.name = "in1_valid__next"} : i1
  %v19 = pyc.constant 1 : i1
  %v20 = pyc.constant 0 : i1
  %v21 = pyc.reg %clk, %rst, %v19, %v18, %v20 : i1
  %v22 = pyc.alias %v21 {pyc.name = "in1_valid"} : i1
  %v23 = pyc.wire {pyc.name = "in2_valid__next"} : i1
  %v24 = pyc.constant 1 : i1
  %v25 = pyc.constant 0 : i1
  %v26 = pyc.reg %clk, %rst, %v24, %v23, %v25 : i1
  %v27 = pyc.alias %v26 {pyc.name = "in2_valid"} : i1
  %v28 = pyc.wire {pyc.name = "in3_valid__next"} : i1
  %v29 = pyc.constant 1 : i1
  %v30 = pyc.constant 0 : i1
  %v31 = pyc.reg %clk, %rst, %v29, %v28, %v30 : i1
  %v32 = pyc.alias %v31 {pyc.name = "in3_valid"} : i1
  %v33 = pyc.wire {pyc.name = "in0_data__next"} : i128
  %v34 = pyc.constant 1 : i1
  %v35 = pyc.constant 0 : i128
  %v36 = pyc.reg %clk, %rst, %v34, %v33, %v35 : i128
  %v37 = pyc.alias %v36 {pyc.name = "in0_data"} : i128
  %v38 = pyc.wire {pyc.name = "in1_data__next"} : i128
  %v39 = pyc.constant 1 : i1
  %v40 = pyc.constant 0 : i128
  %v41 = pyc.reg %clk, %rst, %v39, %v38, %v40 : i128
  %v42 = pyc.alias %v41 {pyc.name = "in1_data"} : i128
  %v43 = pyc.wire {pyc.name = "in2_data__next"} : i128
  %v44 = pyc.constant 1 : i1
  %v45 = pyc.constant 0 : i128
  %v46 = pyc.reg %clk, %rst, %v44, %v43, %v45 : i128
  %v47 = pyc.alias %v46 {pyc.name = "in2_data"} : i128
  %v48 = pyc.wire {pyc.name = "in3_data__next"} : i128
  %v49 = pyc.constant 1 : i1
  %v50 = pyc.constant 0 : i128
  %v51 = pyc.reg %clk, %rst, %v49, %v48, %v50 : i128
  %v52 = pyc.alias %v51 {pyc.name = "in3_data"} : i128
  %v53 = pyc.wire {pyc.name = "in0_seq__next"} : i16
  %v54 = pyc.constant 1 : i1
  %v55 = pyc.constant 0 : i16
  %v56 = pyc.reg %clk, %rst, %v54, %v53, %v55 : i16
  %v57 = pyc.alias %v56 {pyc.name = "in0_seq"} : i16
  %v58 = pyc.wire {pyc.name = "in1_seq__next"} : i16
  %v59 = pyc.constant 1 : i1
  %v60 = pyc.constant 0 : i16
  %v61 = pyc.reg %clk, %rst, %v59, %v58, %v60 : i16
  %v62 = pyc.alias %v61 {pyc.name = "in1_seq"} : i16
  %v63 = pyc.wire {pyc.name = "in2_seq__next"} : i16
  %v64 = pyc.constant 1 : i1
  %v65 = pyc.constant 0 : i16
  %v66 = pyc.reg %clk, %rst, %v64, %v63, %v65 : i16
  %v67 = pyc.alias %v66 {pyc.name = "in2_seq"} : i16
  %v68 = pyc.wire {pyc.name = "in3_seq__next"} : i16
  %v69 = pyc.constant 1 : i1
  %v70 = pyc.constant 0 : i16
  %v71 = pyc.reg %clk, %rst, %v69, %v68, %v70 : i16
  %v72 = pyc.alias %v71 {pyc.name = "in3_seq"} : i16
  %v73 = pyc.wire {pyc.name = "in0_ctrl__next"} : i5
  %v74 = pyc.constant 1 : i1
  %v75 = pyc.constant 0 : i5
  %v76 = pyc.reg %clk, %rst, %v74, %v73, %v75 : i5
  %v77 = pyc.alias %v76 {pyc.name = "in0_ctrl"} : i5
  %v78 = pyc.wire {pyc.name = "in1_ctrl__next"} : i5
  %v79 = pyc.constant 1 : i1
  %v80 = pyc.constant 0 : i5
  %v81 = pyc.reg %clk, %rst, %v79, %v78, %v80 : i5
  %v82 = pyc.alias %v81 {pyc.name = "in1_ctrl"} : i5
  %v83 = pyc.wire {pyc.name = "in2_ctrl__next"} : i5
  %v84 = pyc.constant 1 : i1
  %v85 = pyc.constant 0 : i5
  %v86 = pyc.reg %clk, %rst, %v84, %v83, %v85 : i5
  %v87 = pyc.alias %v86 {pyc.name = "in2_ctrl"} : i5
  %v88 = pyc.wire {pyc.name = "in3_ctrl__next"} : i5
  %v89 = pyc.constant 1 : i1
  %v90 = pyc.constant 0 : i5
  %v91 = pyc.reg %clk, %rst, %v89, %v88, %v90 : i5
  %v92 = pyc.alias %v91 {pyc.name = "in3_ctrl"} : i5
  %v93 = pyc.wire {pyc.name = "in0_lat__next"} : i2
  %v94 = pyc.constant 1 : i1
  %v95 = pyc.constant 0 : i2
  %v96 = pyc.reg %clk, %rst, %v94, %v93, %v95 : i2
  %v97 = pyc.alias %v96 {pyc.name = "in0_lat"} : i2
  %v98 = pyc.wire {pyc.name = "in1_lat__next"} : i2
  %v99 = pyc.constant 1 : i1
  %v100 = pyc.constant 0 : i2
  %v101 = pyc.reg %clk, %rst, %v99, %v98, %v100 : i2
  %v102 = pyc.alias %v101 {pyc.name = "in1_lat"} : i2
  %v103 = pyc.wire {pyc.name = "in2_lat__next"} : i2
  %v104 = pyc.constant 1 : i1
  %v105 = pyc.constant 0 : i2
  %v106 = pyc.reg %clk, %rst, %v104, %v103, %v105 : i2
  %v107 = pyc.alias %v106 {pyc.name = "in2_lat"} : i2
  %v108 = pyc.wire {pyc.name = "in3_lat__next"} : i2
  %v109 = pyc.constant 1 : i1
  %v110 = pyc.constant 0 : i2
  %v111 = pyc.reg %clk, %rst, %v109, %v108, %v110 : i2
  %v112 = pyc.alias %v111 {pyc.name = "in3_lat"} : i2
  %v113 = pyc.wire {pyc.name = "in0_dep__next"} : i3
  %v114 = pyc.constant 1 : i1
  %v115 = pyc.constant 0 : i3
  %v116 = pyc.reg %clk, %rst, %v114, %v113, %v115 : i3
  %v117 = pyc.alias %v116 {pyc.name = "in0_dep"} : i3
  %v118 = pyc.wire {pyc.name = "in1_dep__next"} : i3
  %v119 = pyc.constant 1 : i1
  %v120 = pyc.constant 0 : i3
  %v121 = pyc.reg %clk, %rst, %v119, %v118, %v120 : i3
  %v122 = pyc.alias %v121 {pyc.name = "in1_dep"} : i3
  %v123 = pyc.wire {pyc.name = "in2_dep__next"} : i3
  %v124 = pyc.constant 1 : i1
  %v125 = pyc.constant 0 : i3
  %v126 = pyc.reg %clk, %rst, %v124, %v123, %v125 : i3
  %v127 = pyc.alias %v126 {pyc.name = "in2_dep"} : i3
  %v128 = pyc.wire {pyc.name = "in3_dep__next"} : i3
  %v129 = pyc.constant 1 : i1
  %v130 = pyc.constant 0 : i3
  %v131 = pyc.reg %clk, %rst, %v129, %v128, %v130 : i3
  %v132 = pyc.alias %v131 {pyc.name = "in3_dep"} : i3
  %v133 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_production__L78"} : i16
  %v134 = pyc.alias %lane0_pkt_in_vld {pyc.name = "has_0__fastfwd_v3_production__L81"} : i1
  %v135 = pyc.alias %lane0_pkt_in_ctrl {pyc.name = "ctrl_0__fastfwd_v3_production__L82"} : i5
  %v136 = pyc.constant 3 : i5
  %v137 = pyc.and %v135, %v136 : i5
  %v138 = pyc.alias %v137 {pyc.name = "lat_0__fastfwd_v3_production__L83"} : i5
  %v139 = pyc.lshri %v135 {amount = 2} : i5
  %v140 = pyc.constant 7 : i5
  %v141 = pyc.and %v139, %v140 : i5
  %v142 = pyc.alias %v141 {pyc.name = "dep_0__fastfwd_v3_production__L84"} : i5
  pyc.assign %v13, %v134 : i1
  pyc.assign %v33, %lane0_pkt_in_data : i128
  pyc.assign %v53, %v133 : i16
  pyc.assign %v73, %v135 : i5
  %v143 = pyc.trunc %v138 : i5 -> i2
  pyc.assign %v93, %v143 : i2
  %v144 = pyc.trunc %v142 : i5 -> i3
  pyc.assign %v113, %v144 : i3
  %v145 = pyc.constant 1 : i16
  %v146 = pyc.add %v133, %v145 : i16
  %v147 = pyc.alias %v146 {pyc.name = "new_seq_0__fastfwd_v3_production__L93"} : i16
  %v148 = pyc.mux %v134, %v147, %v133 : i16
  %v149 = pyc.alias %v148 {pyc.name = "seq_after_0__fastfwd_v3_production__L94"} : i16
  %v150 = pyc.alias %lane1_pkt_in_vld {pyc.name = "has_1__fastfwd_v3_production__L97"} : i1
  %v151 = pyc.alias %lane1_pkt_in_ctrl {pyc.name = "ctrl_1__fastfwd_v3_production__L98"} : i5
  %v152 = pyc.constant 3 : i5
  %v153 = pyc.and %v151, %v152 : i5
  %v154 = pyc.alias %v153 {pyc.name = "lat_1__fastfwd_v3_production__L99"} : i5
  %v155 = pyc.lshri %v151 {amount = 2} : i5
  %v156 = pyc.constant 7 : i5
  %v157 = pyc.and %v155, %v156 : i5
  %v158 = pyc.alias %v157 {pyc.name = "dep_1__fastfwd_v3_production__L100"} : i5
  pyc.assign %v18, %v150 : i1
  pyc.assign %v38, %lane1_pkt_in_data : i128
  pyc.assign %v58, %v149 : i16
  pyc.assign %v78, %v151 : i5
  %v159 = pyc.trunc %v154 : i5 -> i2
  pyc.assign %v98, %v159 : i2
  %v160 = pyc.trunc %v158 : i5 -> i3
  pyc.assign %v118, %v160 : i3
  %v161 = pyc.constant 1 : i16
  %v162 = pyc.add %v149, %v161 : i16
  %v163 = pyc.alias %v162 {pyc.name = "new_seq_1__fastfwd_v3_production__L109"} : i16
  %v164 = pyc.mux %v150, %v163, %v149 : i16
  %v165 = pyc.alias %v164 {pyc.name = "seq_after_1__fastfwd_v3_production__L110"} : i16
  %v166 = pyc.alias %lane2_pkt_in_vld {pyc.name = "has_2__fastfwd_v3_production__L113"} : i1
  %v167 = pyc.alias %lane2_pkt_in_ctrl {pyc.name = "ctrl_2__fastfwd_v3_production__L114"} : i5
  %v168 = pyc.constant 3 : i5
  %v169 = pyc.and %v167, %v168 : i5
  %v170 = pyc.alias %v169 {pyc.name = "lat_2__fastfwd_v3_production__L115"} : i5
  %v171 = pyc.lshri %v167 {amount = 2} : i5
  %v172 = pyc.constant 7 : i5
  %v173 = pyc.and %v171, %v172 : i5
  %v174 = pyc.alias %v173 {pyc.name = "dep_2__fastfwd_v3_production__L116"} : i5
  pyc.assign %v23, %v166 : i1
  pyc.assign %v43, %lane2_pkt_in_data : i128
  pyc.assign %v63, %v165 : i16
  pyc.assign %v83, %v167 : i5
  %v175 = pyc.trunc %v170 : i5 -> i2
  pyc.assign %v103, %v175 : i2
  %v176 = pyc.trunc %v174 : i5 -> i3
  pyc.assign %v123, %v176 : i3
  %v177 = pyc.constant 1 : i16
  %v178 = pyc.add %v165, %v177 : i16
  %v179 = pyc.alias %v178 {pyc.name = "new_seq_2__fastfwd_v3_production__L125"} : i16
  %v180 = pyc.mux %v166, %v179, %v165 : i16
  %v181 = pyc.alias %v180 {pyc.name = "seq_after_2__fastfwd_v3_production__L126"} : i16
  %v182 = pyc.alias %lane3_pkt_in_vld {pyc.name = "has_3__fastfwd_v3_production__L129"} : i1
  %v183 = pyc.alias %lane3_pkt_in_ctrl {pyc.name = "ctrl_3__fastfwd_v3_production__L130"} : i5
  %v184 = pyc.constant 3 : i5
  %v185 = pyc.and %v183, %v184 : i5
  %v186 = pyc.alias %v185 {pyc.name = "lat_3__fastfwd_v3_production__L131"} : i5
  %v187 = pyc.lshri %v183 {amount = 2} : i5
  %v188 = pyc.constant 7 : i5
  %v189 = pyc.and %v187, %v188 : i5
  %v190 = pyc.alias %v189 {pyc.name = "dep_3__fastfwd_v3_production__L132"} : i5
  pyc.assign %v28, %v182 : i1
  pyc.assign %v48, %lane3_pkt_in_data : i128
  pyc.assign %v68, %v181 : i16
  pyc.assign %v88, %v183 : i5
  %v191 = pyc.trunc %v186 : i5 -> i2
  pyc.assign %v108, %v191 : i2
  %v192 = pyc.trunc %v190 : i5 -> i3
  pyc.assign %v128, %v192 : i3
  %v193 = pyc.constant 1 : i16
  %v194 = pyc.add %v181, %v193 : i16
  %v195 = pyc.alias %v194 {pyc.name = "new_seq_3__fastfwd_v3_production__L141"} : i16
  %v196 = pyc.mux %v182, %v195, %v181 : i16
  pyc.assign %v1, %v196 : i16
  %v197 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v198 = pyc.constant 1 : i1
  %v199 = pyc.constant 0 : i1
  %v200 = pyc.reg %clk, %rst, %v198, %v197, %v199 : i1
  %v201 = pyc.alias %v200 {pyc.name = "dep0_valid"} : i1
  %v202 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v203 = pyc.constant 1 : i1
  %v204 = pyc.constant 0 : i1
  %v205 = pyc.reg %clk, %rst, %v203, %v202, %v204 : i1
  %v206 = pyc.alias %v205 {pyc.name = "dep1_valid"} : i1
  %v207 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v208 = pyc.constant 1 : i1
  %v209 = pyc.constant 0 : i1
  %v210 = pyc.reg %clk, %rst, %v208, %v207, %v209 : i1
  %v211 = pyc.alias %v210 {pyc.name = "dep2_valid"} : i1
  %v212 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v213 = pyc.constant 1 : i1
  %v214 = pyc.constant 0 : i1
  %v215 = pyc.reg %clk, %rst, %v213, %v212, %v214 : i1
  %v216 = pyc.alias %v215 {pyc.name = "dep3_valid"} : i1
  %v217 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v218 = pyc.constant 1 : i1
  %v219 = pyc.constant 0 : i1
  %v220 = pyc.reg %clk, %rst, %v218, %v217, %v219 : i1
  %v221 = pyc.alias %v220 {pyc.name = "dep4_valid"} : i1
  %v222 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v223 = pyc.constant 1 : i1
  %v224 = pyc.constant 0 : i1
  %v225 = pyc.reg %clk, %rst, %v223, %v222, %v224 : i1
  %v226 = pyc.alias %v225 {pyc.name = "dep5_valid"} : i1
  %v227 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v228 = pyc.constant 1 : i1
  %v229 = pyc.constant 0 : i1
  %v230 = pyc.reg %clk, %rst, %v228, %v227, %v229 : i1
  %v231 = pyc.alias %v230 {pyc.name = "dep6_valid"} : i1
  %v232 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v233 = pyc.constant 1 : i1
  %v234 = pyc.constant 0 : i1
  %v235 = pyc.reg %clk, %rst, %v233, %v232, %v234 : i1
  %v236 = pyc.alias %v235 {pyc.name = "dep7_valid"} : i1
  %v237 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v238 = pyc.constant 1 : i1
  %v239 = pyc.constant 0 : i128
  %v240 = pyc.reg %clk, %rst, %v238, %v237, %v239 : i128
  %v241 = pyc.alias %v240 {pyc.name = "dep0_data"} : i128
  %v242 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v243 = pyc.constant 1 : i1
  %v244 = pyc.constant 0 : i128
  %v245 = pyc.reg %clk, %rst, %v243, %v242, %v244 : i128
  %v246 = pyc.alias %v245 {pyc.name = "dep1_data"} : i128
  %v247 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v248 = pyc.constant 1 : i1
  %v249 = pyc.constant 0 : i128
  %v250 = pyc.reg %clk, %rst, %v248, %v247, %v249 : i128
  %v251 = pyc.alias %v250 {pyc.name = "dep2_data"} : i128
  %v252 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v253 = pyc.constant 1 : i1
  %v254 = pyc.constant 0 : i128
  %v255 = pyc.reg %clk, %rst, %v253, %v252, %v254 : i128
  %v256 = pyc.alias %v255 {pyc.name = "dep3_data"} : i128
  %v257 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v258 = pyc.constant 1 : i1
  %v259 = pyc.constant 0 : i128
  %v260 = pyc.reg %clk, %rst, %v258, %v257, %v259 : i128
  %v261 = pyc.alias %v260 {pyc.name = "dep4_data"} : i128
  %v262 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v263 = pyc.constant 1 : i1
  %v264 = pyc.constant 0 : i128
  %v265 = pyc.reg %clk, %rst, %v263, %v262, %v264 : i128
  %v266 = pyc.alias %v265 {pyc.name = "dep5_data"} : i128
  %v267 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v268 = pyc.constant 1 : i1
  %v269 = pyc.constant 0 : i128
  %v270 = pyc.reg %clk, %rst, %v268, %v267, %v269 : i128
  %v271 = pyc.alias %v270 {pyc.name = "dep6_data"} : i128
  %v272 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v273 = pyc.constant 1 : i1
  %v274 = pyc.constant 0 : i128
  %v275 = pyc.reg %clk, %rst, %v273, %v272, %v274 : i128
  %v276 = pyc.alias %v275 {pyc.name = "dep7_data"} : i128
  %v277 = pyc.wire {pyc.name = "dep0_seq__next"} : i16
  %v278 = pyc.constant 1 : i1
  %v279 = pyc.constant 0 : i16
  %v280 = pyc.reg %clk, %rst, %v278, %v277, %v279 : i16
  %v281 = pyc.alias %v280 {pyc.name = "dep0_seq"} : i16
  %v282 = pyc.wire {pyc.name = "dep1_seq__next"} : i16
  %v283 = pyc.constant 1 : i1
  %v284 = pyc.constant 0 : i16
  %v285 = pyc.reg %clk, %rst, %v283, %v282, %v284 : i16
  %v286 = pyc.alias %v285 {pyc.name = "dep1_seq"} : i16
  %v287 = pyc.wire {pyc.name = "dep2_seq__next"} : i16
  %v288 = pyc.constant 1 : i1
  %v289 = pyc.constant 0 : i16
  %v290 = pyc.reg %clk, %rst, %v288, %v287, %v289 : i16
  %v291 = pyc.alias %v290 {pyc.name = "dep2_seq"} : i16
  %v292 = pyc.wire {pyc.name = "dep3_seq__next"} : i16
  %v293 = pyc.constant 1 : i1
  %v294 = pyc.constant 0 : i16
  %v295 = pyc.reg %clk, %rst, %v293, %v292, %v294 : i16
  %v296 = pyc.alias %v295 {pyc.name = "dep3_seq"} : i16
  %v297 = pyc.wire {pyc.name = "dep4_seq__next"} : i16
  %v298 = pyc.constant 1 : i1
  %v299 = pyc.constant 0 : i16
  %v300 = pyc.reg %clk, %rst, %v298, %v297, %v299 : i16
  %v301 = pyc.alias %v300 {pyc.name = "dep4_seq"} : i16
  %v302 = pyc.wire {pyc.name = "dep5_seq__next"} : i16
  %v303 = pyc.constant 1 : i1
  %v304 = pyc.constant 0 : i16
  %v305 = pyc.reg %clk, %rst, %v303, %v302, %v304 : i16
  %v306 = pyc.alias %v305 {pyc.name = "dep5_seq"} : i16
  %v307 = pyc.wire {pyc.name = "dep6_seq__next"} : i16
  %v308 = pyc.constant 1 : i1
  %v309 = pyc.constant 0 : i16
  %v310 = pyc.reg %clk, %rst, %v308, %v307, %v309 : i16
  %v311 = pyc.alias %v310 {pyc.name = "dep6_seq"} : i16
  %v312 = pyc.wire {pyc.name = "dep7_seq__next"} : i16
  %v313 = pyc.constant 1 : i1
  %v314 = pyc.constant 0 : i16
  %v315 = pyc.reg %clk, %rst, %v313, %v312, %v314 : i16
  %v316 = pyc.alias %v315 {pyc.name = "dep7_seq"} : i16
  %v317 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v318 = pyc.constant 1 : i1
  %v319 = pyc.constant 0 : i1
  %v320 = pyc.reg %clk, %rst, %v318, %v317, %v319 : i1
  %v321 = pyc.alias %v320 {pyc.name = "fe0_busy"} : i1
  %v322 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v323 = pyc.constant 1 : i1
  %v324 = pyc.constant 0 : i1
  %v325 = pyc.reg %clk, %rst, %v323, %v322, %v324 : i1
  %v326 = pyc.alias %v325 {pyc.name = "fe1_busy"} : i1
  %v327 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v328 = pyc.constant 1 : i1
  %v329 = pyc.constant 0 : i1
  %v330 = pyc.reg %clk, %rst, %v328, %v327, %v329 : i1
  %v331 = pyc.alias %v330 {pyc.name = "fe2_busy"} : i1
  %v332 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v333 = pyc.constant 1 : i1
  %v334 = pyc.constant 0 : i1
  %v335 = pyc.reg %clk, %rst, %v333, %v332, %v334 : i1
  %v336 = pyc.alias %v335 {pyc.name = "fe3_busy"} : i1
  %v337 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v338 = pyc.constant 1 : i1
  %v339 = pyc.constant 0 : i3
  %v340 = pyc.reg %clk, %rst, %v338, %v337, %v339 : i3
  %v341 = pyc.alias %v340 {pyc.name = "fe0_timer"} : i3
  %v342 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v343 = pyc.constant 1 : i1
  %v344 = pyc.constant 0 : i3
  %v345 = pyc.reg %clk, %rst, %v343, %v342, %v344 : i3
  %v346 = pyc.alias %v345 {pyc.name = "fe1_timer"} : i3
  %v347 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v348 = pyc.constant 1 : i1
  %v349 = pyc.constant 0 : i3
  %v350 = pyc.reg %clk, %rst, %v348, %v347, %v349 : i3
  %v351 = pyc.alias %v350 {pyc.name = "fe2_timer"} : i3
  %v352 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v353 = pyc.constant 1 : i1
  %v354 = pyc.constant 0 : i3
  %v355 = pyc.reg %clk, %rst, %v353, %v352, %v354 : i3
  %v356 = pyc.alias %v355 {pyc.name = "fe3_timer"} : i3
  %v357 = pyc.wire {pyc.name = "fe0_seq__next"} : i16
  %v358 = pyc.constant 1 : i1
  %v359 = pyc.constant 0 : i16
  %v360 = pyc.reg %clk, %rst, %v358, %v357, %v359 : i16
  %v361 = pyc.alias %v360 {pyc.name = "fe0_seq"} : i16
  %v362 = pyc.wire {pyc.name = "fe1_seq__next"} : i16
  %v363 = pyc.constant 1 : i1
  %v364 = pyc.constant 0 : i16
  %v365 = pyc.reg %clk, %rst, %v363, %v362, %v364 : i16
  %v366 = pyc.alias %v365 {pyc.name = "fe1_seq"} : i16
  %v367 = pyc.wire {pyc.name = "fe2_seq__next"} : i16
  %v368 = pyc.constant 1 : i1
  %v369 = pyc.constant 0 : i16
  %v370 = pyc.reg %clk, %rst, %v368, %v367, %v369 : i16
  %v371 = pyc.alias %v370 {pyc.name = "fe2_seq"} : i16
  %v372 = pyc.wire {pyc.name = "fe3_seq__next"} : i16
  %v373 = pyc.constant 1 : i1
  %v374 = pyc.constant 0 : i16
  %v375 = pyc.reg %clk, %rst, %v373, %v372, %v374 : i16
  %v376 = pyc.alias %v375 {pyc.name = "fe3_seq"} : i16
  %v377 = pyc.wire {pyc.name = "fe0_data__next"} : i128
  %v378 = pyc.constant 1 : i1
  %v379 = pyc.constant 0 : i128
  %v380 = pyc.reg %clk, %rst, %v378, %v377, %v379 : i128
  %v381 = pyc.alias %v380 {pyc.name = "fe0_data"} : i128
  %v382 = pyc.wire {pyc.name = "fe1_data__next"} : i128
  %v383 = pyc.constant 1 : i1
  %v384 = pyc.constant 0 : i128
  %v385 = pyc.reg %clk, %rst, %v383, %v382, %v384 : i128
  %v386 = pyc.alias %v385 {pyc.name = "fe1_data"} : i128
  %v387 = pyc.wire {pyc.name = "fe2_data__next"} : i128
  %v388 = pyc.constant 1 : i1
  %v389 = pyc.constant 0 : i128
  %v390 = pyc.reg %clk, %rst, %v388, %v387, %v389 : i128
  %v391 = pyc.alias %v390 {pyc.name = "fe2_data"} : i128
  %v392 = pyc.wire {pyc.name = "fe3_data__next"} : i128
  %v393 = pyc.constant 1 : i1
  %v394 = pyc.constant 0 : i128
  %v395 = pyc.reg %clk, %rst, %v393, %v392, %v394 : i128
  %v396 = pyc.alias %v395 {pyc.name = "fe3_data"} : i128
  %v397 = pyc.wire {pyc.name = "fe0_result__next"} : i128
  %v398 = pyc.constant 1 : i1
  %v399 = pyc.constant 0 : i128
  %v400 = pyc.reg %clk, %rst, %v398, %v397, %v399 : i128
  %v401 = pyc.alias %v400 {pyc.name = "fe0_result"} : i128
  %v402 = pyc.wire {pyc.name = "fe1_result__next"} : i128
  %v403 = pyc.constant 1 : i1
  %v404 = pyc.constant 0 : i128
  %v405 = pyc.reg %clk, %rst, %v403, %v402, %v404 : i128
  %v406 = pyc.alias %v405 {pyc.name = "fe1_result"} : i128
  %v407 = pyc.wire {pyc.name = "fe2_result__next"} : i128
  %v408 = pyc.constant 1 : i1
  %v409 = pyc.constant 0 : i128
  %v410 = pyc.reg %clk, %rst, %v408, %v407, %v409 : i128
  %v411 = pyc.alias %v410 {pyc.name = "fe2_result"} : i128
  %v412 = pyc.wire {pyc.name = "fe3_result__next"} : i128
  %v413 = pyc.constant 1 : i1
  %v414 = pyc.constant 0 : i128
  %v415 = pyc.reg %clk, %rst, %v413, %v412, %v414 : i128
  %v416 = pyc.alias %v415 {pyc.name = "fe3_result"} : i128
  %v417 = pyc.wire {pyc.name = "last_lat__next"} : i2
  %v418 = pyc.constant 1 : i1
  %v419 = pyc.constant 0 : i2
  %v420 = pyc.reg %clk, %rst, %v418, %v417, %v419 : i2
  %v421 = pyc.alias %v420 {pyc.name = "last_lat"} : i2
  %v422 = pyc.alias %v421 {pyc.name = "last_lat__fastfwd_v3_production__L161"} : i2
  %v423 = pyc.wire {pyc.name = "fwd0_vld__next"} : i1
  %v424 = pyc.constant 1 : i1
  %v425 = pyc.constant 0 : i1
  %v426 = pyc.reg %clk, %rst, %v424, %v423, %v425 : i1
  %v427 = pyc.alias %v426 {pyc.name = "fwd0_vld"} : i1
  %v428 = pyc.wire {pyc.name = "fwd1_vld__next"} : i1
  %v429 = pyc.constant 1 : i1
  %v430 = pyc.constant 0 : i1
  %v431 = pyc.reg %clk, %rst, %v429, %v428, %v430 : i1
  %v432 = pyc.alias %v431 {pyc.name = "fwd1_vld"} : i1
  %v433 = pyc.wire {pyc.name = "fwd2_vld__next"} : i1
  %v434 = pyc.constant 1 : i1
  %v435 = pyc.constant 0 : i1
  %v436 = pyc.reg %clk, %rst, %v434, %v433, %v435 : i1
  %v437 = pyc.alias %v436 {pyc.name = "fwd2_vld"} : i1
  %v438 = pyc.wire {pyc.name = "fwd3_vld__next"} : i1
  %v439 = pyc.constant 1 : i1
  %v440 = pyc.constant 0 : i1
  %v441 = pyc.reg %clk, %rst, %v439, %v438, %v440 : i1
  %v442 = pyc.alias %v441 {pyc.name = "fwd3_vld"} : i1
  %v443 = pyc.wire {pyc.name = "fwd0_data__next"} : i128
  %v444 = pyc.constant 1 : i1
  %v445 = pyc.constant 0 : i128
  %v446 = pyc.reg %clk, %rst, %v444, %v443, %v445 : i128
  %v447 = pyc.alias %v446 {pyc.name = "fwd0_data"} : i128
  %v448 = pyc.wire {pyc.name = "fwd1_data__next"} : i128
  %v449 = pyc.constant 1 : i1
  %v450 = pyc.constant 0 : i128
  %v451 = pyc.reg %clk, %rst, %v449, %v448, %v450 : i128
  %v452 = pyc.alias %v451 {pyc.name = "fwd1_data"} : i128
  %v453 = pyc.wire {pyc.name = "fwd2_data__next"} : i128
  %v454 = pyc.constant 1 : i1
  %v455 = pyc.constant 0 : i128
  %v456 = pyc.reg %clk, %rst, %v454, %v453, %v455 : i128
  %v457 = pyc.alias %v456 {pyc.name = "fwd2_data"} : i128
  %v458 = pyc.wire {pyc.name = "fwd3_data__next"} : i128
  %v459 = pyc.constant 1 : i1
  %v460 = pyc.constant 0 : i128
  %v461 = pyc.reg %clk, %rst, %v459, %v458, %v460 : i128
  %v462 = pyc.alias %v461 {pyc.name = "fwd3_data"} : i128
  %v463 = pyc.wire {pyc.name = "fwd0_lat__next"} : i2
  %v464 = pyc.constant 1 : i1
  %v465 = pyc.constant 0 : i2
  %v466 = pyc.reg %clk, %rst, %v464, %v463, %v465 : i2
  %v467 = pyc.alias %v466 {pyc.name = "fwd0_lat"} : i2
  %v468 = pyc.wire {pyc.name = "fwd1_lat__next"} : i2
  %v469 = pyc.constant 1 : i1
  %v470 = pyc.constant 0 : i2
  %v471 = pyc.reg %clk, %rst, %v469, %v468, %v470 : i2
  %v472 = pyc.alias %v471 {pyc.name = "fwd1_lat"} : i2
  %v473 = pyc.wire {pyc.name = "fwd2_lat__next"} : i2
  %v474 = pyc.constant 1 : i1
  %v475 = pyc.constant 0 : i2
  %v476 = pyc.reg %clk, %rst, %v474, %v473, %v475 : i2
  %v477 = pyc.alias %v476 {pyc.name = "fwd2_lat"} : i2
  %v478 = pyc.wire {pyc.name = "fwd3_lat__next"} : i2
  %v479 = pyc.constant 1 : i1
  %v480 = pyc.constant 0 : i2
  %v481 = pyc.reg %clk, %rst, %v479, %v478, %v480 : i2
  %v482 = pyc.alias %v481 {pyc.name = "fwd3_lat"} : i2
  %v483 = pyc.wire {pyc.name = "fwd0_dp_vld__next"} : i1
  %v484 = pyc.constant 1 : i1
  %v485 = pyc.constant 0 : i1
  %v486 = pyc.reg %clk, %rst, %v484, %v483, %v485 : i1
  %v487 = pyc.alias %v486 {pyc.name = "fwd0_dp_vld"} : i1
  %v488 = pyc.wire {pyc.name = "fwd1_dp_vld__next"} : i1
  %v489 = pyc.constant 1 : i1
  %v490 = pyc.constant 0 : i1
  %v491 = pyc.reg %clk, %rst, %v489, %v488, %v490 : i1
  %v492 = pyc.alias %v491 {pyc.name = "fwd1_dp_vld"} : i1
  %v493 = pyc.wire {pyc.name = "fwd2_dp_vld__next"} : i1
  %v494 = pyc.constant 1 : i1
  %v495 = pyc.constant 0 : i1
  %v496 = pyc.reg %clk, %rst, %v494, %v493, %v495 : i1
  %v497 = pyc.alias %v496 {pyc.name = "fwd2_dp_vld"} : i1
  %v498 = pyc.wire {pyc.name = "fwd3_dp_vld__next"} : i1
  %v499 = pyc.constant 1 : i1
  %v500 = pyc.constant 0 : i1
  %v501 = pyc.reg %clk, %rst, %v499, %v498, %v500 : i1
  %v502 = pyc.alias %v501 {pyc.name = "fwd3_dp_vld"} : i1
  %v503 = pyc.wire {pyc.name = "fwd0_dp_data__next"} : i128
  %v504 = pyc.constant 1 : i1
  %v505 = pyc.constant 0 : i128
  %v506 = pyc.reg %clk, %rst, %v504, %v503, %v505 : i128
  %v507 = pyc.alias %v506 {pyc.name = "fwd0_dp_data"} : i128
  %v508 = pyc.wire {pyc.name = "fwd1_dp_data__next"} : i128
  %v509 = pyc.constant 1 : i1
  %v510 = pyc.constant 0 : i128
  %v511 = pyc.reg %clk, %rst, %v509, %v508, %v510 : i128
  %v512 = pyc.alias %v511 {pyc.name = "fwd1_dp_data"} : i128
  %v513 = pyc.wire {pyc.name = "fwd2_dp_data__next"} : i128
  %v514 = pyc.constant 1 : i1
  %v515 = pyc.constant 0 : i128
  %v516 = pyc.reg %clk, %rst, %v514, %v513, %v515 : i128
  %v517 = pyc.alias %v516 {pyc.name = "fwd2_dp_data"} : i128
  %v518 = pyc.wire {pyc.name = "fwd3_dp_data__next"} : i128
  %v519 = pyc.constant 1 : i1
  %v520 = pyc.constant 0 : i128
  %v521 = pyc.reg %clk, %rst, %v519, %v518, %v520 : i128
  %v522 = pyc.alias %v521 {pyc.name = "fwd3_dp_data"} : i128
  pyc.assign %v423, %v17 : i1
  pyc.assign %v443, %v37 : i128
  pyc.assign %v463, %v97 : i2
  %v523 = pyc.constant 0 : i3
  %v524 = pyc.eq %v117, %v523 : i3
  %v525 = pyc.not %v524 : i1
  %v526 = pyc.alias %v525 {pyc.name = "has_dep__fastfwd_v3_production__L179"} : i1
  pyc.assign %v483, %v526 : i1
  %v527 = pyc.constant 0 : i128
  pyc.assign %v503, %v527 : i128
  pyc.assign %v428, %v22 : i1
  pyc.assign %v448, %v42 : i128
  pyc.assign %v468, %v102 : i2
  %v528 = pyc.constant 0 : i3
  %v529 = pyc.eq %v122, %v528 : i3
  %v530 = pyc.not %v529 : i1
  %v531 = pyc.alias %v530 {pyc.name = "has_dep__fastfwd_v3_production__L179"} : i1
  pyc.assign %v488, %v531 : i1
  %v532 = pyc.constant 0 : i128
  pyc.assign %v508, %v532 : i128
  pyc.assign %v433, %v27 : i1
  pyc.assign %v453, %v47 : i128
  pyc.assign %v473, %v107 : i2
  %v533 = pyc.constant 0 : i3
  %v534 = pyc.eq %v127, %v533 : i3
  %v535 = pyc.not %v534 : i1
  %v536 = pyc.alias %v535 {pyc.name = "has_dep__fastfwd_v3_production__L179"} : i1
  pyc.assign %v493, %v536 : i1
  %v537 = pyc.constant 0 : i128
  pyc.assign %v513, %v537 : i128
  pyc.assign %v438, %v32 : i1
  pyc.assign %v458, %v52 : i128
  pyc.assign %v478, %v112 : i2
  %v538 = pyc.constant 0 : i3
  %v539 = pyc.eq %v132, %v538 : i3
  %v540 = pyc.not %v539 : i1
  %v541 = pyc.alias %v540 {pyc.name = "has_dep__fastfwd_v3_production__L179"} : i1
  pyc.assign %v498, %v541 : i1
  %v542 = pyc.constant 0 : i128
  pyc.assign %v518, %v542 : i128
  %v543 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v544 = pyc.constant 1 : i1
  %v545 = pyc.constant 0 : i1
  %v546 = pyc.reg %clk, %rst, %v544, %v543, %v545 : i1
  %v547 = pyc.alias %v546 {pyc.name = "rob0_valid"} : i1
  %v548 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v549 = pyc.constant 1 : i1
  %v550 = pyc.constant 0 : i1
  %v551 = pyc.reg %clk, %rst, %v549, %v548, %v550 : i1
  %v552 = pyc.alias %v551 {pyc.name = "rob1_valid"} : i1
  %v553 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v554 = pyc.constant 1 : i1
  %v555 = pyc.constant 0 : i1
  %v556 = pyc.reg %clk, %rst, %v554, %v553, %v555 : i1
  %v557 = pyc.alias %v556 {pyc.name = "rob2_valid"} : i1
  %v558 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v559 = pyc.constant 1 : i1
  %v560 = pyc.constant 0 : i1
  %v561 = pyc.reg %clk, %rst, %v559, %v558, %v560 : i1
  %v562 = pyc.alias %v561 {pyc.name = "rob3_valid"} : i1
  %v563 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v564 = pyc.constant 1 : i1
  %v565 = pyc.constant 0 : i1
  %v566 = pyc.reg %clk, %rst, %v564, %v563, %v565 : i1
  %v567 = pyc.alias %v566 {pyc.name = "rob4_valid"} : i1
  %v568 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v569 = pyc.constant 1 : i1
  %v570 = pyc.constant 0 : i1
  %v571 = pyc.reg %clk, %rst, %v569, %v568, %v570 : i1
  %v572 = pyc.alias %v571 {pyc.name = "rob5_valid"} : i1
  %v573 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v574 = pyc.constant 1 : i1
  %v575 = pyc.constant 0 : i1
  %v576 = pyc.reg %clk, %rst, %v574, %v573, %v575 : i1
  %v577 = pyc.alias %v576 {pyc.name = "rob6_valid"} : i1
  %v578 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v579 = pyc.constant 1 : i1
  %v580 = pyc.constant 0 : i1
  %v581 = pyc.reg %clk, %rst, %v579, %v578, %v580 : i1
  %v582 = pyc.alias %v581 {pyc.name = "rob7_valid"} : i1
  %v583 = pyc.wire {pyc.name = "rob8_valid__next"} : i1
  %v584 = pyc.constant 1 : i1
  %v585 = pyc.constant 0 : i1
  %v586 = pyc.reg %clk, %rst, %v584, %v583, %v585 : i1
  %v587 = pyc.alias %v586 {pyc.name = "rob8_valid"} : i1
  %v588 = pyc.wire {pyc.name = "rob9_valid__next"} : i1
  %v589 = pyc.constant 1 : i1
  %v590 = pyc.constant 0 : i1
  %v591 = pyc.reg %clk, %rst, %v589, %v588, %v590 : i1
  %v592 = pyc.alias %v591 {pyc.name = "rob9_valid"} : i1
  %v593 = pyc.wire {pyc.name = "rob10_valid__next"} : i1
  %v594 = pyc.constant 1 : i1
  %v595 = pyc.constant 0 : i1
  %v596 = pyc.reg %clk, %rst, %v594, %v593, %v595 : i1
  %v597 = pyc.alias %v596 {pyc.name = "rob10_valid"} : i1
  %v598 = pyc.wire {pyc.name = "rob11_valid__next"} : i1
  %v599 = pyc.constant 1 : i1
  %v600 = pyc.constant 0 : i1
  %v601 = pyc.reg %clk, %rst, %v599, %v598, %v600 : i1
  %v602 = pyc.alias %v601 {pyc.name = "rob11_valid"} : i1
  %v603 = pyc.wire {pyc.name = "rob12_valid__next"} : i1
  %v604 = pyc.constant 1 : i1
  %v605 = pyc.constant 0 : i1
  %v606 = pyc.reg %clk, %rst, %v604, %v603, %v605 : i1
  %v607 = pyc.alias %v606 {pyc.name = "rob12_valid"} : i1
  %v608 = pyc.wire {pyc.name = "rob13_valid__next"} : i1
  %v609 = pyc.constant 1 : i1
  %v610 = pyc.constant 0 : i1
  %v611 = pyc.reg %clk, %rst, %v609, %v608, %v610 : i1
  %v612 = pyc.alias %v611 {pyc.name = "rob13_valid"} : i1
  %v613 = pyc.wire {pyc.name = "rob14_valid__next"} : i1
  %v614 = pyc.constant 1 : i1
  %v615 = pyc.constant 0 : i1
  %v616 = pyc.reg %clk, %rst, %v614, %v613, %v615 : i1
  %v617 = pyc.alias %v616 {pyc.name = "rob14_valid"} : i1
  %v618 = pyc.wire {pyc.name = "rob15_valid__next"} : i1
  %v619 = pyc.constant 1 : i1
  %v620 = pyc.constant 0 : i1
  %v621 = pyc.reg %clk, %rst, %v619, %v618, %v620 : i1
  %v622 = pyc.alias %v621 {pyc.name = "rob15_valid"} : i1
  %v623 = pyc.wire {pyc.name = "rob16_valid__next"} : i1
  %v624 = pyc.constant 1 : i1
  %v625 = pyc.constant 0 : i1
  %v626 = pyc.reg %clk, %rst, %v624, %v623, %v625 : i1
  %v627 = pyc.alias %v626 {pyc.name = "rob16_valid"} : i1
  %v628 = pyc.wire {pyc.name = "rob17_valid__next"} : i1
  %v629 = pyc.constant 1 : i1
  %v630 = pyc.constant 0 : i1
  %v631 = pyc.reg %clk, %rst, %v629, %v628, %v630 : i1
  %v632 = pyc.alias %v631 {pyc.name = "rob17_valid"} : i1
  %v633 = pyc.wire {pyc.name = "rob18_valid__next"} : i1
  %v634 = pyc.constant 1 : i1
  %v635 = pyc.constant 0 : i1
  %v636 = pyc.reg %clk, %rst, %v634, %v633, %v635 : i1
  %v637 = pyc.alias %v636 {pyc.name = "rob18_valid"} : i1
  %v638 = pyc.wire {pyc.name = "rob19_valid__next"} : i1
  %v639 = pyc.constant 1 : i1
  %v640 = pyc.constant 0 : i1
  %v641 = pyc.reg %clk, %rst, %v639, %v638, %v640 : i1
  %v642 = pyc.alias %v641 {pyc.name = "rob19_valid"} : i1
  %v643 = pyc.wire {pyc.name = "rob20_valid__next"} : i1
  %v644 = pyc.constant 1 : i1
  %v645 = pyc.constant 0 : i1
  %v646 = pyc.reg %clk, %rst, %v644, %v643, %v645 : i1
  %v647 = pyc.alias %v646 {pyc.name = "rob20_valid"} : i1
  %v648 = pyc.wire {pyc.name = "rob21_valid__next"} : i1
  %v649 = pyc.constant 1 : i1
  %v650 = pyc.constant 0 : i1
  %v651 = pyc.reg %clk, %rst, %v649, %v648, %v650 : i1
  %v652 = pyc.alias %v651 {pyc.name = "rob21_valid"} : i1
  %v653 = pyc.wire {pyc.name = "rob22_valid__next"} : i1
  %v654 = pyc.constant 1 : i1
  %v655 = pyc.constant 0 : i1
  %v656 = pyc.reg %clk, %rst, %v654, %v653, %v655 : i1
  %v657 = pyc.alias %v656 {pyc.name = "rob22_valid"} : i1
  %v658 = pyc.wire {pyc.name = "rob23_valid__next"} : i1
  %v659 = pyc.constant 1 : i1
  %v660 = pyc.constant 0 : i1
  %v661 = pyc.reg %clk, %rst, %v659, %v658, %v660 : i1
  %v662 = pyc.alias %v661 {pyc.name = "rob23_valid"} : i1
  %v663 = pyc.wire {pyc.name = "rob24_valid__next"} : i1
  %v664 = pyc.constant 1 : i1
  %v665 = pyc.constant 0 : i1
  %v666 = pyc.reg %clk, %rst, %v664, %v663, %v665 : i1
  %v667 = pyc.alias %v666 {pyc.name = "rob24_valid"} : i1
  %v668 = pyc.wire {pyc.name = "rob25_valid__next"} : i1
  %v669 = pyc.constant 1 : i1
  %v670 = pyc.constant 0 : i1
  %v671 = pyc.reg %clk, %rst, %v669, %v668, %v670 : i1
  %v672 = pyc.alias %v671 {pyc.name = "rob25_valid"} : i1
  %v673 = pyc.wire {pyc.name = "rob26_valid__next"} : i1
  %v674 = pyc.constant 1 : i1
  %v675 = pyc.constant 0 : i1
  %v676 = pyc.reg %clk, %rst, %v674, %v673, %v675 : i1
  %v677 = pyc.alias %v676 {pyc.name = "rob26_valid"} : i1
  %v678 = pyc.wire {pyc.name = "rob27_valid__next"} : i1
  %v679 = pyc.constant 1 : i1
  %v680 = pyc.constant 0 : i1
  %v681 = pyc.reg %clk, %rst, %v679, %v678, %v680 : i1
  %v682 = pyc.alias %v681 {pyc.name = "rob27_valid"} : i1
  %v683 = pyc.wire {pyc.name = "rob28_valid__next"} : i1
  %v684 = pyc.constant 1 : i1
  %v685 = pyc.constant 0 : i1
  %v686 = pyc.reg %clk, %rst, %v684, %v683, %v685 : i1
  %v687 = pyc.alias %v686 {pyc.name = "rob28_valid"} : i1
  %v688 = pyc.wire {pyc.name = "rob29_valid__next"} : i1
  %v689 = pyc.constant 1 : i1
  %v690 = pyc.constant 0 : i1
  %v691 = pyc.reg %clk, %rst, %v689, %v688, %v690 : i1
  %v692 = pyc.alias %v691 {pyc.name = "rob29_valid"} : i1
  %v693 = pyc.wire {pyc.name = "rob30_valid__next"} : i1
  %v694 = pyc.constant 1 : i1
  %v695 = pyc.constant 0 : i1
  %v696 = pyc.reg %clk, %rst, %v694, %v693, %v695 : i1
  %v697 = pyc.alias %v696 {pyc.name = "rob30_valid"} : i1
  %v698 = pyc.wire {pyc.name = "rob31_valid__next"} : i1
  %v699 = pyc.constant 1 : i1
  %v700 = pyc.constant 0 : i1
  %v701 = pyc.reg %clk, %rst, %v699, %v698, %v700 : i1
  %v702 = pyc.alias %v701 {pyc.name = "rob31_valid"} : i1
  %v703 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v704 = pyc.constant 1 : i1
  %v705 = pyc.constant 0 : i128
  %v706 = pyc.reg %clk, %rst, %v704, %v703, %v705 : i128
  %v707 = pyc.alias %v706 {pyc.name = "rob0_data"} : i128
  %v708 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v709 = pyc.constant 1 : i1
  %v710 = pyc.constant 0 : i128
  %v711 = pyc.reg %clk, %rst, %v709, %v708, %v710 : i128
  %v712 = pyc.alias %v711 {pyc.name = "rob1_data"} : i128
  %v713 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v714 = pyc.constant 1 : i1
  %v715 = pyc.constant 0 : i128
  %v716 = pyc.reg %clk, %rst, %v714, %v713, %v715 : i128
  %v717 = pyc.alias %v716 {pyc.name = "rob2_data"} : i128
  %v718 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v719 = pyc.constant 1 : i1
  %v720 = pyc.constant 0 : i128
  %v721 = pyc.reg %clk, %rst, %v719, %v718, %v720 : i128
  %v722 = pyc.alias %v721 {pyc.name = "rob3_data"} : i128
  %v723 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v724 = pyc.constant 1 : i1
  %v725 = pyc.constant 0 : i128
  %v726 = pyc.reg %clk, %rst, %v724, %v723, %v725 : i128
  %v727 = pyc.alias %v726 {pyc.name = "rob4_data"} : i128
  %v728 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v729 = pyc.constant 1 : i1
  %v730 = pyc.constant 0 : i128
  %v731 = pyc.reg %clk, %rst, %v729, %v728, %v730 : i128
  %v732 = pyc.alias %v731 {pyc.name = "rob5_data"} : i128
  %v733 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v734 = pyc.constant 1 : i1
  %v735 = pyc.constant 0 : i128
  %v736 = pyc.reg %clk, %rst, %v734, %v733, %v735 : i128
  %v737 = pyc.alias %v736 {pyc.name = "rob6_data"} : i128
  %v738 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v739 = pyc.constant 1 : i1
  %v740 = pyc.constant 0 : i128
  %v741 = pyc.reg %clk, %rst, %v739, %v738, %v740 : i128
  %v742 = pyc.alias %v741 {pyc.name = "rob7_data"} : i128
  %v743 = pyc.wire {pyc.name = "rob8_data__next"} : i128
  %v744 = pyc.constant 1 : i1
  %v745 = pyc.constant 0 : i128
  %v746 = pyc.reg %clk, %rst, %v744, %v743, %v745 : i128
  %v747 = pyc.alias %v746 {pyc.name = "rob8_data"} : i128
  %v748 = pyc.wire {pyc.name = "rob9_data__next"} : i128
  %v749 = pyc.constant 1 : i1
  %v750 = pyc.constant 0 : i128
  %v751 = pyc.reg %clk, %rst, %v749, %v748, %v750 : i128
  %v752 = pyc.alias %v751 {pyc.name = "rob9_data"} : i128
  %v753 = pyc.wire {pyc.name = "rob10_data__next"} : i128
  %v754 = pyc.constant 1 : i1
  %v755 = pyc.constant 0 : i128
  %v756 = pyc.reg %clk, %rst, %v754, %v753, %v755 : i128
  %v757 = pyc.alias %v756 {pyc.name = "rob10_data"} : i128
  %v758 = pyc.wire {pyc.name = "rob11_data__next"} : i128
  %v759 = pyc.constant 1 : i1
  %v760 = pyc.constant 0 : i128
  %v761 = pyc.reg %clk, %rst, %v759, %v758, %v760 : i128
  %v762 = pyc.alias %v761 {pyc.name = "rob11_data"} : i128
  %v763 = pyc.wire {pyc.name = "rob12_data__next"} : i128
  %v764 = pyc.constant 1 : i1
  %v765 = pyc.constant 0 : i128
  %v766 = pyc.reg %clk, %rst, %v764, %v763, %v765 : i128
  %v767 = pyc.alias %v766 {pyc.name = "rob12_data"} : i128
  %v768 = pyc.wire {pyc.name = "rob13_data__next"} : i128
  %v769 = pyc.constant 1 : i1
  %v770 = pyc.constant 0 : i128
  %v771 = pyc.reg %clk, %rst, %v769, %v768, %v770 : i128
  %v772 = pyc.alias %v771 {pyc.name = "rob13_data"} : i128
  %v773 = pyc.wire {pyc.name = "rob14_data__next"} : i128
  %v774 = pyc.constant 1 : i1
  %v775 = pyc.constant 0 : i128
  %v776 = pyc.reg %clk, %rst, %v774, %v773, %v775 : i128
  %v777 = pyc.alias %v776 {pyc.name = "rob14_data"} : i128
  %v778 = pyc.wire {pyc.name = "rob15_data__next"} : i128
  %v779 = pyc.constant 1 : i1
  %v780 = pyc.constant 0 : i128
  %v781 = pyc.reg %clk, %rst, %v779, %v778, %v780 : i128
  %v782 = pyc.alias %v781 {pyc.name = "rob15_data"} : i128
  %v783 = pyc.wire {pyc.name = "rob16_data__next"} : i128
  %v784 = pyc.constant 1 : i1
  %v785 = pyc.constant 0 : i128
  %v786 = pyc.reg %clk, %rst, %v784, %v783, %v785 : i128
  %v787 = pyc.alias %v786 {pyc.name = "rob16_data"} : i128
  %v788 = pyc.wire {pyc.name = "rob17_data__next"} : i128
  %v789 = pyc.constant 1 : i1
  %v790 = pyc.constant 0 : i128
  %v791 = pyc.reg %clk, %rst, %v789, %v788, %v790 : i128
  %v792 = pyc.alias %v791 {pyc.name = "rob17_data"} : i128
  %v793 = pyc.wire {pyc.name = "rob18_data__next"} : i128
  %v794 = pyc.constant 1 : i1
  %v795 = pyc.constant 0 : i128
  %v796 = pyc.reg %clk, %rst, %v794, %v793, %v795 : i128
  %v797 = pyc.alias %v796 {pyc.name = "rob18_data"} : i128
  %v798 = pyc.wire {pyc.name = "rob19_data__next"} : i128
  %v799 = pyc.constant 1 : i1
  %v800 = pyc.constant 0 : i128
  %v801 = pyc.reg %clk, %rst, %v799, %v798, %v800 : i128
  %v802 = pyc.alias %v801 {pyc.name = "rob19_data"} : i128
  %v803 = pyc.wire {pyc.name = "rob20_data__next"} : i128
  %v804 = pyc.constant 1 : i1
  %v805 = pyc.constant 0 : i128
  %v806 = pyc.reg %clk, %rst, %v804, %v803, %v805 : i128
  %v807 = pyc.alias %v806 {pyc.name = "rob20_data"} : i128
  %v808 = pyc.wire {pyc.name = "rob21_data__next"} : i128
  %v809 = pyc.constant 1 : i1
  %v810 = pyc.constant 0 : i128
  %v811 = pyc.reg %clk, %rst, %v809, %v808, %v810 : i128
  %v812 = pyc.alias %v811 {pyc.name = "rob21_data"} : i128
  %v813 = pyc.wire {pyc.name = "rob22_data__next"} : i128
  %v814 = pyc.constant 1 : i1
  %v815 = pyc.constant 0 : i128
  %v816 = pyc.reg %clk, %rst, %v814, %v813, %v815 : i128
  %v817 = pyc.alias %v816 {pyc.name = "rob22_data"} : i128
  %v818 = pyc.wire {pyc.name = "rob23_data__next"} : i128
  %v819 = pyc.constant 1 : i1
  %v820 = pyc.constant 0 : i128
  %v821 = pyc.reg %clk, %rst, %v819, %v818, %v820 : i128
  %v822 = pyc.alias %v821 {pyc.name = "rob23_data"} : i128
  %v823 = pyc.wire {pyc.name = "rob24_data__next"} : i128
  %v824 = pyc.constant 1 : i1
  %v825 = pyc.constant 0 : i128
  %v826 = pyc.reg %clk, %rst, %v824, %v823, %v825 : i128
  %v827 = pyc.alias %v826 {pyc.name = "rob24_data"} : i128
  %v828 = pyc.wire {pyc.name = "rob25_data__next"} : i128
  %v829 = pyc.constant 1 : i1
  %v830 = pyc.constant 0 : i128
  %v831 = pyc.reg %clk, %rst, %v829, %v828, %v830 : i128
  %v832 = pyc.alias %v831 {pyc.name = "rob25_data"} : i128
  %v833 = pyc.wire {pyc.name = "rob26_data__next"} : i128
  %v834 = pyc.constant 1 : i1
  %v835 = pyc.constant 0 : i128
  %v836 = pyc.reg %clk, %rst, %v834, %v833, %v835 : i128
  %v837 = pyc.alias %v836 {pyc.name = "rob26_data"} : i128
  %v838 = pyc.wire {pyc.name = "rob27_data__next"} : i128
  %v839 = pyc.constant 1 : i1
  %v840 = pyc.constant 0 : i128
  %v841 = pyc.reg %clk, %rst, %v839, %v838, %v840 : i128
  %v842 = pyc.alias %v841 {pyc.name = "rob27_data"} : i128
  %v843 = pyc.wire {pyc.name = "rob28_data__next"} : i128
  %v844 = pyc.constant 1 : i1
  %v845 = pyc.constant 0 : i128
  %v846 = pyc.reg %clk, %rst, %v844, %v843, %v845 : i128
  %v847 = pyc.alias %v846 {pyc.name = "rob28_data"} : i128
  %v848 = pyc.wire {pyc.name = "rob29_data__next"} : i128
  %v849 = pyc.constant 1 : i1
  %v850 = pyc.constant 0 : i128
  %v851 = pyc.reg %clk, %rst, %v849, %v848, %v850 : i128
  %v852 = pyc.alias %v851 {pyc.name = "rob29_data"} : i128
  %v853 = pyc.wire {pyc.name = "rob30_data__next"} : i128
  %v854 = pyc.constant 1 : i1
  %v855 = pyc.constant 0 : i128
  %v856 = pyc.reg %clk, %rst, %v854, %v853, %v855 : i128
  %v857 = pyc.alias %v856 {pyc.name = "rob30_data"} : i128
  %v858 = pyc.wire {pyc.name = "rob31_data__next"} : i128
  %v859 = pyc.constant 1 : i1
  %v860 = pyc.constant 0 : i128
  %v861 = pyc.reg %clk, %rst, %v859, %v858, %v860 : i128
  %v862 = pyc.alias %v861 {pyc.name = "rob31_data"} : i128
  %v863 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v864 = pyc.constant 1 : i1
  %v865 = pyc.constant 0 : i16
  %v866 = pyc.reg %clk, %rst, %v864, %v863, %v865 : i16
  %v867 = pyc.alias %v866 {pyc.name = "rob0_seq"} : i16
  %v868 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v869 = pyc.constant 1 : i1
  %v870 = pyc.constant 0 : i16
  %v871 = pyc.reg %clk, %rst, %v869, %v868, %v870 : i16
  %v872 = pyc.alias %v871 {pyc.name = "rob1_seq"} : i16
  %v873 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v874 = pyc.constant 1 : i1
  %v875 = pyc.constant 0 : i16
  %v876 = pyc.reg %clk, %rst, %v874, %v873, %v875 : i16
  %v877 = pyc.alias %v876 {pyc.name = "rob2_seq"} : i16
  %v878 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v879 = pyc.constant 1 : i1
  %v880 = pyc.constant 0 : i16
  %v881 = pyc.reg %clk, %rst, %v879, %v878, %v880 : i16
  %v882 = pyc.alias %v881 {pyc.name = "rob3_seq"} : i16
  %v883 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v884 = pyc.constant 1 : i1
  %v885 = pyc.constant 0 : i16
  %v886 = pyc.reg %clk, %rst, %v884, %v883, %v885 : i16
  %v887 = pyc.alias %v886 {pyc.name = "rob4_seq"} : i16
  %v888 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v889 = pyc.constant 1 : i1
  %v890 = pyc.constant 0 : i16
  %v891 = pyc.reg %clk, %rst, %v889, %v888, %v890 : i16
  %v892 = pyc.alias %v891 {pyc.name = "rob5_seq"} : i16
  %v893 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v894 = pyc.constant 1 : i1
  %v895 = pyc.constant 0 : i16
  %v896 = pyc.reg %clk, %rst, %v894, %v893, %v895 : i16
  %v897 = pyc.alias %v896 {pyc.name = "rob6_seq"} : i16
  %v898 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v899 = pyc.constant 1 : i1
  %v900 = pyc.constant 0 : i16
  %v901 = pyc.reg %clk, %rst, %v899, %v898, %v900 : i16
  %v902 = pyc.alias %v901 {pyc.name = "rob7_seq"} : i16
  %v903 = pyc.wire {pyc.name = "rob8_seq__next"} : i16
  %v904 = pyc.constant 1 : i1
  %v905 = pyc.constant 0 : i16
  %v906 = pyc.reg %clk, %rst, %v904, %v903, %v905 : i16
  %v907 = pyc.alias %v906 {pyc.name = "rob8_seq"} : i16
  %v908 = pyc.wire {pyc.name = "rob9_seq__next"} : i16
  %v909 = pyc.constant 1 : i1
  %v910 = pyc.constant 0 : i16
  %v911 = pyc.reg %clk, %rst, %v909, %v908, %v910 : i16
  %v912 = pyc.alias %v911 {pyc.name = "rob9_seq"} : i16
  %v913 = pyc.wire {pyc.name = "rob10_seq__next"} : i16
  %v914 = pyc.constant 1 : i1
  %v915 = pyc.constant 0 : i16
  %v916 = pyc.reg %clk, %rst, %v914, %v913, %v915 : i16
  %v917 = pyc.alias %v916 {pyc.name = "rob10_seq"} : i16
  %v918 = pyc.wire {pyc.name = "rob11_seq__next"} : i16
  %v919 = pyc.constant 1 : i1
  %v920 = pyc.constant 0 : i16
  %v921 = pyc.reg %clk, %rst, %v919, %v918, %v920 : i16
  %v922 = pyc.alias %v921 {pyc.name = "rob11_seq"} : i16
  %v923 = pyc.wire {pyc.name = "rob12_seq__next"} : i16
  %v924 = pyc.constant 1 : i1
  %v925 = pyc.constant 0 : i16
  %v926 = pyc.reg %clk, %rst, %v924, %v923, %v925 : i16
  %v927 = pyc.alias %v926 {pyc.name = "rob12_seq"} : i16
  %v928 = pyc.wire {pyc.name = "rob13_seq__next"} : i16
  %v929 = pyc.constant 1 : i1
  %v930 = pyc.constant 0 : i16
  %v931 = pyc.reg %clk, %rst, %v929, %v928, %v930 : i16
  %v932 = pyc.alias %v931 {pyc.name = "rob13_seq"} : i16
  %v933 = pyc.wire {pyc.name = "rob14_seq__next"} : i16
  %v934 = pyc.constant 1 : i1
  %v935 = pyc.constant 0 : i16
  %v936 = pyc.reg %clk, %rst, %v934, %v933, %v935 : i16
  %v937 = pyc.alias %v936 {pyc.name = "rob14_seq"} : i16
  %v938 = pyc.wire {pyc.name = "rob15_seq__next"} : i16
  %v939 = pyc.constant 1 : i1
  %v940 = pyc.constant 0 : i16
  %v941 = pyc.reg %clk, %rst, %v939, %v938, %v940 : i16
  %v942 = pyc.alias %v941 {pyc.name = "rob15_seq"} : i16
  %v943 = pyc.wire {pyc.name = "rob16_seq__next"} : i16
  %v944 = pyc.constant 1 : i1
  %v945 = pyc.constant 0 : i16
  %v946 = pyc.reg %clk, %rst, %v944, %v943, %v945 : i16
  %v947 = pyc.alias %v946 {pyc.name = "rob16_seq"} : i16
  %v948 = pyc.wire {pyc.name = "rob17_seq__next"} : i16
  %v949 = pyc.constant 1 : i1
  %v950 = pyc.constant 0 : i16
  %v951 = pyc.reg %clk, %rst, %v949, %v948, %v950 : i16
  %v952 = pyc.alias %v951 {pyc.name = "rob17_seq"} : i16
  %v953 = pyc.wire {pyc.name = "rob18_seq__next"} : i16
  %v954 = pyc.constant 1 : i1
  %v955 = pyc.constant 0 : i16
  %v956 = pyc.reg %clk, %rst, %v954, %v953, %v955 : i16
  %v957 = pyc.alias %v956 {pyc.name = "rob18_seq"} : i16
  %v958 = pyc.wire {pyc.name = "rob19_seq__next"} : i16
  %v959 = pyc.constant 1 : i1
  %v960 = pyc.constant 0 : i16
  %v961 = pyc.reg %clk, %rst, %v959, %v958, %v960 : i16
  %v962 = pyc.alias %v961 {pyc.name = "rob19_seq"} : i16
  %v963 = pyc.wire {pyc.name = "rob20_seq__next"} : i16
  %v964 = pyc.constant 1 : i1
  %v965 = pyc.constant 0 : i16
  %v966 = pyc.reg %clk, %rst, %v964, %v963, %v965 : i16
  %v967 = pyc.alias %v966 {pyc.name = "rob20_seq"} : i16
  %v968 = pyc.wire {pyc.name = "rob21_seq__next"} : i16
  %v969 = pyc.constant 1 : i1
  %v970 = pyc.constant 0 : i16
  %v971 = pyc.reg %clk, %rst, %v969, %v968, %v970 : i16
  %v972 = pyc.alias %v971 {pyc.name = "rob21_seq"} : i16
  %v973 = pyc.wire {pyc.name = "rob22_seq__next"} : i16
  %v974 = pyc.constant 1 : i1
  %v975 = pyc.constant 0 : i16
  %v976 = pyc.reg %clk, %rst, %v974, %v973, %v975 : i16
  %v977 = pyc.alias %v976 {pyc.name = "rob22_seq"} : i16
  %v978 = pyc.wire {pyc.name = "rob23_seq__next"} : i16
  %v979 = pyc.constant 1 : i1
  %v980 = pyc.constant 0 : i16
  %v981 = pyc.reg %clk, %rst, %v979, %v978, %v980 : i16
  %v982 = pyc.alias %v981 {pyc.name = "rob23_seq"} : i16
  %v983 = pyc.wire {pyc.name = "rob24_seq__next"} : i16
  %v984 = pyc.constant 1 : i1
  %v985 = pyc.constant 0 : i16
  %v986 = pyc.reg %clk, %rst, %v984, %v983, %v985 : i16
  %v987 = pyc.alias %v986 {pyc.name = "rob24_seq"} : i16
  %v988 = pyc.wire {pyc.name = "rob25_seq__next"} : i16
  %v989 = pyc.constant 1 : i1
  %v990 = pyc.constant 0 : i16
  %v991 = pyc.reg %clk, %rst, %v989, %v988, %v990 : i16
  %v992 = pyc.alias %v991 {pyc.name = "rob25_seq"} : i16
  %v993 = pyc.wire {pyc.name = "rob26_seq__next"} : i16
  %v994 = pyc.constant 1 : i1
  %v995 = pyc.constant 0 : i16
  %v996 = pyc.reg %clk, %rst, %v994, %v993, %v995 : i16
  %v997 = pyc.alias %v996 {pyc.name = "rob26_seq"} : i16
  %v998 = pyc.wire {pyc.name = "rob27_seq__next"} : i16
  %v999 = pyc.constant 1 : i1
  %v1000 = pyc.constant 0 : i16
  %v1001 = pyc.reg %clk, %rst, %v999, %v998, %v1000 : i16
  %v1002 = pyc.alias %v1001 {pyc.name = "rob27_seq"} : i16
  %v1003 = pyc.wire {pyc.name = "rob28_seq__next"} : i16
  %v1004 = pyc.constant 1 : i1
  %v1005 = pyc.constant 0 : i16
  %v1006 = pyc.reg %clk, %rst, %v1004, %v1003, %v1005 : i16
  %v1007 = pyc.alias %v1006 {pyc.name = "rob28_seq"} : i16
  %v1008 = pyc.wire {pyc.name = "rob29_seq__next"} : i16
  %v1009 = pyc.constant 1 : i1
  %v1010 = pyc.constant 0 : i16
  %v1011 = pyc.reg %clk, %rst, %v1009, %v1008, %v1010 : i16
  %v1012 = pyc.alias %v1011 {pyc.name = "rob29_seq"} : i16
  %v1013 = pyc.wire {pyc.name = "rob30_seq__next"} : i16
  %v1014 = pyc.constant 1 : i1
  %v1015 = pyc.constant 0 : i16
  %v1016 = pyc.reg %clk, %rst, %v1014, %v1013, %v1015 : i16
  %v1017 = pyc.alias %v1016 {pyc.name = "rob30_seq"} : i16
  %v1018 = pyc.wire {pyc.name = "rob31_seq__next"} : i16
  %v1019 = pyc.constant 1 : i1
  %v1020 = pyc.constant 0 : i16
  %v1021 = pyc.reg %clk, %rst, %v1019, %v1018, %v1020 : i16
  %v1022 = pyc.alias %v1021 {pyc.name = "rob31_seq"} : i16
  %v1023 = pyc.wire {pyc.name = "rob_wr_ptr__next"} : i5
  %v1024 = pyc.constant 1 : i1
  %v1025 = pyc.constant 0 : i5
  %v1026 = pyc.reg %clk, %rst, %v1024, %v1023, %v1025 : i5
  %v1027 = pyc.alias %v1026 {pyc.name = "rob_wr_ptr"} : i5
  %v1028 = pyc.alias %v1027 {pyc.name = "rob_wr_ptr__fastfwd_v3_production__L190"} : i5
  %v1029 = pyc.wire {pyc.name = "rob_rd_ptr__next"} : i5
  %v1030 = pyc.constant 1 : i1
  %v1031 = pyc.constant 0 : i5
  %v1032 = pyc.reg %clk, %rst, %v1030, %v1029, %v1031 : i5
  %v1033 = pyc.alias %v1032 {pyc.name = "rob_rd_ptr"} : i5
  %v1034 = pyc.alias %v1033 {pyc.name = "rob_rd_ptr__fastfwd_v3_production__L191"} : i5
  %v1035 = pyc.wire {pyc.name = "rob_count__next"} : i6
  %v1036 = pyc.constant 1 : i1
  %v1037 = pyc.constant 0 : i6
  %v1038 = pyc.reg %clk, %rst, %v1036, %v1035, %v1037 : i6
  %v1039 = pyc.alias %v1038 {pyc.name = "rob_count"} : i6
  %v1040 = pyc.alias %v1039 {pyc.name = "rob_count__fastfwd_v3_production__L192"} : i6
  %v1041 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v1042 = pyc.constant 1 : i1
  %v1043 = pyc.constant 0 : i1
  %v1044 = pyc.reg %clk, %rst, %v1042, %v1041, %v1043 : i1
  %v1045 = pyc.alias %v1044 {pyc.name = "lane0_out_vld"} : i1
  %v1046 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v1047 = pyc.constant 1 : i1
  %v1048 = pyc.constant 0 : i1
  %v1049 = pyc.reg %clk, %rst, %v1047, %v1046, %v1048 : i1
  %v1050 = pyc.alias %v1049 {pyc.name = "lane1_out_vld"} : i1
  %v1051 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v1052 = pyc.constant 1 : i1
  %v1053 = pyc.constant 0 : i1
  %v1054 = pyc.reg %clk, %rst, %v1052, %v1051, %v1053 : i1
  %v1055 = pyc.alias %v1054 {pyc.name = "lane2_out_vld"} : i1
  %v1056 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v1057 = pyc.constant 1 : i1
  %v1058 = pyc.constant 0 : i1
  %v1059 = pyc.reg %clk, %rst, %v1057, %v1056, %v1058 : i1
  %v1060 = pyc.alias %v1059 {pyc.name = "lane3_out_vld"} : i1
  %v1061 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v1062 = pyc.constant 1 : i1
  %v1063 = pyc.constant 0 : i128
  %v1064 = pyc.reg %clk, %rst, %v1062, %v1061, %v1063 : i128
  %v1065 = pyc.alias %v1064 {pyc.name = "lane0_out_data"} : i128
  %v1066 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v1067 = pyc.constant 1 : i1
  %v1068 = pyc.constant 0 : i128
  %v1069 = pyc.reg %clk, %rst, %v1067, %v1066, %v1068 : i128
  %v1070 = pyc.alias %v1069 {pyc.name = "lane1_out_data"} : i128
  %v1071 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v1072 = pyc.constant 1 : i1
  %v1073 = pyc.constant 0 : i128
  %v1074 = pyc.reg %clk, %rst, %v1072, %v1071, %v1073 : i128
  %v1075 = pyc.alias %v1074 {pyc.name = "lane2_out_data"} : i128
  %v1076 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v1077 = pyc.constant 1 : i1
  %v1078 = pyc.constant 0 : i128
  %v1079 = pyc.reg %clk, %rst, %v1077, %v1076, %v1078 : i128
  %v1080 = pyc.alias %v1079 {pyc.name = "lane3_out_data"} : i128
  %v1081 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_production__L201"} : i2
  %v1082 = pyc.constant 0 : i2
  %v1083 = pyc.eq %v1081, %v1082 : i2
  %v1084 = pyc.alias %v1083 {pyc.name = "this_lane__fastfwd_v3_production__L204"} : i1
  %v1085 = pyc.and %v1084, %v17 : i1
  %v1086 = pyc.alias %v1085 {pyc.name = "has_output__fastfwd_v3_production__L205"} : i1
  pyc.assign %v1041, %v1086 : i1
  %v1087 = pyc.constant 0 : i128
  %v1088 = pyc.mux %v1086, %v37, %v1087 : i128
  pyc.assign %v1061, %v1088 : i128
  %v1089 = pyc.constant 1 : i2
  %v1090 = pyc.eq %v1081, %v1089 : i2
  %v1091 = pyc.alias %v1090 {pyc.name = "this_lane__fastfwd_v3_production__L204"} : i1
  %v1092 = pyc.and %v1091, %v22 : i1
  %v1093 = pyc.alias %v1092 {pyc.name = "has_output__fastfwd_v3_production__L205"} : i1
  pyc.assign %v1046, %v1093 : i1
  %v1094 = pyc.constant 0 : i128
  %v1095 = pyc.mux %v1093, %v42, %v1094 : i128
  pyc.assign %v1066, %v1095 : i128
  %v1096 = pyc.constant 2 : i2
  %v1097 = pyc.eq %v1081, %v1096 : i2
  %v1098 = pyc.alias %v1097 {pyc.name = "this_lane__fastfwd_v3_production__L204"} : i1
  %v1099 = pyc.and %v1098, %v27 : i1
  %v1100 = pyc.alias %v1099 {pyc.name = "has_output__fastfwd_v3_production__L205"} : i1
  pyc.assign %v1051, %v1100 : i1
  %v1101 = pyc.constant 0 : i128
  %v1102 = pyc.mux %v1100, %v47, %v1101 : i128
  pyc.assign %v1071, %v1102 : i128
  %v1103 = pyc.constant 3 : i2
  %v1104 = pyc.eq %v1081, %v1103 : i2
  %v1105 = pyc.alias %v1104 {pyc.name = "this_lane__fastfwd_v3_production__L204"} : i1
  %v1106 = pyc.and %v1105, %v32 : i1
  %v1107 = pyc.alias %v1106 {pyc.name = "has_output__fastfwd_v3_production__L205"} : i1
  pyc.assign %v1056, %v1107 : i1
  %v1108 = pyc.constant 0 : i128
  %v1109 = pyc.mux %v1107, %v52, %v1108 : i128
  pyc.assign %v1076, %v1109 : i128
  %v1110 = pyc.or %v1045, %v1050 : i1
  %v1111 = pyc.or %v1110, %v1055 : i1
  %v1112 = pyc.or %v1111, %v1060 : i1
  %v1113 = pyc.alias %v1112 {pyc.name = "any_output__fastfwd_v3_production__L210"} : i1
  %v1114 = pyc.constant 1 : i2
  %v1115 = pyc.add %v1081, %v1114 : i2
  %v1116 = pyc.constant 3 : i2
  %v1117 = pyc.and %v1115, %v1116 : i2
  %v1118 = pyc.alias %v1117 {pyc.name = "new_ptr__fastfwd_v3_production__L211"} : i2
  %v1119 = pyc.mux %v1113, %v1118, %v1081 : i2
  pyc.assign %v7, %v1119 : i2
  %v1120 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v1121 = pyc.constant 1 : i1
  %v1122 = pyc.constant 0 : i1
  %v1123 = pyc.reg %clk, %rst, %v1121, %v1120, %v1122 : i1
  %v1124 = pyc.alias %v1123 {pyc.name = "bkpr_reg"} : i1
  %v1125 = pyc.alias %v1124 {pyc.name = "bkpr__fastfwd_v3_production__L217"} : i1
  %v1126 = pyc.constant 28 : i6
  %v1127 = pyc.ult %v1040, %v1126 : i6
  %v1128 = pyc.not %v1127 : i1
  pyc.assign %v1120, %v1128 : i1
  func.return %v1045, %v1065, %v1050, %v1070, %v1055, %v1075, %v1060, %v1080, %v427, %v447, %v467, %v487, %v507, %v432, %v452, %v472, %v492, %v512, %v437, %v457, %v477, %v497, %v517, %v442, %v462, %v482, %v502, %v522, %v1125 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1
}

}

