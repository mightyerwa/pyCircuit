module attributes {pyc.top = @fastfwd_v3_final, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3_final(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5, %fwded0_pkt_data_vld: i1, %fwded1_pkt_data_vld: i1, %fwded2_pkt_data_vld: i1, %fwded3_pkt_data_vld: i1, %fwded0_pkt_data: i128, %fwded1_pkt_data: i128, %fwded2_pkt_data: i128, %fwded3_pkt_data: i128) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl", "fwded0_pkt_data_vld", "fwded1_pkt_data_vld", "fwded2_pkt_data_vld", "fwded3_pkt_data_vld", "fwded0_pkt_data", "fwded1_pkt_data", "fwded2_pkt_data", "fwded3_pkt_data"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "fwd0_pkt_data_vld", "fwd0_pkt_data", "fwd0_pkt_lat", "fwd0_pkt_dp_vld", "fwd0_pkt_dp_data", "fwd1_pkt_data_vld", "fwd1_pkt_data", "fwd1_pkt_lat", "fwd1_pkt_dp_vld", "fwd1_pkt_dp_data", "fwd2_pkt_data_vld", "fwd2_pkt_data", "fwd2_pkt_lat", "fwd2_pkt_dp_vld", "fwd2_pkt_dp_data", "fwd3_pkt_data_vld", "fwd3_pkt_data", "fwd3_pkt_lat", "fwd3_pkt_dp_vld", "fwd3_pkt_dp_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3_final", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_final__L51"} : i16
  %v7 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i2
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i2
  %v11 = pyc.alias %v10 {pyc.name = "out_ptr"} : i2
  %v12 = pyc.alias %v11 {pyc.name = "out_ptr__fastfwd_v3_final__L52"} : i2
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
  %v73 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_final__L60"} : i16
  pyc.assign %v13, %lane0_pkt_in_vld : i1
  pyc.assign %v33, %lane0_pkt_in_data : i128
  %v74 = pyc.constant 0 : i16
  %v75 = pyc.add %v73, %v74 : i16
  pyc.assign %v53, %v75 : i16
  pyc.assign %v18, %lane1_pkt_in_vld : i1
  pyc.assign %v38, %lane1_pkt_in_data : i128
  %v76 = pyc.constant 0 : i1
  %v77 = pyc.add %lane0_pkt_in_vld, %v76 : i1
  %v78 = pyc.alias %v77 {pyc.name = "seq_offset__fastfwd_v3_final__L66"} : i1
  %v79 = pyc.zext %v78 : i1 -> i16
  %v80 = pyc.add %v73, %v79 : i16
  pyc.assign %v58, %v80 : i16
  pyc.assign %v23, %lane2_pkt_in_vld : i1
  pyc.assign %v43, %lane2_pkt_in_data : i128
  %v81 = pyc.constant 0 : i1
  %v82 = pyc.add %lane0_pkt_in_vld, %v81 : i1
  %v83 = pyc.add %v82, %lane1_pkt_in_vld : i1
  %v84 = pyc.alias %v83 {pyc.name = "seq_offset__fastfwd_v3_final__L66"} : i1
  %v85 = pyc.zext %v84 : i1 -> i16
  %v86 = pyc.add %v73, %v85 : i16
  pyc.assign %v63, %v86 : i16
  pyc.assign %v28, %lane3_pkt_in_vld : i1
  pyc.assign %v48, %lane3_pkt_in_data : i128
  %v87 = pyc.constant 0 : i1
  %v88 = pyc.add %lane0_pkt_in_vld, %v87 : i1
  %v89 = pyc.add %v88, %lane1_pkt_in_vld : i1
  %v90 = pyc.add %v89, %lane2_pkt_in_vld : i1
  %v91 = pyc.alias %v90 {pyc.name = "seq_offset__fastfwd_v3_final__L66"} : i1
  %v92 = pyc.zext %v91 : i1 -> i16
  %v93 = pyc.add %v73, %v92 : i16
  pyc.assign %v68, %v93 : i16
  %v94 = pyc.constant 0 : i1
  %v95 = pyc.add %lane0_pkt_in_vld, %v94 : i1
  %v96 = pyc.add %v95, %lane1_pkt_in_vld : i1
  %v97 = pyc.add %v96, %lane2_pkt_in_vld : i1
  %v98 = pyc.add %v97, %lane3_pkt_in_vld : i1
  %v99 = pyc.alias %v98 {pyc.name = "total_input__fastfwd_v3_final__L70"} : i1
  %v100 = pyc.zext %v99 : i1 -> i16
  %v101 = pyc.add %v73, %v100 : i16
  pyc.assign %v1, %v101 : i16
  %v102 = pyc.wire {pyc.name = "fwd0_vld__next"} : i1
  %v103 = pyc.constant 1 : i1
  %v104 = pyc.constant 0 : i1
  %v105 = pyc.reg %clk, %rst, %v103, %v102, %v104 : i1
  %v106 = pyc.alias %v105 {pyc.name = "fwd0_vld"} : i1
  %v107 = pyc.wire {pyc.name = "fwd1_vld__next"} : i1
  %v108 = pyc.constant 1 : i1
  %v109 = pyc.constant 0 : i1
  %v110 = pyc.reg %clk, %rst, %v108, %v107, %v109 : i1
  %v111 = pyc.alias %v110 {pyc.name = "fwd1_vld"} : i1
  %v112 = pyc.wire {pyc.name = "fwd2_vld__next"} : i1
  %v113 = pyc.constant 1 : i1
  %v114 = pyc.constant 0 : i1
  %v115 = pyc.reg %clk, %rst, %v113, %v112, %v114 : i1
  %v116 = pyc.alias %v115 {pyc.name = "fwd2_vld"} : i1
  %v117 = pyc.wire {pyc.name = "fwd3_vld__next"} : i1
  %v118 = pyc.constant 1 : i1
  %v119 = pyc.constant 0 : i1
  %v120 = pyc.reg %clk, %rst, %v118, %v117, %v119 : i1
  %v121 = pyc.alias %v120 {pyc.name = "fwd3_vld"} : i1
  %v122 = pyc.wire {pyc.name = "fwd0_data__next"} : i128
  %v123 = pyc.constant 1 : i1
  %v124 = pyc.constant 0 : i128
  %v125 = pyc.reg %clk, %rst, %v123, %v122, %v124 : i128
  %v126 = pyc.alias %v125 {pyc.name = "fwd0_data"} : i128
  %v127 = pyc.wire {pyc.name = "fwd1_data__next"} : i128
  %v128 = pyc.constant 1 : i1
  %v129 = pyc.constant 0 : i128
  %v130 = pyc.reg %clk, %rst, %v128, %v127, %v129 : i128
  %v131 = pyc.alias %v130 {pyc.name = "fwd1_data"} : i128
  %v132 = pyc.wire {pyc.name = "fwd2_data__next"} : i128
  %v133 = pyc.constant 1 : i1
  %v134 = pyc.constant 0 : i128
  %v135 = pyc.reg %clk, %rst, %v133, %v132, %v134 : i128
  %v136 = pyc.alias %v135 {pyc.name = "fwd2_data"} : i128
  %v137 = pyc.wire {pyc.name = "fwd3_data__next"} : i128
  %v138 = pyc.constant 1 : i1
  %v139 = pyc.constant 0 : i128
  %v140 = pyc.reg %clk, %rst, %v138, %v137, %v139 : i128
  %v141 = pyc.alias %v140 {pyc.name = "fwd3_data"} : i128
  %v142 = pyc.wire {pyc.name = "fwd0_lat__next"} : i2
  %v143 = pyc.constant 1 : i1
  %v144 = pyc.constant 0 : i2
  %v145 = pyc.reg %clk, %rst, %v143, %v142, %v144 : i2
  %v146 = pyc.alias %v145 {pyc.name = "fwd0_lat"} : i2
  %v147 = pyc.wire {pyc.name = "fwd1_lat__next"} : i2
  %v148 = pyc.constant 1 : i1
  %v149 = pyc.constant 0 : i2
  %v150 = pyc.reg %clk, %rst, %v148, %v147, %v149 : i2
  %v151 = pyc.alias %v150 {pyc.name = "fwd1_lat"} : i2
  %v152 = pyc.wire {pyc.name = "fwd2_lat__next"} : i2
  %v153 = pyc.constant 1 : i1
  %v154 = pyc.constant 0 : i2
  %v155 = pyc.reg %clk, %rst, %v153, %v152, %v154 : i2
  %v156 = pyc.alias %v155 {pyc.name = "fwd2_lat"} : i2
  %v157 = pyc.wire {pyc.name = "fwd3_lat__next"} : i2
  %v158 = pyc.constant 1 : i1
  %v159 = pyc.constant 0 : i2
  %v160 = pyc.reg %clk, %rst, %v158, %v157, %v159 : i2
  %v161 = pyc.alias %v160 {pyc.name = "fwd3_lat"} : i2
  pyc.assign %v102, %v17 : i1
  pyc.assign %v122, %v37 : i128
  %v162 = pyc.alias %lane0_pkt_in_ctrl {pyc.name = "ctrl__fastfwd_v3_final__L82"} : i5
  %v163 = pyc.constant 3 : i5
  %v164 = pyc.and %v162, %v163 : i5
  %v165 = pyc.trunc %v164 : i5 -> i2
  pyc.assign %v142, %v165 : i2
  pyc.assign %v107, %v22 : i1
  pyc.assign %v127, %v42 : i128
  %v166 = pyc.alias %lane1_pkt_in_ctrl {pyc.name = "ctrl__fastfwd_v3_final__L82"} : i5
  %v167 = pyc.constant 3 : i5
  %v168 = pyc.and %v166, %v167 : i5
  %v169 = pyc.trunc %v168 : i5 -> i2
  pyc.assign %v147, %v169 : i2
  pyc.assign %v112, %v27 : i1
  pyc.assign %v132, %v47 : i128
  %v170 = pyc.alias %lane2_pkt_in_ctrl {pyc.name = "ctrl__fastfwd_v3_final__L82"} : i5
  %v171 = pyc.constant 3 : i5
  %v172 = pyc.and %v170, %v171 : i5
  %v173 = pyc.trunc %v172 : i5 -> i2
  pyc.assign %v152, %v173 : i2
  pyc.assign %v117, %v32 : i1
  pyc.assign %v137, %v52 : i128
  %v174 = pyc.alias %lane3_pkt_in_ctrl {pyc.name = "ctrl__fastfwd_v3_final__L82"} : i5
  %v175 = pyc.constant 3 : i5
  %v176 = pyc.and %v174, %v175 : i5
  %v177 = pyc.trunc %v176 : i5 -> i2
  pyc.assign %v157, %v177 : i2
  %v178 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v179 = pyc.constant 1 : i1
  %v180 = pyc.constant 0 : i1
  %v181 = pyc.reg %clk, %rst, %v179, %v178, %v180 : i1
  %v182 = pyc.alias %v181 {pyc.name = "rob0_valid"} : i1
  %v183 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v184 = pyc.constant 1 : i1
  %v185 = pyc.constant 0 : i1
  %v186 = pyc.reg %clk, %rst, %v184, %v183, %v185 : i1
  %v187 = pyc.alias %v186 {pyc.name = "rob1_valid"} : i1
  %v188 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v189 = pyc.constant 1 : i1
  %v190 = pyc.constant 0 : i1
  %v191 = pyc.reg %clk, %rst, %v189, %v188, %v190 : i1
  %v192 = pyc.alias %v191 {pyc.name = "rob2_valid"} : i1
  %v193 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v194 = pyc.constant 1 : i1
  %v195 = pyc.constant 0 : i1
  %v196 = pyc.reg %clk, %rst, %v194, %v193, %v195 : i1
  %v197 = pyc.alias %v196 {pyc.name = "rob3_valid"} : i1
  %v198 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v199 = pyc.constant 1 : i1
  %v200 = pyc.constant 0 : i1
  %v201 = pyc.reg %clk, %rst, %v199, %v198, %v200 : i1
  %v202 = pyc.alias %v201 {pyc.name = "rob4_valid"} : i1
  %v203 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v204 = pyc.constant 1 : i1
  %v205 = pyc.constant 0 : i1
  %v206 = pyc.reg %clk, %rst, %v204, %v203, %v205 : i1
  %v207 = pyc.alias %v206 {pyc.name = "rob5_valid"} : i1
  %v208 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v209 = pyc.constant 1 : i1
  %v210 = pyc.constant 0 : i1
  %v211 = pyc.reg %clk, %rst, %v209, %v208, %v210 : i1
  %v212 = pyc.alias %v211 {pyc.name = "rob6_valid"} : i1
  %v213 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v214 = pyc.constant 1 : i1
  %v215 = pyc.constant 0 : i1
  %v216 = pyc.reg %clk, %rst, %v214, %v213, %v215 : i1
  %v217 = pyc.alias %v216 {pyc.name = "rob7_valid"} : i1
  %v218 = pyc.wire {pyc.name = "rob8_valid__next"} : i1
  %v219 = pyc.constant 1 : i1
  %v220 = pyc.constant 0 : i1
  %v221 = pyc.reg %clk, %rst, %v219, %v218, %v220 : i1
  %v222 = pyc.alias %v221 {pyc.name = "rob8_valid"} : i1
  %v223 = pyc.wire {pyc.name = "rob9_valid__next"} : i1
  %v224 = pyc.constant 1 : i1
  %v225 = pyc.constant 0 : i1
  %v226 = pyc.reg %clk, %rst, %v224, %v223, %v225 : i1
  %v227 = pyc.alias %v226 {pyc.name = "rob9_valid"} : i1
  %v228 = pyc.wire {pyc.name = "rob10_valid__next"} : i1
  %v229 = pyc.constant 1 : i1
  %v230 = pyc.constant 0 : i1
  %v231 = pyc.reg %clk, %rst, %v229, %v228, %v230 : i1
  %v232 = pyc.alias %v231 {pyc.name = "rob10_valid"} : i1
  %v233 = pyc.wire {pyc.name = "rob11_valid__next"} : i1
  %v234 = pyc.constant 1 : i1
  %v235 = pyc.constant 0 : i1
  %v236 = pyc.reg %clk, %rst, %v234, %v233, %v235 : i1
  %v237 = pyc.alias %v236 {pyc.name = "rob11_valid"} : i1
  %v238 = pyc.wire {pyc.name = "rob12_valid__next"} : i1
  %v239 = pyc.constant 1 : i1
  %v240 = pyc.constant 0 : i1
  %v241 = pyc.reg %clk, %rst, %v239, %v238, %v240 : i1
  %v242 = pyc.alias %v241 {pyc.name = "rob12_valid"} : i1
  %v243 = pyc.wire {pyc.name = "rob13_valid__next"} : i1
  %v244 = pyc.constant 1 : i1
  %v245 = pyc.constant 0 : i1
  %v246 = pyc.reg %clk, %rst, %v244, %v243, %v245 : i1
  %v247 = pyc.alias %v246 {pyc.name = "rob13_valid"} : i1
  %v248 = pyc.wire {pyc.name = "rob14_valid__next"} : i1
  %v249 = pyc.constant 1 : i1
  %v250 = pyc.constant 0 : i1
  %v251 = pyc.reg %clk, %rst, %v249, %v248, %v250 : i1
  %v252 = pyc.alias %v251 {pyc.name = "rob14_valid"} : i1
  %v253 = pyc.wire {pyc.name = "rob15_valid__next"} : i1
  %v254 = pyc.constant 1 : i1
  %v255 = pyc.constant 0 : i1
  %v256 = pyc.reg %clk, %rst, %v254, %v253, %v255 : i1
  %v257 = pyc.alias %v256 {pyc.name = "rob15_valid"} : i1
  %v258 = pyc.wire {pyc.name = "rob16_valid__next"} : i1
  %v259 = pyc.constant 1 : i1
  %v260 = pyc.constant 0 : i1
  %v261 = pyc.reg %clk, %rst, %v259, %v258, %v260 : i1
  %v262 = pyc.alias %v261 {pyc.name = "rob16_valid"} : i1
  %v263 = pyc.wire {pyc.name = "rob17_valid__next"} : i1
  %v264 = pyc.constant 1 : i1
  %v265 = pyc.constant 0 : i1
  %v266 = pyc.reg %clk, %rst, %v264, %v263, %v265 : i1
  %v267 = pyc.alias %v266 {pyc.name = "rob17_valid"} : i1
  %v268 = pyc.wire {pyc.name = "rob18_valid__next"} : i1
  %v269 = pyc.constant 1 : i1
  %v270 = pyc.constant 0 : i1
  %v271 = pyc.reg %clk, %rst, %v269, %v268, %v270 : i1
  %v272 = pyc.alias %v271 {pyc.name = "rob18_valid"} : i1
  %v273 = pyc.wire {pyc.name = "rob19_valid__next"} : i1
  %v274 = pyc.constant 1 : i1
  %v275 = pyc.constant 0 : i1
  %v276 = pyc.reg %clk, %rst, %v274, %v273, %v275 : i1
  %v277 = pyc.alias %v276 {pyc.name = "rob19_valid"} : i1
  %v278 = pyc.wire {pyc.name = "rob20_valid__next"} : i1
  %v279 = pyc.constant 1 : i1
  %v280 = pyc.constant 0 : i1
  %v281 = pyc.reg %clk, %rst, %v279, %v278, %v280 : i1
  %v282 = pyc.alias %v281 {pyc.name = "rob20_valid"} : i1
  %v283 = pyc.wire {pyc.name = "rob21_valid__next"} : i1
  %v284 = pyc.constant 1 : i1
  %v285 = pyc.constant 0 : i1
  %v286 = pyc.reg %clk, %rst, %v284, %v283, %v285 : i1
  %v287 = pyc.alias %v286 {pyc.name = "rob21_valid"} : i1
  %v288 = pyc.wire {pyc.name = "rob22_valid__next"} : i1
  %v289 = pyc.constant 1 : i1
  %v290 = pyc.constant 0 : i1
  %v291 = pyc.reg %clk, %rst, %v289, %v288, %v290 : i1
  %v292 = pyc.alias %v291 {pyc.name = "rob22_valid"} : i1
  %v293 = pyc.wire {pyc.name = "rob23_valid__next"} : i1
  %v294 = pyc.constant 1 : i1
  %v295 = pyc.constant 0 : i1
  %v296 = pyc.reg %clk, %rst, %v294, %v293, %v295 : i1
  %v297 = pyc.alias %v296 {pyc.name = "rob23_valid"} : i1
  %v298 = pyc.wire {pyc.name = "rob24_valid__next"} : i1
  %v299 = pyc.constant 1 : i1
  %v300 = pyc.constant 0 : i1
  %v301 = pyc.reg %clk, %rst, %v299, %v298, %v300 : i1
  %v302 = pyc.alias %v301 {pyc.name = "rob24_valid"} : i1
  %v303 = pyc.wire {pyc.name = "rob25_valid__next"} : i1
  %v304 = pyc.constant 1 : i1
  %v305 = pyc.constant 0 : i1
  %v306 = pyc.reg %clk, %rst, %v304, %v303, %v305 : i1
  %v307 = pyc.alias %v306 {pyc.name = "rob25_valid"} : i1
  %v308 = pyc.wire {pyc.name = "rob26_valid__next"} : i1
  %v309 = pyc.constant 1 : i1
  %v310 = pyc.constant 0 : i1
  %v311 = pyc.reg %clk, %rst, %v309, %v308, %v310 : i1
  %v312 = pyc.alias %v311 {pyc.name = "rob26_valid"} : i1
  %v313 = pyc.wire {pyc.name = "rob27_valid__next"} : i1
  %v314 = pyc.constant 1 : i1
  %v315 = pyc.constant 0 : i1
  %v316 = pyc.reg %clk, %rst, %v314, %v313, %v315 : i1
  %v317 = pyc.alias %v316 {pyc.name = "rob27_valid"} : i1
  %v318 = pyc.wire {pyc.name = "rob28_valid__next"} : i1
  %v319 = pyc.constant 1 : i1
  %v320 = pyc.constant 0 : i1
  %v321 = pyc.reg %clk, %rst, %v319, %v318, %v320 : i1
  %v322 = pyc.alias %v321 {pyc.name = "rob28_valid"} : i1
  %v323 = pyc.wire {pyc.name = "rob29_valid__next"} : i1
  %v324 = pyc.constant 1 : i1
  %v325 = pyc.constant 0 : i1
  %v326 = pyc.reg %clk, %rst, %v324, %v323, %v325 : i1
  %v327 = pyc.alias %v326 {pyc.name = "rob29_valid"} : i1
  %v328 = pyc.wire {pyc.name = "rob30_valid__next"} : i1
  %v329 = pyc.constant 1 : i1
  %v330 = pyc.constant 0 : i1
  %v331 = pyc.reg %clk, %rst, %v329, %v328, %v330 : i1
  %v332 = pyc.alias %v331 {pyc.name = "rob30_valid"} : i1
  %v333 = pyc.wire {pyc.name = "rob31_valid__next"} : i1
  %v334 = pyc.constant 1 : i1
  %v335 = pyc.constant 0 : i1
  %v336 = pyc.reg %clk, %rst, %v334, %v333, %v335 : i1
  %v337 = pyc.alias %v336 {pyc.name = "rob31_valid"} : i1
  %v338 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v339 = pyc.constant 1 : i1
  %v340 = pyc.constant 0 : i128
  %v341 = pyc.reg %clk, %rst, %v339, %v338, %v340 : i128
  %v342 = pyc.alias %v341 {pyc.name = "rob0_data"} : i128
  %v343 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v344 = pyc.constant 1 : i1
  %v345 = pyc.constant 0 : i128
  %v346 = pyc.reg %clk, %rst, %v344, %v343, %v345 : i128
  %v347 = pyc.alias %v346 {pyc.name = "rob1_data"} : i128
  %v348 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v349 = pyc.constant 1 : i1
  %v350 = pyc.constant 0 : i128
  %v351 = pyc.reg %clk, %rst, %v349, %v348, %v350 : i128
  %v352 = pyc.alias %v351 {pyc.name = "rob2_data"} : i128
  %v353 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v354 = pyc.constant 1 : i1
  %v355 = pyc.constant 0 : i128
  %v356 = pyc.reg %clk, %rst, %v354, %v353, %v355 : i128
  %v357 = pyc.alias %v356 {pyc.name = "rob3_data"} : i128
  %v358 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v359 = pyc.constant 1 : i1
  %v360 = pyc.constant 0 : i128
  %v361 = pyc.reg %clk, %rst, %v359, %v358, %v360 : i128
  %v362 = pyc.alias %v361 {pyc.name = "rob4_data"} : i128
  %v363 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v364 = pyc.constant 1 : i1
  %v365 = pyc.constant 0 : i128
  %v366 = pyc.reg %clk, %rst, %v364, %v363, %v365 : i128
  %v367 = pyc.alias %v366 {pyc.name = "rob5_data"} : i128
  %v368 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v369 = pyc.constant 1 : i1
  %v370 = pyc.constant 0 : i128
  %v371 = pyc.reg %clk, %rst, %v369, %v368, %v370 : i128
  %v372 = pyc.alias %v371 {pyc.name = "rob6_data"} : i128
  %v373 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v374 = pyc.constant 1 : i1
  %v375 = pyc.constant 0 : i128
  %v376 = pyc.reg %clk, %rst, %v374, %v373, %v375 : i128
  %v377 = pyc.alias %v376 {pyc.name = "rob7_data"} : i128
  %v378 = pyc.wire {pyc.name = "rob8_data__next"} : i128
  %v379 = pyc.constant 1 : i1
  %v380 = pyc.constant 0 : i128
  %v381 = pyc.reg %clk, %rst, %v379, %v378, %v380 : i128
  %v382 = pyc.alias %v381 {pyc.name = "rob8_data"} : i128
  %v383 = pyc.wire {pyc.name = "rob9_data__next"} : i128
  %v384 = pyc.constant 1 : i1
  %v385 = pyc.constant 0 : i128
  %v386 = pyc.reg %clk, %rst, %v384, %v383, %v385 : i128
  %v387 = pyc.alias %v386 {pyc.name = "rob9_data"} : i128
  %v388 = pyc.wire {pyc.name = "rob10_data__next"} : i128
  %v389 = pyc.constant 1 : i1
  %v390 = pyc.constant 0 : i128
  %v391 = pyc.reg %clk, %rst, %v389, %v388, %v390 : i128
  %v392 = pyc.alias %v391 {pyc.name = "rob10_data"} : i128
  %v393 = pyc.wire {pyc.name = "rob11_data__next"} : i128
  %v394 = pyc.constant 1 : i1
  %v395 = pyc.constant 0 : i128
  %v396 = pyc.reg %clk, %rst, %v394, %v393, %v395 : i128
  %v397 = pyc.alias %v396 {pyc.name = "rob11_data"} : i128
  %v398 = pyc.wire {pyc.name = "rob12_data__next"} : i128
  %v399 = pyc.constant 1 : i1
  %v400 = pyc.constant 0 : i128
  %v401 = pyc.reg %clk, %rst, %v399, %v398, %v400 : i128
  %v402 = pyc.alias %v401 {pyc.name = "rob12_data"} : i128
  %v403 = pyc.wire {pyc.name = "rob13_data__next"} : i128
  %v404 = pyc.constant 1 : i1
  %v405 = pyc.constant 0 : i128
  %v406 = pyc.reg %clk, %rst, %v404, %v403, %v405 : i128
  %v407 = pyc.alias %v406 {pyc.name = "rob13_data"} : i128
  %v408 = pyc.wire {pyc.name = "rob14_data__next"} : i128
  %v409 = pyc.constant 1 : i1
  %v410 = pyc.constant 0 : i128
  %v411 = pyc.reg %clk, %rst, %v409, %v408, %v410 : i128
  %v412 = pyc.alias %v411 {pyc.name = "rob14_data"} : i128
  %v413 = pyc.wire {pyc.name = "rob15_data__next"} : i128
  %v414 = pyc.constant 1 : i1
  %v415 = pyc.constant 0 : i128
  %v416 = pyc.reg %clk, %rst, %v414, %v413, %v415 : i128
  %v417 = pyc.alias %v416 {pyc.name = "rob15_data"} : i128
  %v418 = pyc.wire {pyc.name = "rob16_data__next"} : i128
  %v419 = pyc.constant 1 : i1
  %v420 = pyc.constant 0 : i128
  %v421 = pyc.reg %clk, %rst, %v419, %v418, %v420 : i128
  %v422 = pyc.alias %v421 {pyc.name = "rob16_data"} : i128
  %v423 = pyc.wire {pyc.name = "rob17_data__next"} : i128
  %v424 = pyc.constant 1 : i1
  %v425 = pyc.constant 0 : i128
  %v426 = pyc.reg %clk, %rst, %v424, %v423, %v425 : i128
  %v427 = pyc.alias %v426 {pyc.name = "rob17_data"} : i128
  %v428 = pyc.wire {pyc.name = "rob18_data__next"} : i128
  %v429 = pyc.constant 1 : i1
  %v430 = pyc.constant 0 : i128
  %v431 = pyc.reg %clk, %rst, %v429, %v428, %v430 : i128
  %v432 = pyc.alias %v431 {pyc.name = "rob18_data"} : i128
  %v433 = pyc.wire {pyc.name = "rob19_data__next"} : i128
  %v434 = pyc.constant 1 : i1
  %v435 = pyc.constant 0 : i128
  %v436 = pyc.reg %clk, %rst, %v434, %v433, %v435 : i128
  %v437 = pyc.alias %v436 {pyc.name = "rob19_data"} : i128
  %v438 = pyc.wire {pyc.name = "rob20_data__next"} : i128
  %v439 = pyc.constant 1 : i1
  %v440 = pyc.constant 0 : i128
  %v441 = pyc.reg %clk, %rst, %v439, %v438, %v440 : i128
  %v442 = pyc.alias %v441 {pyc.name = "rob20_data"} : i128
  %v443 = pyc.wire {pyc.name = "rob21_data__next"} : i128
  %v444 = pyc.constant 1 : i1
  %v445 = pyc.constant 0 : i128
  %v446 = pyc.reg %clk, %rst, %v444, %v443, %v445 : i128
  %v447 = pyc.alias %v446 {pyc.name = "rob21_data"} : i128
  %v448 = pyc.wire {pyc.name = "rob22_data__next"} : i128
  %v449 = pyc.constant 1 : i1
  %v450 = pyc.constant 0 : i128
  %v451 = pyc.reg %clk, %rst, %v449, %v448, %v450 : i128
  %v452 = pyc.alias %v451 {pyc.name = "rob22_data"} : i128
  %v453 = pyc.wire {pyc.name = "rob23_data__next"} : i128
  %v454 = pyc.constant 1 : i1
  %v455 = pyc.constant 0 : i128
  %v456 = pyc.reg %clk, %rst, %v454, %v453, %v455 : i128
  %v457 = pyc.alias %v456 {pyc.name = "rob23_data"} : i128
  %v458 = pyc.wire {pyc.name = "rob24_data__next"} : i128
  %v459 = pyc.constant 1 : i1
  %v460 = pyc.constant 0 : i128
  %v461 = pyc.reg %clk, %rst, %v459, %v458, %v460 : i128
  %v462 = pyc.alias %v461 {pyc.name = "rob24_data"} : i128
  %v463 = pyc.wire {pyc.name = "rob25_data__next"} : i128
  %v464 = pyc.constant 1 : i1
  %v465 = pyc.constant 0 : i128
  %v466 = pyc.reg %clk, %rst, %v464, %v463, %v465 : i128
  %v467 = pyc.alias %v466 {pyc.name = "rob25_data"} : i128
  %v468 = pyc.wire {pyc.name = "rob26_data__next"} : i128
  %v469 = pyc.constant 1 : i1
  %v470 = pyc.constant 0 : i128
  %v471 = pyc.reg %clk, %rst, %v469, %v468, %v470 : i128
  %v472 = pyc.alias %v471 {pyc.name = "rob26_data"} : i128
  %v473 = pyc.wire {pyc.name = "rob27_data__next"} : i128
  %v474 = pyc.constant 1 : i1
  %v475 = pyc.constant 0 : i128
  %v476 = pyc.reg %clk, %rst, %v474, %v473, %v475 : i128
  %v477 = pyc.alias %v476 {pyc.name = "rob27_data"} : i128
  %v478 = pyc.wire {pyc.name = "rob28_data__next"} : i128
  %v479 = pyc.constant 1 : i1
  %v480 = pyc.constant 0 : i128
  %v481 = pyc.reg %clk, %rst, %v479, %v478, %v480 : i128
  %v482 = pyc.alias %v481 {pyc.name = "rob28_data"} : i128
  %v483 = pyc.wire {pyc.name = "rob29_data__next"} : i128
  %v484 = pyc.constant 1 : i1
  %v485 = pyc.constant 0 : i128
  %v486 = pyc.reg %clk, %rst, %v484, %v483, %v485 : i128
  %v487 = pyc.alias %v486 {pyc.name = "rob29_data"} : i128
  %v488 = pyc.wire {pyc.name = "rob30_data__next"} : i128
  %v489 = pyc.constant 1 : i1
  %v490 = pyc.constant 0 : i128
  %v491 = pyc.reg %clk, %rst, %v489, %v488, %v490 : i128
  %v492 = pyc.alias %v491 {pyc.name = "rob30_data"} : i128
  %v493 = pyc.wire {pyc.name = "rob31_data__next"} : i128
  %v494 = pyc.constant 1 : i1
  %v495 = pyc.constant 0 : i128
  %v496 = pyc.reg %clk, %rst, %v494, %v493, %v495 : i128
  %v497 = pyc.alias %v496 {pyc.name = "rob31_data"} : i128
  %v498 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v499 = pyc.constant 1 : i1
  %v500 = pyc.constant 0 : i1
  %v501 = pyc.reg %clk, %rst, %v499, %v498, %v500 : i1
  %v502 = pyc.alias %v501 {pyc.name = "lane0_out_vld"} : i1
  %v503 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v504 = pyc.constant 1 : i1
  %v505 = pyc.constant 0 : i1
  %v506 = pyc.reg %clk, %rst, %v504, %v503, %v505 : i1
  %v507 = pyc.alias %v506 {pyc.name = "lane1_out_vld"} : i1
  %v508 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v509 = pyc.constant 1 : i1
  %v510 = pyc.constant 0 : i1
  %v511 = pyc.reg %clk, %rst, %v509, %v508, %v510 : i1
  %v512 = pyc.alias %v511 {pyc.name = "lane2_out_vld"} : i1
  %v513 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v514 = pyc.constant 1 : i1
  %v515 = pyc.constant 0 : i1
  %v516 = pyc.reg %clk, %rst, %v514, %v513, %v515 : i1
  %v517 = pyc.alias %v516 {pyc.name = "lane3_out_vld"} : i1
  %v518 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v519 = pyc.constant 1 : i1
  %v520 = pyc.constant 0 : i128
  %v521 = pyc.reg %clk, %rst, %v519, %v518, %v520 : i128
  %v522 = pyc.alias %v521 {pyc.name = "lane0_out_data"} : i128
  %v523 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v524 = pyc.constant 1 : i1
  %v525 = pyc.constant 0 : i128
  %v526 = pyc.reg %clk, %rst, %v524, %v523, %v525 : i128
  %v527 = pyc.alias %v526 {pyc.name = "lane1_out_data"} : i128
  %v528 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v529 = pyc.constant 1 : i1
  %v530 = pyc.constant 0 : i128
  %v531 = pyc.reg %clk, %rst, %v529, %v528, %v530 : i128
  %v532 = pyc.alias %v531 {pyc.name = "lane2_out_data"} : i128
  %v533 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v534 = pyc.constant 1 : i1
  %v535 = pyc.constant 0 : i128
  %v536 = pyc.reg %clk, %rst, %v534, %v533, %v535 : i128
  %v537 = pyc.alias %v536 {pyc.name = "lane3_out_data"} : i128
  %v538 = pyc.alias %v12 {pyc.name = "ptr__fastfwd_v3_final__L93"} : i2
  %v539 = pyc.constant 0 : i2
  %v540 = pyc.eq %v538, %v539 : i2
  %v541 = pyc.alias %v540 {pyc.name = "match__fastfwd_v3_final__L95"} : i1
  %v542 = pyc.and %v541, %v17 : i1
  pyc.assign %v498, %v542 : i1
  %v543 = pyc.and %v541, %v17 : i1
  %v544 = pyc.constant 0 : i128
  %v545 = pyc.mux %v543, %v37, %v544 : i128
  pyc.assign %v518, %v545 : i128
  %v546 = pyc.constant 1 : i2
  %v547 = pyc.eq %v538, %v546 : i2
  %v548 = pyc.alias %v547 {pyc.name = "match__fastfwd_v3_final__L95"} : i1
  %v549 = pyc.and %v548, %v22 : i1
  pyc.assign %v503, %v549 : i1
  %v550 = pyc.and %v548, %v22 : i1
  %v551 = pyc.constant 0 : i128
  %v552 = pyc.mux %v550, %v42, %v551 : i128
  pyc.assign %v523, %v552 : i128
  %v553 = pyc.constant 2 : i2
  %v554 = pyc.eq %v538, %v553 : i2
  %v555 = pyc.alias %v554 {pyc.name = "match__fastfwd_v3_final__L95"} : i1
  %v556 = pyc.and %v555, %v27 : i1
  pyc.assign %v508, %v556 : i1
  %v557 = pyc.and %v555, %v27 : i1
  %v558 = pyc.constant 0 : i128
  %v559 = pyc.mux %v557, %v47, %v558 : i128
  pyc.assign %v528, %v559 : i128
  %v560 = pyc.constant 3 : i2
  %v561 = pyc.eq %v538, %v560 : i2
  %v562 = pyc.alias %v561 {pyc.name = "match__fastfwd_v3_final__L95"} : i1
  %v563 = pyc.and %v562, %v32 : i1
  pyc.assign %v513, %v563 : i1
  %v564 = pyc.and %v562, %v32 : i1
  %v565 = pyc.constant 0 : i128
  %v566 = pyc.mux %v564, %v52, %v565 : i128
  pyc.assign %v533, %v566 : i128
  %v567 = pyc.or %v502, %v507 : i1
  %v568 = pyc.or %v567, %v512 : i1
  %v569 = pyc.or %v568, %v517 : i1
  %v570 = pyc.alias %v569 {pyc.name = "any_out__fastfwd_v3_final__L100"} : i1
  %v571 = pyc.constant 1 : i2
  %v572 = pyc.add %v538, %v571 : i2
  %v573 = pyc.constant 3 : i2
  %v574 = pyc.and %v572, %v573 : i2
  %v575 = pyc.alias %v574 {pyc.name = "new_ptr__fastfwd_v3_final__L101"} : i2
  %v576 = pyc.mux %v570, %v575, %v538 : i2
  pyc.assign %v7, %v576 : i2
  %v577 = pyc.wire {pyc.name = "bkpr_reg__next"} : i1
  %v578 = pyc.constant 1 : i1
  %v579 = pyc.constant 0 : i1
  %v580 = pyc.reg %clk, %rst, %v578, %v577, %v579 : i1
  %v581 = pyc.alias %v580 {pyc.name = "bkpr_reg"} : i1
  %v582 = pyc.alias %v581 {pyc.name = "bkpr__fastfwd_v3_final__L105"} : i1
  %v583 = pyc.constant 0 : i1
  pyc.assign %v577, %v583 : i1
  %v584 = pyc.constant 0 : i1
  %v585 = pyc.constant 0 : i128
  %v586 = pyc.constant 0 : i1
  %v587 = pyc.constant 0 : i128
  %v588 = pyc.constant 0 : i1
  %v589 = pyc.constant 0 : i128
  %v590 = pyc.constant 0 : i1
  %v591 = pyc.constant 0 : i128
  func.return %v502, %v522, %v507, %v527, %v512, %v532, %v517, %v537, %v106, %v126, %v146, %v584, %v585, %v111, %v131, %v151, %v586, %v587, %v116, %v136, %v156, %v588, %v589, %v121, %v141, %v161, %v590, %v591, %v582 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1
}

}

