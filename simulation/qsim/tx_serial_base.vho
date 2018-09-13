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

-- DATE "09/05/2018 11:07:07"

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
	pronto : OUT std_logic
	);
END tx_serial_base;

-- Design Ports Information
-- saida_serial	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pronto	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- partida	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[0]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[1]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[2]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[3]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[4]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[5]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[6]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- paridade	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \partida~input_o\ : std_logic;
SIGNAL \U2|U2|IQ[0]~3_combout\ : std_logic;
SIGNAL \U2|U2|IQ[0]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|IQ[1]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|IQ[3]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|IQ~1_combout\ : std_logic;
SIGNAL \U2|U2|IQ[2]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|IQ~0_combout\ : std_logic;
SIGNAL \U1|Selector1~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \U1|Sreg.transmissao~q\ : std_logic;
SIGNAL \U2|U2|IQ[1]~2_combout\ : std_logic;
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
SIGNAL \U2|U1|IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U2|U2|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U2|U1|ALT_INV_IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U1|ALT_INV_Sreg.inicial~q\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[4]~input_o\ : std_logic;
SIGNAL \U2|ALT_INV_D[9]~0_combout\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_partida~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[2]~input_o\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.final~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.preparacao~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.transmissao~q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_IQ[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_paridade~input_o\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_partida <= partida;
ww_paridade <= paridade;
ww_dados_ascii <= dados_ascii;
saida_serial <= ww_saida_serial;
pronto <= ww_pronto;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\U2|U1|ALT_INV_IQ\(2) <= NOT \U2|U1|IQ\(2);
\U1|ALT_INV_Sreg.inicial~q\ <= NOT \U1|Sreg.inicial~q\;
\U2|U1|ALT_INV_IQ\(3) <= NOT \U2|U1|IQ\(3);
\U2|U1|ALT_INV_IQ\(4) <= NOT \U2|U1|IQ\(4);
\ALT_INV_dados_ascii[3]~input_o\ <= NOT \dados_ascii[3]~input_o\;
\ALT_INV_dados_ascii[4]~input_o\ <= NOT \dados_ascii[4]~input_o\;
\U2|U1|ALT_INV_IQ\(5) <= NOT \U2|U1|IQ\(5);
\U2|U1|ALT_INV_IQ\(6) <= NOT \U2|U1|IQ\(6);
\U2|U1|ALT_INV_IQ\(7) <= NOT \U2|U1|IQ\(7);
\U2|U1|ALT_INV_IQ\(8) <= NOT \U2|U1|IQ\(8);
\U2|U1|ALT_INV_IQ\(9) <= NOT \U2|U1|IQ\(9);
\U2|ALT_INV_D[9]~0_combout\ <= NOT \U2|D[9]~0_combout\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_dados_ascii[5]~input_o\ <= NOT \dados_ascii[5]~input_o\;
\ALT_INV_dados_ascii[6]~input_o\ <= NOT \dados_ascii[6]~input_o\;
\ALT_INV_partida~input_o\ <= NOT \partida~input_o\;
\ALT_INV_dados_ascii[0]~input_o\ <= NOT \dados_ascii[0]~input_o\;
\ALT_INV_dados_ascii[1]~input_o\ <= NOT \dados_ascii[1]~input_o\;
\ALT_INV_dados_ascii[2]~input_o\ <= NOT \dados_ascii[2]~input_o\;
\U2|U1|ALT_INV_IQ\(0) <= NOT \U2|U1|IQ\(0);
\U2|U1|ALT_INV_IQ\(1) <= NOT \U2|U1|IQ\(1);
\U1|ALT_INV_Sreg.final~q\ <= NOT \U1|Sreg.final~q\;
\U1|ALT_INV_Sreg.preparacao~q\ <= NOT \U1|Sreg.preparacao~q\;
\U1|ALT_INV_Sreg.transmissao~q\ <= NOT \U1|Sreg.transmissao~q\;
\U2|U2|ALT_INV_IQ\(3) <= NOT \U2|U2|IQ\(3);
\U2|U2|ALT_INV_IQ\(0) <= NOT \U2|U2|IQ\(0);
\U2|U2|ALT_INV_IQ\(2) <= NOT \U2|U2|IQ\(2);
\U2|U2|ALT_INV_IQ\(1) <= NOT \U2|U2|IQ\(1);
\U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\ <= NOT \U2|U2|IQ[1]~DUPLICATE_q\;
\U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\ <= NOT \U2|U2|IQ[0]~DUPLICATE_q\;
\U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\ <= NOT \U2|U2|IQ[2]~DUPLICATE_q\;
\U2|U2|ALT_INV_IQ[3]~DUPLICATE_q\ <= NOT \U2|U2|IQ[3]~DUPLICATE_q\;
\ALT_INV_paridade~input_o\ <= NOT \paridade~input_o\;

-- Location: IOOBUF_X54_Y19_N22
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

-- Location: IOOBUF_X54_Y19_N5
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

-- Location: IOIBUF_X54_Y18_N61
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G10
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

-- Location: IOIBUF_X54_Y21_N55
\partida~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_partida,
	o => \partida~input_o\);

-- Location: FF_X52_Y26_N20
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

-- Location: LABCELL_X52_Y26_N18
\U2|U2|IQ[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ[0]~3_combout\ = ( !\U2|U2|IQ\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \U2|U2|ALT_INV_IQ\(0),
	combout => \U2|U2|IQ[0]~3_combout\);

-- Location: FF_X52_Y26_N19
\U2|U2|IQ[0]~DUPLICATE\ : dffeas
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
	q => \U2|U2|IQ[0]~DUPLICATE_q\);

-- Location: FF_X52_Y26_N28
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

-- Location: FF_X52_Y26_N56
\U2|U2|IQ[3]~DUPLICATE\ : dffeas
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
	q => \U2|U2|IQ[3]~DUPLICATE_q\);

-- Location: FF_X52_Y26_N40
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

-- Location: LABCELL_X52_Y26_N39
\U2|U2|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ~1_combout\ = ( \U2|U2|IQ\(2) & ( \U2|U2|IQ[1]~DUPLICATE_q\ & ( !\U2|U2|IQ\(0) ) ) ) # ( !\U2|U2|IQ\(2) & ( \U2|U2|IQ[1]~DUPLICATE_q\ & ( (!\U2|U2|IQ[3]~DUPLICATE_q\ & \U2|U2|IQ\(0)) ) ) ) # ( \U2|U2|IQ\(2) & ( !\U2|U2|IQ[1]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000101010101111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_IQ[3]~DUPLICATE_q\,
	datad => \U2|U2|ALT_INV_IQ\(0),
	datae => \U2|U2|ALT_INV_IQ\(2),
	dataf => \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\,
	combout => \U2|U2|IQ~1_combout\);

-- Location: FF_X52_Y26_N41
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

-- Location: LABCELL_X52_Y26_N54
\U2|U2|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ~0_combout\ = ( \U2|U2|IQ\(3) & ( \U2|U2|IQ[1]~DUPLICATE_q\ & ( !\U2|U2|IQ\(0) ) ) ) # ( !\U2|U2|IQ\(3) & ( \U2|U2|IQ[1]~DUPLICATE_q\ & ( (\U2|U2|IQ\(0) & \U2|U2|IQ[2]~DUPLICATE_q\) ) ) ) # ( \U2|U2|IQ\(3) & ( !\U2|U2|IQ[1]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U2|ALT_INV_IQ\(0),
	datad => \U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\,
	datae => \U2|U2|ALT_INV_IQ\(3),
	dataf => \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\,
	combout => \U2|U2|IQ~0_combout\);

-- Location: FF_X52_Y26_N55
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

-- Location: LABCELL_X53_Y26_N48
\U1|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector1~0_combout\ = ( \U1|Sreg.transmissao~q\ & ( \U2|U2|IQ\(2) ) ) # ( !\U1|Sreg.transmissao~q\ & ( \U2|U2|IQ\(2) & ( \U1|Sreg.preparacao~q\ ) ) ) # ( \U1|Sreg.transmissao~q\ & ( !\U2|U2|IQ\(2) & ( (!\U2|U2|IQ[0]~DUPLICATE_q\) # 
-- ((!\U2|U2|IQ[1]~DUPLICATE_q\) # ((!\U2|U2|IQ\(3)) # (\U1|Sreg.preparacao~q\))) ) ) ) # ( !\U1|Sreg.transmissao~q\ & ( !\U2|U2|IQ\(2) & ( \U1|Sreg.preparacao~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111111101111111100000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	datab => \U2|U2|ALT_INV_IQ[1]~DUPLICATE_q\,
	datac => \U2|U2|ALT_INV_IQ\(3),
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	datae => \U1|ALT_INV_Sreg.transmissao~q\,
	dataf => \U2|U2|ALT_INV_IQ\(2),
	combout => \U1|Selector1~0_combout\);

-- Location: IOIBUF_X54_Y21_N21
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X53_Y26_N50
\U1|Sreg.transmissao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.transmissao~q\);

-- Location: LABCELL_X52_Y26_N27
\U2|U2|IQ[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|IQ[1]~2_combout\ = ( \U2|U2|IQ\(1) & ( \U2|U2|IQ[0]~DUPLICATE_q\ & ( !\U1|Sreg.transmissao~q\ ) ) ) # ( !\U2|U2|IQ\(1) & ( \U2|U2|IQ[0]~DUPLICATE_q\ & ( \U1|Sreg.transmissao~q\ ) ) ) # ( \U2|U2|IQ\(1) & ( !\U2|U2|IQ[0]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|ALT_INV_Sreg.transmissao~q\,
	datae => \U2|U2|ALT_INV_IQ\(1),
	dataf => \U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	combout => \U2|U2|IQ[1]~2_combout\);

-- Location: FF_X52_Y26_N29
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

-- Location: LABCELL_X52_Y26_N45
\U1|Snext.final~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.final~0_combout\ = ( \U2|U2|IQ\(0) & ( (\U2|U2|IQ\(1) & (\U1|Sreg.transmissao~q\ & (!\U2|U2|IQ[2]~DUPLICATE_q\ & \U2|U2|IQ[3]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_IQ\(1),
	datab => \U1|ALT_INV_Sreg.transmissao~q\,
	datac => \U2|U2|ALT_INV_IQ[2]~DUPLICATE_q\,
	datad => \U2|U2|ALT_INV_IQ[3]~DUPLICATE_q\,
	dataf => \U2|U2|ALT_INV_IQ\(0),
	combout => \U1|Snext.final~0_combout\);

-- Location: FF_X52_Y26_N46
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

-- Location: LABCELL_X52_Y26_N42
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

-- Location: FF_X52_Y26_N44
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

-- Location: LABCELL_X52_Y26_N51
\U1|Snext.preparacao~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.preparacao~0_combout\ = ( \partida~input_o\ & ( !\U1|Sreg.inicial~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_partida~input_o\,
	dataf => \U1|ALT_INV_Sreg.inicial~q\,
	combout => \U1|Snext.preparacao~0_combout\);

-- Location: FF_X52_Y26_N53
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

-- Location: IOIBUF_X54_Y19_N38
\dados_ascii[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(0),
	o => \dados_ascii[0]~input_o\);

-- Location: IOIBUF_X54_Y19_N55
\dados_ascii[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(1),
	o => \dados_ascii[1]~input_o\);

-- Location: IOIBUF_X54_Y21_N4
\dados_ascii[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(2),
	o => \dados_ascii[2]~input_o\);

-- Location: IOIBUF_X54_Y20_N4
\dados_ascii[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(3),
	o => \dados_ascii[3]~input_o\);

-- Location: IOIBUF_X54_Y20_N38
\dados_ascii[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(4),
	o => \dados_ascii[4]~input_o\);

-- Location: IOIBUF_X54_Y20_N55
\dados_ascii[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(5),
	o => \dados_ascii[5]~input_o\);

-- Location: IOIBUF_X54_Y21_N38
\dados_ascii[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(6),
	o => \dados_ascii[6]~input_o\);

-- Location: IOIBUF_X54_Y20_N21
\paridade~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_paridade,
	o => \paridade~input_o\);

-- Location: LABCELL_X53_Y26_N54
\U2|D[9]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|D[9]~0_combout\ = ( \dados_ascii[3]~input_o\ & ( \dados_ascii[0]~input_o\ & ( !\dados_ascii[2]~input_o\ $ (!\dados_ascii[1]~input_o\ $ (!\paridade~input_o\ $ (!\dados_ascii[4]~input_o\))) ) ) ) # ( !\dados_ascii[3]~input_o\ & ( 
-- \dados_ascii[0]~input_o\ & ( !\dados_ascii[2]~input_o\ $ (!\dados_ascii[1]~input_o\ $ (!\paridade~input_o\ $ (\dados_ascii[4]~input_o\))) ) ) ) # ( \dados_ascii[3]~input_o\ & ( !\dados_ascii[0]~input_o\ & ( !\dados_ascii[2]~input_o\ $ 
-- (!\dados_ascii[1]~input_o\ $ (!\paridade~input_o\ $ (\dados_ascii[4]~input_o\))) ) ) ) # ( !\dados_ascii[3]~input_o\ & ( !\dados_ascii[0]~input_o\ & ( !\dados_ascii[2]~input_o\ $ (!\dados_ascii[1]~input_o\ $ (!\paridade~input_o\ $ 
-- (!\dados_ascii[4]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110100101100110100110010110011010010110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[2]~input_o\,
	datab => \ALT_INV_dados_ascii[1]~input_o\,
	datac => \ALT_INV_paridade~input_o\,
	datad => \ALT_INV_dados_ascii[4]~input_o\,
	datae => \ALT_INV_dados_ascii[3]~input_o\,
	dataf => \ALT_INV_dados_ascii[0]~input_o\,
	combout => \U2|D[9]~0_combout\);

-- Location: LABCELL_X53_Y26_N30
\U2|U1|IQ~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~10_combout\ = ( \U2|U1|IQ\(9) & ( \U1|Sreg.transmissao~q\ & ( (\U1|Sreg.preparacao~q\ & (!\dados_ascii[5]~input_o\ $ (!\dados_ascii[6]~input_o\ $ (!\U2|D[9]~0_combout\)))) ) ) ) # ( !\U2|U1|IQ\(9) & ( \U1|Sreg.transmissao~q\ & ( 
-- (\U1|Sreg.preparacao~q\ & (!\dados_ascii[5]~input_o\ $ (!\dados_ascii[6]~input_o\ $ (!\U2|D[9]~0_combout\)))) ) ) ) # ( \U2|U1|IQ\(9) & ( !\U1|Sreg.transmissao~q\ & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[5]~input_o\ $ (!\dados_ascii[6]~input_o\ $ 
-- (!\U2|D[9]~0_combout\))) ) ) ) # ( !\U2|U1|IQ\(9) & ( !\U1|Sreg.transmissao~q\ & ( (\U1|Sreg.preparacao~q\ & (!\dados_ascii[5]~input_o\ $ (!\dados_ascii[6]~input_o\ $ (!\U2|D[9]~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010010110111111111001011000000000100101100000000010010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dados_ascii[5]~input_o\,
	datab => \ALT_INV_dados_ascii[6]~input_o\,
	datac => \U2|ALT_INV_D[9]~0_combout\,
	datad => \U1|ALT_INV_Sreg.preparacao~q\,
	datae => \U2|U1|ALT_INV_IQ\(9),
	dataf => \U1|ALT_INV_Sreg.transmissao~q\,
	combout => \U2|U1|IQ~10_combout\);

-- Location: FF_X53_Y26_N31
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

-- Location: LABCELL_X53_Y26_N21
\U2|U1|IQ~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~9_combout\ = ( \U2|U1|IQ\(9) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[6]~input_o\) ) ) # ( !\U2|U1|IQ\(9) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011111100111111001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datac => \ALT_INV_dados_ascii[6]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(9),
	combout => \U2|U1|IQ~9_combout\);

-- Location: LABCELL_X53_Y26_N3
\U2|U1|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ[0]~1_combout\ = ( \U1|Sreg.preparacao~q\ ) # ( !\U1|Sreg.preparacao~q\ & ( \U1|Sreg.transmissao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_Sreg.transmissao~q\,
	dataf => \U1|ALT_INV_Sreg.preparacao~q\,
	combout => \U2|U1|IQ[0]~1_combout\);

-- Location: FF_X53_Y26_N22
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

-- Location: LABCELL_X53_Y26_N18
\U2|U1|IQ~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~8_combout\ = ( \U2|U1|IQ\(8) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[5]~input_o\) ) ) # ( !\U2|U1|IQ\(8) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[5]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011111100111111001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datac => \ALT_INV_dados_ascii[5]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(8),
	combout => \U2|U1|IQ~8_combout\);

-- Location: FF_X53_Y26_N19
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

-- Location: LABCELL_X53_Y26_N27
\U2|U1|IQ~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~7_combout\ = ( \U2|U1|IQ\(7) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[4]~input_o\) ) ) # ( !\U2|U1|IQ\(7) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011111100111111001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datac => \ALT_INV_dados_ascii[4]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(7),
	combout => \U2|U1|IQ~7_combout\);

-- Location: FF_X53_Y26_N28
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

-- Location: LABCELL_X53_Y26_N24
\U2|U1|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~6_combout\ = ( \U2|U1|IQ\(6) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[3]~input_o\) ) ) # ( !\U2|U1|IQ\(6) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011111100111111001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datac => \ALT_INV_dados_ascii[3]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(6),
	combout => \U2|U1|IQ~6_combout\);

-- Location: FF_X53_Y26_N25
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

-- Location: LABCELL_X53_Y26_N15
\U2|U1|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~5_combout\ = ( \U2|U1|IQ\(5) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[2]~input_o\) ) ) # ( !\U2|U1|IQ\(5) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000011111111110011001111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datad => \ALT_INV_dados_ascii[2]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(5),
	combout => \U2|U1|IQ~5_combout\);

-- Location: FF_X53_Y26_N17
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

-- Location: LABCELL_X53_Y26_N12
\U2|U1|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~4_combout\ = ( \U2|U1|IQ\(4) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[1]~input_o\) ) ) # ( !\U2|U1|IQ\(4) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000011111111110011001111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datad => \ALT_INV_dados_ascii[1]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(4),
	combout => \U2|U1|IQ~4_combout\);

-- Location: FF_X53_Y26_N13
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

-- Location: LABCELL_X53_Y26_N39
\U2|U1|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~3_combout\ = ( \U2|U1|IQ\(3) & ( (!\U1|Sreg.preparacao~q\) # (!\dados_ascii[0]~input_o\) ) ) # ( !\U2|U1|IQ\(3) & ( (\U1|Sreg.preparacao~q\ & !\dados_ascii[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000011111100111111001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	datac => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \U2|U1|ALT_INV_IQ\(3),
	combout => \U2|U1|IQ~3_combout\);

-- Location: FF_X53_Y26_N41
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

-- Location: LABCELL_X53_Y26_N36
\U2|U1|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~2_combout\ = ( \U2|U1|IQ\(2) ) # ( !\U2|U1|IQ\(2) & ( \U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(2),
	combout => \U2|U1|IQ~2_combout\);

-- Location: FF_X53_Y26_N38
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

-- Location: LABCELL_X53_Y26_N0
\U2|U1|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|IQ~0_combout\ = ( \U2|U1|IQ\(1) & ( !\U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|ALT_INV_IQ\(1),
	combout => \U2|U1|IQ~0_combout\);

-- Location: FF_X53_Y26_N1
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

-- Location: LABCELL_X12_Y23_N3
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


