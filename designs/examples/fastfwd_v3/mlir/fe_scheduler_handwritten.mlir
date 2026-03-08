module attributes {pyc.top = @fe_scheduler_handwritten, pyc.frontend.contract = "pycircuit"} {
func.func @fe_scheduler_handwritten(%clk: !pyc.clock, %rst: !pyc.reset, %in0_vld: i1, %in1_vld: i1, %in2_vld: i1, %in3_vld: i1, %in0_data: i128, %in1_data: i128, %in2_data: i128, %in3_data: i128, %in0_ctrl: i5, %in1_ctrl: i5, %in2_ctrl: i5, %in3_ctrl: i5, %in0_seq: i16, %in1_seq: i16, %in2_seq: i16, %in3_seq: i16) -> (i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2) attributes {arg_names = ["clk", "rst", "in0_vld", "in1_vld", "in2_vld", "in3_vld", "in0_data", "in1_data", "in2_data", "in3_data", "in0_ctrl", "in1_ctrl", "in2_ctrl", "in3_ctrl", "in0_seq", "in1_seq", "in2_seq", "in3_seq"], result_names = ["fe0_vld", "fe0_data", "fe0_lat", "fe1_vld", "fe1_data", "fe1_lat", "fe2_vld", "fe2_data", "fe2_lat", "fe3_vld", "fe3_data", "fe3_lat"], pyc.base = "fe_scheduler_handwritten", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
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
  %v41 = pyc.wire {pyc.name = "fe0_finish__next"} : i4
  %v42 = pyc.constant 1 : i1
  %v43 = pyc.constant 0 : i4
  %v44 = pyc.reg %clk, %rst, %v42, %v41, %v43 : i4
  %v45 = pyc.alias %v44 {pyc.name = "fe0_finish"} : i4
  %v46 = pyc.wire {pyc.name = "fe1_finish__next"} : i4
  %v47 = pyc.constant 1 : i1
  %v48 = pyc.constant 0 : i4
  %v49 = pyc.reg %clk, %rst, %v47, %v46, %v48 : i4
  %v50 = pyc.alias %v49 {pyc.name = "fe1_finish"} : i4
  %v51 = pyc.wire {pyc.name = "fe2_finish__next"} : i4
  %v52 = pyc.constant 1 : i1
  %v53 = pyc.constant 0 : i4
  %v54 = pyc.reg %clk, %rst, %v52, %v51, %v53 : i4
  %v55 = pyc.alias %v54 {pyc.name = "fe2_finish"} : i4
  %v56 = pyc.wire {pyc.name = "fe3_finish__next"} : i4
  %v57 = pyc.constant 1 : i1
  %v58 = pyc.constant 0 : i4
  %v59 = pyc.reg %clk, %rst, %v57, %v56, %v58 : i4
  %v60 = pyc.alias %v59 {pyc.name = "fe3_finish"} : i4
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
  %v126 = pyc.alias %v125 {pyc.name = "cycle_cnt__fe_scheduler__L57"} : i16
  %v127 = pyc.constant 1 : i16
  %v128 = pyc.add %v126, %v127 : i16
  pyc.assign %v121, %v128 : i16
  %v129 = pyc.alias %v126 {pyc.name = "current_cycle__fe_scheduler__L60"} : i16
  %v130 = pyc.constant 3 : i5
  %v131 = pyc.and %in0_ctrl, %v130 : i5
  %v132 = pyc.alias %v131 {pyc.name = "lat__fe_scheduler__L65"} : i5
  %v133 = pyc.zext %v132 : i5 -> i16
  %v134 = pyc.add %v129, %v133 : i16
  %v135 = pyc.constant 1 : i4
  %v136 = pyc.zext %v135 : i4 -> i16
  %v137 = pyc.add %v134, %v136 : i16
  %v138 = pyc.alias %v137 {pyc.name = "finish_cycle__fe_scheduler__L66"} : i16
  %v139 = pyc.zext %v45 : i4 -> i16
  %v140 = pyc.eq %v138, %v139 : i16
  %v141 = pyc.and %v5, %v140 : i1
  %v142 = pyc.alias %v141 {pyc.name = "would_conflict__fe_scheduler__L70"} : i1
  %v143 = pyc.not %v5 : i1
  %v144 = pyc.and %v143, %in0_vld : i1
  %v145 = pyc.not %v142 : i1
  %v146 = pyc.and %v144, %v145 : i1
  %v147 = pyc.alias %v146 {pyc.name = "can_schedule__fe_scheduler__L73"} : i1
  pyc.assign %v61, %v147 : i1
  %v148 = pyc.constant 0 : i128
  %v149 = pyc.mux %v147, %in0_data, %v148 : i128
  pyc.assign %v81, %v149 : i128
  %v150 = pyc.constant 0 : i2
  %v151 = pyc.zext %v150 : i2 -> i5
  %v152 = pyc.mux %v147, %v132, %v151 : i5
  %v153 = pyc.trunc %v152 : i5 -> i2
  pyc.assign %v101, %v153 : i2
  %v154 = pyc.constant 1 : i3
  %v155 = pyc.ult %v154, %v25 : i3
  %v156 = pyc.and %v5, %v155 : i1
  %v157 = pyc.or %v147, %v156 : i1
  %v158 = pyc.alias %v157 {pyc.name = "new_busy__fe_scheduler__L81"} : i1
  pyc.assign %v1, %v158 : i1
  %v159 = pyc.constant 1 : i3
  %v160 = pyc.zext %v159 : i3 -> i5
  %v161 = pyc.add %v132, %v160 : i5
  %v162 = pyc.constant 1 : i3
  %v163 = pyc.sub %v25, %v162 : i3
  %v164 = pyc.constant 0 : i3
  %v165 = pyc.mux %v5, %v163, %v164 : i3
  %v166 = pyc.zext %v165 : i3 -> i5
  %v167 = pyc.mux %v147, %v161, %v166 : i5
  %v168 = pyc.alias %v167 {pyc.name = "new_timer__fe_scheduler__L84"} : i5
  %v169 = pyc.trunc %v168 : i5 -> i3
  pyc.assign %v21, %v169 : i3
  %v170 = pyc.zext %v45 : i4 -> i16
  %v171 = pyc.mux %v147, %v138, %v170 : i16
  %v172 = pyc.alias %v171 {pyc.name = "new_finish__fe_scheduler__L89"} : i16
  %v173 = pyc.trunc %v172 : i16 -> i4
  pyc.assign %v41, %v173 : i4
  %v174 = pyc.constant 3 : i5
  %v175 = pyc.and %in1_ctrl, %v174 : i5
  %v176 = pyc.alias %v175 {pyc.name = "lat__fe_scheduler__L65"} : i5
  %v177 = pyc.zext %v176 : i5 -> i16
  %v178 = pyc.add %v129, %v177 : i16
  %v179 = pyc.constant 1 : i4
  %v180 = pyc.zext %v179 : i4 -> i16
  %v181 = pyc.add %v178, %v180 : i16
  %v182 = pyc.alias %v181 {pyc.name = "finish_cycle__fe_scheduler__L66"} : i16
  %v183 = pyc.zext %v50 : i4 -> i16
  %v184 = pyc.eq %v182, %v183 : i16
  %v185 = pyc.and %v10, %v184 : i1
  %v186 = pyc.alias %v185 {pyc.name = "would_conflict__fe_scheduler__L70"} : i1
  %v187 = pyc.not %v10 : i1
  %v188 = pyc.and %v187, %in1_vld : i1
  %v189 = pyc.not %v186 : i1
  %v190 = pyc.and %v188, %v189 : i1
  %v191 = pyc.alias %v190 {pyc.name = "can_schedule__fe_scheduler__L73"} : i1
  pyc.assign %v66, %v191 : i1
  %v192 = pyc.constant 0 : i128
  %v193 = pyc.mux %v191, %in1_data, %v192 : i128
  pyc.assign %v86, %v193 : i128
  %v194 = pyc.constant 0 : i2
  %v195 = pyc.zext %v194 : i2 -> i5
  %v196 = pyc.mux %v191, %v176, %v195 : i5
  %v197 = pyc.trunc %v196 : i5 -> i2
  pyc.assign %v106, %v197 : i2
  %v198 = pyc.constant 1 : i3
  %v199 = pyc.ult %v198, %v30 : i3
  %v200 = pyc.and %v10, %v199 : i1
  %v201 = pyc.or %v191, %v200 : i1
  %v202 = pyc.alias %v201 {pyc.name = "new_busy__fe_scheduler__L81"} : i1
  pyc.assign %v6, %v202 : i1
  %v203 = pyc.constant 1 : i3
  %v204 = pyc.zext %v203 : i3 -> i5
  %v205 = pyc.add %v176, %v204 : i5
  %v206 = pyc.constant 1 : i3
  %v207 = pyc.sub %v30, %v206 : i3
  %v208 = pyc.constant 0 : i3
  %v209 = pyc.mux %v10, %v207, %v208 : i3
  %v210 = pyc.zext %v209 : i3 -> i5
  %v211 = pyc.mux %v191, %v205, %v210 : i5
  %v212 = pyc.alias %v211 {pyc.name = "new_timer__fe_scheduler__L84"} : i5
  %v213 = pyc.trunc %v212 : i5 -> i3
  pyc.assign %v26, %v213 : i3
  %v214 = pyc.zext %v50 : i4 -> i16
  %v215 = pyc.mux %v191, %v182, %v214 : i16
  %v216 = pyc.alias %v215 {pyc.name = "new_finish__fe_scheduler__L89"} : i16
  %v217 = pyc.trunc %v216 : i16 -> i4
  pyc.assign %v46, %v217 : i4
  %v218 = pyc.constant 3 : i5
  %v219 = pyc.and %in2_ctrl, %v218 : i5
  %v220 = pyc.alias %v219 {pyc.name = "lat__fe_scheduler__L65"} : i5
  %v221 = pyc.zext %v220 : i5 -> i16
  %v222 = pyc.add %v129, %v221 : i16
  %v223 = pyc.constant 1 : i4
  %v224 = pyc.zext %v223 : i4 -> i16
  %v225 = pyc.add %v222, %v224 : i16
  %v226 = pyc.alias %v225 {pyc.name = "finish_cycle__fe_scheduler__L66"} : i16
  %v227 = pyc.zext %v55 : i4 -> i16
  %v228 = pyc.eq %v226, %v227 : i16
  %v229 = pyc.and %v15, %v228 : i1
  %v230 = pyc.alias %v229 {pyc.name = "would_conflict__fe_scheduler__L70"} : i1
  %v231 = pyc.not %v15 : i1
  %v232 = pyc.and %v231, %in2_vld : i1
  %v233 = pyc.not %v230 : i1
  %v234 = pyc.and %v232, %v233 : i1
  %v235 = pyc.alias %v234 {pyc.name = "can_schedule__fe_scheduler__L73"} : i1
  pyc.assign %v71, %v235 : i1
  %v236 = pyc.constant 0 : i128
  %v237 = pyc.mux %v235, %in2_data, %v236 : i128
  pyc.assign %v91, %v237 : i128
  %v238 = pyc.constant 0 : i2
  %v239 = pyc.zext %v238 : i2 -> i5
  %v240 = pyc.mux %v235, %v220, %v239 : i5
  %v241 = pyc.trunc %v240 : i5 -> i2
  pyc.assign %v111, %v241 : i2
  %v242 = pyc.constant 1 : i3
  %v243 = pyc.ult %v242, %v35 : i3
  %v244 = pyc.and %v15, %v243 : i1
  %v245 = pyc.or %v235, %v244 : i1
  %v246 = pyc.alias %v245 {pyc.name = "new_busy__fe_scheduler__L81"} : i1
  pyc.assign %v11, %v246 : i1
  %v247 = pyc.constant 1 : i3
  %v248 = pyc.zext %v247 : i3 -> i5
  %v249 = pyc.add %v220, %v248 : i5
  %v250 = pyc.constant 1 : i3
  %v251 = pyc.sub %v35, %v250 : i3
  %v252 = pyc.constant 0 : i3
  %v253 = pyc.mux %v15, %v251, %v252 : i3
  %v254 = pyc.zext %v253 : i3 -> i5
  %v255 = pyc.mux %v235, %v249, %v254 : i5
  %v256 = pyc.alias %v255 {pyc.name = "new_timer__fe_scheduler__L84"} : i5
  %v257 = pyc.trunc %v256 : i5 -> i3
  pyc.assign %v31, %v257 : i3
  %v258 = pyc.zext %v55 : i4 -> i16
  %v259 = pyc.mux %v235, %v226, %v258 : i16
  %v260 = pyc.alias %v259 {pyc.name = "new_finish__fe_scheduler__L89"} : i16
  %v261 = pyc.trunc %v260 : i16 -> i4
  pyc.assign %v51, %v261 : i4
  %v262 = pyc.constant 3 : i5
  %v263 = pyc.and %in3_ctrl, %v262 : i5
  %v264 = pyc.alias %v263 {pyc.name = "lat__fe_scheduler__L65"} : i5
  %v265 = pyc.zext %v264 : i5 -> i16
  %v266 = pyc.add %v129, %v265 : i16
  %v267 = pyc.constant 1 : i4
  %v268 = pyc.zext %v267 : i4 -> i16
  %v269 = pyc.add %v266, %v268 : i16
  %v270 = pyc.alias %v269 {pyc.name = "finish_cycle__fe_scheduler__L66"} : i16
  %v271 = pyc.zext %v60 : i4 -> i16
  %v272 = pyc.eq %v270, %v271 : i16
  %v273 = pyc.and %v20, %v272 : i1
  %v274 = pyc.alias %v273 {pyc.name = "would_conflict__fe_scheduler__L70"} : i1
  %v275 = pyc.not %v20 : i1
  %v276 = pyc.and %v275, %in3_vld : i1
  %v277 = pyc.not %v274 : i1
  %v278 = pyc.and %v276, %v277 : i1
  %v279 = pyc.alias %v278 {pyc.name = "can_schedule__fe_scheduler__L73"} : i1
  pyc.assign %v76, %v279 : i1
  %v280 = pyc.constant 0 : i128
  %v281 = pyc.mux %v279, %in3_data, %v280 : i128
  pyc.assign %v96, %v281 : i128
  %v282 = pyc.constant 0 : i2
  %v283 = pyc.zext %v282 : i2 -> i5
  %v284 = pyc.mux %v279, %v264, %v283 : i5
  %v285 = pyc.trunc %v284 : i5 -> i2
  pyc.assign %v116, %v285 : i2
  %v286 = pyc.constant 1 : i3
  %v287 = pyc.ult %v286, %v40 : i3
  %v288 = pyc.and %v20, %v287 : i1
  %v289 = pyc.or %v279, %v288 : i1
  %v290 = pyc.alias %v289 {pyc.name = "new_busy__fe_scheduler__L81"} : i1
  pyc.assign %v16, %v290 : i1
  %v291 = pyc.constant 1 : i3
  %v292 = pyc.zext %v291 : i3 -> i5
  %v293 = pyc.add %v264, %v292 : i5
  %v294 = pyc.constant 1 : i3
  %v295 = pyc.sub %v40, %v294 : i3
  %v296 = pyc.constant 0 : i3
  %v297 = pyc.mux %v20, %v295, %v296 : i3
  %v298 = pyc.zext %v297 : i3 -> i5
  %v299 = pyc.mux %v279, %v293, %v298 : i5
  %v300 = pyc.alias %v299 {pyc.name = "new_timer__fe_scheduler__L84"} : i5
  %v301 = pyc.trunc %v300 : i5 -> i3
  pyc.assign %v36, %v301 : i3
  %v302 = pyc.zext %v60 : i4 -> i16
  %v303 = pyc.mux %v279, %v270, %v302 : i16
  %v304 = pyc.alias %v303 {pyc.name = "new_finish__fe_scheduler__L89"} : i16
  %v305 = pyc.trunc %v304 : i16 -> i4
  pyc.assign %v56, %v305 : i4
  func.return %v65, %v85, %v105, %v70, %v90, %v110, %v75, %v95, %v115, %v80, %v100, %v120 : i1, i128, i2, i1, i128, i2, i1, i128, i2, i1, i128, i2
}

}
