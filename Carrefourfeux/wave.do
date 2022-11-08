onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tp2_1_vhd/RESET
add wave -noupdate /tp2_1_vhd/CLK
add wave -noupdate /tp2_1_vhd/uut/cpt1mhz
add wave -noupdate /tp2_1_vhd/uut/en1mhz
add wave -noupdate /tp2_1_vhd/uut/cpt130
add wave -noupdate /tp2_1_vhd/DETECTION
add wave -noupdate /tp2_1_vhd/Rp
add wave -noupdate /tp2_1_vhd/Op
add wave -noupdate /tp2_1_vhd/Vp
add wave -noupdate /tp2_1_vhd/Rs
add wave -noupdate /tp2_1_vhd/Os
add wave -noupdate /tp2_1_vhd/Vs
add wave -noupdate /tp2_1_vhd/uut/etat_ac
add wave -noupdate /tp2_1_vhd/uut/etat_fu
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {681 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 226
configure wave -valuecolwidth 202
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {7304 ps}
