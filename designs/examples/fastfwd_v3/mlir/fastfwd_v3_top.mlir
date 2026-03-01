module attributes {pyc.top = @fastfwd_v3_top, pyc.frontend.contract = "pycircuit"} {
func.func @fastfwd_v3_top(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_pkt_in_vld: i1, %lane1_pkt_in_vld: i1, %lane2_pkt_in_vld: i1, %lane3_pkt_in_vld: i1, %lane0_pkt_in_data: i128, %lane1_pkt_in_data: i128, %lane2_pkt_in_data: i128, %lane3_pkt_in_data: i128, %lane0_pkt_in_ctrl: i5, %lane1_pkt_in_ctrl: i5, %lane2_pkt_in_ctrl: i5, %lane3_pkt_in_ctrl: i5) -> (i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1) attributes {arg_names = ["clk", "rst", "lane0_pkt_in_vld", "lane1_pkt_in_vld", "lane2_pkt_in_vld", "lane3_pkt_in_vld", "lane0_pkt_in_data", "lane1_pkt_in_data", "lane2_pkt_in_data", "lane3_pkt_in_data", "lane0_pkt_in_ctrl", "lane1_pkt_in_ctrl", "lane2_pkt_in_ctrl", "lane3_pkt_in_ctrl"], result_names = ["lane0_pkt_out_vld", "lane0_pkt_out_data", "lane1_pkt_out_vld", "lane1_pkt_out_data", "lane2_pkt_out_vld", "lane2_pkt_out_data", "lane3_pkt_out_vld", "lane3_pkt_out_data", "fwd0_pkt_data_vld", "fwd0_pkt_data", "fwd0_pkt_lat", "fwd0_pkt_dp_vld", "fwd0_pkt_dp_data", "fwd1_pkt_data_vld", "fwd1_pkt_data", "fwd1_pkt_lat", "fwd1_pkt_dp_vld", "fwd1_pkt_dp_data", "fwd2_pkt_data_vld", "fwd2_pkt_data", "fwd2_pkt_lat", "fwd2_pkt_dp_vld", "fwd2_pkt_dp_data", "fwd3_pkt_data_vld", "fwd3_pkt_data", "fwd3_pkt_lat", "fwd3_pkt_dp_vld", "fwd3_pkt_dp_data", "pkt_in_bkpr"], pyc.base = "fastfwd_v3_top", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__fastfwd_v3_top__L40"} : i16
  %v7 = pyc.alias %v6 {pyc.name = "current_seq__fastfwd_v3_top__L41"} : i16
  %v8 = pyc.wire {pyc.name = "m1_out0_vld__next"} : i1
  %v9 = pyc.constant 1 : i1
  %v10 = pyc.constant 0 : i1
  %v11 = pyc.reg %clk, %rst, %v9, %v8, %v10 : i1
  %v12 = pyc.alias %v11 {pyc.name = "m1_out0_vld"} : i1
  %v13 = pyc.wire {pyc.name = "m1_out1_vld__next"} : i1
  %v14 = pyc.constant 1 : i1
  %v15 = pyc.constant 0 : i1
  %v16 = pyc.reg %clk, %rst, %v14, %v13, %v15 : i1
  %v17 = pyc.alias %v16 {pyc.name = "m1_out1_vld"} : i1
  %v18 = pyc.wire {pyc.name = "m1_out2_vld__next"} : i1
  %v19 = pyc.constant 1 : i1
  %v20 = pyc.constant 0 : i1
  %v21 = pyc.reg %clk, %rst, %v19, %v18, %v20 : i1
  %v22 = pyc.alias %v21 {pyc.name = "m1_out2_vld"} : i1
  %v23 = pyc.wire {pyc.name = "m1_out3_vld__next"} : i1
  %v24 = pyc.constant 1 : i1
  %v25 = pyc.constant 0 : i1
  %v26 = pyc.reg %clk, %rst, %v24, %v23, %v25 : i1
  %v27 = pyc.alias %v26 {pyc.name = "m1_out3_vld"} : i1
  %v28 = pyc.wire {pyc.name = "m1_out0_data__next"} : i128
  %v29 = pyc.constant 1 : i1
  %v30 = pyc.constant 0 : i128
  %v31 = pyc.reg %clk, %rst, %v29, %v28, %v30 : i128
  %v32 = pyc.alias %v31 {pyc.name = "m1_out0_data"} : i128
  %v33 = pyc.wire {pyc.name = "m1_out1_data__next"} : i128
  %v34 = pyc.constant 1 : i1
  %v35 = pyc.constant 0 : i128
  %v36 = pyc.reg %clk, %rst, %v34, %v33, %v35 : i128
  %v37 = pyc.alias %v36 {pyc.name = "m1_out1_data"} : i128
  %v38 = pyc.wire {pyc.name = "m1_out2_data__next"} : i128
  %v39 = pyc.constant 1 : i1
  %v40 = pyc.constant 0 : i128
  %v41 = pyc.reg %clk, %rst, %v39, %v38, %v40 : i128
  %v42 = pyc.alias %v41 {pyc.name = "m1_out2_data"} : i128
  %v43 = pyc.wire {pyc.name = "m1_out3_data__next"} : i128
  %v44 = pyc.constant 1 : i1
  %v45 = pyc.constant 0 : i128
  %v46 = pyc.reg %clk, %rst, %v44, %v43, %v45 : i128
  %v47 = pyc.alias %v46 {pyc.name = "m1_out3_data"} : i128
  %v48 = pyc.wire {pyc.name = "m1_out0_seq__next"} : i16
  %v49 = pyc.constant 1 : i1
  %v50 = pyc.constant 0 : i16
  %v51 = pyc.reg %clk, %rst, %v49, %v48, %v50 : i16
  %v52 = pyc.alias %v51 {pyc.name = "m1_out0_seq"} : i16
  %v53 = pyc.wire {pyc.name = "m1_out1_seq__next"} : i16
  %v54 = pyc.constant 1 : i1
  %v55 = pyc.constant 0 : i16
  %v56 = pyc.reg %clk, %rst, %v54, %v53, %v55 : i16
  %v57 = pyc.alias %v56 {pyc.name = "m1_out1_seq"} : i16
  %v58 = pyc.wire {pyc.name = "m1_out2_seq__next"} : i16
  %v59 = pyc.constant 1 : i1
  %v60 = pyc.constant 0 : i16
  %v61 = pyc.reg %clk, %rst, %v59, %v58, %v60 : i16
  %v62 = pyc.alias %v61 {pyc.name = "m1_out2_seq"} : i16
  %v63 = pyc.wire {pyc.name = "m1_out3_seq__next"} : i16
  %v64 = pyc.constant 1 : i1
  %v65 = pyc.constant 0 : i16
  %v66 = pyc.reg %clk, %rst, %v64, %v63, %v65 : i16
  %v67 = pyc.alias %v66 {pyc.name = "m1_out3_seq"} : i16
  pyc.assign %v8, %lane0_pkt_in_vld : i1
  pyc.assign %v28, %lane0_pkt_in_data : i128
  %v68 = pyc.constant 0 : i16
  %v69 = pyc.add %v7, %v68 : i16
  pyc.assign %v48, %v69 : i16
  %v70 = pyc.constant 0 : i1
  %v71 = pyc.add %lane0_pkt_in_vld, %v70 : i1
  %v72 = pyc.alias %v71 {pyc.name = "offset__fastfwd_v3_top__L48"} : i1
  pyc.assign %v13, %lane1_pkt_in_vld : i1
  pyc.assign %v33, %lane1_pkt_in_data : i128
  %v73 = pyc.zext %v72 : i1 -> i16
  %v74 = pyc.add %v7, %v73 : i16
  pyc.assign %v53, %v74 : i16
  %v75 = pyc.constant 0 : i1
  %v76 = pyc.add %lane0_pkt_in_vld, %v75 : i1
  %v77 = pyc.add %v76, %lane1_pkt_in_vld : i1
  %v78 = pyc.alias %v77 {pyc.name = "offset__fastfwd_v3_top__L48"} : i1
  pyc.assign %v18, %lane2_pkt_in_vld : i1
  pyc.assign %v38, %lane2_pkt_in_data : i128
  %v79 = pyc.zext %v78 : i1 -> i16
  %v80 = pyc.add %v7, %v79 : i16
  pyc.assign %v58, %v80 : i16
  %v81 = pyc.constant 0 : i1
  %v82 = pyc.add %lane0_pkt_in_vld, %v81 : i1
  %v83 = pyc.add %v82, %lane1_pkt_in_vld : i1
  %v84 = pyc.add %v83, %lane2_pkt_in_vld : i1
  %v85 = pyc.alias %v84 {pyc.name = "offset__fastfwd_v3_top__L48"} : i1
  pyc.assign %v23, %lane3_pkt_in_vld : i1
  pyc.assign %v43, %lane3_pkt_in_data : i128
  %v86 = pyc.zext %v85 : i1 -> i16
  %v87 = pyc.add %v7, %v86 : i16
  pyc.assign %v63, %v87 : i16
  %v88 = pyc.constant 0 : i1
  %v89 = pyc.add %lane0_pkt_in_vld, %v88 : i1
  %v90 = pyc.add %v89, %lane1_pkt_in_vld : i1
  %v91 = pyc.add %v90, %lane2_pkt_in_vld : i1
  %v92 = pyc.add %v91, %lane3_pkt_in_vld : i1
  %v93 = pyc.alias %v92 {pyc.name = "total_input__fastfwd_v3_top__L53"} : i1
  %v94 = pyc.zext %v93 : i1 -> i16
  %v95 = pyc.add %v7, %v94 : i16
  pyc.assign %v1, %v95 : i16
  %v96 = pyc.wire {pyc.name = "fe0_out_vld__next"} : i1
  %v97 = pyc.constant 1 : i1
  %v98 = pyc.constant 0 : i1
  %v99 = pyc.reg %clk, %rst, %v97, %v96, %v98 : i1
  %v100 = pyc.alias %v99 {pyc.name = "fe0_out_vld"} : i1
  %v101 = pyc.wire {pyc.name = "fe1_out_vld__next"} : i1
  %v102 = pyc.constant 1 : i1
  %v103 = pyc.constant 0 : i1
  %v104 = pyc.reg %clk, %rst, %v102, %v101, %v103 : i1
  %v105 = pyc.alias %v104 {pyc.name = "fe1_out_vld"} : i1
  %v106 = pyc.wire {pyc.name = "fe2_out_vld__next"} : i1
  %v107 = pyc.constant 1 : i1
  %v108 = pyc.constant 0 : i1
  %v109 = pyc.reg %clk, %rst, %v107, %v106, %v108 : i1
  %v110 = pyc.alias %v109 {pyc.name = "fe2_out_vld"} : i1
  %v111 = pyc.wire {pyc.name = "fe3_out_vld__next"} : i1
  %v112 = pyc.constant 1 : i1
  %v113 = pyc.constant 0 : i1
  %v114 = pyc.reg %clk, %rst, %v112, %v111, %v113 : i1
  %v115 = pyc.alias %v114 {pyc.name = "fe3_out_vld"} : i1
  %v116 = pyc.wire {pyc.name = "fe0_out_data__next"} : i128
  %v117 = pyc.constant 1 : i1
  %v118 = pyc.constant 0 : i128
  %v119 = pyc.reg %clk, %rst, %v117, %v116, %v118 : i128
  %v120 = pyc.alias %v119 {pyc.name = "fe0_out_data"} : i128
  %v121 = pyc.wire {pyc.name = "fe1_out_data__next"} : i128
  %v122 = pyc.constant 1 : i1
  %v123 = pyc.constant 0 : i128
  %v124 = pyc.reg %clk, %rst, %v122, %v121, %v123 : i128
  %v125 = pyc.alias %v124 {pyc.name = "fe1_out_data"} : i128
  %v126 = pyc.wire {pyc.name = "fe2_out_data__next"} : i128
  %v127 = pyc.constant 1 : i1
  %v128 = pyc.constant 0 : i128
  %v129 = pyc.reg %clk, %rst, %v127, %v126, %v128 : i128
  %v130 = pyc.alias %v129 {pyc.name = "fe2_out_data"} : i128
  %v131 = pyc.wire {pyc.name = "fe3_out_data__next"} : i128
  %v132 = pyc.constant 1 : i1
  %v133 = pyc.constant 0 : i128
  %v134 = pyc.reg %clk, %rst, %v132, %v131, %v133 : i128
  %v135 = pyc.alias %v134 {pyc.name = "fe3_out_data"} : i128
  %v136 = pyc.wire {pyc.name = "fe0_out_seq__next"} : i16
  %v137 = pyc.constant 1 : i1
  %v138 = pyc.constant 0 : i16
  %v139 = pyc.reg %clk, %rst, %v137, %v136, %v138 : i16
  %v140 = pyc.alias %v139 {pyc.name = "fe0_out_seq"} : i16
  %v141 = pyc.wire {pyc.name = "fe1_out_seq__next"} : i16
  %v142 = pyc.constant 1 : i1
  %v143 = pyc.constant 0 : i16
  %v144 = pyc.reg %clk, %rst, %v142, %v141, %v143 : i16
  %v145 = pyc.alias %v144 {pyc.name = "fe1_out_seq"} : i16
  %v146 = pyc.wire {pyc.name = "fe2_out_seq__next"} : i16
  %v147 = pyc.constant 1 : i1
  %v148 = pyc.constant 0 : i16
  %v149 = pyc.reg %clk, %rst, %v147, %v146, %v148 : i16
  %v150 = pyc.alias %v149 {pyc.name = "fe2_out_seq"} : i16
  %v151 = pyc.wire {pyc.name = "fe3_out_seq__next"} : i16
  %v152 = pyc.constant 1 : i1
  %v153 = pyc.constant 0 : i16
  %v154 = pyc.reg %clk, %rst, %v152, %v151, %v153 : i16
  %v155 = pyc.alias %v154 {pyc.name = "fe3_out_seq"} : i16
  pyc.assign %v96, %v12 : i1
  pyc.assign %v116, %v32 : i128
  pyc.assign %v136, %v52 : i16
  pyc.assign %v101, %v17 : i1
  pyc.assign %v121, %v37 : i128
  pyc.assign %v141, %v57 : i16
  pyc.assign %v106, %v22 : i1
  pyc.assign %v126, %v42 : i128
  pyc.assign %v146, %v62 : i16
  pyc.assign %v111, %v27 : i1
  pyc.assign %v131, %v47 : i128
  pyc.assign %v151, %v67 : i16
  %v156 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v157 = pyc.constant 1 : i1
  %v158 = pyc.constant 0 : i2
  %v159 = pyc.reg %clk, %rst, %v157, %v156, %v158 : i2
  %v160 = pyc.alias %v159 {pyc.name = "out_ptr"} : i2
  %v161 = pyc.alias %v160 {pyc.name = "out_ptr__fastfwd_v3_top__L67"} : i2
  %v162 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v163 = pyc.constant 1 : i1
  %v164 = pyc.constant 0 : i1
  %v165 = pyc.reg %clk, %rst, %v163, %v162, %v164 : i1
  %v166 = pyc.alias %v165 {pyc.name = "lane0_out_vld"} : i1
  %v167 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v168 = pyc.constant 1 : i1
  %v169 = pyc.constant 0 : i1
  %v170 = pyc.reg %clk, %rst, %v168, %v167, %v169 : i1
  %v171 = pyc.alias %v170 {pyc.name = "lane1_out_vld"} : i1
  %v172 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v173 = pyc.constant 1 : i1
  %v174 = pyc.constant 0 : i1
  %v175 = pyc.reg %clk, %rst, %v173, %v172, %v174 : i1
  %v176 = pyc.alias %v175 {pyc.name = "lane2_out_vld"} : i1
  %v177 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v178 = pyc.constant 1 : i1
  %v179 = pyc.constant 0 : i1
  %v180 = pyc.reg %clk, %rst, %v178, %v177, %v179 : i1
  %v181 = pyc.alias %v180 {pyc.name = "lane3_out_vld"} : i1
  %v182 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v183 = pyc.constant 1 : i1
  %v184 = pyc.constant 0 : i128
  %v185 = pyc.reg %clk, %rst, %v183, %v182, %v184 : i128
  %v186 = pyc.alias %v185 {pyc.name = "lane0_out_data"} : i128
  %v187 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v188 = pyc.constant 1 : i1
  %v189 = pyc.constant 0 : i128
  %v190 = pyc.reg %clk, %rst, %v188, %v187, %v189 : i128
  %v191 = pyc.alias %v190 {pyc.name = "lane1_out_data"} : i128
  %v192 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v193 = pyc.constant 1 : i1
  %v194 = pyc.constant 0 : i128
  %v195 = pyc.reg %clk, %rst, %v193, %v192, %v194 : i128
  %v196 = pyc.alias %v195 {pyc.name = "lane2_out_data"} : i128
  %v197 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v198 = pyc.constant 1 : i1
  %v199 = pyc.constant 0 : i128
  %v200 = pyc.reg %clk, %rst, %v198, %v197, %v199 : i128
  %v201 = pyc.alias %v200 {pyc.name = "lane3_out_data"} : i128
  %v202 = pyc.alias %v161 {pyc.name = "ptr__fastfwd_v3_top__L72"} : i2
  %v203 = pyc.constant 0 : i2
  %v204 = pyc.eq %v202, %v203 : i2
  %v205 = pyc.alias %v204 {pyc.name = "match__fastfwd_v3_top__L74"} : i1
  %v206 = pyc.and %v205, %v100 : i1
  pyc.assign %v162, %v206 : i1
  %v207 = pyc.and %v205, %v100 : i1
  %v208 = pyc.constant 0 : i128
  %v209 = pyc.mux %v207, %v120, %v208 : i128
  pyc.assign %v182, %v209 : i128
  %v210 = pyc.constant 1 : i2
  %v211 = pyc.eq %v202, %v210 : i2
  %v212 = pyc.alias %v211 {pyc.name = "match__fastfwd_v3_top__L74"} : i1
  %v213 = pyc.and %v212, %v105 : i1
  pyc.assign %v167, %v213 : i1
  %v214 = pyc.and %v212, %v105 : i1
  %v215 = pyc.constant 0 : i128
  %v216 = pyc.mux %v214, %v125, %v215 : i128
  pyc.assign %v187, %v216 : i128
  %v217 = pyc.constant 2 : i2
  %v218 = pyc.eq %v202, %v217 : i2
  %v219 = pyc.alias %v218 {pyc.name = "match__fastfwd_v3_top__L74"} : i1
  %v220 = pyc.and %v219, %v110 : i1
  pyc.assign %v172, %v220 : i1
  %v221 = pyc.and %v219, %v110 : i1
  %v222 = pyc.constant 0 : i128
  %v223 = pyc.mux %v221, %v130, %v222 : i128
  pyc.assign %v192, %v223 : i128
  %v224 = pyc.constant 3 : i2
  %v225 = pyc.eq %v202, %v224 : i2
  %v226 = pyc.alias %v225 {pyc.name = "match__fastfwd_v3_top__L74"} : i1
  %v227 = pyc.and %v226, %v115 : i1
  pyc.assign %v177, %v227 : i1
  %v228 = pyc.and %v226, %v115 : i1
  %v229 = pyc.constant 0 : i128
  %v230 = pyc.mux %v228, %v135, %v229 : i128
  pyc.assign %v197, %v230 : i128
  %v231 = pyc.or %v166, %v171 : i1
  %v232 = pyc.or %v231, %v176 : i1
  %v233 = pyc.or %v232, %v181 : i1
  %v234 = pyc.alias %v233 {pyc.name = "any_out__fastfwd_v3_top__L78"} : i1
  %v235 = pyc.constant 1 : i2
  %v236 = pyc.add %v202, %v235 : i2
  %v237 = pyc.constant 3 : i2
  %v238 = pyc.and %v236, %v237 : i2
  %v239 = pyc.alias %v238 {pyc.name = "new_ptr__fastfwd_v3_top__L79"} : i2
  %v240 = pyc.mux %v234, %v239, %v202 : i2
  pyc.assign %v156, %v240 : i2
  %v241 = pyc.constant 0 : i2
  %v242 = pyc.constant 0 : i1
  %v243 = pyc.constant 0 : i128
  %v244 = pyc.constant 0 : i2
  %v245 = pyc.constant 0 : i1
  %v246 = pyc.constant 0 : i128
  %v247 = pyc.constant 0 : i2
  %v248 = pyc.constant 0 : i1
  %v249 = pyc.constant 0 : i128
  %v250 = pyc.constant 0 : i2
  %v251 = pyc.constant 0 : i1
  %v252 = pyc.constant 0 : i128
  %v253 = pyc.constant 0 : i1
  func.return %v166, %v186, %v171, %v191, %v176, %v196, %v181, %v201, %v100, %v120, %v241, %v242, %v243, %v105, %v125, %v244, %v245, %v246, %v110, %v130, %v247, %v248, %v249, %v115, %v135, %v250, %v251, %v252, %v253 : i1, i128, i1, i128, i1, i128, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1, i128, i2, i1, i128, i1
}

}

