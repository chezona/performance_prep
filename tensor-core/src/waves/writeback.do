onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /writeback_tb/CLK
add wave -noupdate -radix decimal /writeback_tb/test_num
add wave -noupdate -expand -group Inputs -expand -group Inputs -radix hexadecimal /writeback_tb/wbif/alu_wdat
add wave -noupdate -expand -group Inputs -expand -group Inputs -radix unsigned /writeback_tb/wbif/alu_reg_sel
add wave -noupdate -expand -group Inputs -expand -group Inputs -radix unsigned /writeback_tb/wbif/alu_done
add wave -noupdate -expand -group Inputs -expand -group {Load Inputs} -radix hexadecimal /writeback_tb/wbif/load_wdat
add wave -noupdate -expand -group Inputs -expand -group {Load Inputs} -radix unsigned /writeback_tb/wbif/load_reg_sel
add wave -noupdate -expand -group Inputs -expand -group {Load Inputs} -radix unsigned /writeback_tb/wbif/load_done
add wave -noupdate -expand -group Inputs -expand -group Branch -radix unsigned /writeback_tb/wbif/branch_spec
add wave -noupdate -expand -group Inputs -expand -group Branch -radix unsigned /writeback_tb/wbif/branch_correct
add wave -noupdate -expand -group Inputs -expand -group Branch -radix unsigned /writeback_tb/wbif/branch_mispredict
add wave -noupdate -expand -group WriteBack -radix unsigned /writeback_tb/DUT/wb_sel
add wave -noupdate -expand -group WriteBack -radix hexadecimal -childformat {{/writeback_tb/wbif/wb_out.reg_en -radix unsigned} {/writeback_tb/wbif/wb_out.reg_sel -radix unsigned} {/writeback_tb/wbif/wb_out.wdat -radix unsigned}} -expand -subitemconfig {/writeback_tb/wbif/wb_out.reg_en {-color Cyan -height 16 -radix unsigned} /writeback_tb/wbif/wb_out.reg_sel {-color Cyan -height 16 -radix unsigned} /writeback_tb/wbif/wb_out.wdat {-color Cyan -height 16 -radix unsigned}} /writeback_tb/wbif/wb_out
add wave -noupdate -expand -group {ALU Buffer} -radix hexadecimal -childformat {{/writeback_tb/DUT/alu_din.reg_en -radix unsigned} {/writeback_tb/DUT/alu_din.reg_sel -radix unsigned} {/writeback_tb/DUT/alu_din.wdat -radix unsigned}} -expand -subitemconfig {/writeback_tb/DUT/alu_din.reg_en {-height 16 -radix unsigned} /writeback_tb/DUT/alu_din.reg_sel {-height 16 -radix unsigned} /writeback_tb/DUT/alu_din.wdat {-height 16 -radix unsigned}} /writeback_tb/DUT/alu_din
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned -childformat {{/writeback_tb/DUT/alu_dout.reg_en -radix unsigned} {/writeback_tb/DUT/alu_dout.reg_sel -radix unsigned} {/writeback_tb/DUT/alu_dout.wdat -radix unsigned}} -expand -subitemconfig {/writeback_tb/DUT/alu_dout.reg_en {-height 16 -radix unsigned} /writeback_tb/DUT/alu_dout.reg_sel {-height 16 -radix unsigned} /writeback_tb/DUT/alu_dout.wdat {-height 16 -radix unsigned}} /writeback_tb/DUT/alu_dout
add wave -noupdate -expand -group {ALU Buffer} /writeback_tb/DUT/alu_write
add wave -noupdate -expand -group {ALU Buffer} /writeback_tb/DUT/alu_read
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned /writeback_tb/DUT/alu_wptr
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned /writeback_tb/DUT/alu_rptr
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned /writeback_tb/DUT/alu_count
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned /writeback_tb/DUT/alu_full
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned /writeback_tb/DUT/alu_empty
add wave -noupdate -expand -group {ALU Buffer} -radix unsigned -childformat {{{/writeback_tb/DUT/alu_buffer[30]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[29]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[28]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[27]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[26]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[25]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[24]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[23]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[22]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[21]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[20]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[19]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[18]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[17]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[16]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[15]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[14]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[13]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[12]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[11]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[10]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[9]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[8]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[7]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[6]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[5]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[4]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[3]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[2]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[1]} -radix unsigned} {{/writeback_tb/DUT/alu_buffer[0]} -radix unsigned}} -subitemconfig {{/writeback_tb/DUT/alu_buffer[30]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[29]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[28]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[27]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[26]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[25]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[24]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[23]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[22]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[21]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[20]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[19]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[18]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[17]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[16]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[15]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[14]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[13]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[12]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[11]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[10]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[9]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[8]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[7]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[6]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[5]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[4]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[3]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[2]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[1]} {-height 16 -radix unsigned} {/writeback_tb/DUT/alu_buffer[0]} {-height 16 -radix unsigned}} /writeback_tb/DUT/alu_buffer
add wave -noupdate -expand -group {Load Buffer} -radix unsigned -childformat {{/writeback_tb/DUT/load_din.reg_en -radix unsigned} {/writeback_tb/DUT/load_din.reg_sel -radix unsigned} {/writeback_tb/DUT/load_din.wdat -radix unsigned}} -expand -subitemconfig {/writeback_tb/DUT/load_din.reg_en {-height 16 -radix unsigned} /writeback_tb/DUT/load_din.reg_sel {-height 16 -radix unsigned} /writeback_tb/DUT/load_din.wdat {-height 16 -radix unsigned}} /writeback_tb/DUT/load_din
add wave -noupdate -expand -group {Load Buffer} -radix unsigned -childformat {{/writeback_tb/DUT/load_dout.reg_en -radix unsigned} {/writeback_tb/DUT/load_dout.reg_sel -radix unsigned} {/writeback_tb/DUT/load_dout.wdat -radix unsigned}} -expand -subitemconfig {/writeback_tb/DUT/load_dout.reg_en {-height 16 -radix unsigned} /writeback_tb/DUT/load_dout.reg_sel {-height 16 -radix unsigned} /writeback_tb/DUT/load_dout.wdat {-height 16 -radix unsigned}} /writeback_tb/DUT/load_dout
add wave -noupdate -expand -group {Load Buffer} /writeback_tb/DUT/load_write
add wave -noupdate -expand -group {Load Buffer} /writeback_tb/DUT/load_read
add wave -noupdate -expand -group {Load Buffer} -radix unsigned /writeback_tb/DUT/load_wptr
add wave -noupdate -expand -group {Load Buffer} -radix unsigned /writeback_tb/DUT/load_rptr
add wave -noupdate -expand -group {Load Buffer} -radix unsigned /writeback_tb/DUT/load_count
add wave -noupdate -expand -group {Load Buffer} -radix unsigned /writeback_tb/DUT/load_empty
add wave -noupdate -expand -group {Load Buffer} -radix unsigned /writeback_tb/DUT/load_full
add wave -noupdate -expand -group {Load Buffer} -radix unsigned /writeback_tb/DUT/load_buffer
add wave -noupdate -expand -group Speculative -radix unsigned /writeback_tb/DUT/state
add wave -noupdate -expand -group Speculative -radix unsigned /writeback_tb/DUT/spec_alu_wptr
add wave -noupdate -expand -group Speculative /writeback_tb/DUT/spec_write
add wave -noupdate -expand -group Speculative /writeback_tb/DUT/clean_count
add wave -noupdate -expand -group Jump /writeback_tb/DUT/jump_din
add wave -noupdate -expand -group Jump /writeback_tb/wbif/jump_wdat
add wave -noupdate -expand -group Jump /writeback_tb/wbif/jump_done
add wave -noupdate -expand -group Jump /writeback_tb/wbif/jump_reg_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {848179 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1328583 ps} {1345865 ps}
