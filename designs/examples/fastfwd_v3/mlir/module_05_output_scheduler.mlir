module attributes {pyc.top = @output_scheduler, pyc.frontend.contract = "pycircuit"} {
func.func @output_scheduler(%clk: !pyc.clock, %rst: !pyc.reset, %in_vld: i1, %in_data: i128, %in_seq: i16) -> (i1, i128, i1, i128, i1, i128, i1, i128) attributes {arg_names = ["clk", "rst", "in_vld", "in_data", "in_seq"], result_names = ["lane0_vld", "lane0_data", "lane1_vld", "lane1_data", "lane2_vld", "lane2_data", "lane3_vld", "lane3_data"], pyc.base = "output_scheduler", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.alias %in_vld {pyc.name = "in_vld__module_05_output_scheduler__L39"} : i1
  %v2 = pyc.alias %in_data {pyc.name = "in_data__module_05_output_scheduler__L40"} : i128
  %v3 = pyc.alias %in_seq {pyc.name = "in_seq__module_05_output_scheduler__L41"} : i16
  %v4 = pyc.wire {pyc.name = "out_ptr__next"} : i2
  %v5 = pyc.constant 1 : i1
  %v6 = pyc.constant 0 : i2
  %v7 = pyc.reg %clk, %rst, %v5, %v4, %v6 : i2
  %v8 = pyc.alias %v7 {pyc.name = "out_ptr"} : i2
  %v9 = pyc.alias %v8 {pyc.name = "out_ptr__module_05_output_scheduler__L44"} : i2
  %v10 = pyc.wire {pyc.name = "lane0_out_vld__next"} : i1
  %v11 = pyc.constant 1 : i1
  %v12 = pyc.constant 0 : i1
  %v13 = pyc.reg %clk, %rst, %v11, %v10, %v12 : i1
  %v14 = pyc.alias %v13 {pyc.name = "lane0_out_vld"} : i1
  %v15 = pyc.wire {pyc.name = "lane1_out_vld__next"} : i1
  %v16 = pyc.constant 1 : i1
  %v17 = pyc.constant 0 : i1
  %v18 = pyc.reg %clk, %rst, %v16, %v15, %v17 : i1
  %v19 = pyc.alias %v18 {pyc.name = "lane1_out_vld"} : i1
  %v20 = pyc.wire {pyc.name = "lane2_out_vld__next"} : i1
  %v21 = pyc.constant 1 : i1
  %v22 = pyc.constant 0 : i1
  %v23 = pyc.reg %clk, %rst, %v21, %v20, %v22 : i1
  %v24 = pyc.alias %v23 {pyc.name = "lane2_out_vld"} : i1
  %v25 = pyc.wire {pyc.name = "lane3_out_vld__next"} : i1
  %v26 = pyc.constant 1 : i1
  %v27 = pyc.constant 0 : i1
  %v28 = pyc.reg %clk, %rst, %v26, %v25, %v27 : i1
  %v29 = pyc.alias %v28 {pyc.name = "lane3_out_vld"} : i1
  %v30 = pyc.wire {pyc.name = "lane0_out_data__next"} : i128
  %v31 = pyc.constant 1 : i1
  %v32 = pyc.constant 0 : i128
  %v33 = pyc.reg %clk, %rst, %v31, %v30, %v32 : i128
  %v34 = pyc.alias %v33 {pyc.name = "lane0_out_data"} : i128
  %v35 = pyc.wire {pyc.name = "lane1_out_data__next"} : i128
  %v36 = pyc.constant 1 : i1
  %v37 = pyc.constant 0 : i128
  %v38 = pyc.reg %clk, %rst, %v36, %v35, %v37 : i128
  %v39 = pyc.alias %v38 {pyc.name = "lane1_out_data"} : i128
  %v40 = pyc.wire {pyc.name = "lane2_out_data__next"} : i128
  %v41 = pyc.constant 1 : i1
  %v42 = pyc.constant 0 : i128
  %v43 = pyc.reg %clk, %rst, %v41, %v40, %v42 : i128
  %v44 = pyc.alias %v43 {pyc.name = "lane2_out_data"} : i128
  %v45 = pyc.wire {pyc.name = "lane3_out_data__next"} : i128
  %v46 = pyc.constant 1 : i1
  %v47 = pyc.constant 0 : i128
  %v48 = pyc.reg %clk, %rst, %v46, %v45, %v47 : i128
  %v49 = pyc.alias %v48 {pyc.name = "lane3_out_data"} : i128
  %v50 = pyc.alias %v9 {pyc.name = "ptr__module_05_output_scheduler__L51"} : i2
  %v51 = pyc.constant 0 : i2
  %v52 = pyc.eq %v50, %v51 : i2
  %v53 = pyc.alias %v52 {pyc.name = "match__module_05_output_scheduler__L55"} : i1
  %v54 = pyc.and %v53, %v1 : i1
  pyc.assign %v10, %v54 : i1
  %v55 = pyc.and %v53, %v1 : i1
  %v56 = pyc.constant 0 : i128
  %v57 = pyc.mux %v55, %v2, %v56 : i128
  pyc.assign %v30, %v57 : i128
  %v58 = pyc.constant 1 : i2
  %v59 = pyc.eq %v50, %v58 : i2
  %v60 = pyc.alias %v59 {pyc.name = "match__module_05_output_scheduler__L55"} : i1
  %v61 = pyc.and %v60, %v1 : i1
  pyc.assign %v15, %v61 : i1
  %v62 = pyc.and %v60, %v1 : i1
  %v63 = pyc.constant 0 : i128
  %v64 = pyc.mux %v62, %v2, %v63 : i128
  pyc.assign %v35, %v64 : i128
  %v65 = pyc.constant 2 : i2
  %v66 = pyc.eq %v50, %v65 : i2
  %v67 = pyc.alias %v66 {pyc.name = "match__module_05_output_scheduler__L55"} : i1
  %v68 = pyc.and %v67, %v1 : i1
  pyc.assign %v20, %v68 : i1
  %v69 = pyc.and %v67, %v1 : i1
  %v70 = pyc.constant 0 : i128
  %v71 = pyc.mux %v69, %v2, %v70 : i128
  pyc.assign %v40, %v71 : i128
  %v72 = pyc.constant 3 : i2
  %v73 = pyc.eq %v50, %v72 : i2
  %v74 = pyc.alias %v73 {pyc.name = "match__module_05_output_scheduler__L55"} : i1
  %v75 = pyc.and %v74, %v1 : i1
  pyc.assign %v25, %v75 : i1
  %v76 = pyc.and %v74, %v1 : i1
  %v77 = pyc.constant 0 : i128
  %v78 = pyc.mux %v76, %v2, %v77 : i128
  pyc.assign %v45, %v78 : i128
  %v79 = pyc.or %v14, %v19 : i1
  %v80 = pyc.or %v79, %v24 : i1
  %v81 = pyc.or %v80, %v29 : i1
  %v82 = pyc.alias %v81 {pyc.name = "any_out__module_05_output_scheduler__L60"} : i1
  %v83 = pyc.constant 1 : i2
  %v84 = pyc.add %v50, %v83 : i2
  %v85 = pyc.constant 3 : i2
  %v86 = pyc.and %v84, %v85 : i2
  %v87 = pyc.alias %v86 {pyc.name = "new_ptr__module_05_output_scheduler__L61"} : i2
  %v88 = pyc.mux %v82, %v87, %v50 : i2
  pyc.assign %v4, %v88 : i2
  func.return %v14, %v34, %v19, %v39, %v24, %v44, %v29, %v49 : i1, i128, i1, i128, i1, i128, i1, i128
}

}

