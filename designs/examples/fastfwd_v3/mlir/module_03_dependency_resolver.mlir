module attributes {pyc.top = @dependency_resolver, pyc.frontend.contract = "pycircuit"} {
func.func @dependency_resolver(%clk: !pyc.clock, %rst: !pyc.reset, %in0_vld: i1, %in1_vld: i1, %in2_vld: i1, %in3_vld: i1, %in0_data: i128, %in1_data: i128, %in2_data: i128, %in3_data: i128, %in0_seq: i16, %in1_seq: i16, %in2_seq: i16, %in3_seq: i16, %in0_dep: i3, %in1_dep: i3, %in2_dep: i3, %in3_dep: i3) -> (i1, i128, i1, i128, i1, i128, i1, i128) attributes {arg_names = ["clk", "rst", "in0_vld", "in1_vld", "in2_vld", "in3_vld", "in0_data", "in1_data", "in2_data", "in3_data", "in0_seq", "in1_seq", "in2_seq", "in3_seq", "in0_dep", "in1_dep", "in2_dep", "in3_dep"], result_names = ["out0_dp_vld", "out0_dp_data", "out1_dp_vld", "out1_dp_data", "out2_dp_vld", "out2_dp_data", "out3_dp_vld", "out3_dp_data"], pyc.base = "dependency_resolver", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "dep0_valid__next"} : i1
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i1
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i1
  %v5 = pyc.alias %v4 {pyc.name = "dep0_valid"} : i1
  %v6 = pyc.wire {pyc.name = "dep1_valid__next"} : i1
  %v7 = pyc.constant 1 : i1
  %v8 = pyc.constant 0 : i1
  %v9 = pyc.reg %clk, %rst, %v7, %v6, %v8 : i1
  %v10 = pyc.alias %v9 {pyc.name = "dep1_valid"} : i1
  %v11 = pyc.wire {pyc.name = "dep2_valid__next"} : i1
  %v12 = pyc.constant 1 : i1
  %v13 = pyc.constant 0 : i1
  %v14 = pyc.reg %clk, %rst, %v12, %v11, %v13 : i1
  %v15 = pyc.alias %v14 {pyc.name = "dep2_valid"} : i1
  %v16 = pyc.wire {pyc.name = "dep3_valid__next"} : i1
  %v17 = pyc.constant 1 : i1
  %v18 = pyc.constant 0 : i1
  %v19 = pyc.reg %clk, %rst, %v17, %v16, %v18 : i1
  %v20 = pyc.alias %v19 {pyc.name = "dep3_valid"} : i1
  %v21 = pyc.wire {pyc.name = "dep4_valid__next"} : i1
  %v22 = pyc.constant 1 : i1
  %v23 = pyc.constant 0 : i1
  %v24 = pyc.reg %clk, %rst, %v22, %v21, %v23 : i1
  %v25 = pyc.alias %v24 {pyc.name = "dep4_valid"} : i1
  %v26 = pyc.wire {pyc.name = "dep5_valid__next"} : i1
  %v27 = pyc.constant 1 : i1
  %v28 = pyc.constant 0 : i1
  %v29 = pyc.reg %clk, %rst, %v27, %v26, %v28 : i1
  %v30 = pyc.alias %v29 {pyc.name = "dep5_valid"} : i1
  %v31 = pyc.wire {pyc.name = "dep6_valid__next"} : i1
  %v32 = pyc.constant 1 : i1
  %v33 = pyc.constant 0 : i1
  %v34 = pyc.reg %clk, %rst, %v32, %v31, %v33 : i1
  %v35 = pyc.alias %v34 {pyc.name = "dep6_valid"} : i1
  %v36 = pyc.wire {pyc.name = "dep7_valid__next"} : i1
  %v37 = pyc.constant 1 : i1
  %v38 = pyc.constant 0 : i1
  %v39 = pyc.reg %clk, %rst, %v37, %v36, %v38 : i1
  %v40 = pyc.alias %v39 {pyc.name = "dep7_valid"} : i1
  %v41 = pyc.wire {pyc.name = "dep0_data__next"} : i128
  %v42 = pyc.constant 1 : i1
  %v43 = pyc.constant 0 : i128
  %v44 = pyc.reg %clk, %rst, %v42, %v41, %v43 : i128
  %v45 = pyc.alias %v44 {pyc.name = "dep0_data"} : i128
  %v46 = pyc.wire {pyc.name = "dep1_data__next"} : i128
  %v47 = pyc.constant 1 : i1
  %v48 = pyc.constant 0 : i128
  %v49 = pyc.reg %clk, %rst, %v47, %v46, %v48 : i128
  %v50 = pyc.alias %v49 {pyc.name = "dep1_data"} : i128
  %v51 = pyc.wire {pyc.name = "dep2_data__next"} : i128
  %v52 = pyc.constant 1 : i1
  %v53 = pyc.constant 0 : i128
  %v54 = pyc.reg %clk, %rst, %v52, %v51, %v53 : i128
  %v55 = pyc.alias %v54 {pyc.name = "dep2_data"} : i128
  %v56 = pyc.wire {pyc.name = "dep3_data__next"} : i128
  %v57 = pyc.constant 1 : i1
  %v58 = pyc.constant 0 : i128
  %v59 = pyc.reg %clk, %rst, %v57, %v56, %v58 : i128
  %v60 = pyc.alias %v59 {pyc.name = "dep3_data"} : i128
  %v61 = pyc.wire {pyc.name = "dep4_data__next"} : i128
  %v62 = pyc.constant 1 : i1
  %v63 = pyc.constant 0 : i128
  %v64 = pyc.reg %clk, %rst, %v62, %v61, %v63 : i128
  %v65 = pyc.alias %v64 {pyc.name = "dep4_data"} : i128
  %v66 = pyc.wire {pyc.name = "dep5_data__next"} : i128
  %v67 = pyc.constant 1 : i1
  %v68 = pyc.constant 0 : i128
  %v69 = pyc.reg %clk, %rst, %v67, %v66, %v68 : i128
  %v70 = pyc.alias %v69 {pyc.name = "dep5_data"} : i128
  %v71 = pyc.wire {pyc.name = "dep6_data__next"} : i128
  %v72 = pyc.constant 1 : i1
  %v73 = pyc.constant 0 : i128
  %v74 = pyc.reg %clk, %rst, %v72, %v71, %v73 : i128
  %v75 = pyc.alias %v74 {pyc.name = "dep6_data"} : i128
  %v76 = pyc.wire {pyc.name = "dep7_data__next"} : i128
  %v77 = pyc.constant 1 : i1
  %v78 = pyc.constant 0 : i128
  %v79 = pyc.reg %clk, %rst, %v77, %v76, %v78 : i128
  %v80 = pyc.alias %v79 {pyc.name = "dep7_data"} : i128
  %v81 = pyc.wire {pyc.name = "dep0_seq__next"} : i16
  %v82 = pyc.constant 1 : i1
  %v83 = pyc.constant 0 : i16
  %v84 = pyc.reg %clk, %rst, %v82, %v81, %v83 : i16
  %v85 = pyc.alias %v84 {pyc.name = "dep0_seq"} : i16
  %v86 = pyc.wire {pyc.name = "dep1_seq__next"} : i16
  %v87 = pyc.constant 1 : i1
  %v88 = pyc.constant 0 : i16
  %v89 = pyc.reg %clk, %rst, %v87, %v86, %v88 : i16
  %v90 = pyc.alias %v89 {pyc.name = "dep1_seq"} : i16
  %v91 = pyc.wire {pyc.name = "dep2_seq__next"} : i16
  %v92 = pyc.constant 1 : i1
  %v93 = pyc.constant 0 : i16
  %v94 = pyc.reg %clk, %rst, %v92, %v91, %v93 : i16
  %v95 = pyc.alias %v94 {pyc.name = "dep2_seq"} : i16
  %v96 = pyc.wire {pyc.name = "dep3_seq__next"} : i16
  %v97 = pyc.constant 1 : i1
  %v98 = pyc.constant 0 : i16
  %v99 = pyc.reg %clk, %rst, %v97, %v96, %v98 : i16
  %v100 = pyc.alias %v99 {pyc.name = "dep3_seq"} : i16
  %v101 = pyc.wire {pyc.name = "dep4_seq__next"} : i16
  %v102 = pyc.constant 1 : i1
  %v103 = pyc.constant 0 : i16
  %v104 = pyc.reg %clk, %rst, %v102, %v101, %v103 : i16
  %v105 = pyc.alias %v104 {pyc.name = "dep4_seq"} : i16
  %v106 = pyc.wire {pyc.name = "dep5_seq__next"} : i16
  %v107 = pyc.constant 1 : i1
  %v108 = pyc.constant 0 : i16
  %v109 = pyc.reg %clk, %rst, %v107, %v106, %v108 : i16
  %v110 = pyc.alias %v109 {pyc.name = "dep5_seq"} : i16
  %v111 = pyc.wire {pyc.name = "dep6_seq__next"} : i16
  %v112 = pyc.constant 1 : i1
  %v113 = pyc.constant 0 : i16
  %v114 = pyc.reg %clk, %rst, %v112, %v111, %v113 : i16
  %v115 = pyc.alias %v114 {pyc.name = "dep6_seq"} : i16
  %v116 = pyc.wire {pyc.name = "dep7_seq__next"} : i16
  %v117 = pyc.constant 1 : i1
  %v118 = pyc.constant 0 : i16
  %v119 = pyc.reg %clk, %rst, %v117, %v116, %v118 : i16
  %v120 = pyc.alias %v119 {pyc.name = "dep7_seq"} : i16
  %v121 = pyc.wire {pyc.name = "out0_dp_vld__next"} : i1
  %v122 = pyc.constant 1 : i1
  %v123 = pyc.constant 0 : i1
  %v124 = pyc.reg %clk, %rst, %v122, %v121, %v123 : i1
  %v125 = pyc.alias %v124 {pyc.name = "out0_dp_vld"} : i1
  %v126 = pyc.wire {pyc.name = "out1_dp_vld__next"} : i1
  %v127 = pyc.constant 1 : i1
  %v128 = pyc.constant 0 : i1
  %v129 = pyc.reg %clk, %rst, %v127, %v126, %v128 : i1
  %v130 = pyc.alias %v129 {pyc.name = "out1_dp_vld"} : i1
  %v131 = pyc.wire {pyc.name = "out2_dp_vld__next"} : i1
  %v132 = pyc.constant 1 : i1
  %v133 = pyc.constant 0 : i1
  %v134 = pyc.reg %clk, %rst, %v132, %v131, %v133 : i1
  %v135 = pyc.alias %v134 {pyc.name = "out2_dp_vld"} : i1
  %v136 = pyc.wire {pyc.name = "out3_dp_vld__next"} : i1
  %v137 = pyc.constant 1 : i1
  %v138 = pyc.constant 0 : i1
  %v139 = pyc.reg %clk, %rst, %v137, %v136, %v138 : i1
  %v140 = pyc.alias %v139 {pyc.name = "out3_dp_vld"} : i1
  %v141 = pyc.wire {pyc.name = "out0_dp_data__next"} : i128
  %v142 = pyc.constant 1 : i1
  %v143 = pyc.constant 0 : i128
  %v144 = pyc.reg %clk, %rst, %v142, %v141, %v143 : i128
  %v145 = pyc.alias %v144 {pyc.name = "out0_dp_data"} : i128
  %v146 = pyc.wire {pyc.name = "out1_dp_data__next"} : i128
  %v147 = pyc.constant 1 : i1
  %v148 = pyc.constant 0 : i128
  %v149 = pyc.reg %clk, %rst, %v147, %v146, %v148 : i128
  %v150 = pyc.alias %v149 {pyc.name = "out1_dp_data"} : i128
  %v151 = pyc.wire {pyc.name = "out2_dp_data__next"} : i128
  %v152 = pyc.constant 1 : i1
  %v153 = pyc.constant 0 : i128
  %v154 = pyc.reg %clk, %rst, %v152, %v151, %v153 : i128
  %v155 = pyc.alias %v154 {pyc.name = "out2_dp_data"} : i128
  %v156 = pyc.wire {pyc.name = "out3_dp_data__next"} : i128
  %v157 = pyc.constant 1 : i1
  %v158 = pyc.constant 0 : i128
  %v159 = pyc.reg %clk, %rst, %v157, %v156, %v158 : i128
  %v160 = pyc.alias %v159 {pyc.name = "out3_dp_data"} : i128
  %v161 = pyc.constant 0 : i3
  %v162 = pyc.eq %in0_dep, %v161 : i3
  %v163 = pyc.not %v162 : i1
  %v164 = pyc.alias %v163 {pyc.name = "has_dep__module_03_dependency_resolver__L57"} : i1
  %v165 = pyc.zext %in0_dep : i3 -> i16
  %v166 = pyc.sub %in0_seq, %v165 : i16
  %v167 = pyc.alias %v166 {pyc.name = "dep_seq__module_03_dependency_resolver__L60"} : i16
  %v168 = pyc.eq %v85, %v167 : i16
  %v169 = pyc.and %v5, %v168 : i1
  %v170 = pyc.alias %v169 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v171 = pyc.constant 0 : i1
  %v172 = pyc.or %v170, %v171 : i1
  %v173 = pyc.alias %v172 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v174 = pyc.not %v170 : i1
  %v175 = pyc.constant 0 : i128
  %v176 = pyc.mux %v174, %v175, %v45 : i128
  %v177 = pyc.alias %v176 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v178 = pyc.eq %v90, %v167 : i16
  %v179 = pyc.and %v10, %v178 : i1
  %v180 = pyc.alias %v179 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v181 = pyc.or %v173, %v180 : i1
  %v182 = pyc.alias %v181 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v183 = pyc.not %v180 : i1
  %v184 = pyc.mux %v183, %v177, %v50 : i128
  %v185 = pyc.alias %v184 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v186 = pyc.eq %v95, %v167 : i16
  %v187 = pyc.and %v15, %v186 : i1
  %v188 = pyc.alias %v187 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v189 = pyc.or %v182, %v188 : i1
  %v190 = pyc.alias %v189 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v191 = pyc.not %v188 : i1
  %v192 = pyc.mux %v191, %v185, %v55 : i128
  %v193 = pyc.alias %v192 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v194 = pyc.eq %v100, %v167 : i16
  %v195 = pyc.and %v20, %v194 : i1
  %v196 = pyc.alias %v195 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v197 = pyc.or %v190, %v196 : i1
  %v198 = pyc.alias %v197 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v199 = pyc.not %v196 : i1
  %v200 = pyc.mux %v199, %v193, %v60 : i128
  %v201 = pyc.alias %v200 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v202 = pyc.eq %v105, %v167 : i16
  %v203 = pyc.and %v25, %v202 : i1
  %v204 = pyc.alias %v203 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v205 = pyc.or %v198, %v204 : i1
  %v206 = pyc.alias %v205 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v207 = pyc.not %v204 : i1
  %v208 = pyc.mux %v207, %v201, %v65 : i128
  %v209 = pyc.alias %v208 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v210 = pyc.eq %v110, %v167 : i16
  %v211 = pyc.and %v30, %v210 : i1
  %v212 = pyc.alias %v211 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v213 = pyc.or %v206, %v212 : i1
  %v214 = pyc.alias %v213 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v215 = pyc.not %v212 : i1
  %v216 = pyc.mux %v215, %v209, %v70 : i128
  %v217 = pyc.alias %v216 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v218 = pyc.eq %v115, %v167 : i16
  %v219 = pyc.and %v35, %v218 : i1
  %v220 = pyc.alias %v219 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v221 = pyc.or %v214, %v220 : i1
  %v222 = pyc.alias %v221 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v223 = pyc.not %v220 : i1
  %v224 = pyc.mux %v223, %v217, %v75 : i128
  %v225 = pyc.alias %v224 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v226 = pyc.eq %v120, %v167 : i16
  %v227 = pyc.and %v40, %v226 : i1
  %v228 = pyc.alias %v227 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v229 = pyc.or %v222, %v228 : i1
  %v230 = pyc.alias %v229 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v231 = pyc.not %v228 : i1
  %v232 = pyc.mux %v231, %v225, %v80 : i128
  %v233 = pyc.alias %v232 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v234 = pyc.and %v164, %v230 : i1
  pyc.assign %v121, %v234 : i1
  pyc.assign %v141, %v233 : i128
  %v235 = pyc.constant 0 : i3
  %v236 = pyc.eq %in1_dep, %v235 : i3
  %v237 = pyc.not %v236 : i1
  %v238 = pyc.alias %v237 {pyc.name = "has_dep__module_03_dependency_resolver__L57"} : i1
  %v239 = pyc.zext %in1_dep : i3 -> i16
  %v240 = pyc.sub %in1_seq, %v239 : i16
  %v241 = pyc.alias %v240 {pyc.name = "dep_seq__module_03_dependency_resolver__L60"} : i16
  %v242 = pyc.eq %v85, %v241 : i16
  %v243 = pyc.and %v5, %v242 : i1
  %v244 = pyc.alias %v243 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v245 = pyc.constant 0 : i1
  %v246 = pyc.or %v244, %v245 : i1
  %v247 = pyc.alias %v246 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v248 = pyc.not %v244 : i1
  %v249 = pyc.constant 0 : i128
  %v250 = pyc.mux %v248, %v249, %v45 : i128
  %v251 = pyc.alias %v250 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v252 = pyc.eq %v90, %v241 : i16
  %v253 = pyc.and %v10, %v252 : i1
  %v254 = pyc.alias %v253 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v255 = pyc.or %v247, %v254 : i1
  %v256 = pyc.alias %v255 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v257 = pyc.not %v254 : i1
  %v258 = pyc.mux %v257, %v251, %v50 : i128
  %v259 = pyc.alias %v258 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v260 = pyc.eq %v95, %v241 : i16
  %v261 = pyc.and %v15, %v260 : i1
  %v262 = pyc.alias %v261 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v263 = pyc.or %v256, %v262 : i1
  %v264 = pyc.alias %v263 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v265 = pyc.not %v262 : i1
  %v266 = pyc.mux %v265, %v259, %v55 : i128
  %v267 = pyc.alias %v266 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v268 = pyc.eq %v100, %v241 : i16
  %v269 = pyc.and %v20, %v268 : i1
  %v270 = pyc.alias %v269 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v271 = pyc.or %v264, %v270 : i1
  %v272 = pyc.alias %v271 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v273 = pyc.not %v270 : i1
  %v274 = pyc.mux %v273, %v267, %v60 : i128
  %v275 = pyc.alias %v274 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v276 = pyc.eq %v105, %v241 : i16
  %v277 = pyc.and %v25, %v276 : i1
  %v278 = pyc.alias %v277 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v279 = pyc.or %v272, %v278 : i1
  %v280 = pyc.alias %v279 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v281 = pyc.not %v278 : i1
  %v282 = pyc.mux %v281, %v275, %v65 : i128
  %v283 = pyc.alias %v282 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v284 = pyc.eq %v110, %v241 : i16
  %v285 = pyc.and %v30, %v284 : i1
  %v286 = pyc.alias %v285 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v287 = pyc.or %v280, %v286 : i1
  %v288 = pyc.alias %v287 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v289 = pyc.not %v286 : i1
  %v290 = pyc.mux %v289, %v283, %v70 : i128
  %v291 = pyc.alias %v290 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v292 = pyc.eq %v115, %v241 : i16
  %v293 = pyc.and %v35, %v292 : i1
  %v294 = pyc.alias %v293 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v295 = pyc.or %v288, %v294 : i1
  %v296 = pyc.alias %v295 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v297 = pyc.not %v294 : i1
  %v298 = pyc.mux %v297, %v291, %v75 : i128
  %v299 = pyc.alias %v298 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v300 = pyc.eq %v120, %v241 : i16
  %v301 = pyc.and %v40, %v300 : i1
  %v302 = pyc.alias %v301 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v303 = pyc.or %v296, %v302 : i1
  %v304 = pyc.alias %v303 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v305 = pyc.not %v302 : i1
  %v306 = pyc.mux %v305, %v299, %v80 : i128
  %v307 = pyc.alias %v306 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v308 = pyc.and %v238, %v304 : i1
  pyc.assign %v126, %v308 : i1
  pyc.assign %v146, %v307 : i128
  %v309 = pyc.constant 0 : i3
  %v310 = pyc.eq %in2_dep, %v309 : i3
  %v311 = pyc.not %v310 : i1
  %v312 = pyc.alias %v311 {pyc.name = "has_dep__module_03_dependency_resolver__L57"} : i1
  %v313 = pyc.zext %in2_dep : i3 -> i16
  %v314 = pyc.sub %in2_seq, %v313 : i16
  %v315 = pyc.alias %v314 {pyc.name = "dep_seq__module_03_dependency_resolver__L60"} : i16
  %v316 = pyc.eq %v85, %v315 : i16
  %v317 = pyc.and %v5, %v316 : i1
  %v318 = pyc.alias %v317 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v319 = pyc.constant 0 : i1
  %v320 = pyc.or %v318, %v319 : i1
  %v321 = pyc.alias %v320 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v322 = pyc.not %v318 : i1
  %v323 = pyc.constant 0 : i128
  %v324 = pyc.mux %v322, %v323, %v45 : i128
  %v325 = pyc.alias %v324 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v326 = pyc.eq %v90, %v315 : i16
  %v327 = pyc.and %v10, %v326 : i1
  %v328 = pyc.alias %v327 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v329 = pyc.or %v321, %v328 : i1
  %v330 = pyc.alias %v329 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v331 = pyc.not %v328 : i1
  %v332 = pyc.mux %v331, %v325, %v50 : i128
  %v333 = pyc.alias %v332 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v334 = pyc.eq %v95, %v315 : i16
  %v335 = pyc.and %v15, %v334 : i1
  %v336 = pyc.alias %v335 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v337 = pyc.or %v330, %v336 : i1
  %v338 = pyc.alias %v337 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v339 = pyc.not %v336 : i1
  %v340 = pyc.mux %v339, %v333, %v55 : i128
  %v341 = pyc.alias %v340 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v342 = pyc.eq %v100, %v315 : i16
  %v343 = pyc.and %v20, %v342 : i1
  %v344 = pyc.alias %v343 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v345 = pyc.or %v338, %v344 : i1
  %v346 = pyc.alias %v345 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v347 = pyc.not %v344 : i1
  %v348 = pyc.mux %v347, %v341, %v60 : i128
  %v349 = pyc.alias %v348 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v350 = pyc.eq %v105, %v315 : i16
  %v351 = pyc.and %v25, %v350 : i1
  %v352 = pyc.alias %v351 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v353 = pyc.or %v346, %v352 : i1
  %v354 = pyc.alias %v353 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v355 = pyc.not %v352 : i1
  %v356 = pyc.mux %v355, %v349, %v65 : i128
  %v357 = pyc.alias %v356 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v358 = pyc.eq %v110, %v315 : i16
  %v359 = pyc.and %v30, %v358 : i1
  %v360 = pyc.alias %v359 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v361 = pyc.or %v354, %v360 : i1
  %v362 = pyc.alias %v361 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v363 = pyc.not %v360 : i1
  %v364 = pyc.mux %v363, %v357, %v70 : i128
  %v365 = pyc.alias %v364 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v366 = pyc.eq %v115, %v315 : i16
  %v367 = pyc.and %v35, %v366 : i1
  %v368 = pyc.alias %v367 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v369 = pyc.or %v362, %v368 : i1
  %v370 = pyc.alias %v369 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v371 = pyc.not %v368 : i1
  %v372 = pyc.mux %v371, %v365, %v75 : i128
  %v373 = pyc.alias %v372 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v374 = pyc.eq %v120, %v315 : i16
  %v375 = pyc.and %v40, %v374 : i1
  %v376 = pyc.alias %v375 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v377 = pyc.or %v370, %v376 : i1
  %v378 = pyc.alias %v377 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v379 = pyc.not %v376 : i1
  %v380 = pyc.mux %v379, %v373, %v80 : i128
  %v381 = pyc.alias %v380 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v382 = pyc.and %v312, %v378 : i1
  pyc.assign %v131, %v382 : i1
  pyc.assign %v151, %v381 : i128
  %v383 = pyc.constant 0 : i3
  %v384 = pyc.eq %in3_dep, %v383 : i3
  %v385 = pyc.not %v384 : i1
  %v386 = pyc.alias %v385 {pyc.name = "has_dep__module_03_dependency_resolver__L57"} : i1
  %v387 = pyc.zext %in3_dep : i3 -> i16
  %v388 = pyc.sub %in3_seq, %v387 : i16
  %v389 = pyc.alias %v388 {pyc.name = "dep_seq__module_03_dependency_resolver__L60"} : i16
  %v390 = pyc.eq %v85, %v389 : i16
  %v391 = pyc.and %v5, %v390 : i1
  %v392 = pyc.alias %v391 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v393 = pyc.constant 0 : i1
  %v394 = pyc.or %v392, %v393 : i1
  %v395 = pyc.alias %v394 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v396 = pyc.not %v392 : i1
  %v397 = pyc.constant 0 : i128
  %v398 = pyc.mux %v396, %v397, %v45 : i128
  %v399 = pyc.alias %v398 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v400 = pyc.eq %v90, %v389 : i16
  %v401 = pyc.and %v10, %v400 : i1
  %v402 = pyc.alias %v401 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v403 = pyc.or %v395, %v402 : i1
  %v404 = pyc.alias %v403 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v405 = pyc.not %v402 : i1
  %v406 = pyc.mux %v405, %v399, %v50 : i128
  %v407 = pyc.alias %v406 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v408 = pyc.eq %v95, %v389 : i16
  %v409 = pyc.and %v15, %v408 : i1
  %v410 = pyc.alias %v409 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v411 = pyc.or %v404, %v410 : i1
  %v412 = pyc.alias %v411 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v413 = pyc.not %v410 : i1
  %v414 = pyc.mux %v413, %v407, %v55 : i128
  %v415 = pyc.alias %v414 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v416 = pyc.eq %v100, %v389 : i16
  %v417 = pyc.and %v20, %v416 : i1
  %v418 = pyc.alias %v417 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v419 = pyc.or %v412, %v418 : i1
  %v420 = pyc.alias %v419 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v421 = pyc.not %v418 : i1
  %v422 = pyc.mux %v421, %v415, %v60 : i128
  %v423 = pyc.alias %v422 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v424 = pyc.eq %v105, %v389 : i16
  %v425 = pyc.and %v25, %v424 : i1
  %v426 = pyc.alias %v425 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v427 = pyc.or %v420, %v426 : i1
  %v428 = pyc.alias %v427 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v429 = pyc.not %v426 : i1
  %v430 = pyc.mux %v429, %v423, %v65 : i128
  %v431 = pyc.alias %v430 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v432 = pyc.eq %v110, %v389 : i16
  %v433 = pyc.and %v30, %v432 : i1
  %v434 = pyc.alias %v433 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v435 = pyc.or %v428, %v434 : i1
  %v436 = pyc.alias %v435 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v437 = pyc.not %v434 : i1
  %v438 = pyc.mux %v437, %v431, %v70 : i128
  %v439 = pyc.alias %v438 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v440 = pyc.eq %v115, %v389 : i16
  %v441 = pyc.and %v35, %v440 : i1
  %v442 = pyc.alias %v441 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v443 = pyc.or %v436, %v442 : i1
  %v444 = pyc.alias %v443 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v445 = pyc.not %v442 : i1
  %v446 = pyc.mux %v445, %v439, %v75 : i128
  %v447 = pyc.alias %v446 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v448 = pyc.eq %v120, %v389 : i16
  %v449 = pyc.and %v40, %v448 : i1
  %v450 = pyc.alias %v449 {pyc.name = "match__module_03_dependency_resolver__L67"} : i1
  %v451 = pyc.or %v444, %v450 : i1
  %v452 = pyc.alias %v451 {pyc.name = "found__module_03_dependency_resolver__L68"} : i1
  %v453 = pyc.not %v450 : i1
  %v454 = pyc.mux %v453, %v447, %v80 : i128
  %v455 = pyc.alias %v454 {pyc.name = "found_data__module_03_dependency_resolver__L69"} : i128
  %v456 = pyc.and %v386, %v452 : i1
  pyc.assign %v136, %v456 : i1
  pyc.assign %v156, %v455 : i128
  %v457 = pyc.wire {pyc.name = "write_ptr__next"} : i3
  %v458 = pyc.constant 1 : i1
  %v459 = pyc.constant 0 : i3
  %v460 = pyc.reg %clk, %rst, %v458, %v457, %v459 : i3
  %v461 = pyc.alias %v460 {pyc.name = "write_ptr"} : i3
  %v462 = pyc.alias %v461 {pyc.name = "write_ptr__module_03_dependency_resolver__L77"} : i3
  %v463 = pyc.or %in0_vld, %in1_vld : i1
  %v464 = pyc.or %v463, %in2_vld : i1
  %v465 = pyc.or %v464, %in3_vld : i1
  %v466 = pyc.alias %v465 {pyc.name = "any_vld__module_03_dependency_resolver__L79"} : i1
  %v467 = pyc.constant 0 : i3
  %v468 = pyc.eq %v462, %v467 : i3
  %v469 = pyc.and %in0_vld, %v468 : i1
  %v470 = pyc.alias %v469 {pyc.name = "should_write__module_03_dependency_resolver__L83"} : i1
  %v471 = pyc.or %v470, %v5 : i1
  pyc.assign %v1, %v471 : i1
  %v472 = pyc.mux %v470, %in0_data, %v45 : i128
  pyc.assign %v41, %v472 : i128
  %v473 = pyc.mux %v470, %in0_seq, %v85 : i16
  pyc.assign %v81, %v473 : i16
  %v474 = pyc.constant 1 : i3
  %v475 = pyc.eq %v462, %v474 : i3
  %v476 = pyc.and %in1_vld, %v475 : i1
  %v477 = pyc.alias %v476 {pyc.name = "should_write__module_03_dependency_resolver__L83"} : i1
  %v478 = pyc.or %v477, %v10 : i1
  pyc.assign %v6, %v478 : i1
  %v479 = pyc.mux %v477, %in1_data, %v50 : i128
  pyc.assign %v46, %v479 : i128
  %v480 = pyc.mux %v477, %in1_seq, %v90 : i16
  pyc.assign %v86, %v480 : i16
  %v481 = pyc.constant 2 : i3
  %v482 = pyc.eq %v462, %v481 : i3
  %v483 = pyc.and %in2_vld, %v482 : i1
  %v484 = pyc.alias %v483 {pyc.name = "should_write__module_03_dependency_resolver__L83"} : i1
  %v485 = pyc.or %v484, %v15 : i1
  pyc.assign %v11, %v485 : i1
  %v486 = pyc.mux %v484, %in2_data, %v55 : i128
  pyc.assign %v51, %v486 : i128
  %v487 = pyc.mux %v484, %in2_seq, %v95 : i16
  pyc.assign %v91, %v487 : i16
  %v488 = pyc.constant 3 : i3
  %v489 = pyc.eq %v462, %v488 : i3
  %v490 = pyc.and %in3_vld, %v489 : i1
  %v491 = pyc.alias %v490 {pyc.name = "should_write__module_03_dependency_resolver__L83"} : i1
  %v492 = pyc.or %v491, %v20 : i1
  pyc.assign %v16, %v492 : i1
  %v493 = pyc.mux %v491, %in3_data, %v60 : i128
  pyc.assign %v56, %v493 : i128
  %v494 = pyc.mux %v491, %in3_seq, %v100 : i16
  pyc.assign %v96, %v494 : i16
  %v495 = pyc.constant 1 : i3
  %v496 = pyc.add %v462, %v495 : i3
  %v497 = pyc.constant 7 : i3
  %v498 = pyc.and %v496, %v497 : i3
  %v499 = pyc.alias %v498 {pyc.name = "new_ptr__module_03_dependency_resolver__L90"} : i3
  %v500 = pyc.mux %v466, %v499, %v462 : i3
  pyc.assign %v457, %v500 : i3
  func.return %v125, %v145, %v130, %v150, %v135, %v155, %v140, %v160 : i1, i128, i1, i128, i1, i128, i1, i128
}

}

