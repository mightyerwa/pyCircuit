module attributes {pyc.top = @fe_scheduler_v3, pyc.frontend.contract = "pycircuit"} {
func.func @fe_scheduler_v3(%clk: !pyc.clock, %rst: !pyc.reset, %in0_vld: i1, %in1_vld: i1, %in2_vld: i1, %in3_vld: i1, %in0_data: i128, %in1_data: i128, %in2_data: i128, %in3_data: i128, %in0_ctrl: i5, %in1_ctrl: i5, %in2_ctrl: i5, %in3_ctrl: i5, %in0_seq: i16, %in1_seq: i16, %in2_seq: i16, %in3_seq: i16) -> (i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2) attributes {arg_names = ["clk", "rst", "in0_vld", "in1_vld", "in2_vld", "in3_vld", "in0_data", "in1_data", "in2_data", "in3_data", "in0_ctrl", "in1_ctrl", "in2_ctrl", "in3_ctrl", "in0_seq", "in1_seq", "in2_seq", "in3_seq"], result_names = ["fe0_vld", "fe0_data", "fe0_lat", "fe1_vld", "fe1_data", "fe1_lat", "fe2_vld", "fe2_data", "fe2_lat", "fe3_vld", "fe3_data", "fe3_lat"], pyc.base = "fe_scheduler_v3", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
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
  %v41 = pyc.wire {pyc.name = "fe0_last_finish__next"} : i4
  %v42 = pyc.constant 1 : i1
  %v43 = pyc.constant 0 : i4
  %v44 = pyc.reg %clk, %rst, %v42, %v41, %v43 : i4
  %v45 = pyc.alias %v44 {pyc.name = "fe0_last_finish"} : i4
  %v46 = pyc.wire {pyc.name = "fe1_last_finish__next"} : i4
  %v47 = pyc.constant 1 : i1
  %v48 = pyc.constant 0 : i4
  %v49 = pyc.reg %clk, %rst, %v47, %v46, %v48 : i4
  %v50 = pyc.alias %v49 {pyc.name = "fe1_last_finish"} : i4
  %v51 = pyc.wire {pyc.name = "fe2_last_finish__next"} : i4
  %v52 = pyc.constant 1 : i1
  %v53 = pyc.constant 0 : i4
  %v54 = pyc.reg %clk, %rst, %v52, %v51, %v53 : i4
  %v55 = pyc.alias %v54 {pyc.name = "fe2_last_finish"} : i4
  %v56 = pyc.wire {pyc.name = "fe3_last_finish__next"} : i4
  %v57 = pyc.constant 1 : i1
  %v58 = pyc.constant 0 : i4
  %v59 = pyc.reg %clk, %rst, %v57, %v56, %v58 : i4
  %v60 = pyc.alias %v59 {pyc.name = "fe3_last_finish"} : i4
  %v61 = pyc.wire {pyc.name = "fe0_out_vld__next"} : i1
  %v62 = pyc.constant 1 : i1
  %v63 = pyc.constant 0 : i1
  %v64 = pyc.reg %clk, %rst, %v62, %v61, %v63 : i1
  %v65 = pyc.alias %v64 {pyc.name = "fe0_out_vld"} : i1
  %v66 = pyc.wire {pyc.name = "fe1_out_vld__next"} : i1
  %v67 = pyc.constant 1 : i1
  %v68 = pyc.constant 0 : i1
  %v69 = pyc.reg %clk, %rst, %v67, %v66, %v68 : i1
  %v70 = pyc.alias %v69 {pyc.name = "fe1_out_vld"} : i1
  %v71 = pyc.wire {pyc.name = "fe2_out_vld__next"} : i1
  %v72 = pyc.constant 1 : i1
  %v73 = pyc.constant 0 : i1
  %v74 = pyc.reg %clk, %rst, %v72, %v71, %v73 : i1
  %v75 = pyc.alias %v74 {pyc.name = "fe2_out_vld"} : i1
  %v76 = pyc.wire {pyc.name = "fe3_out_vld__next"} : i1
  %v77 = pyc.constant 1 : i1
  %v78 = pyc.constant 0 : i1
  %v79 = pyc.reg %clk, %rst, %v77, %v76, %v78 : i1
  %v80 = pyc.alias %v79 {pyc.name = "fe3_out_vld"} : i1
  %v81 = pyc.wire {pyc.name = "fe0_out_data__next"} : i128
  %v82 = pyc.constant 1 : i1
  %v83 = pyc.constant 0 : i128
  %v84 = pyc.reg %clk, %rst, %v82, %v81, %v83 : i128
  %v85 = pyc.alias %v84 {pyc.name = "fe0_out_data"} : i128
  %v86 = pyc.wire {pyc.name = "fe1_out_data__next"} : i128
  %v87 = pyc.constant 1 : i1
  %v88 = pyc.constant 0 : i128
  %v89 = pyc.reg %clk, %rst, %v87, %v86, %v88 : i128
  %v90 = pyc.alias %v89 {pyc.name = "fe1_out_data"} : i128
  %v91 = pyc.wire {pyc.name = "fe2_out_data__next"} : i128
  %v92 = pyc.constant 1 : i1
  %v93 = pyc.constant 0 : i128
  %v94 = pyc.reg %clk, %rst, %v92, %v91, %v93 : i128
  %v95 = pyc.alias %v94 {pyc.name = "fe2_out_data"} : i128
  %v96 = pyc.wire {pyc.name = "fe3_out_data__next"} : i128
  %v97 = pyc.constant 1 : i1
  %v98 = pyc.constant 0 : i128
  %v99 = pyc.reg %clk, %rst, %v97, %v96, %v98 : i128
  %v100 = pyc.alias %v99 {pyc.name = "fe3_out_data"} : i128
  %v101 = pyc.wire {pyc.name = "fe0_out_lat__next"} : i2
  %v102 = pyc.constant 1 : i1
  %v103 = pyc.constant 0 : i2
  %v104 = pyc.reg %clk, %rst, %v102, %v101, %v103 : i2
  %v105 = pyc.alias %v104 {pyc.name = "fe0_out_lat"} : i2
  %v106 = pyc.wire {pyc.name = "fe1_out_lat__next"} : i2
  %v107 = pyc.constant 1 : i1
  %v108 = pyc.constant 0 : i2
  %v109 = pyc.reg %clk, %rst, %v107, %v106, %v108 : i2
  %v110 = pyc.alias %v109 {pyc.name = "fe1_out_lat"} : i2
  %v111 = pyc.wire {pyc.name = "fe2_out_lat__next"} : i2
  %v112 = pyc.constant 1 : i1
  %v113 = pyc.constant 0 : i2
  %v114 = pyc.reg %clk, %rst, %v112, %v111, %v113 : i2
  %v115 = pyc.alias %v114 {pyc.name = "fe2_out_lat"} : i2
  %v116 = pyc.wire {pyc.name = "fe3_out_lat__next"} : i2
  %v117 = pyc.constant 1 : i1
  %v118 = pyc.constant 0 : i2
  %v119 = pyc.reg %clk, %rst, %v117, %v116, %v118 : i2
  %v120 = pyc.alias %v119 {pyc.name = "fe3_out_lat"} : i2
  %v121 = pyc.wire {pyc.name = "cycle_cnt__next"} : i16
  %v122 = pyc.constant 1 : i1
  %v123 = pyc.constant 0 : i16
  %v124 = pyc.reg %clk, %rst, %v122, %v121, %v123 : i16
  %v125 = pyc.alias %v124 {pyc.name = "cycle_cnt"} : i16
  %v126 = pyc.alias %v125 {pyc.name = "cycle_cnt__module_02_fe_scheduler_v3__L57"} : i16
  %v127 = pyc.constant 1 : i16
  %v128 = pyc.add %v126, %v127 : i16
  pyc.assign %v121, %v128 : i16
  %v129 = pyc.alias %v126 {pyc.name = "current_cycle__module_02_fe_scheduler_v3__L60"} : i16
  %v130 = pyc.constant 3 : i5
  %v131 = pyc.and %in0_ctrl, %v130 : i5
  %v132 = pyc.alias %v131 {pyc.name = "lat__module_02_fe_scheduler_v3__L63"} : i5
  %v133 = pyc.zext %v132 : i5 -> i16
  %v134 = pyc.add %v129, %v133 : i16
  %v135 = pyc.constant 1 : i4
  %v136 = pyc.zext %v135 : i4 -> i16
  %v137 = pyc.add %v134, %v136 : i16
  %v138 = pyc.alias %v137 {pyc.name = "finish_cycle__module_02_fe_scheduler_v3__L64"} : i16
  %v139 = pyc.zext %v45 : i4 -> i16
  %v140 = pyc.ult %v139, %v138 : i16
  %v141 = pyc.alias %v140 {pyc.name = "constraint_ok__module_02_fe_scheduler_v3__L68"} : i1
  %v142 = pyc.not %v5 : i1
  %v143 = pyc.and %v142, %in0_vld : i1
  %v144 = pyc.and %v143, %v141 : i1
  %v145 = pyc.alias %v144 {pyc.name = "can_schedule__module_02_fe_scheduler_v3__L69"} : i1
  pyc.assign %v61, %v145 : i1
  %v146 = pyc.constant 0 : i128
  %v147 = pyc.mux %v145, %in0_data, %v146 : i128
  pyc.assign %v81, %v147 : i128
  %v148 = pyc.constant 0 : i2
  %v149 = pyc.zext %v148 : i2 -> i5
  %v150 = pyc.mux %v145, %v132, %v149 : i5
  %v151 = pyc.trunc %v150 : i5 -> i2
  pyc.assign %v101, %v151 : i2
  %v152 = pyc.constant 1 : i3
  %v153 = pyc.ult %v152, %v25 : i3
  %v154 = pyc.and %v5, %v153 : i1
  %v155 = pyc.or %v145, %v154 : i1
  %v156 = pyc.alias %v155 {pyc.name = "new_busy__module_02_fe_scheduler_v3__L76"} : i1
  pyc.assign %v1, %v156 : i1
  %v157 = pyc.constant 1 : i3
  %v158 = pyc.zext %v157 : i3 -> i5
  %v159 = pyc.add %v132, %v158 : i5
  %v160 = pyc.constant 1 : i3
  %v161 = pyc.sub %v25, %v160 : i3
  %v162 = pyc.constant 0 : i3
  %v163 = pyc.mux %v5, %v161, %v162 : i3
  %v164 = pyc.zext %v163 : i3 -> i5
  %v165 = pyc.mux %v145, %v159, %v164 : i5
  %v166 = pyc.alias %v165 {pyc.name = "new_timer__module_02_fe_scheduler_v3__L79"} : i5
  %v167 = pyc.trunc %v166 : i5 -> i3
  pyc.assign %v21, %v167 : i3
  %v168 = pyc.zext %v45 : i4 -> i16
  %v169 = pyc.mux %v145, %v138, %v168 : i16
  %v170 = pyc.alias %v169 {pyc.name = "new_last_finish__module_02_fe_scheduler_v3__L84"} : i16
  %v171 = pyc.trunc %v170 : i16 -> i4
  pyc.assign %v41, %v171 : i4
  %v172 = pyc.constant 3 : i5
  %v173 = pyc.and %in1_ctrl, %v172 : i5
  %v174 = pyc.alias %v173 {pyc.name = "lat__module_02_fe_scheduler_v3__L63"} : i5
  %v175 = pyc.zext %v174 : i5 -> i16
  %v176 = pyc.add %v129, %v175 : i16
  %v177 = pyc.constant 1 : i4
  %v178 = pyc.zext %v177 : i4 -> i16
  %v179 = pyc.add %v176, %v178 : i16
  %v180 = pyc.alias %v179 {pyc.name = "finish_cycle__module_02_fe_scheduler_v3__L64"} : i16
  %v181 = pyc.zext %v50 : i4 -> i16
  %v182 = pyc.ult %v181, %v180 : i16
  %v183 = pyc.alias %v182 {pyc.name = "constraint_ok__module_02_fe_scheduler_v3__L68"} : i1
  %v184 = pyc.not %v10 : i1
  %v185 = pyc.and %v184, %in1_vld : i1
  %v186 = pyc.and %v185, %v183 : i1
  %v187 = pyc.alias %v186 {pyc.name = "can_schedule__module_02_fe_scheduler_v3__L69"} : i1
  pyc.assign %v66, %v187 : i1
  %v188 = pyc.constant 0 : i128
  %v189 = pyc.mux %v187, %in1_data, %v188 : i128
  pyc.assign %v86, %v189 : i128
  %v190 = pyc.constant 0 : i2
  %v191 = pyc.zext %v190 : i2 -> i5
  %v192 = pyc.mux %v187, %v174, %v191 : i5
  %v193 = pyc.trunc %v192 : i5 -> i2
  pyc.assign %v106, %v193 : i2
  %v194 = pyc.constant 1 : i3
  %v195 = pyc.ult %v194, %v30 : i3
  %v196 = pyc.and %v10, %v195 : i1
  %v197 = pyc.or %v187, %v196 : i1
  %v198 = pyc.alias %v197 {pyc.name = "new_busy__module_02_fe_scheduler_v3__L76"} : i1
  pyc.assign %v6, %v198 : i1
  %v199 = pyc.constant 1 : i3
  %v200 = pyc.zext %v199 : i3 -> i5
  %v201 = pyc.add %v174, %v200 : i5
  %v202 = pyc.constant 1 : i3
  %v203 = pyc.sub %v30, %v202 : i3
  %v204 = pyc.constant 0 : i3
  %v205 = pyc.mux %v10, %v203, %v204 : i3
  %v206 = pyc.zext %v205 : i3 -> i5
  %v207 = pyc.mux %v187, %v201, %v206 : i5
  %v208 = pyc.alias %v207 {pyc.name = "new_timer__module_02_fe_scheduler_v3__L79"} : i5
  %v209 = pyc.trunc %v208 : i5 -> i3
  pyc.assign %v26, %v209 : i3
  %v210 = pyc.zext %v50 : i4 -> i16
  %v211 = pyc.mux %v187, %v180, %v210 : i16
  %v212 = pyc.alias %v211 {pyc.name = "new_last_finish__module_02_fe_scheduler_v3__L84"} : i16
  %v213 = pyc.trunc %v212 : i16 -> i4
  pyc.assign %v46, %v213 : i4
  %v214 = pyc.constant 3 : i5
  %v215 = pyc.and %in2_ctrl, %v214 : i5
  %v216 = pyc.alias %v215 {pyc.name = "lat__module_02_fe_scheduler_v3__L63"} : i5
  %v217 = pyc.zext %v216 : i5 -> i16
  %v218 = pyc.add %v129, %v217 : i16
  %v219 = pyc.constant 1 : i4
  %v220 = pyc.zext %v219 : i4 -> i16
  %v221 = pyc.add %v218, %v220 : i16
  %v222 = pyc.alias %v221 {pyc.name = "finish_cycle__module_02_fe_scheduler_v3__L64"} : i16
  %v223 = pyc.zext %v55 : i4 -> i16
  %v224 = pyc.ult %v223, %v222 : i16
  %v225 = pyc.alias %v224 {pyc.name = "constraint_ok__module_02_fe_scheduler_v3__L68"} : i1
  %v226 = pyc.not %v15 : i1
  %v227 = pyc.and %v226, %in2_vld : i1
  %v228 = pyc.and %v227, %v225 : i1
  %v229 = pyc.alias %v228 {pyc.name = "can_schedule__module_02_fe_scheduler_v3__L69"} : i1
  pyc.assign %v71, %v229 : i1
  %v230 = pyc.constant 0 : i128
  %v231 = pyc.mux %v229, %in2_data, %v230 : i128
  pyc.assign %v91, %v231 : i128
  %v232 = pyc.constant 0 : i2
  %v233 = pyc.zext %v232 : i2 -> i5
  %v234 = pyc.mux %v229, %v216, %v233 : i5
  %v235 = pyc.trunc %v234 : i5 -> i2
  pyc.assign %v111, %v235 : i2
  %v236 = pyc.constant 1 : i3
  %v237 = pyc.ult %v236, %v35 : i3
  %v238 = pyc.and %v15, %v237 : i1
  %v239 = pyc.or %v229, %v238 : i1
  %v240 = pyc.alias %v239 {pyc.name = "new_busy__module_02_fe_scheduler_v3__L76"} : i1
  pyc.assign %v11, %v240 : i1
  %v241 = pyc.constant 1 : i3
  %v242 = pyc.zext %v241 : i3 -> i5
  %v243 = pyc.add %v216, %v242 : i5
  %v244 = pyc.constant 1 : i3
  %v245 = pyc.sub %v35, %v244 : i3
  %v246 = pyc.constant 0 : i3
  %v247 = pyc.mux %v15, %v245, %v246 : i3
  %v248 = pyc.zext %v247 : i3 -> i5
  %v249 = pyc.mux %v229, %v243, %v248 : i5
  %v250 = pyc.alias %v249 {pyc.name = "new_timer__module_02_fe_scheduler_v3__L79"} : i5
  %v251 = pyc.trunc %v250 : i5 -> i3
  pyc.assign %v31, %v251 : i3
  %v252 = pyc.zext %v55 : i4 -> i16
  %v253 = pyc.mux %v229, %v222, %v252 : i16
  %v254 = pyc.alias %v253 {pyc.name = "new_last_finish__module_02_fe_scheduler_v3__L84"} : i16
  %v255 = pyc.trunc %v254 : i16 -> i4
  pyc.assign %v51, %v255 : i4
  %v256 = pyc.constant 3 : i5
  %v257 = pyc.and %in3_ctrl, %v256 : i5
  %v258 = pyc.alias %v257 {pyc.name = "lat__module_02_fe_scheduler_v3__L63"} : i5
  %v259 = pyc.zext %v258 : i5 -> i16
  %v260 = pyc.add %v129, %v259 : i16
  %v261 = pyc.constant 1 : i4
  %v262 = pyc.zext %v261 : i4 -> i16
  %v263 = pyc.add %v260, %v262 : i16
  %v264 = pyc.alias %v263 {pyc.name = "finish_cycle__module_02_fe_scheduler_v3__L64"} : i16
  %v265 = pyc.zext %v60 : i4 -> i16
  %v266 = pyc.ult %v265, %v264 : i16
  %v267 = pyc.alias %v266 {pyc.name = "constraint_ok__module_02_fe_scheduler_v3__L68"} : i1
  %v268 = pyc.not %v20 : i1
  %v269 = pyc.and %v268, %in3_vld : i1
  %v270 = pyc.and %v269, %v267 : i1
  %v271 = pyc.alias %v270 {pyc.name = "can_schedule__module_02_fe_scheduler_v3__L69"} : i1
  pyc.assign %v76, %v271 : i1
  %v272 = pyc.constant 0 : i128
  %v273 = pyc.mux %v271, %in3_data, %v272 : i128
  pyc.assign %v96, %v273 : i128
  %v274 = pyc.constant 0 : i2
  %v275 = pyc.zext %v274 : i2 -> i5
  %v276 = pyc.mux %v271, %v258, %v275 : i5
  %v277 = pyc.trunc %v276 : i5 -> i2
  pyc.assign %v116, %v277 : i2
  %v278 = pyc.constant 1 : i3
  %v279 = pyc.ult %v278, %v40 : i3
  %v280 = pyc.and %v20, %v279 : i1
  %v281 = pyc.or %v271, %v280 : i1
  %v282 = pyc.alias %v281 {pyc.name = "new_busy__module_02_fe_scheduler_v3__L76"} : i1
  pyc.assign %v16, %v282 : i1
  %v283 = pyc.constant 1 : i3
  %v284 = pyc.zext %v283 : i3 -> i5
  %v285 = pyc.add %v258, %v284 : i5
  %v286 = pyc.constant 1 : i3
  %v287 = pyc.sub %v40, %v286 : i3
  %v288 = pyc.constant 0 : i3
  %v289 = pyc.mux %v20, %v287, %v288 : i3
  %v290 = pyc.zext %v289 : i3 -> i5
  %v291 = pyc.mux %v271, %v285, %v290 : i5
  %v292 = pyc.alias %v291 {pyc.name = "new_timer__module_02_fe_scheduler_v3__L79"} : i5
  %v293 = pyc.trunc %v292 : i5 -> i3
  pyc.assign %v36, %v293 : i3
  %v294 = pyc.zext %v60 : i4 -> i16
  %v295 = pyc.mux %v271, %v264, %v294 : i16
  %v296 = pyc.alias %v295 {pyc.name = "new_last_finish__module_02_fe_scheduler_v3__L84"} : i16
  %v297 = pyc.trunc %v296 : i16 -> i4
  pyc.assign %v56, %v297 : i4
  func.return %v65, %v85, %v105, %v70, %v90, %v110, %v75, %v95, %v115, %v80, %v100, %v120 : i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2
}

}

