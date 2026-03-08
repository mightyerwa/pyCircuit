module attributes {pyc.top = @fe_scheduler_v2, pyc.frontend.contract = "pycircuit"} {
func.func @fe_scheduler_v2(%clk: !pyc.clock, %rst: !pyc.reset, %in0_vld: i1, %in1_vld: i1, %in2_vld: i1, %in3_vld: i1, %in0_data: i128, %in1_data: i128, %in2_data: i128, %in3_data: i128, %in0_ctrl: i5, %in1_ctrl: i5, %in2_ctrl: i5, %in3_ctrl: i5, %in0_seq: i16, %in1_seq: i16, %in2_seq: i16, %in3_seq: i16) -> (i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2) attributes {arg_names = ["clk", "rst", "in0_vld", "in1_vld", "in2_vld", "in3_vld", "in0_data", "in1_data", "in2_data", "in3_data", "in0_ctrl", "in1_ctrl", "in2_ctrl", "in3_ctrl", "in0_seq", "in1_seq", "in2_seq", "in3_seq"], result_names = ["fe0_vld", "fe0_data", "fe0_lat", "fe1_vld", "fe1_data", "fe1_lat", "fe2_vld", "fe2_data", "fe2_lat", "fe3_vld", "fe3_data", "fe3_lat"], pyc.base = "fe_scheduler", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
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
  %v41 = pyc.wire {pyc.name = "last_lat__next"} : i2
  %v42 = pyc.constant 1 : i1
  %v43 = pyc.constant 0 : i2
  %v44 = pyc.reg %clk, %rst, %v42, %v41, %v43 : i2
  %v45 = pyc.alias %v44 {pyc.name = "last_lat"} : i2
  %v46 = pyc.alias %v45 {pyc.name = "last_lat__module_02_fe_scheduler_v2__L55"} : i2
  %v47 = pyc.wire {pyc.name = "last_lat_valid__next"} : i1
  %v48 = pyc.constant 1 : i1
  %v49 = pyc.constant 0 : i1
  %v50 = pyc.reg %clk, %rst, %v48, %v47, %v49 : i1
  %v51 = pyc.alias %v50 {pyc.name = "last_lat_valid"} : i1
  %v52 = pyc.alias %v51 {pyc.name = "last_lat_valid__module_02_fe_scheduler_v2__L56"} : i1
  %v53 = pyc.wire {pyc.name = "fe0_out_vld__next"} : i1
  %v54 = pyc.constant 1 : i1
  %v55 = pyc.constant 0 : i1
  %v56 = pyc.reg %clk, %rst, %v54, %v53, %v55 : i1
  %v57 = pyc.alias %v56 {pyc.name = "fe0_out_vld"} : i1
  %v58 = pyc.wire {pyc.name = "fe1_out_vld__next"} : i1
  %v59 = pyc.constant 1 : i1
  %v60 = pyc.constant 0 : i1
  %v61 = pyc.reg %clk, %rst, %v59, %v58, %v60 : i1
  %v62 = pyc.alias %v61 {pyc.name = "fe1_out_vld"} : i1
  %v63 = pyc.wire {pyc.name = "fe2_out_vld__next"} : i1
  %v64 = pyc.constant 1 : i1
  %v65 = pyc.constant 0 : i1
  %v66 = pyc.reg %clk, %rst, %v64, %v63, %v65 : i1
  %v67 = pyc.alias %v66 {pyc.name = "fe2_out_vld"} : i1
  %v68 = pyc.wire {pyc.name = "fe3_out_vld__next"} : i1
  %v69 = pyc.constant 1 : i1
  %v70 = pyc.constant 0 : i1
  %v71 = pyc.reg %clk, %rst, %v69, %v68, %v70 : i1
  %v72 = pyc.alias %v71 {pyc.name = "fe3_out_vld"} : i1
  %v73 = pyc.wire {pyc.name = "fe0_out_data__next"} : i128
  %v74 = pyc.constant 1 : i1
  %v75 = pyc.constant 0 : i128
  %v76 = pyc.reg %clk, %rst, %v74, %v73, %v75 : i128
  %v77 = pyc.alias %v76 {pyc.name = "fe0_out_data"} : i128
  %v78 = pyc.wire {pyc.name = "fe1_out_data__next"} : i128
  %v79 = pyc.constant 1 : i1
  %v80 = pyc.constant 0 : i128
  %v81 = pyc.reg %clk, %rst, %v79, %v78, %v80 : i128
  %v82 = pyc.alias %v81 {pyc.name = "fe1_out_data"} : i128
  %v83 = pyc.wire {pyc.name = "fe2_out_data__next"} : i128
  %v84 = pyc.constant 1 : i1
  %v85 = pyc.constant 0 : i128
  %v86 = pyc.reg %clk, %rst, %v84, %v83, %v85 : i128
  %v87 = pyc.alias %v86 {pyc.name = "fe2_out_data"} : i128
  %v88 = pyc.wire {pyc.name = "fe3_out_data__next"} : i128
  %v89 = pyc.constant 1 : i1
  %v90 = pyc.constant 0 : i128
  %v91 = pyc.reg %clk, %rst, %v89, %v88, %v90 : i128
  %v92 = pyc.alias %v91 {pyc.name = "fe3_out_data"} : i128
  %v93 = pyc.wire {pyc.name = "fe0_out_lat__next"} : i2
  %v94 = pyc.constant 1 : i1
  %v95 = pyc.constant 0 : i2
  %v96 = pyc.reg %clk, %rst, %v94, %v93, %v95 : i2
  %v97 = pyc.alias %v96 {pyc.name = "fe0_out_lat"} : i2
  %v98 = pyc.wire {pyc.name = "fe1_out_lat__next"} : i2
  %v99 = pyc.constant 1 : i1
  %v100 = pyc.constant 0 : i2
  %v101 = pyc.reg %clk, %rst, %v99, %v98, %v100 : i2
  %v102 = pyc.alias %v101 {pyc.name = "fe1_out_lat"} : i2
  %v103 = pyc.wire {pyc.name = "fe2_out_lat__next"} : i2
  %v104 = pyc.constant 1 : i1
  %v105 = pyc.constant 0 : i2
  %v106 = pyc.reg %clk, %rst, %v104, %v103, %v105 : i2
  %v107 = pyc.alias %v106 {pyc.name = "fe2_out_lat"} : i2
  %v108 = pyc.wire {pyc.name = "fe3_out_lat__next"} : i2
  %v109 = pyc.constant 1 : i1
  %v110 = pyc.constant 0 : i2
  %v111 = pyc.reg %clk, %rst, %v109, %v108, %v110 : i2
  %v112 = pyc.alias %v111 {pyc.name = "fe3_out_lat"} : i2
  %v113 = pyc.constant 3 : i5
  %v114 = pyc.and %in0_ctrl, %v113 : i5
  %v115 = pyc.alias %v114 {pyc.name = "lat__module_02_fe_scheduler_v2__L66"} : i5
  %v116 = pyc.constant 3 : i5
  %v117 = pyc.and %in1_ctrl, %v116 : i5
  %v118 = pyc.alias %v117 {pyc.name = "lat__module_02_fe_scheduler_v2__L66"} : i5
  %v119 = pyc.constant 3 : i5
  %v120 = pyc.and %in2_ctrl, %v119 : i5
  %v121 = pyc.alias %v120 {pyc.name = "lat__module_02_fe_scheduler_v2__L66"} : i5
  %v122 = pyc.constant 3 : i5
  %v123 = pyc.and %in3_ctrl, %v122 : i5
  %v124 = pyc.alias %v123 {pyc.name = "lat__module_02_fe_scheduler_v2__L66"} : i5
  %v125 = pyc.alias %v115 {pyc.name = "first_vld_lat__module_02_fe_scheduler_v2__L71"} : i5
  %v137, %v138 = scf.if %v52 -> (i1, i1) {
    %v126 = pyc.zext %v46 : i2 -> i5
    %v127 = pyc.ult %v115, %v126 : i5
    %v128 = pyc.alias %v127 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L83"} : i1
    %v129 = pyc.not %v5 : i1
    %v130 = pyc.and %v129, %in0_vld : i1
    %v131 = pyc.not %v128 : i1
    %v132 = pyc.and %v130, %v131 : i1
    %v133 = pyc.alias %v132 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L84"} : i1
    scf.yield %v133, %v128 : i1, i1
  } else {
    %v134 = pyc.not %v5 : i1
    %v135 = pyc.and %v134, %in0_vld : i1
    %v136 = pyc.alias %v135 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L86"} : i1
    %v139 = pyc.constant 0 : i1
    scf.yield %v136, %v139 : i1, i1
  }
  %v140 = pyc.alias %v137 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L81"} : i1
  %v141 = pyc.alias %v138 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L81"} : i1
  pyc.assign %v53, %v140 : i1
  %v142 = pyc.constant 0 : i128
  %v143 = pyc.mux %v140, %in0_data, %v142 : i128
  pyc.assign %v73, %v143 : i128
  %v144 = pyc.constant 0 : i2
  %v145 = pyc.zext %v144 : i2 -> i5
  %v146 = pyc.mux %v140, %v115, %v145 : i5
  %v147 = pyc.trunc %v146 : i5 -> i2
  pyc.assign %v93, %v147 : i2
  %v148 = pyc.constant 1 : i3
  %v149 = pyc.ult %v148, %v25 : i3
  %v150 = pyc.and %v5, %v149 : i1
  %v151 = pyc.or %v140, %v150 : i1
  %v152 = pyc.alias %v151 {pyc.name = "new_busy__module_02_fe_scheduler_v2__L94"} : i1
  pyc.assign %v1, %v152 : i1
  %v153 = pyc.constant 1 : i3
  %v154 = pyc.zext %v153 : i3 -> i5
  %v155 = pyc.add %v115, %v154 : i5
  %v156 = pyc.constant 1 : i3
  %v157 = pyc.sub %v25, %v156 : i3
  %v158 = pyc.constant 0 : i3
  %v159 = pyc.mux %v5, %v157, %v158 : i3
  %v160 = pyc.zext %v159 : i3 -> i5
  %v161 = pyc.mux %v140, %v155, %v160 : i5
  %v162 = pyc.alias %v161 {pyc.name = "new_timer__module_02_fe_scheduler_v2__L100"} : i5
  %v163 = pyc.trunc %v162 : i5 -> i3
  pyc.assign %v21, %v163 : i3
  %v175, %v176 = scf.if %v52 -> (i1, i1) {
    %v164 = pyc.zext %v46 : i2 -> i5
    %v165 = pyc.ult %v118, %v164 : i5
    %v166 = pyc.alias %v165 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L83"} : i1
    %v167 = pyc.not %v10 : i1
    %v168 = pyc.and %v167, %in1_vld : i1
    %v169 = pyc.not %v166 : i1
    %v170 = pyc.and %v168, %v169 : i1
    %v171 = pyc.alias %v170 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L84"} : i1
    scf.yield %v171, %v166 : i1, i1
  } else {
    %v172 = pyc.not %v10 : i1
    %v173 = pyc.and %v172, %in1_vld : i1
    %v174 = pyc.alias %v173 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L86"} : i1
    scf.yield %v174, %v141 : i1, i1
  }
  %v177 = pyc.alias %v175 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L81"} : i1
  %v178 = pyc.alias %v176 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L81"} : i1
  pyc.assign %v58, %v177 : i1
  %v179 = pyc.constant 0 : i128
  %v180 = pyc.mux %v177, %in1_data, %v179 : i128
  pyc.assign %v78, %v180 : i128
  %v181 = pyc.constant 0 : i2
  %v182 = pyc.zext %v181 : i2 -> i5
  %v183 = pyc.mux %v177, %v118, %v182 : i5
  %v184 = pyc.trunc %v183 : i5 -> i2
  pyc.assign %v98, %v184 : i2
  %v185 = pyc.constant 1 : i3
  %v186 = pyc.ult %v185, %v30 : i3
  %v187 = pyc.and %v10, %v186 : i1
  %v188 = pyc.or %v177, %v187 : i1
  %v189 = pyc.alias %v188 {pyc.name = "new_busy__module_02_fe_scheduler_v2__L94"} : i1
  pyc.assign %v6, %v189 : i1
  %v190 = pyc.constant 1 : i3
  %v191 = pyc.zext %v190 : i3 -> i5
  %v192 = pyc.add %v118, %v191 : i5
  %v193 = pyc.constant 1 : i3
  %v194 = pyc.sub %v30, %v193 : i3
  %v195 = pyc.constant 0 : i3
  %v196 = pyc.mux %v10, %v194, %v195 : i3
  %v197 = pyc.zext %v196 : i3 -> i5
  %v198 = pyc.mux %v177, %v192, %v197 : i5
  %v199 = pyc.alias %v198 {pyc.name = "new_timer__module_02_fe_scheduler_v2__L100"} : i5
  %v200 = pyc.trunc %v199 : i5 -> i3
  pyc.assign %v26, %v200 : i3
  %v212, %v213 = scf.if %v52 -> (i1, i1) {
    %v201 = pyc.zext %v46 : i2 -> i5
    %v202 = pyc.ult %v121, %v201 : i5
    %v203 = pyc.alias %v202 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L83"} : i1
    %v204 = pyc.not %v15 : i1
    %v205 = pyc.and %v204, %in2_vld : i1
    %v206 = pyc.not %v203 : i1
    %v207 = pyc.and %v205, %v206 : i1
    %v208 = pyc.alias %v207 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L84"} : i1
    scf.yield %v208, %v203 : i1, i1
  } else {
    %v209 = pyc.not %v15 : i1
    %v210 = pyc.and %v209, %in2_vld : i1
    %v211 = pyc.alias %v210 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L86"} : i1
    scf.yield %v211, %v178 : i1, i1
  }
  %v214 = pyc.alias %v212 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L81"} : i1
  %v215 = pyc.alias %v213 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L81"} : i1
  pyc.assign %v63, %v214 : i1
  %v216 = pyc.constant 0 : i128
  %v217 = pyc.mux %v214, %in2_data, %v216 : i128
  pyc.assign %v83, %v217 : i128
  %v218 = pyc.constant 0 : i2
  %v219 = pyc.zext %v218 : i2 -> i5
  %v220 = pyc.mux %v214, %v121, %v219 : i5
  %v221 = pyc.trunc %v220 : i5 -> i2
  pyc.assign %v103, %v221 : i2
  %v222 = pyc.constant 1 : i3
  %v223 = pyc.ult %v222, %v35 : i3
  %v224 = pyc.and %v15, %v223 : i1
  %v225 = pyc.or %v214, %v224 : i1
  %v226 = pyc.alias %v225 {pyc.name = "new_busy__module_02_fe_scheduler_v2__L94"} : i1
  pyc.assign %v11, %v226 : i1
  %v227 = pyc.constant 1 : i3
  %v228 = pyc.zext %v227 : i3 -> i5
  %v229 = pyc.add %v121, %v228 : i5
  %v230 = pyc.constant 1 : i3
  %v231 = pyc.sub %v35, %v230 : i3
  %v232 = pyc.constant 0 : i3
  %v233 = pyc.mux %v15, %v231, %v232 : i3
  %v234 = pyc.zext %v233 : i3 -> i5
  %v235 = pyc.mux %v214, %v229, %v234 : i5
  %v236 = pyc.alias %v235 {pyc.name = "new_timer__module_02_fe_scheduler_v2__L100"} : i5
  %v237 = pyc.trunc %v236 : i5 -> i3
  pyc.assign %v31, %v237 : i3
  %v249, %v250 = scf.if %v52 -> (i1, i1) {
    %v238 = pyc.zext %v46 : i2 -> i5
    %v239 = pyc.ult %v124, %v238 : i5
    %v240 = pyc.alias %v239 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L83"} : i1
    %v241 = pyc.not %v20 : i1
    %v242 = pyc.and %v241, %in3_vld : i1
    %v243 = pyc.not %v240 : i1
    %v244 = pyc.and %v242, %v243 : i1
    %v245 = pyc.alias %v244 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L84"} : i1
    scf.yield %v245, %v240 : i1, i1
  } else {
    %v246 = pyc.not %v20 : i1
    %v247 = pyc.and %v246, %in3_vld : i1
    %v248 = pyc.alias %v247 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L86"} : i1
    scf.yield %v248, %v215 : i1, i1
  }
  %v251 = pyc.alias %v249 {pyc.name = "can_schedule__module_02_fe_scheduler_v2__L81"} : i1
  %v252 = pyc.alias %v250 {pyc.name = "constraint_violation__module_02_fe_scheduler_v2__L81"} : i1
  pyc.assign %v68, %v251 : i1
  %v253 = pyc.constant 0 : i128
  %v254 = pyc.mux %v251, %in3_data, %v253 : i128
  pyc.assign %v88, %v254 : i128
  %v255 = pyc.constant 0 : i2
  %v256 = pyc.zext %v255 : i2 -> i5
  %v257 = pyc.mux %v251, %v124, %v256 : i5
  %v258 = pyc.trunc %v257 : i5 -> i2
  pyc.assign %v108, %v258 : i2
  %v259 = pyc.constant 1 : i3
  %v260 = pyc.ult %v259, %v40 : i3
  %v261 = pyc.and %v20, %v260 : i1
  %v262 = pyc.or %v251, %v261 : i1
  %v263 = pyc.alias %v262 {pyc.name = "new_busy__module_02_fe_scheduler_v2__L94"} : i1
  pyc.assign %v16, %v263 : i1
  %v264 = pyc.constant 1 : i3
  %v265 = pyc.zext %v264 : i3 -> i5
  %v266 = pyc.add %v124, %v265 : i5
  %v267 = pyc.constant 1 : i3
  %v268 = pyc.sub %v40, %v267 : i3
  %v269 = pyc.constant 0 : i3
  %v270 = pyc.mux %v20, %v268, %v269 : i3
  %v271 = pyc.zext %v270 : i3 -> i5
  %v272 = pyc.mux %v251, %v266, %v271 : i5
  %v273 = pyc.alias %v272 {pyc.name = "new_timer__module_02_fe_scheduler_v2__L100"} : i5
  %v274 = pyc.trunc %v273 : i5 -> i3
  pyc.assign %v36, %v274 : i3
  %v275 = pyc.or %in0_vld, %in1_vld : i1
  %v276 = pyc.or %v275, %in2_vld : i1
  %v277 = pyc.or %v276, %in3_vld : i1
  %v278 = pyc.alias %v277 {pyc.name = "any_vld__module_02_fe_scheduler_v2__L105"} : i1
  %v279 = pyc.constant 0 : i2
  %v280 = pyc.zext %v279 : i2 -> i5
  %v281 = pyc.mux %in0_vld, %v115, %v280 : i5
  %v282 = pyc.alias %v281 {pyc.name = "first_valid_lat__module_02_fe_scheduler_v2__L111"} : i5
  %v283 = pyc.mux %in1_vld, %v118, %v282 : i5
  %v284 = pyc.alias %v283 {pyc.name = "first_valid_lat__module_02_fe_scheduler_v2__L113"} : i5
  %v285 = pyc.mux %in2_vld, %v121, %v284 : i5
  %v286 = pyc.alias %v285 {pyc.name = "first_valid_lat__module_02_fe_scheduler_v2__L113"} : i5
  %v287 = pyc.mux %in3_vld, %v124, %v286 : i5
  %v288 = pyc.alias %v287 {pyc.name = "first_valid_lat__module_02_fe_scheduler_v2__L113"} : i5
  %v289 = pyc.zext %v46 : i2 -> i5
  %v290 = pyc.mux %v278, %v288, %v289 : i5
  %v291 = pyc.trunc %v290 : i5 -> i2
  pyc.assign %v41, %v291 : i2
  pyc.assign %v47, %v278 : i1
  func.return %v57, %v77, %v97, %v62, %v82, %v102, %v67, %v87, %v107, %v72, %v92, %v112 : i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2
}

}

