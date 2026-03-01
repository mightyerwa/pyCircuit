module attributes {pyc.top = @fe_scheduler, pyc.frontend.contract = "pycircuit"} {
func.func @fe_scheduler(%clk: !pyc.clock, %rst: !pyc.reset, %in0_vld: i1, %in1_vld: i1, %in2_vld: i1, %in3_vld: i1, %in0_data: i128, %in1_data: i128, %in2_data: i128, %in3_data: i128, %in0_ctrl: i5, %in1_ctrl: i5, %in2_ctrl: i5, %in3_ctrl: i5, %in0_seq: i16, %in1_seq: i16, %in2_seq: i16, %in3_seq: i16) -> (i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2) attributes {arg_names = ["clk", "rst", "in0_vld", "in1_vld", "in2_vld", "in3_vld", "in0_data", "in1_data", "in2_data", "in3_data", "in0_ctrl", "in1_ctrl", "in2_ctrl", "in3_ctrl", "in0_seq", "in1_seq", "in2_seq", "in3_seq"], result_names = ["fe0_vld", "fe0_data", "fe0_lat", "fe1_vld", "fe1_data", "fe1_lat", "fe2_vld", "fe2_data", "fe2_lat", "fe3_vld", "fe3_data", "fe3_lat"], pyc.base = "fe_scheduler", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "fe0_busy__next"} : i1
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i1
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i1
  %v5 = pyc.alias %v4 {pyc.name = "fe0_busy"} : i1
  %v6 = pyc.wire {pyc.name = "fe1_busy__next"} : i1
  %v7 = pyc.constant 1 : i1
  %v8 = pyc.constant 0 : i1
  %v9 = pyc.reg %clk, %rst, %v7, %v6, %v8 : i1
  %v10 = pyc.alias %v9 {pyc.name = "fe1_busy"} : i1
  %v11 = pyc.wire {pyc.name = "fe2_busy__next"} : i1
  %v12 = pyc.constant 1 : i1
  %v13 = pyc.constant 0 : i1
  %v14 = pyc.reg %clk, %rst, %v12, %v11, %v13 : i1
  %v15 = pyc.alias %v14 {pyc.name = "fe2_busy"} : i1
  %v16 = pyc.wire {pyc.name = "fe3_busy__next"} : i1
  %v17 = pyc.constant 1 : i1
  %v18 = pyc.constant 0 : i1
  %v19 = pyc.reg %clk, %rst, %v17, %v16, %v18 : i1
  %v20 = pyc.alias %v19 {pyc.name = "fe3_busy"} : i1
  %v21 = pyc.wire {pyc.name = "fe0_timer__next"} : i3
  %v22 = pyc.constant 1 : i1
  %v23 = pyc.constant 0 : i3
  %v24 = pyc.reg %clk, %rst, %v22, %v21, %v23 : i3
  %v25 = pyc.alias %v24 {pyc.name = "fe0_timer"} : i3
  %v26 = pyc.wire {pyc.name = "fe1_timer__next"} : i3
  %v27 = pyc.constant 1 : i1
  %v28 = pyc.constant 0 : i3
  %v29 = pyc.reg %clk, %rst, %v27, %v26, %v28 : i3
  %v30 = pyc.alias %v29 {pyc.name = "fe1_timer"} : i3
  %v31 = pyc.wire {pyc.name = "fe2_timer__next"} : i3
  %v32 = pyc.constant 1 : i1
  %v33 = pyc.constant 0 : i3
  %v34 = pyc.reg %clk, %rst, %v32, %v31, %v33 : i3
  %v35 = pyc.alias %v34 {pyc.name = "fe2_timer"} : i3
  %v36 = pyc.wire {pyc.name = "fe3_timer__next"} : i3
  %v37 = pyc.constant 1 : i1
  %v38 = pyc.constant 0 : i3
  %v39 = pyc.reg %clk, %rst, %v37, %v36, %v38 : i3
  %v40 = pyc.alias %v39 {pyc.name = "fe3_timer"} : i3
  %v41 = pyc.wire {pyc.name = "fe0_seq__next"} : i16
  %v42 = pyc.constant 1 : i1
  %v43 = pyc.constant 0 : i16
  %v44 = pyc.reg %clk, %rst, %v42, %v41, %v43 : i16
  %v45 = pyc.alias %v44 {pyc.name = "fe0_seq"} : i16
  %v46 = pyc.wire {pyc.name = "fe1_seq__next"} : i16
  %v47 = pyc.constant 1 : i1
  %v48 = pyc.constant 0 : i16
  %v49 = pyc.reg %clk, %rst, %v47, %v46, %v48 : i16
  %v50 = pyc.alias %v49 {pyc.name = "fe1_seq"} : i16
  %v51 = pyc.wire {pyc.name = "fe2_seq__next"} : i16
  %v52 = pyc.constant 1 : i1
  %v53 = pyc.constant 0 : i16
  %v54 = pyc.reg %clk, %rst, %v52, %v51, %v53 : i16
  %v55 = pyc.alias %v54 {pyc.name = "fe2_seq"} : i16
  %v56 = pyc.wire {pyc.name = "fe3_seq__next"} : i16
  %v57 = pyc.constant 1 : i1
  %v58 = pyc.constant 0 : i16
  %v59 = pyc.reg %clk, %rst, %v57, %v56, %v58 : i16
  %v60 = pyc.alias %v59 {pyc.name = "fe3_seq"} : i16
  %v61 = pyc.wire {pyc.name = "last_lat__next"} : i2
  %v62 = pyc.constant 1 : i1
  %v63 = pyc.constant 0 : i2
  %v64 = pyc.reg %clk, %rst, %v62, %v61, %v63 : i2
  %v65 = pyc.alias %v64 {pyc.name = "last_lat"} : i2
  %v66 = pyc.alias %v65 {pyc.name = "last_lat__module_02_fe_scheduler__L51"} : i2
  %v67 = pyc.wire {pyc.name = "fe0_out_vld__next"} : i1
  %v68 = pyc.constant 1 : i1
  %v69 = pyc.constant 0 : i1
  %v70 = pyc.reg %clk, %rst, %v68, %v67, %v69 : i1
  %v71 = pyc.alias %v70 {pyc.name = "fe0_out_vld"} : i1
  %v72 = pyc.wire {pyc.name = "fe1_out_vld__next"} : i1
  %v73 = pyc.constant 1 : i1
  %v74 = pyc.constant 0 : i1
  %v75 = pyc.reg %clk, %rst, %v73, %v72, %v74 : i1
  %v76 = pyc.alias %v75 {pyc.name = "fe1_out_vld"} : i1
  %v77 = pyc.wire {pyc.name = "fe2_out_vld__next"} : i1
  %v78 = pyc.constant 1 : i1
  %v79 = pyc.constant 0 : i1
  %v80 = pyc.reg %clk, %rst, %v78, %v77, %v79 : i1
  %v81 = pyc.alias %v80 {pyc.name = "fe2_out_vld"} : i1
  %v82 = pyc.wire {pyc.name = "fe3_out_vld__next"} : i1
  %v83 = pyc.constant 1 : i1
  %v84 = pyc.constant 0 : i1
  %v85 = pyc.reg %clk, %rst, %v83, %v82, %v84 : i1
  %v86 = pyc.alias %v85 {pyc.name = "fe3_out_vld"} : i1
  %v87 = pyc.wire {pyc.name = "fe0_out_data__next"} : i128
  %v88 = pyc.constant 1 : i1
  %v89 = pyc.constant 0 : i128
  %v90 = pyc.reg %clk, %rst, %v88, %v87, %v89 : i128
  %v91 = pyc.alias %v90 {pyc.name = "fe0_out_data"} : i128
  %v92 = pyc.wire {pyc.name = "fe1_out_data__next"} : i128
  %v93 = pyc.constant 1 : i1
  %v94 = pyc.constant 0 : i128
  %v95 = pyc.reg %clk, %rst, %v93, %v92, %v94 : i128
  %v96 = pyc.alias %v95 {pyc.name = "fe1_out_data"} : i128
  %v97 = pyc.wire {pyc.name = "fe2_out_data__next"} : i128
  %v98 = pyc.constant 1 : i1
  %v99 = pyc.constant 0 : i128
  %v100 = pyc.reg %clk, %rst, %v98, %v97, %v99 : i128
  %v101 = pyc.alias %v100 {pyc.name = "fe2_out_data"} : i128
  %v102 = pyc.wire {pyc.name = "fe3_out_data__next"} : i128
  %v103 = pyc.constant 1 : i1
  %v104 = pyc.constant 0 : i128
  %v105 = pyc.reg %clk, %rst, %v103, %v102, %v104 : i128
  %v106 = pyc.alias %v105 {pyc.name = "fe3_out_data"} : i128
  %v107 = pyc.wire {pyc.name = "fe0_out_lat__next"} : i2
  %v108 = pyc.constant 1 : i1
  %v109 = pyc.constant 0 : i2
  %v110 = pyc.reg %clk, %rst, %v108, %v107, %v109 : i2
  %v111 = pyc.alias %v110 {pyc.name = "fe0_out_lat"} : i2
  %v112 = pyc.wire {pyc.name = "fe1_out_lat__next"} : i2
  %v113 = pyc.constant 1 : i1
  %v114 = pyc.constant 0 : i2
  %v115 = pyc.reg %clk, %rst, %v113, %v112, %v114 : i2
  %v116 = pyc.alias %v115 {pyc.name = "fe1_out_lat"} : i2
  %v117 = pyc.wire {pyc.name = "fe2_out_lat__next"} : i2
  %v118 = pyc.constant 1 : i1
  %v119 = pyc.constant 0 : i2
  %v120 = pyc.reg %clk, %rst, %v118, %v117, %v119 : i2
  %v121 = pyc.alias %v120 {pyc.name = "fe2_out_lat"} : i2
  %v122 = pyc.wire {pyc.name = "fe3_out_lat__next"} : i2
  %v123 = pyc.constant 1 : i1
  %v124 = pyc.constant 0 : i2
  %v125 = pyc.reg %clk, %rst, %v123, %v122, %v124 : i2
  %v126 = pyc.alias %v125 {pyc.name = "fe3_out_lat"} : i2
  %v127 = pyc.constant 3 : i5
  %v128 = pyc.and %in0_ctrl, %v127 : i5
  %v129 = pyc.alias %v128 {pyc.name = "lat__module_02_fe_scheduler__L61"} : i5
  %v130 = pyc.constant 3 : i5
  %v131 = pyc.and %in1_ctrl, %v130 : i5
  %v132 = pyc.alias %v131 {pyc.name = "lat__module_02_fe_scheduler__L61"} : i5
  %v133 = pyc.constant 3 : i5
  %v134 = pyc.and %in2_ctrl, %v133 : i5
  %v135 = pyc.alias %v134 {pyc.name = "lat__module_02_fe_scheduler__L61"} : i5
  %v136 = pyc.constant 3 : i5
  %v137 = pyc.and %in3_ctrl, %v136 : i5
  %v138 = pyc.alias %v137 {pyc.name = "lat__module_02_fe_scheduler__L61"} : i5
  %v139 = pyc.not %v5 : i1
  %v140 = pyc.and %v139, %in0_vld : i1
  %v141 = pyc.alias %v140 {pyc.name = "can_start__module_02_fe_scheduler__L68"} : i1
  pyc.assign %v67, %v141 : i1
  pyc.assign %v87, %in0_data : i128
  %v142 = pyc.trunc %v129 : i5 -> i2
  pyc.assign %v107, %v142 : i2
  %v143 = pyc.constant 0 : i3
  %v144 = pyc.ult %v143, %v25 : i3
  %v145 = pyc.and %v5, %v144 : i1
  %v146 = pyc.or %v141, %v145 : i1
  %v147 = pyc.alias %v146 {pyc.name = "new_busy__module_02_fe_scheduler__L76"} : i1
  pyc.assign %v1, %v147 : i1
  %v148 = pyc.constant 1 : i3
  %v149 = pyc.zext %v148 : i3 -> i5
  %v150 = pyc.add %v129, %v149 : i5
  %v151 = pyc.constant 1 : i3
  %v152 = pyc.sub %v25, %v151 : i3
  %v153 = pyc.zext %v152 : i3 -> i5
  %v154 = pyc.mux %v141, %v150, %v153 : i5
  %v155 = pyc.alias %v154 {pyc.name = "new_timer__module_02_fe_scheduler__L80"} : i5
  %v156 = pyc.trunc %v155 : i5 -> i3
  pyc.assign %v21, %v156 : i3
  %v157 = pyc.mux %v141, %in0_seq, %v45 : i16
  pyc.assign %v41, %v157 : i16
  %v158 = pyc.not %v10 : i1
  %v159 = pyc.and %v158, %in1_vld : i1
  %v160 = pyc.alias %v159 {pyc.name = "can_start__module_02_fe_scheduler__L68"} : i1
  pyc.assign %v72, %v160 : i1
  pyc.assign %v92, %in1_data : i128
  %v161 = pyc.trunc %v132 : i5 -> i2
  pyc.assign %v112, %v161 : i2
  %v162 = pyc.constant 0 : i3
  %v163 = pyc.ult %v162, %v30 : i3
  %v164 = pyc.and %v10, %v163 : i1
  %v165 = pyc.or %v160, %v164 : i1
  %v166 = pyc.alias %v165 {pyc.name = "new_busy__module_02_fe_scheduler__L76"} : i1
  pyc.assign %v6, %v166 : i1
  %v167 = pyc.constant 1 : i3
  %v168 = pyc.zext %v167 : i3 -> i5
  %v169 = pyc.add %v132, %v168 : i5
  %v170 = pyc.constant 1 : i3
  %v171 = pyc.sub %v30, %v170 : i3
  %v172 = pyc.zext %v171 : i3 -> i5
  %v173 = pyc.mux %v160, %v169, %v172 : i5
  %v174 = pyc.alias %v173 {pyc.name = "new_timer__module_02_fe_scheduler__L80"} : i5
  %v175 = pyc.trunc %v174 : i5 -> i3
  pyc.assign %v26, %v175 : i3
  %v176 = pyc.mux %v160, %in1_seq, %v50 : i16
  pyc.assign %v46, %v176 : i16
  %v177 = pyc.not %v15 : i1
  %v178 = pyc.and %v177, %in2_vld : i1
  %v179 = pyc.alias %v178 {pyc.name = "can_start__module_02_fe_scheduler__L68"} : i1
  pyc.assign %v77, %v179 : i1
  pyc.assign %v97, %in2_data : i128
  %v180 = pyc.trunc %v135 : i5 -> i2
  pyc.assign %v117, %v180 : i2
  %v181 = pyc.constant 0 : i3
  %v182 = pyc.ult %v181, %v35 : i3
  %v183 = pyc.and %v15, %v182 : i1
  %v184 = pyc.or %v179, %v183 : i1
  %v185 = pyc.alias %v184 {pyc.name = "new_busy__module_02_fe_scheduler__L76"} : i1
  pyc.assign %v11, %v185 : i1
  %v186 = pyc.constant 1 : i3
  %v187 = pyc.zext %v186 : i3 -> i5
  %v188 = pyc.add %v135, %v187 : i5
  %v189 = pyc.constant 1 : i3
  %v190 = pyc.sub %v35, %v189 : i3
  %v191 = pyc.zext %v190 : i3 -> i5
  %v192 = pyc.mux %v179, %v188, %v191 : i5
  %v193 = pyc.alias %v192 {pyc.name = "new_timer__module_02_fe_scheduler__L80"} : i5
  %v194 = pyc.trunc %v193 : i5 -> i3
  pyc.assign %v31, %v194 : i3
  %v195 = pyc.mux %v179, %in2_seq, %v55 : i16
  pyc.assign %v51, %v195 : i16
  %v196 = pyc.not %v20 : i1
  %v197 = pyc.and %v196, %in3_vld : i1
  %v198 = pyc.alias %v197 {pyc.name = "can_start__module_02_fe_scheduler__L68"} : i1
  pyc.assign %v82, %v198 : i1
  pyc.assign %v102, %in3_data : i128
  %v199 = pyc.trunc %v138 : i5 -> i2
  pyc.assign %v122, %v199 : i2
  %v200 = pyc.constant 0 : i3
  %v201 = pyc.ult %v200, %v40 : i3
  %v202 = pyc.and %v20, %v201 : i1
  %v203 = pyc.or %v198, %v202 : i1
  %v204 = pyc.alias %v203 {pyc.name = "new_busy__module_02_fe_scheduler__L76"} : i1
  pyc.assign %v16, %v204 : i1
  %v205 = pyc.constant 1 : i3
  %v206 = pyc.zext %v205 : i3 -> i5
  %v207 = pyc.add %v138, %v206 : i5
  %v208 = pyc.constant 1 : i3
  %v209 = pyc.sub %v40, %v208 : i3
  %v210 = pyc.zext %v209 : i3 -> i5
  %v211 = pyc.mux %v198, %v207, %v210 : i5
  %v212 = pyc.alias %v211 {pyc.name = "new_timer__module_02_fe_scheduler__L80"} : i5
  %v213 = pyc.trunc %v212 : i5 -> i3
  pyc.assign %v36, %v213 : i3
  %v214 = pyc.mux %v198, %in3_seq, %v60 : i16
  pyc.assign %v56, %v214 : i16
  %v215 = pyc.or %in0_vld, %in1_vld : i1
  %v216 = pyc.or %v215, %in2_vld : i1
  %v217 = pyc.or %v216, %in3_vld : i1
  %v218 = pyc.alias %v217 {pyc.name = "any_vld__module_02_fe_scheduler__L87"} : i1
  %v219 = pyc.zext %v66 : i2 -> i5
  %v220 = pyc.mux %in3_vld, %v138, %v219 : i5
  %v221 = pyc.mux %in2_vld, %v135, %v220 : i5
  %v222 = pyc.mux %in1_vld, %v132, %v221 : i5
  %v223 = pyc.mux %in0_vld, %v129, %v222 : i5
  %v224 = pyc.alias %v223 {pyc.name = "new_last_lat__module_02_fe_scheduler__L88"} : i5
  %v225 = pyc.zext %v66 : i2 -> i5
  %v226 = pyc.mux %v218, %v224, %v225 : i5
  %v227 = pyc.trunc %v226 : i5 -> i2
  pyc.assign %v61, %v227 : i2
  func.return %v71, %v91, %v111, %v76, %v96, %v116, %v81, %v101, %v121, %v86, %v106, %v126 : i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2
}

}

