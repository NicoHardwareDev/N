k# --- CONFIGURACIÓN DE RELOJ (Asumiendo oscilador de 100MHz) ---
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports clk]

# --- CONFIGURACIÓN DE RESET ---
# Asignado al interruptor (switch) más a la izquierda
set_property PACKAGE_PIN V17 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# --- SALIDAS A LEDS (data_out[7:0]) ---
set_property PACKAGE_PIN U16 [get_ports {data_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {data_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {data_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {data_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {data_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[4]}]
set_property PACKAGE_PIN U15 [get_ports {data_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[5]}]
set_property PACKAGE_PIN U14 [get_ports {data_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[6]}]
set_property PACKAGE_PIN V14 [get_ports {data_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[7]}]

# --- OPCIONAL: Mapeo de PC a otros LEDs (Ej: PC en los siguientes 4) ---
set_property PACKAGE_PIN V13 [get_ports {pc_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pc_out[0]}]
set_property PACKAGE_PIN V3  [get_ports {pc_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pc_out[1]}]
set_property PACKAGE_PIN W3  [get_ports {pc_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pc_out[2]}]
set_property PACKAGE_PIN U3  [get_ports {pc_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pc_out[3]}]
