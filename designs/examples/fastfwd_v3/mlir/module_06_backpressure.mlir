module attributes {pyc.top = @backpressure_generator, pyc.frontend.contract = "pycircuit"} {
func.func @backpressure_generator(%clk: !pyc.clock, %rst: !pyc.reset, %rob_count: i6) -> i1 attributes {arg_names = ["clk", "rst", "rob_count"], result_names = ["bkpr_o"], pyc.base = "backpressure_generator", pyc.params = "{}", pyc.kind = "module", pyc.inline = "false"} {
  %v1 = pyc.alias %rob_count {pyc.name = "rob_count__module_06_backpressure__L37"} : i6
  %v2 = pyc.constant 28 : i6
  %v3 = pyc.ult %v1, %v2 : i6
  %v4 = pyc.not %v3 : i1
  %v5 = pyc.alias %v4 {pyc.name = "need_bkpr__module_06_backpressure__L44"} : i1
  %v6 = pyc.wire {pyc.name = "pkt_in_bkpr__next"} : i1
  %v7 = pyc.constant 1 : i1
  %v8 = pyc.constant 0 : i1
  %v9 = pyc.reg %clk, %rst, %v7, %v6, %v8 : i1
  %v10 = pyc.alias %v9 {pyc.name = "pkt_in_bkpr"} : i1
  %v11 = pyc.alias %v10 {pyc.name = "bkpr__module_06_backpressure__L47"} : i1
  pyc.assign %v6, %v5 : i1
  func.return %v11 : i1
}

}

