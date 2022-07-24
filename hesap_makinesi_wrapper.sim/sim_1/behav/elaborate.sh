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
ExecStep $xv_path/bin/xelab -wto c08445b05ae04c1b99de503c07db5686 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip --snapshot hm_wrapper_behav xil_defaultlib.hm_wrapper xil_defaultlib.glbl -log elaborate.log
