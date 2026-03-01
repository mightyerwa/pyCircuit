module attributes {pyc.top = @rob, pyc.frontend.contract = "pycircuit"} {
func.func @rob(%clk: !pyc.clock, %rst: !pyc.reset, %in_vld: i1, %in_data: i128, %in_seq: i16) -> (i1, i128, i16) attributes {arg_names = ["clk", "rst", "in_vld", "in_data", "in_seq"], result_names = ["out_vld_o", "out_data_o", "out_seq_o"], pyc.base = "rob", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.alias %in_vld {pyc.name = "in_vld__module_04_rob__L45"} : i1
  %v2 = pyc.alias %in_data {pyc.name = "in_data__module_04_rob__L46"} : i128
  %v3 = pyc.alias %in_seq {pyc.name = "in_seq__module_04_rob__L47"} : i16
  %v4 = pyc.wire {pyc.name = "rob0_valid__next"} : i1
  %v5 = pyc.constant 1 : i1
  %v6 = pyc.constant 0 : i1
  %v7 = pyc.reg %clk, %rst, %v5, %v4, %v6 : i1
  %v8 = pyc.alias %v7 {pyc.name = "rob0_valid"} : i1
  %v9 = pyc.wire {pyc.name = "rob1_valid__next"} : i1
  %v10 = pyc.constant 1 : i1
  %v11 = pyc.constant 0 : i1
  %v12 = pyc.reg %clk, %rst, %v10, %v9, %v11 : i1
  %v13 = pyc.alias %v12 {pyc.name = "rob1_valid"} : i1
  %v14 = pyc.wire {pyc.name = "rob2_valid__next"} : i1
  %v15 = pyc.constant 1 : i1
  %v16 = pyc.constant 0 : i1
  %v17 = pyc.reg %clk, %rst, %v15, %v14, %v16 : i1
  %v18 = pyc.alias %v17 {pyc.name = "rob2_valid"} : i1
  %v19 = pyc.wire {pyc.name = "rob3_valid__next"} : i1
  %v20 = pyc.constant 1 : i1
  %v21 = pyc.constant 0 : i1
  %v22 = pyc.reg %clk, %rst, %v20, %v19, %v21 : i1
  %v23 = pyc.alias %v22 {pyc.name = "rob3_valid"} : i1
  %v24 = pyc.wire {pyc.name = "rob4_valid__next"} : i1
  %v25 = pyc.constant 1 : i1
  %v26 = pyc.constant 0 : i1
  %v27 = pyc.reg %clk, %rst, %v25, %v24, %v26 : i1
  %v28 = pyc.alias %v27 {pyc.name = "rob4_valid"} : i1
  %v29 = pyc.wire {pyc.name = "rob5_valid__next"} : i1
  %v30 = pyc.constant 1 : i1
  %v31 = pyc.constant 0 : i1
  %v32 = pyc.reg %clk, %rst, %v30, %v29, %v31 : i1
  %v33 = pyc.alias %v32 {pyc.name = "rob5_valid"} : i1
  %v34 = pyc.wire {pyc.name = "rob6_valid__next"} : i1
  %v35 = pyc.constant 1 : i1
  %v36 = pyc.constant 0 : i1
  %v37 = pyc.reg %clk, %rst, %v35, %v34, %v36 : i1
  %v38 = pyc.alias %v37 {pyc.name = "rob6_valid"} : i1
  %v39 = pyc.wire {pyc.name = "rob7_valid__next"} : i1
  %v40 = pyc.constant 1 : i1
  %v41 = pyc.constant 0 : i1
  %v42 = pyc.reg %clk, %rst, %v40, %v39, %v41 : i1
  %v43 = pyc.alias %v42 {pyc.name = "rob7_valid"} : i1
  %v44 = pyc.wire {pyc.name = "rob8_valid__next"} : i1
  %v45 = pyc.constant 1 : i1
  %v46 = pyc.constant 0 : i1
  %v47 = pyc.reg %clk, %rst, %v45, %v44, %v46 : i1
  %v48 = pyc.alias %v47 {pyc.name = "rob8_valid"} : i1
  %v49 = pyc.wire {pyc.name = "rob9_valid__next"} : i1
  %v50 = pyc.constant 1 : i1
  %v51 = pyc.constant 0 : i1
  %v52 = pyc.reg %clk, %rst, %v50, %v49, %v51 : i1
  %v53 = pyc.alias %v52 {pyc.name = "rob9_valid"} : i1
  %v54 = pyc.wire {pyc.name = "rob10_valid__next"} : i1
  %v55 = pyc.constant 1 : i1
  %v56 = pyc.constant 0 : i1
  %v57 = pyc.reg %clk, %rst, %v55, %v54, %v56 : i1
  %v58 = pyc.alias %v57 {pyc.name = "rob10_valid"} : i1
  %v59 = pyc.wire {pyc.name = "rob11_valid__next"} : i1
  %v60 = pyc.constant 1 : i1
  %v61 = pyc.constant 0 : i1
  %v62 = pyc.reg %clk, %rst, %v60, %v59, %v61 : i1
  %v63 = pyc.alias %v62 {pyc.name = "rob11_valid"} : i1
  %v64 = pyc.wire {pyc.name = "rob12_valid__next"} : i1
  %v65 = pyc.constant 1 : i1
  %v66 = pyc.constant 0 : i1
  %v67 = pyc.reg %clk, %rst, %v65, %v64, %v66 : i1
  %v68 = pyc.alias %v67 {pyc.name = "rob12_valid"} : i1
  %v69 = pyc.wire {pyc.name = "rob13_valid__next"} : i1
  %v70 = pyc.constant 1 : i1
  %v71 = pyc.constant 0 : i1
  %v72 = pyc.reg %clk, %rst, %v70, %v69, %v71 : i1
  %v73 = pyc.alias %v72 {pyc.name = "rob13_valid"} : i1
  %v74 = pyc.wire {pyc.name = "rob14_valid__next"} : i1
  %v75 = pyc.constant 1 : i1
  %v76 = pyc.constant 0 : i1
  %v77 = pyc.reg %clk, %rst, %v75, %v74, %v76 : i1
  %v78 = pyc.alias %v77 {pyc.name = "rob14_valid"} : i1
  %v79 = pyc.wire {pyc.name = "rob15_valid__next"} : i1
  %v80 = pyc.constant 1 : i1
  %v81 = pyc.constant 0 : i1
  %v82 = pyc.reg %clk, %rst, %v80, %v79, %v81 : i1
  %v83 = pyc.alias %v82 {pyc.name = "rob15_valid"} : i1
  %v84 = pyc.wire {pyc.name = "rob16_valid__next"} : i1
  %v85 = pyc.constant 1 : i1
  %v86 = pyc.constant 0 : i1
  %v87 = pyc.reg %clk, %rst, %v85, %v84, %v86 : i1
  %v88 = pyc.alias %v87 {pyc.name = "rob16_valid"} : i1
  %v89 = pyc.wire {pyc.name = "rob17_valid__next"} : i1
  %v90 = pyc.constant 1 : i1
  %v91 = pyc.constant 0 : i1
  %v92 = pyc.reg %clk, %rst, %v90, %v89, %v91 : i1
  %v93 = pyc.alias %v92 {pyc.name = "rob17_valid"} : i1
  %v94 = pyc.wire {pyc.name = "rob18_valid__next"} : i1
  %v95 = pyc.constant 1 : i1
  %v96 = pyc.constant 0 : i1
  %v97 = pyc.reg %clk, %rst, %v95, %v94, %v96 : i1
  %v98 = pyc.alias %v97 {pyc.name = "rob18_valid"} : i1
  %v99 = pyc.wire {pyc.name = "rob19_valid__next"} : i1
  %v100 = pyc.constant 1 : i1
  %v101 = pyc.constant 0 : i1
  %v102 = pyc.reg %clk, %rst, %v100, %v99, %v101 : i1
  %v103 = pyc.alias %v102 {pyc.name = "rob19_valid"} : i1
  %v104 = pyc.wire {pyc.name = "rob20_valid__next"} : i1
  %v105 = pyc.constant 1 : i1
  %v106 = pyc.constant 0 : i1
  %v107 = pyc.reg %clk, %rst, %v105, %v104, %v106 : i1
  %v108 = pyc.alias %v107 {pyc.name = "rob20_valid"} : i1
  %v109 = pyc.wire {pyc.name = "rob21_valid__next"} : i1
  %v110 = pyc.constant 1 : i1
  %v111 = pyc.constant 0 : i1
  %v112 = pyc.reg %clk, %rst, %v110, %v109, %v111 : i1
  %v113 = pyc.alias %v112 {pyc.name = "rob21_valid"} : i1
  %v114 = pyc.wire {pyc.name = "rob22_valid__next"} : i1
  %v115 = pyc.constant 1 : i1
  %v116 = pyc.constant 0 : i1
  %v117 = pyc.reg %clk, %rst, %v115, %v114, %v116 : i1
  %v118 = pyc.alias %v117 {pyc.name = "rob22_valid"} : i1
  %v119 = pyc.wire {pyc.name = "rob23_valid__next"} : i1
  %v120 = pyc.constant 1 : i1
  %v121 = pyc.constant 0 : i1
  %v122 = pyc.reg %clk, %rst, %v120, %v119, %v121 : i1
  %v123 = pyc.alias %v122 {pyc.name = "rob23_valid"} : i1
  %v124 = pyc.wire {pyc.name = "rob24_valid__next"} : i1
  %v125 = pyc.constant 1 : i1
  %v126 = pyc.constant 0 : i1
  %v127 = pyc.reg %clk, %rst, %v125, %v124, %v126 : i1
  %v128 = pyc.alias %v127 {pyc.name = "rob24_valid"} : i1
  %v129 = pyc.wire {pyc.name = "rob25_valid__next"} : i1
  %v130 = pyc.constant 1 : i1
  %v131 = pyc.constant 0 : i1
  %v132 = pyc.reg %clk, %rst, %v130, %v129, %v131 : i1
  %v133 = pyc.alias %v132 {pyc.name = "rob25_valid"} : i1
  %v134 = pyc.wire {pyc.name = "rob26_valid__next"} : i1
  %v135 = pyc.constant 1 : i1
  %v136 = pyc.constant 0 : i1
  %v137 = pyc.reg %clk, %rst, %v135, %v134, %v136 : i1
  %v138 = pyc.alias %v137 {pyc.name = "rob26_valid"} : i1
  %v139 = pyc.wire {pyc.name = "rob27_valid__next"} : i1
  %v140 = pyc.constant 1 : i1
  %v141 = pyc.constant 0 : i1
  %v142 = pyc.reg %clk, %rst, %v140, %v139, %v141 : i1
  %v143 = pyc.alias %v142 {pyc.name = "rob27_valid"} : i1
  %v144 = pyc.wire {pyc.name = "rob28_valid__next"} : i1
  %v145 = pyc.constant 1 : i1
  %v146 = pyc.constant 0 : i1
  %v147 = pyc.reg %clk, %rst, %v145, %v144, %v146 : i1
  %v148 = pyc.alias %v147 {pyc.name = "rob28_valid"} : i1
  %v149 = pyc.wire {pyc.name = "rob29_valid__next"} : i1
  %v150 = pyc.constant 1 : i1
  %v151 = pyc.constant 0 : i1
  %v152 = pyc.reg %clk, %rst, %v150, %v149, %v151 : i1
  %v153 = pyc.alias %v152 {pyc.name = "rob29_valid"} : i1
  %v154 = pyc.wire {pyc.name = "rob30_valid__next"} : i1
  %v155 = pyc.constant 1 : i1
  %v156 = pyc.constant 0 : i1
  %v157 = pyc.reg %clk, %rst, %v155, %v154, %v156 : i1
  %v158 = pyc.alias %v157 {pyc.name = "rob30_valid"} : i1
  %v159 = pyc.wire {pyc.name = "rob31_valid__next"} : i1
  %v160 = pyc.constant 1 : i1
  %v161 = pyc.constant 0 : i1
  %v162 = pyc.reg %clk, %rst, %v160, %v159, %v161 : i1
  %v163 = pyc.alias %v162 {pyc.name = "rob31_valid"} : i1
  %v164 = pyc.wire {pyc.name = "rob0_data__next"} : i128
  %v165 = pyc.constant 1 : i1
  %v166 = pyc.constant 0 : i128
  %v167 = pyc.reg %clk, %rst, %v165, %v164, %v166 : i128
  %v168 = pyc.alias %v167 {pyc.name = "rob0_data"} : i128
  %v169 = pyc.wire {pyc.name = "rob1_data__next"} : i128
  %v170 = pyc.constant 1 : i1
  %v171 = pyc.constant 0 : i128
  %v172 = pyc.reg %clk, %rst, %v170, %v169, %v171 : i128
  %v173 = pyc.alias %v172 {pyc.name = "rob1_data"} : i128
  %v174 = pyc.wire {pyc.name = "rob2_data__next"} : i128
  %v175 = pyc.constant 1 : i1
  %v176 = pyc.constant 0 : i128
  %v177 = pyc.reg %clk, %rst, %v175, %v174, %v176 : i128
  %v178 = pyc.alias %v177 {pyc.name = "rob2_data"} : i128
  %v179 = pyc.wire {pyc.name = "rob3_data__next"} : i128
  %v180 = pyc.constant 1 : i1
  %v181 = pyc.constant 0 : i128
  %v182 = pyc.reg %clk, %rst, %v180, %v179, %v181 : i128
  %v183 = pyc.alias %v182 {pyc.name = "rob3_data"} : i128
  %v184 = pyc.wire {pyc.name = "rob4_data__next"} : i128
  %v185 = pyc.constant 1 : i1
  %v186 = pyc.constant 0 : i128
  %v187 = pyc.reg %clk, %rst, %v185, %v184, %v186 : i128
  %v188 = pyc.alias %v187 {pyc.name = "rob4_data"} : i128
  %v189 = pyc.wire {pyc.name = "rob5_data__next"} : i128
  %v190 = pyc.constant 1 : i1
  %v191 = pyc.constant 0 : i128
  %v192 = pyc.reg %clk, %rst, %v190, %v189, %v191 : i128
  %v193 = pyc.alias %v192 {pyc.name = "rob5_data"} : i128
  %v194 = pyc.wire {pyc.name = "rob6_data__next"} : i128
  %v195 = pyc.constant 1 : i1
  %v196 = pyc.constant 0 : i128
  %v197 = pyc.reg %clk, %rst, %v195, %v194, %v196 : i128
  %v198 = pyc.alias %v197 {pyc.name = "rob6_data"} : i128
  %v199 = pyc.wire {pyc.name = "rob7_data__next"} : i128
  %v200 = pyc.constant 1 : i1
  %v201 = pyc.constant 0 : i128
  %v202 = pyc.reg %clk, %rst, %v200, %v199, %v201 : i128
  %v203 = pyc.alias %v202 {pyc.name = "rob7_data"} : i128
  %v204 = pyc.wire {pyc.name = "rob8_data__next"} : i128
  %v205 = pyc.constant 1 : i1
  %v206 = pyc.constant 0 : i128
  %v207 = pyc.reg %clk, %rst, %v205, %v204, %v206 : i128
  %v208 = pyc.alias %v207 {pyc.name = "rob8_data"} : i128
  %v209 = pyc.wire {pyc.name = "rob9_data__next"} : i128
  %v210 = pyc.constant 1 : i1
  %v211 = pyc.constant 0 : i128
  %v212 = pyc.reg %clk, %rst, %v210, %v209, %v211 : i128
  %v213 = pyc.alias %v212 {pyc.name = "rob9_data"} : i128
  %v214 = pyc.wire {pyc.name = "rob10_data__next"} : i128
  %v215 = pyc.constant 1 : i1
  %v216 = pyc.constant 0 : i128
  %v217 = pyc.reg %clk, %rst, %v215, %v214, %v216 : i128
  %v218 = pyc.alias %v217 {pyc.name = "rob10_data"} : i128
  %v219 = pyc.wire {pyc.name = "rob11_data__next"} : i128
  %v220 = pyc.constant 1 : i1
  %v221 = pyc.constant 0 : i128
  %v222 = pyc.reg %clk, %rst, %v220, %v219, %v221 : i128
  %v223 = pyc.alias %v222 {pyc.name = "rob11_data"} : i128
  %v224 = pyc.wire {pyc.name = "rob12_data__next"} : i128
  %v225 = pyc.constant 1 : i1
  %v226 = pyc.constant 0 : i128
  %v227 = pyc.reg %clk, %rst, %v225, %v224, %v226 : i128
  %v228 = pyc.alias %v227 {pyc.name = "rob12_data"} : i128
  %v229 = pyc.wire {pyc.name = "rob13_data__next"} : i128
  %v230 = pyc.constant 1 : i1
  %v231 = pyc.constant 0 : i128
  %v232 = pyc.reg %clk, %rst, %v230, %v229, %v231 : i128
  %v233 = pyc.alias %v232 {pyc.name = "rob13_data"} : i128
  %v234 = pyc.wire {pyc.name = "rob14_data__next"} : i128
  %v235 = pyc.constant 1 : i1
  %v236 = pyc.constant 0 : i128
  %v237 = pyc.reg %clk, %rst, %v235, %v234, %v236 : i128
  %v238 = pyc.alias %v237 {pyc.name = "rob14_data"} : i128
  %v239 = pyc.wire {pyc.name = "rob15_data__next"} : i128
  %v240 = pyc.constant 1 : i1
  %v241 = pyc.constant 0 : i128
  %v242 = pyc.reg %clk, %rst, %v240, %v239, %v241 : i128
  %v243 = pyc.alias %v242 {pyc.name = "rob15_data"} : i128
  %v244 = pyc.wire {pyc.name = "rob16_data__next"} : i128
  %v245 = pyc.constant 1 : i1
  %v246 = pyc.constant 0 : i128
  %v247 = pyc.reg %clk, %rst, %v245, %v244, %v246 : i128
  %v248 = pyc.alias %v247 {pyc.name = "rob16_data"} : i128
  %v249 = pyc.wire {pyc.name = "rob17_data__next"} : i128
  %v250 = pyc.constant 1 : i1
  %v251 = pyc.constant 0 : i128
  %v252 = pyc.reg %clk, %rst, %v250, %v249, %v251 : i128
  %v253 = pyc.alias %v252 {pyc.name = "rob17_data"} : i128
  %v254 = pyc.wire {pyc.name = "rob18_data__next"} : i128
  %v255 = pyc.constant 1 : i1
  %v256 = pyc.constant 0 : i128
  %v257 = pyc.reg %clk, %rst, %v255, %v254, %v256 : i128
  %v258 = pyc.alias %v257 {pyc.name = "rob18_data"} : i128
  %v259 = pyc.wire {pyc.name = "rob19_data__next"} : i128
  %v260 = pyc.constant 1 : i1
  %v261 = pyc.constant 0 : i128
  %v262 = pyc.reg %clk, %rst, %v260, %v259, %v261 : i128
  %v263 = pyc.alias %v262 {pyc.name = "rob19_data"} : i128
  %v264 = pyc.wire {pyc.name = "rob20_data__next"} : i128
  %v265 = pyc.constant 1 : i1
  %v266 = pyc.constant 0 : i128
  %v267 = pyc.reg %clk, %rst, %v265, %v264, %v266 : i128
  %v268 = pyc.alias %v267 {pyc.name = "rob20_data"} : i128
  %v269 = pyc.wire {pyc.name = "rob21_data__next"} : i128
  %v270 = pyc.constant 1 : i1
  %v271 = pyc.constant 0 : i128
  %v272 = pyc.reg %clk, %rst, %v270, %v269, %v271 : i128
  %v273 = pyc.alias %v272 {pyc.name = "rob21_data"} : i128
  %v274 = pyc.wire {pyc.name = "rob22_data__next"} : i128
  %v275 = pyc.constant 1 : i1
  %v276 = pyc.constant 0 : i128
  %v277 = pyc.reg %clk, %rst, %v275, %v274, %v276 : i128
  %v278 = pyc.alias %v277 {pyc.name = "rob22_data"} : i128
  %v279 = pyc.wire {pyc.name = "rob23_data__next"} : i128
  %v280 = pyc.constant 1 : i1
  %v281 = pyc.constant 0 : i128
  %v282 = pyc.reg %clk, %rst, %v280, %v279, %v281 : i128
  %v283 = pyc.alias %v282 {pyc.name = "rob23_data"} : i128
  %v284 = pyc.wire {pyc.name = "rob24_data__next"} : i128
  %v285 = pyc.constant 1 : i1
  %v286 = pyc.constant 0 : i128
  %v287 = pyc.reg %clk, %rst, %v285, %v284, %v286 : i128
  %v288 = pyc.alias %v287 {pyc.name = "rob24_data"} : i128
  %v289 = pyc.wire {pyc.name = "rob25_data__next"} : i128
  %v290 = pyc.constant 1 : i1
  %v291 = pyc.constant 0 : i128
  %v292 = pyc.reg %clk, %rst, %v290, %v289, %v291 : i128
  %v293 = pyc.alias %v292 {pyc.name = "rob25_data"} : i128
  %v294 = pyc.wire {pyc.name = "rob26_data__next"} : i128
  %v295 = pyc.constant 1 : i1
  %v296 = pyc.constant 0 : i128
  %v297 = pyc.reg %clk, %rst, %v295, %v294, %v296 : i128
  %v298 = pyc.alias %v297 {pyc.name = "rob26_data"} : i128
  %v299 = pyc.wire {pyc.name = "rob27_data__next"} : i128
  %v300 = pyc.constant 1 : i1
  %v301 = pyc.constant 0 : i128
  %v302 = pyc.reg %clk, %rst, %v300, %v299, %v301 : i128
  %v303 = pyc.alias %v302 {pyc.name = "rob27_data"} : i128
  %v304 = pyc.wire {pyc.name = "rob28_data__next"} : i128
  %v305 = pyc.constant 1 : i1
  %v306 = pyc.constant 0 : i128
  %v307 = pyc.reg %clk, %rst, %v305, %v304, %v306 : i128
  %v308 = pyc.alias %v307 {pyc.name = "rob28_data"} : i128
  %v309 = pyc.wire {pyc.name = "rob29_data__next"} : i128
  %v310 = pyc.constant 1 : i1
  %v311 = pyc.constant 0 : i128
  %v312 = pyc.reg %clk, %rst, %v310, %v309, %v311 : i128
  %v313 = pyc.alias %v312 {pyc.name = "rob29_data"} : i128
  %v314 = pyc.wire {pyc.name = "rob30_data__next"} : i128
  %v315 = pyc.constant 1 : i1
  %v316 = pyc.constant 0 : i128
  %v317 = pyc.reg %clk, %rst, %v315, %v314, %v316 : i128
  %v318 = pyc.alias %v317 {pyc.name = "rob30_data"} : i128
  %v319 = pyc.wire {pyc.name = "rob31_data__next"} : i128
  %v320 = pyc.constant 1 : i1
  %v321 = pyc.constant 0 : i128
  %v322 = pyc.reg %clk, %rst, %v320, %v319, %v321 : i128
  %v323 = pyc.alias %v322 {pyc.name = "rob31_data"} : i128
  %v324 = pyc.wire {pyc.name = "rob0_seq__next"} : i16
  %v325 = pyc.constant 1 : i1
  %v326 = pyc.constant 0 : i16
  %v327 = pyc.reg %clk, %rst, %v325, %v324, %v326 : i16
  %v328 = pyc.alias %v327 {pyc.name = "rob0_seq"} : i16
  %v329 = pyc.wire {pyc.name = "rob1_seq__next"} : i16
  %v330 = pyc.constant 1 : i1
  %v331 = pyc.constant 0 : i16
  %v332 = pyc.reg %clk, %rst, %v330, %v329, %v331 : i16
  %v333 = pyc.alias %v332 {pyc.name = "rob1_seq"} : i16
  %v334 = pyc.wire {pyc.name = "rob2_seq__next"} : i16
  %v335 = pyc.constant 1 : i1
  %v336 = pyc.constant 0 : i16
  %v337 = pyc.reg %clk, %rst, %v335, %v334, %v336 : i16
  %v338 = pyc.alias %v337 {pyc.name = "rob2_seq"} : i16
  %v339 = pyc.wire {pyc.name = "rob3_seq__next"} : i16
  %v340 = pyc.constant 1 : i1
  %v341 = pyc.constant 0 : i16
  %v342 = pyc.reg %clk, %rst, %v340, %v339, %v341 : i16
  %v343 = pyc.alias %v342 {pyc.name = "rob3_seq"} : i16
  %v344 = pyc.wire {pyc.name = "rob4_seq__next"} : i16
  %v345 = pyc.constant 1 : i1
  %v346 = pyc.constant 0 : i16
  %v347 = pyc.reg %clk, %rst, %v345, %v344, %v346 : i16
  %v348 = pyc.alias %v347 {pyc.name = "rob4_seq"} : i16
  %v349 = pyc.wire {pyc.name = "rob5_seq__next"} : i16
  %v350 = pyc.constant 1 : i1
  %v351 = pyc.constant 0 : i16
  %v352 = pyc.reg %clk, %rst, %v350, %v349, %v351 : i16
  %v353 = pyc.alias %v352 {pyc.name = "rob5_seq"} : i16
  %v354 = pyc.wire {pyc.name = "rob6_seq__next"} : i16
  %v355 = pyc.constant 1 : i1
  %v356 = pyc.constant 0 : i16
  %v357 = pyc.reg %clk, %rst, %v355, %v354, %v356 : i16
  %v358 = pyc.alias %v357 {pyc.name = "rob6_seq"} : i16
  %v359 = pyc.wire {pyc.name = "rob7_seq__next"} : i16
  %v360 = pyc.constant 1 : i1
  %v361 = pyc.constant 0 : i16
  %v362 = pyc.reg %clk, %rst, %v360, %v359, %v361 : i16
  %v363 = pyc.alias %v362 {pyc.name = "rob7_seq"} : i16
  %v364 = pyc.wire {pyc.name = "rob8_seq__next"} : i16
  %v365 = pyc.constant 1 : i1
  %v366 = pyc.constant 0 : i16
  %v367 = pyc.reg %clk, %rst, %v365, %v364, %v366 : i16
  %v368 = pyc.alias %v367 {pyc.name = "rob8_seq"} : i16
  %v369 = pyc.wire {pyc.name = "rob9_seq__next"} : i16
  %v370 = pyc.constant 1 : i1
  %v371 = pyc.constant 0 : i16
  %v372 = pyc.reg %clk, %rst, %v370, %v369, %v371 : i16
  %v373 = pyc.alias %v372 {pyc.name = "rob9_seq"} : i16
  %v374 = pyc.wire {pyc.name = "rob10_seq__next"} : i16
  %v375 = pyc.constant 1 : i1
  %v376 = pyc.constant 0 : i16
  %v377 = pyc.reg %clk, %rst, %v375, %v374, %v376 : i16
  %v378 = pyc.alias %v377 {pyc.name = "rob10_seq"} : i16
  %v379 = pyc.wire {pyc.name = "rob11_seq__next"} : i16
  %v380 = pyc.constant 1 : i1
  %v381 = pyc.constant 0 : i16
  %v382 = pyc.reg %clk, %rst, %v380, %v379, %v381 : i16
  %v383 = pyc.alias %v382 {pyc.name = "rob11_seq"} : i16
  %v384 = pyc.wire {pyc.name = "rob12_seq__next"} : i16
  %v385 = pyc.constant 1 : i1
  %v386 = pyc.constant 0 : i16
  %v387 = pyc.reg %clk, %rst, %v385, %v384, %v386 : i16
  %v388 = pyc.alias %v387 {pyc.name = "rob12_seq"} : i16
  %v389 = pyc.wire {pyc.name = "rob13_seq__next"} : i16
  %v390 = pyc.constant 1 : i1
  %v391 = pyc.constant 0 : i16
  %v392 = pyc.reg %clk, %rst, %v390, %v389, %v391 : i16
  %v393 = pyc.alias %v392 {pyc.name = "rob13_seq"} : i16
  %v394 = pyc.wire {pyc.name = "rob14_seq__next"} : i16
  %v395 = pyc.constant 1 : i1
  %v396 = pyc.constant 0 : i16
  %v397 = pyc.reg %clk, %rst, %v395, %v394, %v396 : i16
  %v398 = pyc.alias %v397 {pyc.name = "rob14_seq"} : i16
  %v399 = pyc.wire {pyc.name = "rob15_seq__next"} : i16
  %v400 = pyc.constant 1 : i1
  %v401 = pyc.constant 0 : i16
  %v402 = pyc.reg %clk, %rst, %v400, %v399, %v401 : i16
  %v403 = pyc.alias %v402 {pyc.name = "rob15_seq"} : i16
  %v404 = pyc.wire {pyc.name = "rob16_seq__next"} : i16
  %v405 = pyc.constant 1 : i1
  %v406 = pyc.constant 0 : i16
  %v407 = pyc.reg %clk, %rst, %v405, %v404, %v406 : i16
  %v408 = pyc.alias %v407 {pyc.name = "rob16_seq"} : i16
  %v409 = pyc.wire {pyc.name = "rob17_seq__next"} : i16
  %v410 = pyc.constant 1 : i1
  %v411 = pyc.constant 0 : i16
  %v412 = pyc.reg %clk, %rst, %v410, %v409, %v411 : i16
  %v413 = pyc.alias %v412 {pyc.name = "rob17_seq"} : i16
  %v414 = pyc.wire {pyc.name = "rob18_seq__next"} : i16
  %v415 = pyc.constant 1 : i1
  %v416 = pyc.constant 0 : i16
  %v417 = pyc.reg %clk, %rst, %v415, %v414, %v416 : i16
  %v418 = pyc.alias %v417 {pyc.name = "rob18_seq"} : i16
  %v419 = pyc.wire {pyc.name = "rob19_seq__next"} : i16
  %v420 = pyc.constant 1 : i1
  %v421 = pyc.constant 0 : i16
  %v422 = pyc.reg %clk, %rst, %v420, %v419, %v421 : i16
  %v423 = pyc.alias %v422 {pyc.name = "rob19_seq"} : i16
  %v424 = pyc.wire {pyc.name = "rob20_seq__next"} : i16
  %v425 = pyc.constant 1 : i1
  %v426 = pyc.constant 0 : i16
  %v427 = pyc.reg %clk, %rst, %v425, %v424, %v426 : i16
  %v428 = pyc.alias %v427 {pyc.name = "rob20_seq"} : i16
  %v429 = pyc.wire {pyc.name = "rob21_seq__next"} : i16
  %v430 = pyc.constant 1 : i1
  %v431 = pyc.constant 0 : i16
  %v432 = pyc.reg %clk, %rst, %v430, %v429, %v431 : i16
  %v433 = pyc.alias %v432 {pyc.name = "rob21_seq"} : i16
  %v434 = pyc.wire {pyc.name = "rob22_seq__next"} : i16
  %v435 = pyc.constant 1 : i1
  %v436 = pyc.constant 0 : i16
  %v437 = pyc.reg %clk, %rst, %v435, %v434, %v436 : i16
  %v438 = pyc.alias %v437 {pyc.name = "rob22_seq"} : i16
  %v439 = pyc.wire {pyc.name = "rob23_seq__next"} : i16
  %v440 = pyc.constant 1 : i1
  %v441 = pyc.constant 0 : i16
  %v442 = pyc.reg %clk, %rst, %v440, %v439, %v441 : i16
  %v443 = pyc.alias %v442 {pyc.name = "rob23_seq"} : i16
  %v444 = pyc.wire {pyc.name = "rob24_seq__next"} : i16
  %v445 = pyc.constant 1 : i1
  %v446 = pyc.constant 0 : i16
  %v447 = pyc.reg %clk, %rst, %v445, %v444, %v446 : i16
  %v448 = pyc.alias %v447 {pyc.name = "rob24_seq"} : i16
  %v449 = pyc.wire {pyc.name = "rob25_seq__next"} : i16
  %v450 = pyc.constant 1 : i1
  %v451 = pyc.constant 0 : i16
  %v452 = pyc.reg %clk, %rst, %v450, %v449, %v451 : i16
  %v453 = pyc.alias %v452 {pyc.name = "rob25_seq"} : i16
  %v454 = pyc.wire {pyc.name = "rob26_seq__next"} : i16
  %v455 = pyc.constant 1 : i1
  %v456 = pyc.constant 0 : i16
  %v457 = pyc.reg %clk, %rst, %v455, %v454, %v456 : i16
  %v458 = pyc.alias %v457 {pyc.name = "rob26_seq"} : i16
  %v459 = pyc.wire {pyc.name = "rob27_seq__next"} : i16
  %v460 = pyc.constant 1 : i1
  %v461 = pyc.constant 0 : i16
  %v462 = pyc.reg %clk, %rst, %v460, %v459, %v461 : i16
  %v463 = pyc.alias %v462 {pyc.name = "rob27_seq"} : i16
  %v464 = pyc.wire {pyc.name = "rob28_seq__next"} : i16
  %v465 = pyc.constant 1 : i1
  %v466 = pyc.constant 0 : i16
  %v467 = pyc.reg %clk, %rst, %v465, %v464, %v466 : i16
  %v468 = pyc.alias %v467 {pyc.name = "rob28_seq"} : i16
  %v469 = pyc.wire {pyc.name = "rob29_seq__next"} : i16
  %v470 = pyc.constant 1 : i1
  %v471 = pyc.constant 0 : i16
  %v472 = pyc.reg %clk, %rst, %v470, %v469, %v471 : i16
  %v473 = pyc.alias %v472 {pyc.name = "rob29_seq"} : i16
  %v474 = pyc.wire {pyc.name = "rob30_seq__next"} : i16
  %v475 = pyc.constant 1 : i1
  %v476 = pyc.constant 0 : i16
  %v477 = pyc.reg %clk, %rst, %v475, %v474, %v476 : i16
  %v478 = pyc.alias %v477 {pyc.name = "rob30_seq"} : i16
  %v479 = pyc.wire {pyc.name = "rob31_seq__next"} : i16
  %v480 = pyc.constant 1 : i1
  %v481 = pyc.constant 0 : i16
  %v482 = pyc.reg %clk, %rst, %v480, %v479, %v481 : i16
  %v483 = pyc.alias %v482 {pyc.name = "rob31_seq"} : i16
  %v484 = pyc.wire {pyc.name = "head__next"} : i5
  %v485 = pyc.constant 1 : i1
  %v486 = pyc.constant 0 : i5
  %v487 = pyc.reg %clk, %rst, %v485, %v484, %v486 : i5
  %v488 = pyc.alias %v487 {pyc.name = "head"} : i5
  %v489 = pyc.alias %v488 {pyc.name = "head__module_04_rob__L55"} : i5
  %v490 = pyc.wire {pyc.name = "tail__next"} : i5
  %v491 = pyc.constant 1 : i1
  %v492 = pyc.constant 0 : i5
  %v493 = pyc.reg %clk, %rst, %v491, %v490, %v492 : i5
  %v494 = pyc.alias %v493 {pyc.name = "tail"} : i5
  %v495 = pyc.alias %v494 {pyc.name = "tail__module_04_rob__L56"} : i5
  %v496 = pyc.wire {pyc.name = "count__next"} : i6
  %v497 = pyc.constant 1 : i1
  %v498 = pyc.constant 0 : i6
  %v499 = pyc.reg %clk, %rst, %v497, %v496, %v498 : i6
  %v500 = pyc.alias %v499 {pyc.name = "count"} : i6
  %v501 = pyc.alias %v500 {pyc.name = "count__module_04_rob__L57"} : i6
  %v502 = pyc.wire {pyc.name = "next_seq__next"} : i16
  %v503 = pyc.constant 1 : i1
  %v504 = pyc.constant 0 : i16
  %v505 = pyc.reg %clk, %rst, %v503, %v502, %v504 : i16
  %v506 = pyc.alias %v505 {pyc.name = "next_seq"} : i16
  %v507 = pyc.alias %v506 {pyc.name = "next_seq__module_04_rob__L60"} : i16
  %v508 = pyc.wire {pyc.name = "out_vld__next"} : i1
  %v509 = pyc.constant 1 : i1
  %v510 = pyc.constant 0 : i1
  %v511 = pyc.reg %clk, %rst, %v509, %v508, %v510 : i1
  %v512 = pyc.alias %v511 {pyc.name = "out_vld"} : i1
  %v513 = pyc.alias %v512 {pyc.name = "out_vld__module_04_rob__L63"} : i1
  %v514 = pyc.wire {pyc.name = "out_data__next"} : i128
  %v515 = pyc.constant 1 : i1
  %v516 = pyc.constant 0 : i128
  %v517 = pyc.reg %clk, %rst, %v515, %v514, %v516 : i128
  %v518 = pyc.alias %v517 {pyc.name = "out_data"} : i128
  %v519 = pyc.alias %v518 {pyc.name = "out_data__module_04_rob__L64"} : i128
  %v520 = pyc.wire {pyc.name = "out_seq__next"} : i16
  %v521 = pyc.constant 1 : i1
  %v522 = pyc.constant 0 : i16
  %v523 = pyc.reg %clk, %rst, %v521, %v520, %v522 : i16
  %v524 = pyc.alias %v523 {pyc.name = "out_seq"} : i16
  %v525 = pyc.alias %v524 {pyc.name = "out_seq__module_04_rob__L65"} : i16
  %v526 = pyc.alias %v495 {pyc.name = "tail_ptr__module_04_rob__L68"} : i5
  %v527 = pyc.constant 0 : i5
  %v528 = pyc.eq %v526, %v527 : i5
  %v529 = pyc.and %v1, %v528 : i1
  %v530 = pyc.alias %v529 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v531 = pyc.or %v530, %v8 : i1
  pyc.assign %v4, %v531 : i1
  %v532 = pyc.mux %v530, %v2, %v168 : i128
  pyc.assign %v164, %v532 : i128
  %v533 = pyc.mux %v530, %v3, %v328 : i16
  pyc.assign %v324, %v533 : i16
  %v534 = pyc.constant 1 : i5
  %v535 = pyc.eq %v526, %v534 : i5
  %v536 = pyc.and %v1, %v535 : i1
  %v537 = pyc.alias %v536 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v538 = pyc.or %v537, %v13 : i1
  pyc.assign %v9, %v538 : i1
  %v539 = pyc.mux %v537, %v2, %v173 : i128
  pyc.assign %v169, %v539 : i128
  %v540 = pyc.mux %v537, %v3, %v333 : i16
  pyc.assign %v329, %v540 : i16
  %v541 = pyc.constant 2 : i5
  %v542 = pyc.eq %v526, %v541 : i5
  %v543 = pyc.and %v1, %v542 : i1
  %v544 = pyc.alias %v543 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v545 = pyc.or %v544, %v18 : i1
  pyc.assign %v14, %v545 : i1
  %v546 = pyc.mux %v544, %v2, %v178 : i128
  pyc.assign %v174, %v546 : i128
  %v547 = pyc.mux %v544, %v3, %v338 : i16
  pyc.assign %v334, %v547 : i16
  %v548 = pyc.constant 3 : i5
  %v549 = pyc.eq %v526, %v548 : i5
  %v550 = pyc.and %v1, %v549 : i1
  %v551 = pyc.alias %v550 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v552 = pyc.or %v551, %v23 : i1
  pyc.assign %v19, %v552 : i1
  %v553 = pyc.mux %v551, %v2, %v183 : i128
  pyc.assign %v179, %v553 : i128
  %v554 = pyc.mux %v551, %v3, %v343 : i16
  pyc.assign %v339, %v554 : i16
  %v555 = pyc.constant 4 : i5
  %v556 = pyc.eq %v526, %v555 : i5
  %v557 = pyc.and %v1, %v556 : i1
  %v558 = pyc.alias %v557 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v559 = pyc.or %v558, %v28 : i1
  pyc.assign %v24, %v559 : i1
  %v560 = pyc.mux %v558, %v2, %v188 : i128
  pyc.assign %v184, %v560 : i128
  %v561 = pyc.mux %v558, %v3, %v348 : i16
  pyc.assign %v344, %v561 : i16
  %v562 = pyc.constant 5 : i5
  %v563 = pyc.eq %v526, %v562 : i5
  %v564 = pyc.and %v1, %v563 : i1
  %v565 = pyc.alias %v564 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v566 = pyc.or %v565, %v33 : i1
  pyc.assign %v29, %v566 : i1
  %v567 = pyc.mux %v565, %v2, %v193 : i128
  pyc.assign %v189, %v567 : i128
  %v568 = pyc.mux %v565, %v3, %v353 : i16
  pyc.assign %v349, %v568 : i16
  %v569 = pyc.constant 6 : i5
  %v570 = pyc.eq %v526, %v569 : i5
  %v571 = pyc.and %v1, %v570 : i1
  %v572 = pyc.alias %v571 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v573 = pyc.or %v572, %v38 : i1
  pyc.assign %v34, %v573 : i1
  %v574 = pyc.mux %v572, %v2, %v198 : i128
  pyc.assign %v194, %v574 : i128
  %v575 = pyc.mux %v572, %v3, %v358 : i16
  pyc.assign %v354, %v575 : i16
  %v576 = pyc.constant 7 : i5
  %v577 = pyc.eq %v526, %v576 : i5
  %v578 = pyc.and %v1, %v577 : i1
  %v579 = pyc.alias %v578 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v580 = pyc.or %v579, %v43 : i1
  pyc.assign %v39, %v580 : i1
  %v581 = pyc.mux %v579, %v2, %v203 : i128
  pyc.assign %v199, %v581 : i128
  %v582 = pyc.mux %v579, %v3, %v363 : i16
  pyc.assign %v359, %v582 : i16
  %v583 = pyc.constant 8 : i5
  %v584 = pyc.eq %v526, %v583 : i5
  %v585 = pyc.and %v1, %v584 : i1
  %v586 = pyc.alias %v585 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v587 = pyc.or %v586, %v48 : i1
  pyc.assign %v44, %v587 : i1
  %v588 = pyc.mux %v586, %v2, %v208 : i128
  pyc.assign %v204, %v588 : i128
  %v589 = pyc.mux %v586, %v3, %v368 : i16
  pyc.assign %v364, %v589 : i16
  %v590 = pyc.constant 9 : i5
  %v591 = pyc.eq %v526, %v590 : i5
  %v592 = pyc.and %v1, %v591 : i1
  %v593 = pyc.alias %v592 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v594 = pyc.or %v593, %v53 : i1
  pyc.assign %v49, %v594 : i1
  %v595 = pyc.mux %v593, %v2, %v213 : i128
  pyc.assign %v209, %v595 : i128
  %v596 = pyc.mux %v593, %v3, %v373 : i16
  pyc.assign %v369, %v596 : i16
  %v597 = pyc.constant 10 : i5
  %v598 = pyc.eq %v526, %v597 : i5
  %v599 = pyc.and %v1, %v598 : i1
  %v600 = pyc.alias %v599 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v601 = pyc.or %v600, %v58 : i1
  pyc.assign %v54, %v601 : i1
  %v602 = pyc.mux %v600, %v2, %v218 : i128
  pyc.assign %v214, %v602 : i128
  %v603 = pyc.mux %v600, %v3, %v378 : i16
  pyc.assign %v374, %v603 : i16
  %v604 = pyc.constant 11 : i5
  %v605 = pyc.eq %v526, %v604 : i5
  %v606 = pyc.and %v1, %v605 : i1
  %v607 = pyc.alias %v606 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v608 = pyc.or %v607, %v63 : i1
  pyc.assign %v59, %v608 : i1
  %v609 = pyc.mux %v607, %v2, %v223 : i128
  pyc.assign %v219, %v609 : i128
  %v610 = pyc.mux %v607, %v3, %v383 : i16
  pyc.assign %v379, %v610 : i16
  %v611 = pyc.constant 12 : i5
  %v612 = pyc.eq %v526, %v611 : i5
  %v613 = pyc.and %v1, %v612 : i1
  %v614 = pyc.alias %v613 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v615 = pyc.or %v614, %v68 : i1
  pyc.assign %v64, %v615 : i1
  %v616 = pyc.mux %v614, %v2, %v228 : i128
  pyc.assign %v224, %v616 : i128
  %v617 = pyc.mux %v614, %v3, %v388 : i16
  pyc.assign %v384, %v617 : i16
  %v618 = pyc.constant 13 : i5
  %v619 = pyc.eq %v526, %v618 : i5
  %v620 = pyc.and %v1, %v619 : i1
  %v621 = pyc.alias %v620 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v622 = pyc.or %v621, %v73 : i1
  pyc.assign %v69, %v622 : i1
  %v623 = pyc.mux %v621, %v2, %v233 : i128
  pyc.assign %v229, %v623 : i128
  %v624 = pyc.mux %v621, %v3, %v393 : i16
  pyc.assign %v389, %v624 : i16
  %v625 = pyc.constant 14 : i5
  %v626 = pyc.eq %v526, %v625 : i5
  %v627 = pyc.and %v1, %v626 : i1
  %v628 = pyc.alias %v627 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v629 = pyc.or %v628, %v78 : i1
  pyc.assign %v74, %v629 : i1
  %v630 = pyc.mux %v628, %v2, %v238 : i128
  pyc.assign %v234, %v630 : i128
  %v631 = pyc.mux %v628, %v3, %v398 : i16
  pyc.assign %v394, %v631 : i16
  %v632 = pyc.constant 15 : i5
  %v633 = pyc.eq %v526, %v632 : i5
  %v634 = pyc.and %v1, %v633 : i1
  %v635 = pyc.alias %v634 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v636 = pyc.or %v635, %v83 : i1
  pyc.assign %v79, %v636 : i1
  %v637 = pyc.mux %v635, %v2, %v243 : i128
  pyc.assign %v239, %v637 : i128
  %v638 = pyc.mux %v635, %v3, %v403 : i16
  pyc.assign %v399, %v638 : i16
  %v639 = pyc.constant 16 : i5
  %v640 = pyc.eq %v526, %v639 : i5
  %v641 = pyc.and %v1, %v640 : i1
  %v642 = pyc.alias %v641 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v643 = pyc.or %v642, %v88 : i1
  pyc.assign %v84, %v643 : i1
  %v644 = pyc.mux %v642, %v2, %v248 : i128
  pyc.assign %v244, %v644 : i128
  %v645 = pyc.mux %v642, %v3, %v408 : i16
  pyc.assign %v404, %v645 : i16
  %v646 = pyc.constant 17 : i5
  %v647 = pyc.eq %v526, %v646 : i5
  %v648 = pyc.and %v1, %v647 : i1
  %v649 = pyc.alias %v648 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v650 = pyc.or %v649, %v93 : i1
  pyc.assign %v89, %v650 : i1
  %v651 = pyc.mux %v649, %v2, %v253 : i128
  pyc.assign %v249, %v651 : i128
  %v652 = pyc.mux %v649, %v3, %v413 : i16
  pyc.assign %v409, %v652 : i16
  %v653 = pyc.constant 18 : i5
  %v654 = pyc.eq %v526, %v653 : i5
  %v655 = pyc.and %v1, %v654 : i1
  %v656 = pyc.alias %v655 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v657 = pyc.or %v656, %v98 : i1
  pyc.assign %v94, %v657 : i1
  %v658 = pyc.mux %v656, %v2, %v258 : i128
  pyc.assign %v254, %v658 : i128
  %v659 = pyc.mux %v656, %v3, %v418 : i16
  pyc.assign %v414, %v659 : i16
  %v660 = pyc.constant 19 : i5
  %v661 = pyc.eq %v526, %v660 : i5
  %v662 = pyc.and %v1, %v661 : i1
  %v663 = pyc.alias %v662 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v664 = pyc.or %v663, %v103 : i1
  pyc.assign %v99, %v664 : i1
  %v665 = pyc.mux %v663, %v2, %v263 : i128
  pyc.assign %v259, %v665 : i128
  %v666 = pyc.mux %v663, %v3, %v423 : i16
  pyc.assign %v419, %v666 : i16
  %v667 = pyc.constant 20 : i5
  %v668 = pyc.eq %v526, %v667 : i5
  %v669 = pyc.and %v1, %v668 : i1
  %v670 = pyc.alias %v669 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v671 = pyc.or %v670, %v108 : i1
  pyc.assign %v104, %v671 : i1
  %v672 = pyc.mux %v670, %v2, %v268 : i128
  pyc.assign %v264, %v672 : i128
  %v673 = pyc.mux %v670, %v3, %v428 : i16
  pyc.assign %v424, %v673 : i16
  %v674 = pyc.constant 21 : i5
  %v675 = pyc.eq %v526, %v674 : i5
  %v676 = pyc.and %v1, %v675 : i1
  %v677 = pyc.alias %v676 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v678 = pyc.or %v677, %v113 : i1
  pyc.assign %v109, %v678 : i1
  %v679 = pyc.mux %v677, %v2, %v273 : i128
  pyc.assign %v269, %v679 : i128
  %v680 = pyc.mux %v677, %v3, %v433 : i16
  pyc.assign %v429, %v680 : i16
  %v681 = pyc.constant 22 : i5
  %v682 = pyc.eq %v526, %v681 : i5
  %v683 = pyc.and %v1, %v682 : i1
  %v684 = pyc.alias %v683 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v685 = pyc.or %v684, %v118 : i1
  pyc.assign %v114, %v685 : i1
  %v686 = pyc.mux %v684, %v2, %v278 : i128
  pyc.assign %v274, %v686 : i128
  %v687 = pyc.mux %v684, %v3, %v438 : i16
  pyc.assign %v434, %v687 : i16
  %v688 = pyc.constant 23 : i5
  %v689 = pyc.eq %v526, %v688 : i5
  %v690 = pyc.and %v1, %v689 : i1
  %v691 = pyc.alias %v690 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v692 = pyc.or %v691, %v123 : i1
  pyc.assign %v119, %v692 : i1
  %v693 = pyc.mux %v691, %v2, %v283 : i128
  pyc.assign %v279, %v693 : i128
  %v694 = pyc.mux %v691, %v3, %v443 : i16
  pyc.assign %v439, %v694 : i16
  %v695 = pyc.constant 24 : i5
  %v696 = pyc.eq %v526, %v695 : i5
  %v697 = pyc.and %v1, %v696 : i1
  %v698 = pyc.alias %v697 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v699 = pyc.or %v698, %v128 : i1
  pyc.assign %v124, %v699 : i1
  %v700 = pyc.mux %v698, %v2, %v288 : i128
  pyc.assign %v284, %v700 : i128
  %v701 = pyc.mux %v698, %v3, %v448 : i16
  pyc.assign %v444, %v701 : i16
  %v702 = pyc.constant 25 : i5
  %v703 = pyc.eq %v526, %v702 : i5
  %v704 = pyc.and %v1, %v703 : i1
  %v705 = pyc.alias %v704 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v706 = pyc.or %v705, %v133 : i1
  pyc.assign %v129, %v706 : i1
  %v707 = pyc.mux %v705, %v2, %v293 : i128
  pyc.assign %v289, %v707 : i128
  %v708 = pyc.mux %v705, %v3, %v453 : i16
  pyc.assign %v449, %v708 : i16
  %v709 = pyc.constant 26 : i5
  %v710 = pyc.eq %v526, %v709 : i5
  %v711 = pyc.and %v1, %v710 : i1
  %v712 = pyc.alias %v711 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v713 = pyc.or %v712, %v138 : i1
  pyc.assign %v134, %v713 : i1
  %v714 = pyc.mux %v712, %v2, %v298 : i128
  pyc.assign %v294, %v714 : i128
  %v715 = pyc.mux %v712, %v3, %v458 : i16
  pyc.assign %v454, %v715 : i16
  %v716 = pyc.constant 27 : i5
  %v717 = pyc.eq %v526, %v716 : i5
  %v718 = pyc.and %v1, %v717 : i1
  %v719 = pyc.alias %v718 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v720 = pyc.or %v719, %v143 : i1
  pyc.assign %v139, %v720 : i1
  %v721 = pyc.mux %v719, %v2, %v303 : i128
  pyc.assign %v299, %v721 : i128
  %v722 = pyc.mux %v719, %v3, %v463 : i16
  pyc.assign %v459, %v722 : i16
  %v723 = pyc.constant 28 : i5
  %v724 = pyc.eq %v526, %v723 : i5
  %v725 = pyc.and %v1, %v724 : i1
  %v726 = pyc.alias %v725 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v727 = pyc.or %v726, %v148 : i1
  pyc.assign %v144, %v727 : i1
  %v728 = pyc.mux %v726, %v2, %v308 : i128
  pyc.assign %v304, %v728 : i128
  %v729 = pyc.mux %v726, %v3, %v468 : i16
  pyc.assign %v464, %v729 : i16
  %v730 = pyc.constant 29 : i5
  %v731 = pyc.eq %v526, %v730 : i5
  %v732 = pyc.and %v1, %v731 : i1
  %v733 = pyc.alias %v732 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v734 = pyc.or %v733, %v153 : i1
  pyc.assign %v149, %v734 : i1
  %v735 = pyc.mux %v733, %v2, %v313 : i128
  pyc.assign %v309, %v735 : i128
  %v736 = pyc.mux %v733, %v3, %v473 : i16
  pyc.assign %v469, %v736 : i16
  %v737 = pyc.constant 30 : i5
  %v738 = pyc.eq %v526, %v737 : i5
  %v739 = pyc.and %v1, %v738 : i1
  %v740 = pyc.alias %v739 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v741 = pyc.or %v740, %v158 : i1
  pyc.assign %v154, %v741 : i1
  %v742 = pyc.mux %v740, %v2, %v318 : i128
  pyc.assign %v314, %v742 : i128
  %v743 = pyc.mux %v740, %v3, %v478 : i16
  pyc.assign %v474, %v743 : i16
  %v744 = pyc.constant 31 : i5
  %v745 = pyc.eq %v526, %v744 : i5
  %v746 = pyc.and %v1, %v745 : i1
  %v747 = pyc.alias %v746 {pyc.name = "should_write__module_04_rob__L71"} : i1
  %v748 = pyc.or %v747, %v163 : i1
  pyc.assign %v159, %v748 : i1
  %v749 = pyc.mux %v747, %v2, %v323 : i128
  pyc.assign %v319, %v749 : i128
  %v750 = pyc.mux %v747, %v3, %v483 : i16
  pyc.assign %v479, %v750 : i16
  %v751 = pyc.constant 1 : i5
  %v752 = pyc.add %v526, %v751 : i5
  %v753 = pyc.constant 31 : i5
  %v754 = pyc.and %v752, %v753 : i5
  %v755 = pyc.alias %v754 {pyc.name = "new_tail__module_04_rob__L78"} : i5
  %v756 = pyc.mux %v1, %v755, %v526 : i5
  pyc.assign %v490, %v756 : i5
  %v757 = pyc.constant 1 : i6
  %v758 = pyc.add %v501, %v757 : i6
  %v759 = pyc.alias %v758 {pyc.name = "new_count__module_04_rob__L82"} : i6
  %v760 = pyc.mux %v1, %v759, %v501 : i6
  pyc.assign %v496, %v760 : i6
  %v761 = pyc.alias %v489 {pyc.name = "head_ptr__module_04_rob__L86"} : i5
  %v762 = pyc.alias %v8 {pyc.name = "head_valid__module_04_rob__L89"} : i1
  %v763 = pyc.eq %v328, %v507 : i16
  %v764 = pyc.alias %v763 {pyc.name = "head_seq_match__module_04_rob__L90"} : i1
  %v765 = pyc.and %v762, %v764 : i1
  %v766 = pyc.alias %v765 {pyc.name = "can_output__module_04_rob__L92"} : i1
  pyc.assign %v508, %v766 : i1
  %v767 = pyc.constant 0 : i128
  %v768 = pyc.mux %v766, %v168, %v767 : i128
  pyc.assign %v514, %v768 : i128
  %v769 = pyc.constant 0 : i16
  %v770 = pyc.mux %v766, %v328, %v769 : i16
  pyc.assign %v520, %v770 : i16
  %v771 = pyc.constant 1 : i5
  %v772 = pyc.add %v761, %v771 : i5
  %v773 = pyc.constant 31 : i5
  %v774 = pyc.and %v772, %v773 : i5
  %v775 = pyc.alias %v774 {pyc.name = "new_head__module_04_rob__L99"} : i5
  %v776 = pyc.mux %v766, %v775, %v761 : i5
  pyc.assign %v484, %v776 : i5
  %v777 = pyc.constant 1 : i16
  %v778 = pyc.add %v507, %v777 : i16
  %v779 = pyc.alias %v778 {pyc.name = "new_next_seq__module_04_rob__L102"} : i16
  %v780 = pyc.mux %v766, %v779, %v507 : i16
  pyc.assign %v502, %v780 : i16
  func.return %v513, %v519, %v525 : i1, i128, i16
}

}

