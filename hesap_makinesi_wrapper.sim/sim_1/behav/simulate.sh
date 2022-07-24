#!/bin/bash -f
xv_path="/opt/Xilinx/NewFolder/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim hm_wrapper_behav -key {Behavioral:sim_1:Functional:hm_wrapper} -tclbatch hm_wrapper.tcl -log simulate.log
