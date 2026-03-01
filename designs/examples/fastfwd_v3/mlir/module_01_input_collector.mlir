module attributes {pyc.top = @input_collector, pyc.frontend.contract = "pycircuit"} {
func.func @input_collector(%clk: !pyc.clock, %rst: !pyc.reset, %lane0_vld: i1, %lane1_vld: i1, %lane2_vld: i1, %lane3_vld: i1, %lane0_data: i128, %lane1_data: i128, %lane2_data: i128, %lane3_data: i128, %lane0_ctrl: i5, %lane1_ctrl: i5, %lane2_ctrl: i5, %lane3_ctrl: i5) -> (i1, i128, i5, i16, i1, i128, i5, i16, i1, i128, i5, i16, i1, i128, i5, i16) attributes {arg_names = ["clk", "rst", "lane0_vld", "lane1_vld", "lane2_vld", "lane3_vld", "lane0_data", "lane1_data", "lane2_data", "lane3_data", "lane0_ctrl", "lane1_ctrl", "lane2_ctrl", "lane3_ctrl"], result_names = ["lane0_vld", "lane0_data", "lane0_ctrl", "lane0_seq", "lane1_vld", "lane1_data", "lane1_ctrl", "lane1_seq", "lane2_vld", "lane2_data", "lane2_ctrl", "lane2_seq", "lane3_vld", "lane3_data", "lane3_ctrl", "lane3_seq"], pyc.base = "input_collector", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.wire {pyc.name = "seq_cnt__next"} : i16
  %v2 = pyc.constant 1 : i1
  %v3 = pyc.constant 0 : i16
  %v4 = pyc.reg %clk, %rst, %v2, %v1, %v3 : i16
  %v5 = pyc.alias %v4 {pyc.name = "seq_cnt"} : i16
  %v6 = pyc.alias %v5 {pyc.name = "seq_cnt__module_01_input_collector__L43"} : i16
  %v7 = pyc.wire {pyc.name = "out0_vld__next"} : i1
  %v8 = pyc.constant 1 : i1
  %v9 = pyc.constant 0 : i1
  %v10 = pyc.reg %clk, %rst, %v8, %v7, %v9 : i1
  %v11 = pyc.alias %v10 {pyc.name = "out0_vld"} : i1
  %v12 = pyc.wire {pyc.name = "out1_vld__next"} : i1
  %v13 = pyc.constant 1 : i1
  %v14 = pyc.constant 0 : i1
  %v15 = pyc.reg %clk, %rst, %v13, %v12, %v14 : i1
  %v16 = pyc.alias %v15 {pyc.name = "out1_vld"} : i1
  %v17 = pyc.wire {pyc.name = "out2_vld__next"} : i1
  %v18 = pyc.constant 1 : i1
  %v19 = pyc.constant 0 : i1
  %v20 = pyc.reg %clk, %rst, %v18, %v17, %v19 : i1
  %v21 = pyc.alias %v20 {pyc.name = "out2_vld"} : i1
  %v22 = pyc.wire {pyc.name = "out3_vld__next"} : i1
  %v23 = pyc.constant 1 : i1
  %v24 = pyc.constant 0 : i1
  %v25 = pyc.reg %clk, %rst, %v23, %v22, %v24 : i1
  %v26 = pyc.alias %v25 {pyc.name = "out3_vld"} : i1
  %v27 = pyc.wire {pyc.name = "out0_data__next"} : i128
  %v28 = pyc.constant 1 : i1
  %v29 = pyc.constant 0 : i128
  %v30 = pyc.reg %clk, %rst, %v28, %v27, %v29 : i128
  %v31 = pyc.alias %v30 {pyc.name = "out0_data"} : i128
  %v32 = pyc.wire {pyc.name = "out1_data__next"} : i128
  %v33 = pyc.constant 1 : i1
  %v34 = pyc.constant 0 : i128
  %v35 = pyc.reg %clk, %rst, %v33, %v32, %v34 : i128
  %v36 = pyc.alias %v35 {pyc.name = "out1_data"} : i128
  %v37 = pyc.wire {pyc.name = "out2_data__next"} : i128
  %v38 = pyc.constant 1 : i1
  %v39 = pyc.constant 0 : i128
  %v40 = pyc.reg %clk, %rst, %v38, %v37, %v39 : i128
  %v41 = pyc.alias %v40 {pyc.name = "out2_data"} : i128
  %v42 = pyc.wire {pyc.name = "out3_data__next"} : i128
  %v43 = pyc.constant 1 : i1
  %v44 = pyc.constant 0 : i128
  %v45 = pyc.reg %clk, %rst, %v43, %v42, %v44 : i128
  %v46 = pyc.alias %v45 {pyc.name = "out3_data"} : i128
  %v47 = pyc.wire {pyc.name = "out0_ctrl__next"} : i5
  %v48 = pyc.constant 1 : i1
  %v49 = pyc.constant 0 : i5
  %v50 = pyc.reg %clk, %rst, %v48, %v47, %v49 : i5
  %v51 = pyc.alias %v50 {pyc.name = "out0_ctrl"} : i5
  %v52 = pyc.wire {pyc.name = "out1_ctrl__next"} : i5
  %v53 = pyc.constant 1 : i1
  %v54 = pyc.constant 0 : i5
  %v55 = pyc.reg %clk, %rst, %v53, %v52, %v54 : i5
  %v56 = pyc.alias %v55 {pyc.name = "out1_ctrl"} : i5
  %v57 = pyc.wire {pyc.name = "out2_ctrl__next"} : i5
  %v58 = pyc.constant 1 : i1
  %v59 = pyc.constant 0 : i5
  %v60 = pyc.reg %clk, %rst, %v58, %v57, %v59 : i5
  %v61 = pyc.alias %v60 {pyc.name = "out2_ctrl"} : i5
  %v62 = pyc.wire {pyc.name = "out3_ctrl__next"} : i5
  %v63 = pyc.constant 1 : i1
  %v64 = pyc.constant 0 : i5
  %v65 = pyc.reg %clk, %rst, %v63, %v62, %v64 : i5
  %v66 = pyc.alias %v65 {pyc.name = "out3_ctrl"} : i5
  %v67 = pyc.wire {pyc.name = "out0_seq__next"} : i16
  %v68 = pyc.constant 1 : i1
  %v69 = pyc.constant 0 : i16
  %v70 = pyc.reg %clk, %rst, %v68, %v67, %v69 : i16
  %v71 = pyc.alias %v70 {pyc.name = "out0_seq"} : i16
  %v72 = pyc.wire {pyc.name = "out1_seq__next"} : i16
  %v73 = pyc.constant 1 : i1
  %v74 = pyc.constant 0 : i16
  %v75 = pyc.reg %clk, %rst, %v73, %v72, %v74 : i16
  %v76 = pyc.alias %v75 {pyc.name = "out1_seq"} : i16
  %v77 = pyc.wire {pyc.name = "out2_seq__next"} : i16
  %v78 = pyc.constant 1 : i1
  %v79 = pyc.constant 0 : i16
  %v80 = pyc.reg %clk, %rst, %v78, %v77, %v79 : i16
  %v81 = pyc.alias %v80 {pyc.name = "out2_seq"} : i16
  %v82 = pyc.wire {pyc.name = "out3_seq__next"} : i16
  %v83 = pyc.constant 1 : i1
  %v84 = pyc.constant 0 : i16
  %v85 = pyc.reg %clk, %rst, %v83, %v82, %v84 : i16
  %v86 = pyc.alias %v85 {pyc.name = "out3_seq"} : i16
  %v87 = pyc.alias %v6 {pyc.name = "current_seq__module_01_input_collector__L53"} : i16
  %v88 = pyc.alias %lane0_vld {pyc.name = "offset_1__module_01_input_collector__L62"} : i1
  %v89 = pyc.add %v88, %lane1_vld : i1
  %v90 = pyc.alias %v89 {pyc.name = "offset_2__module_01_input_collector__L63"} : i1
  %v91 = pyc.add %v90, %lane2_vld : i1
  %v92 = pyc.alias %v91 {pyc.name = "offset_3__module_01_input_collector__L64"} : i1
  pyc.assign %v7, %lane0_vld : i1
  pyc.assign %v27, %lane0_data : i128
  pyc.assign %v47, %lane0_ctrl : i5
  %v93 = pyc.constant 0 : i16
  %v94 = pyc.add %v87, %v93 : i16
  pyc.assign %v67, %v94 : i16
  pyc.assign %v12, %lane1_vld : i1
  pyc.assign %v32, %lane1_data : i128
  pyc.assign %v52, %lane1_ctrl : i5
  %v95 = pyc.zext %v88 : i1 -> i16
  %v96 = pyc.add %v87, %v95 : i16
  pyc.assign %v72, %v96 : i16
  pyc.assign %v17, %lane2_vld : i1
  pyc.assign %v37, %lane2_data : i128
  pyc.assign %v57, %lane2_ctrl : i5
  %v97 = pyc.zext %v90 : i1 -> i16
  %v98 = pyc.add %v87, %v97 : i16
  pyc.assign %v77, %v98 : i16
  pyc.assign %v22, %lane3_vld : i1
  pyc.assign %v42, %lane3_data : i128
  pyc.assign %v62, %lane3_ctrl : i5
  %v99 = pyc.zext %v92 : i1 -> i16
  %v100 = pyc.add %v87, %v99 : i16
  pyc.assign %v82, %v100 : i16
  %v101 = pyc.add %lane0_vld, %lane1_vld : i1
  %v102 = pyc.add %v101, %lane2_vld : i1
  %v103 = pyc.add %v102, %lane3_vld : i1
  %v104 = pyc.alias %v103 {pyc.name = "total_input__module_01_input_collector__L76"} : i1
  %v105 = pyc.zext %v104 : i1 -> i16
  %v106 = pyc.add %v87, %v105 : i16
  pyc.assign %v1, %v106 : i16
  func.return %v11, %v31, %v51, %v71, %v16, %v36, %v56, %v76, %v21, %v41, %v61, %v81, %v26, %v46, %v66, %v86 : i1, i128, i5, i16, i1, i128, i5, i16, i1, i128, i5, i16, i1, i128, i5, i16
}

}

