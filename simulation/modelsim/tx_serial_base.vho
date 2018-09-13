-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "09/12/2018 10:26:03"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	tx_serial_base IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	partida : IN std_logic;
	paridade : IN std_logic;
	dados_ascii : IN std_logic_vector(6 DOWNTO 0);
	saida_serial : OUT std_logic;
	pronto : OUT std_logic;
	o_paridade : OUT std_logic;
	o_clock : OUT std_logic;
	hex1 : OUT std_logic_vector(6 DOWNTO 0);
	hex0 : OUT std_logic_vector(6 DOWNTO 0)
	);
END tx_serial_base;

-- Design Ports Information
-- saida_serial	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pronto	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_paridade	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_clock	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[0]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[1]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[2]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[3]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[4]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[5]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[6]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[0]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[1]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[2]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[3]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[4]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[5]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[6]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[4]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[5]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- paridade	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[0]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[1]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- partida	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF tx_serial_base IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_partida : std_logic;
SIGNAL ww_paridade : std_logic;
SIGNAL ww_dados_ascii : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_saida_serial : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL ww_o_paridade : std_logic;
SIGNAL ww_o_clock : std_logic;
SIGNAL ww_hex1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \partida~input_o\ : std_logic;
SIGNAL \U2|U2|IQ[0]~3_combout\ : std_logic;
SIGNAL \U2|U2|IQ~1_combout\ : std_logic;
SIGNAL \U2|U2|IQ[2]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|IQ~0_combout\ : std_logic;
SIGNAL \U1|Selector1~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \U1|Sreg.transmissao~q\ : std_logic;
SIGNAL \U2|U2|IQ[1]~2_combout\ : std_logic;
SIGNAL \U2|U2|IQ[1]~DUPLICATE_q\ : std_logic;
SIGNAL \U1|Snext.final~0_combout\ : std_logic;
SIGNAL \U1|Sreg.final~q\ : std_logic;
SIGNAL \U1|Selector0~0_combout\ : std_logic;
SIGNAL \U1|Sreg.inicial~q\ : std_logic;
SIGNAL \U1|Snext.preparacao~0_combout\ : std_logic;
SIGNAL \U1|Sreg.preparacao~q\ : std_logic;
SIGNAL \dados_ascii[0]~input_o\ : std_logic;
SIGNAL \dados_ascii[1]~input_o\ : std_logic;
SIGNAL \dados_ascii[2]~input_o\ : std_logic;
SIGNAL \dados_ascii[3]~input_o\ : std_logic;
SIGNAL \dados_ascii[4]~input_o\ : std_logic;
SIGNAL \dados_ascii[5]~input_o\ : std_logic;
SIGNAL \dados_ascii[6]~input_o\ : std_logic;
SIGNAL \paridade~input_o\ : std_logic;
SIGNAL \U2|D[9]~0_combout\ : std_logic;
SIGNAL \U2|U1|IQ~10_combout\ : std_logic;
SIGNAL \U2|U1|IQ~9_combout\ : std_logic;
SIGNAL \U2|U1|IQ[0]~1_combout\ : std_logic;
SIGNAL \U2|U1|IQ~8_combout\ : std_logic;
SIGNAL \U2|U1|IQ~7_combout\ : std_logic;
SIGNAL \U2|U1|IQ~6_combout\ : std_logic;
SIGNAL \U2|U1|IQ~5_combout\ : std_logic;
SIGNAL \U2|U1|IQ~4_combout\ : std_logic;
SIGNAL \U2|U1|IQ~3_combout\ : std_logic;
SIGNAL \U2|U1|IQ~2_combout\ : std_logic;
SIGNAL \U2|U1|IQ~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux6~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux5~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux4~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux3~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux2~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux1~0_combout\ : std_logic;
SIGNAL \U2|H1|Mux0~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux6~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux5~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux4~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux3~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux2~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux1~0_combout\ : std_logic;
SIGNAL \U2|H0|Mux0~0_combout\ : std_logic;
SIGNAL \U2|U1|IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U2|U2|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U2|D\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_partida~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_paridade~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[4]~input_o\ : std_logic;
SIGNAL \U2|U1|ALT_INV_IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U1|ALT_INV_Sreg.inicial~q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U1|ALT_INV_Sreg.transmissao~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.preparacao~q\ : std_logic;
SIGNAL \U2|H0|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \U2|H1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \U2|ALT_INV_D[9]~0_combout\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.final~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_partida <= partida;
ww_paridade <= paridade;
ww_dados_ascii <= dados_ascii;
saida_serial <= ww_saida_serial;
pronto <= ww_pronto;
o_paridade <= ww_o_paridade;
o_clock <= ww_o_clock;
hex1 <= ww_hex1;
hex0 <= ww_hex0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\ <= NOT \U2|U2|IQ[1]~DUPLICATE_q\;
\U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\ <= NOT \U2|U2|IQ[2]~DUPLICATE_q\;
\ALT_INV_partida~input_o\ <= NOT \partida~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_dados_ascii[6]~input_o\ <= NOT \dados_ascii[6]~input_o\;
\ALT_INV_dados_ascii[3]~input_o\ <= NOT \dados_ascii[3]~input_o\;
\ALT_INV_dados_ascii[2]~input_o\ <= NOT \dados_ascii[2]~input_o\;
\ALT_INV_dados_ascii[1]~input_o\ <= NOT \dados_ascii[1]~input_o\;
\ALT_INV_dados_ascii[0]~input_o\ <= NOT \dados_ascii[0]~input_o\;
\ALT_INV_paridade~input_o\ <= NOT \paridade~input_o\;
\ALT_INV_dados_ascii[5]~input_o\ <= NOT \dados_ascii[5]~input_o\;
\ALT_INV_dados_ascii[4]~input_o\ <= NOT \dados_ascii[4]~input_o\;
\U2|U1|ALT_INV_IQ\(9) <= NOT \U2|U1|IQ\(9);
\U2|U1|ALT_INV_IQ\(8) <= NOT \U2|U1|IQ\(8);
\U2|U1|ALT_INV_IQ\(7) <= NOT \U2|U1|IQ\(7);
\U2|U1|ALT_INV_IQ\(6) <= NOT \U2|U1|IQ\(6);
\U2|U1|ALT_INV_IQ\(5) <= NOT \U2|U1|IQ\(5);
\U2|U1|ALT_INV_IQ\(4) <= NOT \U2|U1|IQ\(4);
\U2|U1|ALT_INV_IQ\(3) <= NOT \U2|U1|IQ\(3);
\U1|ALT_INV_Sreg.inicial~q\ <= NOT \U1|Sreg.inicial~q\;
\U2|U1|ALT_INV_IQ\(2) <= NOT \U2|U1|IQ\(2);
\U2|U2|ALT_INV_IQ\(1) <= NOT \U2|U2|IQ\(1);
\U2|U2|ALT_INV_IQ\(0) <= NOT \U2|U2|IQ\(0);
\U2|U2|ALT_INV_IQ\(2) <= NOT \U2|U2|IQ\(2);
\U2|U2|ALT_INV_IQ\(3) <= NOT \U2|U2|IQ\(3);
\U1|ALT_INV_Sreg.transmissao~q\ <= NOT \U1|Sreg.transmissao~q\;
\U1|ALT_INV_Sreg.preparacao~q\ <= NOT \U1|Sreg.preparacao~q\;
\U2|U1|ALT_INV_IQ\(1) <= NOT \U2|U1|IQ\(1);
\U2|H0|ALT_INV_Mux0~0_combout\ <= NOT \U2|H0|Mux0~0_combout\;
\U2|H1|ALT_INV_Mux1~0_combout\ <= NOT \U2|H1|Mux1~0_combout\;
\U2|ALT_INV_D[9]~0_combout\ <= NOT \U2|D[9]~0_combout\;
\U1|ALT_INV_Sreg.final~q\ <= NOT \U1|Sreg.final~q\;
\U2|U1|ALT_INV_IQ\(0) <= NOT \U2|U1|IQ\(0);

-- Location: IOOBUF_X44_Y45_N36
\saida_serial~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U1|ALT_INV_IQ\(0),
	devoe => ww_devoe,
	o => ww_saida_serial);

-- Location: IOOBUF_X0_Y18_N79
\pronto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|Sreg.final~q\,
	devoe => ww_devoe,
	o => ww_pronto);

-- Location: IOOBUF_X0_Y20_N56
\o_paridade~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|D\(9),
	devoe => ww_devoe,
	o => ww_o_paridade);

-- Location: IOOBUF_X0_Y20_N39
\o_clock~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \clock~inputCLKENA0_outclk\,
	devoe => ww_devoe,
	o => ww_o_clock);

-- Location: IOOBUF_X44_Y0_N36
\hex1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(0));

-- Location: IOOBUF_X40_Y0_N93
\hex1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(1));

-- Location: IOOBUF_X44_Y0_N53
\hex1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(2));

-- Location: IOOBUF_X43_Y0_N36
\hex1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(3));

-- Location: IOOBUF_X38_Y0_N36
\hex1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(4));

-- Location: IOOBUF_X43_Y0_N53
\hex1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(5));

-- Location: IOOBUF_X51_Y0_N53
\hex1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H1|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex1(6));

-- Location: IOOBUF_X52_Y0_N53
\hex0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(0));

-- Location: IOOBUF_X51_Y0_N36
\hex0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(1));

-- Location: IOOBUF_X48_Y0_N76
\hex0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(2));

-- Location: IOOBUF_X50_Y0_N36
\hex0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(3));

-- Location: IOOBUF_X48_Y0_N93
\hex0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(4));

-- Location: IOOBUF_X50_Y0_N53
\hex0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(5));

-- Location: IOOBUF_X46_Y0_N36
\hex0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|H0|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_hex0(6));

-- Location: IOIBUF_X36_Y45_N52
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G13
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X42_Y45_N35
\partida~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_partida,
	o => \partida~input_o\);

-- Location: LABCELL_X41_Y1_N42
\U2|U2|IQ[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ[0]~3_combout\ = !\U2|U2|IQ\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U2|ALT_INV_IQ\(0),
	combout => \U2|U2|IQ[0]~3_combout\);

-- Location: FF_X41_Y1_N44
\U2|U2|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|IQ[0]~3_combout\,
	clrn => \U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|IQ\(0));

-- Location: FF_X41_Y1_N52
\U2|U2|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|IQ~1_combout\,
	clrn => \U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|IQ\(2));

-- Location: LABCELL_X41_Y1_N51
\U2|U2|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ~1_combout\ = ( \U2|U2|IQ[1]~DUPLICATE_q\ & ( (!\U2|U2|IQ\(0) & ((\U2|U2|IQ\(2)))) # (\U2|U2|IQ\(0) & (!\U2|U2|IQ\(3) & !\U2|U2|IQ\(2))) ) ) # ( !\U2|U2|IQ[1]~DUPLICATE_q\ & ( \U2|U2|IQ\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100110000110011000011000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U2|ALT_INV_IQ\(0),
	datac => \U2|U2|ALT_INV_IQ\(3),
	datad => \U2|U2|ALT_INV_IQ\(2),
	dataf => \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\,
	combout => \U2|U2|IQ~1_combout\);

-- Location: FF_X41_Y1_N53
\U2|U2|IQ[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|IQ~1_combout\,
	clrn => \U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|IQ[2]~DUPLICATE_q\);

-- Location: LABCELL_X41_Y1_N6
\U2|U2|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ~0_combout\ = ( \U2|U2|IQ[1]~DUPLICATE_q\ & ( (!\U2|U2|IQ\(0) & ((\U2|U2|IQ\(3)))) # (\U2|U2|IQ\(0) & (\U2|U2|IQ[2]~DUPLICATE_q\ & !\U2|U2|IQ\(3))) ) ) # ( !\U2|U2|IQ[1]~DUPLICATE_q\ & ( \U2|U2|IQ\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011110011000000001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U2|ALT_INV_IQ\(0),
	datac => \U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\,
	datad => \U2|U2|ALT_INV_IQ\(3),
	dataf => \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\,
	combout => \U2|U2|IQ~0_combout\);

-- Location: FF_X41_Y1_N8
\U2|U2|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|IQ~0_combout\,
	clrn => \U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|IQ\(3));

-- Location: FF_X41_Y1_N59
\U2|U2|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|IQ[1]~2_combout\,
	clrn => \U1|ALT_INV_Sreg.preparacao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|IQ\(1));

-- Location: LABCELL_X41_Y1_N15
\U1|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector1~0_combout\ = ( \U2|U2|IQ\(1) & ( \U1|Sreg.transmissao~q\ & ( ((!\U2|U2|IQ\(3)) # ((!\U2|U2|IQ\(0)) # (\U2|U2|IQ[2]~DUPLICATE_q\))) # (\U1|Sreg.preparacao~q\) ) ) ) # ( !\U2|U2|IQ\(1) & ( \U1|Sreg.transmissao~q\ ) ) # ( \U2|U2|IQ\(1) & ( 
-- !\U1|Sreg.transmissao~q\ & ( \U1|Sreg.preparacao~q\ ) ) ) # ( !\U2|U2|IQ\(1) & ( !\U1|Sreg.transmissao~q\ & ( \U1|Sreg.preparacao~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_Sreg.preparacao~q\,
	datab => \U2|U2|ALT_INV_IQ\(3),
	datac => \U2|U2|ALT_INV_IQ\(0),
	datad => \U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\,
	datae => \U2|U2|ALT_INV_IQ\(1),
	dataf => \U1|ALT_INV_Sreg.transmissao~q\,
	combout => \U1|Selector1~0_combout\);

-- Location: IOIBUF_X36_Y45_N35
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X40_Y1_N53
\U1|Sreg.transmissao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1|Selector1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.transmissao~q\);

-- Location: LABCELL_X41_Y1_N57
\U2|U2|IQ[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ[1]~2_combout\ = ( \U2|U2|IQ\(0) & ( !\U1|Sreg.transmissao~q\ $ (!\U2|U2|IQ\(1)) ) ) # ( !\U2|U2|IQ\(0) & ( \U2|U2|IQ\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|ALT_INV_Sreg.transmissao~q\,
	datad => \U2|U2|ALT_INV_IQ\(1),
	dataf => \U2|U2|ALT_INV_IQ\(0),
	combout => \U2|U2|IQ[1]~2_combout\);

-- Location: FF_X41_Y1_N58
\U2|U2|IQ[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|IQ[1]~2_combout\,
	clrn => \U1|ALT_INV_Sreg.preparacao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|IQ[1]~DUPLICATE_q\);

-- Location: LABCELL_X41_Y1_N27
\U1|Snext.final~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.final~0_combout\ = ( \U2|U2|IQ\(0) & ( (\U2|U2|IQ[1]~DUPLICATE_q\ & (\U1|Sreg.transmissao~q\ & (\U2|U2|IQ\(3) & !\U2|U2|IQ\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\,
	datab => \U1|ALT_INV_Sreg.transmissao~q\,
	datac => \U2|U2|ALT_INV_IQ\(3),
	datad => \U2|U2|ALT_INV_IQ\(2),
	dataf => \U2|U2|ALT_INV_IQ\(0),
	combout => \U1|Snext.final~0_combout\);

-- Location: FF_X41_Y1_N28
\U1|Sreg.final\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Snext.final~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.final~q\);

-- Location: LABCELL_X41_Y1_N18
\U1|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector0~0_combout\ = ( !\U1|Sreg.final~q\ & ( (\U1|Sreg.inicial~q\) # (\partida~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_partida~input_o\,
	datad => \U1|ALT_INV_Sreg.inicial~q\,
	dataf => \U1|ALT_INV_Sreg.final~q\,
	combout => \U1|Selector0~0_combout\);

-- Location: FF_X41_Y1_N20
\U1|Sreg.inicial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.inicial~q\);

-- Location: LABCELL_X41_Y1_N24
\U1|Snext.preparacao~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.preparacao~0_combout\ = ( !\U1|Sreg.inicial~q\ & ( \partida~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_partida~input_o\,
	dataf => \U1|ALT_INV_Sreg.inicial~q\,
	combout => \U1|Snext.preparacao~0_combout\);

-- Location: FF_X41_Y1_N26
\U1|Sreg.preparacao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Snext.preparacao~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.preparacao~q\);

-- Location: IOIBUF_X33_Y0_N41
\dados_ascii[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(0),
	o => \dados_ascii[0]~input_o\);

-- Location: IOIBUF_X33_Y0_N58
\dados_ascii[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(1),
	o => \dados_ascii[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\dados_ascii[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(2),
	o => \dados_ascii[2]~input_o\);

-- Location: IOIBUF_X34_Y0_N18
\dados_ascii[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(3),
	o => \dados_ascii[3]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\dados_ascii[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(4),
	o => \dados_ascii[4]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\dados_ascii[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(5),
	o => \dados_ascii[5]~input_o\);

-- Location: IOIBUF_X34_Y0_N52
\dados_ascii[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(6),
	o => \dados_ascii[6]~input_o\);

-- Location: IOIBUF_X33_Y0_N75
\paridade~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_paridade,
	o => \paridade~input_o\);

-- Location: LABCELL_X40_Y1_N51
\U2|D[9]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|D[9]~0_combout\ = ( \dados_ascii[1]~input_o\ & ( \dados_ascii[2]~input_o\ & ( !\dados_ascii[3]~input_o\ $ (!\dados_ascii[6]~input_o\ $ (!\paridade~input_o\ $ (!\dados_ascii[0]~input_o\))) ) ) ) # ( !\dados_ascii[1]~input_o\ & ( 
-- \dados_ascii[2]~input_o\ & ( !\dados_ascii[3]~input_o\ $ (!\dados_ascii[6]~input_o\ $ (!\paridade~input_o\ $ (\dados_ascii[0]~input_o\))) ) ) ) # ( \dados_ascii[1]~input_o\ & ( !\dados_ascii[2]~input_o\ & ( !\dados_ascii[3]~input_o\ $ 
-- (!\dados_ascii[6]~input_o\ $ (!\paridade~input_o\ $ (\dados_ascii[0]~input_o\))) ) ) ) # ( !\dados_ascii[1]~input_o\ & ( !\dados_ascii[2]~input_o\ & ( !\dados_ascii[3]~input_o\ $ (!\dados_ascii[6]~input_o\ $ (!\paridade~input_o\ $ 
-- (!\dados_ascii[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110100101100110100110010110011010010110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[3]~input_o\,
	datab => \ALT_INV_dados_ascii[6]~input_o\,
	datac => \ALT_INV_paridade~input_o\,
	datad => \ALT_INV_dados_ascii[0]~input_o\,
	datae => \ALT_INV_dados_ascii[1]~input_o\,
	dataf => \ALT_INV_dados_ascii[2]~input_o\,
	combout => \U2|D[9]~0_combout\);

-- Location: LABCELL_X40_Y1_N57
\U2|U1|IQ~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~10_combout\ = ( \U2|U1|IQ\(9) & ( \U1|Sreg.preparacao~q\ & ( !\dados_ascii[4]~input_o\ $ (!\dados_ascii[5]~input_o\ $ (!\U2|D[9]~0_combout\)) ) ) ) # ( !\U2|U1|IQ\(9) & ( \U1|Sreg.preparacao~q\ & ( !\dados_ascii[4]~input_o\ $ 
-- (!\dados_ascii[5]~input_o\ $ (!\U2|D[9]~0_combout\)) ) ) ) # ( \U2|U1|IQ\(9) & ( !\U1|Sreg.preparacao~q\ & ( !\U1|Sreg.transmissao~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000010010110100101101001011010010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datac => \U2|ALT_INV_D[9]~0_combout\,
	datad => \U1|ALT_INV_Sreg.transmissao~q\,
	datae => \U2|U1|ALT_INV_IQ\(9),
	dataf => \U1|ALT_INV_Sreg.preparacao~q\,
	combout => \U2|U1|IQ~10_combout\);

-- Location: FF_X40_Y1_N58
\U2|U1|IQ[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~10_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(9));

-- Location: LABCELL_X40_Y1_N24
\U2|U1|IQ~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~9_combout\ = ( \U2|U1|IQ\(9) & ( (!\dados_ascii[6]~input_o\) # (!\U1|Sreg.preparacao~q\) ) ) # ( !\U2|U1|IQ\(9) & ( (!\dados_ascii[6]~input_o\ & \U1|Sreg.preparacao~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011111111110011001111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_dados_ascii[6]~input_o\,
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(9),
	combout => \U2|U1|IQ~9_combout\);

-- Location: LABCELL_X40_Y1_N18
\U2|U1|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ[0]~1_combout\ = ( \U1|Sreg.preparacao~q\ ) # ( !\U1|Sreg.preparacao~q\ & ( \U1|Sreg.transmissao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|ALT_INV_Sreg.transmissao~q\,
	dataf => \U1|ALT_INV_Sreg.preparacao~q\,
	combout => \U2|U1|IQ[0]~1_combout\);

-- Location: FF_X40_Y1_N25
\U2|U1|IQ[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~9_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(8));

-- Location: LABCELL_X40_Y1_N12
\U2|U1|IQ~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~8_combout\ = ( \U2|U1|IQ\(8) & ( (!\dados_ascii[5]~input_o\) # (!\U1|Sreg.preparacao~q\) ) ) # ( !\U2|U1|IQ\(8) & ( (!\dados_ascii[5]~input_o\ & \U1|Sreg.preparacao~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011111111110011001111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(8),
	combout => \U2|U1|IQ~8_combout\);

-- Location: FF_X40_Y1_N14
\U2|U1|IQ[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~8_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(7));

-- Location: LABCELL_X40_Y1_N27
\U2|U1|IQ~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~7_combout\ = ( \U1|Sreg.preparacao~q\ & ( !\dados_ascii[4]~input_o\ ) ) # ( !\U1|Sreg.preparacao~q\ & ( \U2|U1|IQ\(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datac => \U2|U1|ALT_INV_IQ\(7),
	dataf => \U1|ALT_INV_Sreg.preparacao~q\,
	combout => \U2|U1|IQ~7_combout\);

-- Location: FF_X40_Y1_N29
\U2|U1|IQ[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~7_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(6));

-- Location: LABCELL_X40_Y1_N21
\U2|U1|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~6_combout\ = ( \U1|Sreg.preparacao~q\ & ( !\dados_ascii[3]~input_o\ ) ) # ( !\U1|Sreg.preparacao~q\ & ( \U2|U1|IQ\(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[3]~input_o\,
	datad => \U2|U1|ALT_INV_IQ\(6),
	dataf => \U1|ALT_INV_Sreg.preparacao~q\,
	combout => \U2|U1|IQ~6_combout\);

-- Location: FF_X40_Y1_N22
\U2|U1|IQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~6_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(5));

-- Location: LABCELL_X40_Y1_N33
\U2|U1|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~5_combout\ = ( \U2|U1|IQ\(5) & ( (!\dados_ascii[2]~input_o\) # (!\U1|Sreg.preparacao~q\) ) ) # ( !\U2|U1|IQ\(5) & ( (!\dados_ascii[2]~input_o\ & \U1|Sreg.preparacao~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111100001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_dados_ascii[2]~input_o\,
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(5),
	combout => \U2|U1|IQ~5_combout\);

-- Location: FF_X40_Y1_N35
\U2|U1|IQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~5_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(4));

-- Location: LABCELL_X40_Y1_N15
\U2|U1|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~4_combout\ = ( \U2|U1|IQ\(4) & ( (!\dados_ascii[1]~input_o\) # (!\U1|Sreg.preparacao~q\) ) ) # ( !\U2|U1|IQ\(4) & ( (!\dados_ascii[1]~input_o\ & \U1|Sreg.preparacao~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101011111111101010101111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[1]~input_o\,
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(4),
	combout => \U2|U1|IQ~4_combout\);

-- Location: FF_X40_Y1_N17
\U2|U1|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~4_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(3));

-- Location: LABCELL_X40_Y1_N45
\U2|U1|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~3_combout\ = ( \U1|Sreg.preparacao~q\ & ( !\dados_ascii[0]~input_o\ ) ) # ( !\U1|Sreg.preparacao~q\ & ( \U2|U1|IQ\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[0]~input_o\,
	datac => \U2|U1|ALT_INV_IQ\(3),
	dataf => \U1|ALT_INV_Sreg.preparacao~q\,
	combout => \U2|U1|IQ~3_combout\);

-- Location: FF_X40_Y1_N46
\U2|U1|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(2));

-- Location: LABCELL_X40_Y1_N30
\U2|U1|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~2_combout\ = ( \U2|U1|IQ\(2) ) # ( !\U2|U1|IQ\(2) & ( \U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(2),
	combout => \U2|U1|IQ~2_combout\);

-- Location: FF_X40_Y1_N31
\U2|U1|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(1));

-- Location: LABCELL_X40_Y1_N42
\U2|U1|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~0_combout\ = ( \U2|U1|IQ\(1) & ( !\U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(1),
	combout => \U2|U1|IQ~0_combout\);

-- Location: FF_X40_Y1_N43
\U2|U1|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|IQ~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|IQ\(0));

-- Location: LABCELL_X40_Y1_N6
\U2|D[9]\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|D\(9) = !\dados_ascii[4]~input_o\ $ (!\dados_ascii[5]~input_o\ $ (\U2|D[9]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011010011001011001101001100101100110100110010110011010011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datad => \U2|ALT_INV_D[9]~0_combout\,
	combout => \U2|D\(9));

-- Location: LABCELL_X41_Y1_N9
\U2|H1|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux6~0_combout\ = ( !\dados_ascii[5]~input_o\ & ( !\dados_ascii[6]~input_o\ $ (!\dados_ascii[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[6]~input_o\,
	datac => \ALT_INV_dados_ascii[4]~input_o\,
	dataf => \ALT_INV_dados_ascii[5]~input_o\,
	combout => \U2|H1|Mux6~0_combout\);

-- Location: LABCELL_X40_Y1_N3
\U2|H1|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux5~0_combout\ = (\dados_ascii[6]~input_o\ & (!\dados_ascii[4]~input_o\ $ (!\dados_ascii[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000000110000001100000011000000110000001100000011000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datac => \ALT_INV_dados_ascii[6]~input_o\,
	combout => \U2|H1|Mux5~0_combout\);

-- Location: LABCELL_X41_Y1_N54
\U2|H1|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux4~0_combout\ = ( \dados_ascii[5]~input_o\ & ( (!\dados_ascii[4]~input_o\ & !\dados_ascii[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datac => \ALT_INV_dados_ascii[6]~input_o\,
	dataf => \ALT_INV_dados_ascii[5]~input_o\,
	combout => \U2|H1|Mux4~0_combout\);

-- Location: LABCELL_X40_Y1_N0
\U2|H1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux3~0_combout\ = (!\dados_ascii[4]~input_o\ & (!\dados_ascii[5]~input_o\ & \dados_ascii[6]~input_o\)) # (\dados_ascii[4]~input_o\ & (!\dados_ascii[5]~input_o\ $ (\dados_ascii[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010010011001010001001001100101000100100110010100010010011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datad => \ALT_INV_dados_ascii[6]~input_o\,
	combout => \U2|H1|Mux3~0_combout\);

-- Location: LABCELL_X40_Y1_N36
\U2|H1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux2~0_combout\ = ( \dados_ascii[6]~input_o\ & ( (!\dados_ascii[5]~input_o\) # (\dados_ascii[4]~input_o\) ) ) # ( !\dados_ascii[6]~input_o\ & ( \dados_ascii[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111110011111100111100001111000011111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datac => \ALT_INV_dados_ascii[4]~input_o\,
	datae => \ALT_INV_dados_ascii[6]~input_o\,
	combout => \U2|H1|Mux2~0_combout\);

-- Location: LABCELL_X40_Y1_N9
\U2|H1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux1~0_combout\ = ((!\dados_ascii[4]~input_o\ & !\dados_ascii[5]~input_o\)) # (\dados_ascii[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111110001111100011111000111110001111100011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[4]~input_o\,
	datab => \ALT_INV_dados_ascii[5]~input_o\,
	datac => \ALT_INV_dados_ascii[6]~input_o\,
	combout => \U2|H1|Mux1~0_combout\);

-- Location: LABCELL_X41_Y1_N45
\U2|H1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H1|Mux0~0_combout\ = ( \dados_ascii[5]~input_o\ & ( (\dados_ascii[6]~input_o\ & \dados_ascii[4]~input_o\) ) ) # ( !\dados_ascii[5]~input_o\ & ( !\dados_ascii[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[6]~input_o\,
	datac => \ALT_INV_dados_ascii[4]~input_o\,
	dataf => \ALT_INV_dados_ascii[5]~input_o\,
	combout => \U2|H1|Mux0~0_combout\);

-- Location: LABCELL_X41_Y1_N21
\U2|H0|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux6~0_combout\ = ( \dados_ascii[3]~input_o\ & ( (\dados_ascii[0]~input_o\ & (!\dados_ascii[2]~input_o\ $ (!\dados_ascii[1]~input_o\))) ) ) # ( !\dados_ascii[3]~input_o\ & ( (!\dados_ascii[1]~input_o\ & (!\dados_ascii[2]~input_o\ $ 
-- (!\dados_ascii[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000010010000100100000000110000001100000011000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datab => \ALT_INV_dados_ascii[1]~input_o\,
	datac => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux6~0_combout\);

-- Location: LABCELL_X41_Y1_N48
\U2|H0|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux5~0_combout\ = ( \dados_ascii[3]~input_o\ & ( (!\dados_ascii[0]~input_o\ & ((\dados_ascii[2]~input_o\))) # (\dados_ascii[0]~input_o\ & (\dados_ascii[1]~input_o\)) ) ) # ( !\dados_ascii[3]~input_o\ & ( (\dados_ascii[2]~input_o\ & 
-- (!\dados_ascii[1]~input_o\ $ (!\dados_ascii[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001010000001010000101000001111010101010000111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[1]~input_o\,
	datac => \ALT_INV_dados_ascii[2]~input_o\,
	datad => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux5~0_combout\);

-- Location: LABCELL_X41_Y1_N0
\U2|H0|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux4~0_combout\ = ( \dados_ascii[3]~input_o\ & ( (\dados_ascii[2]~input_o\ & ((!\dados_ascii[0]~input_o\) # (\dados_ascii[1]~input_o\))) ) ) # ( !\dados_ascii[3]~input_o\ & ( (!\dados_ascii[2]~input_o\ & (\dados_ascii[1]~input_o\ & 
-- !\dados_ascii[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000001010101000100010101010100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datab => \ALT_INV_dados_ascii[1]~input_o\,
	datad => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux4~0_combout\);

-- Location: LABCELL_X41_Y1_N3
\U2|H0|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux3~0_combout\ = ( \dados_ascii[3]~input_o\ & ( (\dados_ascii[1]~input_o\ & (!\dados_ascii[2]~input_o\ $ (\dados_ascii[0]~input_o\))) ) ) # ( !\dados_ascii[3]~input_o\ & ( (!\dados_ascii[2]~input_o\ & (!\dados_ascii[1]~input_o\ & 
-- \dados_ascii[0]~input_o\)) # (\dados_ascii[2]~input_o\ & (!\dados_ascii[1]~input_o\ $ (\dados_ascii[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100101001001010010010100100100100001001000010010000100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datab => \ALT_INV_dados_ascii[1]~input_o\,
	datac => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux3~0_combout\);

-- Location: LABCELL_X41_Y1_N39
\U2|H0|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux2~0_combout\ = ( \dados_ascii[3]~input_o\ & ( (!\dados_ascii[2]~input_o\ & (!\dados_ascii[1]~input_o\ & \dados_ascii[0]~input_o\)) ) ) # ( !\dados_ascii[3]~input_o\ & ( ((\dados_ascii[2]~input_o\ & !\dados_ascii[1]~input_o\)) # 
-- (\dados_ascii[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111101001111010011110100111100001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datab => \ALT_INV_dados_ascii[1]~input_o\,
	datac => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux2~0_combout\);

-- Location: LABCELL_X41_Y1_N33
\U2|H0|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux1~0_combout\ = ( \dados_ascii[0]~input_o\ & ( \dados_ascii[3]~input_o\ & ( (\dados_ascii[2]~input_o\ & !\dados_ascii[1]~input_o\) ) ) ) # ( \dados_ascii[0]~input_o\ & ( !\dados_ascii[3]~input_o\ & ( !\dados_ascii[2]~input_o\ ) ) ) # ( 
-- !\dados_ascii[0]~input_o\ & ( !\dados_ascii[3]~input_o\ & ( (!\dados_ascii[2]~input_o\ & \dados_ascii[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101000000000000000000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datac => \ALT_INV_dados_ascii[1]~input_o\,
	datae => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux1~0_combout\);

-- Location: LABCELL_X41_Y1_N36
\U2|H0|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|H0|Mux0~0_combout\ = ( \dados_ascii[3]~input_o\ & ( (!\dados_ascii[2]~input_o\) # ((\dados_ascii[0]~input_o\) # (\dados_ascii[1]~input_o\)) ) ) # ( !\dados_ascii[3]~input_o\ & ( (!\dados_ascii[2]~input_o\ & (\dados_ascii[1]~input_o\)) # 
-- (\dados_ascii[2]~input_o\ & ((!\dados_ascii[1]~input_o\) # (!\dados_ascii[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101100110011101110110011010111011111111111011101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datab => \ALT_INV_dados_ascii[1]~input_o\,
	datad => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[3]~input_o\,
	combout => \U2|H0|Mux0~0_combout\);

-- Location: LABCELL_X7_Y16_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


