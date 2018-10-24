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

-- DATE "10/24/2018 10:26:26"

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

ENTITY 	print_escreve_campo IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	iniciar : IN std_logic;
	operacao : IN std_logic_vector(1 DOWNTO 0);
	dado : IN std_logic_vector(1 DOWNTO 0);
	endereco : IN std_logic_vector(5 DOWNTO 0);
	saida_serial : OUT std_logic;
	pronto : OUT std_logic;
	db_reseta : OUT std_logic;
	db_partida : OUT std_logic;
	db_zera : OUT std_logic;
	db_conta : OUT std_logic;
	db_carrega : OUT std_logic;
	db_pronto : OUT std_logic;
	db_we : OUT std_logic;
	db_fim : OUT std_logic;
	db_q : OUT std_logic_vector(5 DOWNTO 0);
	db_sel : OUT std_logic_vector(1 DOWNTO 0);
	db_dados : OUT std_logic_vector(6 DOWNTO 0)
	);
END print_escreve_campo;

-- Design Ports Information
-- saida_serial	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pronto	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_reseta	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_partida	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_zera	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_conta	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_carrega	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_pronto	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_we	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_fim	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_q[0]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_q[1]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_q[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_q[3]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_q[4]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_q[5]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_sel[0]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_sel[1]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[0]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[1]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[2]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[3]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[4]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[5]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- db_dados[6]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operacao[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operacao[0]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[4]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[3]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[2]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[0]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dado[0]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dado[1]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iniciar	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF print_escreve_campo IS
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
SIGNAL ww_iniciar : std_logic;
SIGNAL ww_operacao : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_dado : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_endereco : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_saida_serial : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL ww_db_reseta : std_logic;
SIGNAL ww_db_partida : std_logic;
SIGNAL ww_db_zera : std_logic;
SIGNAL ww_db_conta : std_logic;
SIGNAL ww_db_carrega : std_logic;
SIGNAL ww_db_pronto : std_logic;
SIGNAL ww_db_we : std_logic;
SIGNAL ww_db_fim : std_logic;
SIGNAL ww_db_q : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_db_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_db_dados : std_logic_vector(6 DOWNTO 0);
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \U2|U1|U3|Add0~33_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Equal0~0_combout\ : std_logic;
SIGNAL \U2|U1|U3|Equal0~2_combout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~34\ : std_logic;
SIGNAL \U2|U1|U3|Add0~5_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~6\ : std_logic;
SIGNAL \U2|U1|U3|Add0~9_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~10\ : std_logic;
SIGNAL \U2|U1|U3|Add0~13_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~14\ : std_logic;
SIGNAL \U2|U1|U3|Add0~1_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~2\ : std_logic;
SIGNAL \U2|U1|U3|Add0~17_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~18\ : std_logic;
SIGNAL \U2|U1|U3|Add0~21_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~22\ : std_logic;
SIGNAL \U2|U1|U3|Add0~25_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Add0~26\ : std_logic;
SIGNAL \U2|U1|U3|Add0~29_sumout\ : std_logic;
SIGNAL \U2|U1|U3|Equal0~1_combout\ : std_logic;
SIGNAL \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U1|U2|U2|IQ[1]~3_combout\ : std_logic;
SIGNAL \U2|U1|U2|U2|IQ~0_combout\ : std_logic;
SIGNAL \U2|U1|U2|U2|IQ~2_combout\ : std_logic;
SIGNAL \U2|U1|U2|U2|IQ~1_combout\ : std_logic;
SIGNAL \U2|U1|U2|U2|Equal0~0_combout\ : std_logic;
SIGNAL \U2|U1|U1|Selector1~0_combout\ : std_logic;
SIGNAL \operacao[1]~input_o\ : std_logic;
SIGNAL \iniciar~input_o\ : std_logic;
SIGNAL \U3|r0_input~feeder_combout\ : std_logic;
SIGNAL \U3|r0_input~q\ : std_logic;
SIGNAL \U3|r1_input~DUPLICATE_q\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \U1|Sreg.enviaNL~q\ : std_logic;
SIGNAL \U1|Selector6~0_combout\ : std_logic;
SIGNAL \U1|Sreg.esperaNL~q\ : std_logic;
SIGNAL \operacao[0]~input_o\ : std_logic;
SIGNAL \U3|r1_input~q\ : std_logic;
SIGNAL \U1|Snext.carrega_endereco~0_combout\ : std_logic;
SIGNAL \U1|Sreg.carrega_endereco~q\ : std_logic;
SIGNAL \U1|Selector1~0_combout\ : std_logic;
SIGNAL \U1|Sreg.envia~q\ : std_logic;
SIGNAL \U1|Selector2~0_combout\ : std_logic;
SIGNAL \U1|Sreg.espera~q\ : std_logic;
SIGNAL \U1|Selector3~0_combout\ : std_logic;
SIGNAL \U1|Sreg.incrementa~q\ : std_logic;
SIGNAL \endereco[0]~input_o\ : std_logic;
SIGNAL \U2|U3|IQ~4_combout\ : std_logic;
SIGNAL \endereco[1]~input_o\ : std_logic;
SIGNAL \U2|U3|IQ~5_combout\ : std_logic;
SIGNAL \U2|U3|Equal0~1_combout\ : std_logic;
SIGNAL \endereco[2]~input_o\ : std_logic;
SIGNAL \U2|U3|IQ~3_combout\ : std_logic;
SIGNAL \U2|U3|Equal0~3_combout\ : std_logic;
SIGNAL \endereco[3]~input_o\ : std_logic;
SIGNAL \U2|U3|IQ~2_combout\ : std_logic;
SIGNAL \endereco[4]~input_o\ : std_logic;
SIGNAL \U2|U3|Equal0~2_combout\ : std_logic;
SIGNAL \U2|U3|IQ~1_combout\ : std_logic;
SIGNAL \endereco[5]~input_o\ : std_logic;
SIGNAL \U2|U3|IQ~0_combout\ : std_logic;
SIGNAL \U2|U3|Equal0~0_combout\ : std_logic;
SIGNAL \U1|Sreg.escreve_memoria~q\ : std_logic;
SIGNAL \U1|Selector4~0_combout\ : std_logic;
SIGNAL \U1|Sreg.final~q\ : std_logic;
SIGNAL \U1|Selector0~0_combout\ : std_logic;
SIGNAL \U1|Sreg.inicial~q\ : std_logic;
SIGNAL \U2|U1|U1|Sreg.espera~q\ : std_logic;
SIGNAL \U2|U1|U1|Snext.transmissao~0_combout\ : std_logic;
SIGNAL \U2|U1|U1|Sreg.transmissao~q\ : std_logic;
SIGNAL \U2|U1|U1|Selector2~0_combout\ : std_logic;
SIGNAL \U2|U1|U1|Sreg.final~q\ : std_logic;
SIGNAL \U1|Snext.selecionaCR~0_combout\ : std_logic;
SIGNAL \U1|Sreg.selecionaCR~q\ : std_logic;
SIGNAL \U1|Sreg.enviaCR~q\ : std_logic;
SIGNAL \U1|Selector5~0_combout\ : std_logic;
SIGNAL \U1|Sreg.esperaCR~q\ : std_logic;
SIGNAL \U1|Snext.selecionaNL~0_combout\ : std_logic;
SIGNAL \U1|Sreg.selecionaNL~q\ : std_logic;
SIGNAL \U1|Sreg.enviaNL~DUPLICATE_q\ : std_logic;
SIGNAL \U1|WideNor0~combout\ : std_logic;
SIGNAL \U2|U1|U4|r0_input~q\ : std_logic;
SIGNAL \U2|U1|U4|r1_input~q\ : std_logic;
SIGNAL \U2|U1|U1|Selector0~0_combout\ : std_logic;
SIGNAL \U2|U1|U1|Sreg.inicial~q\ : std_logic;
SIGNAL \U2|U1|U1|Snext.preparacao~0_combout\ : std_logic;
SIGNAL \U2|U1|U1|Sreg.preparacao~feeder_combout\ : std_logic;
SIGNAL \U2|U1|U1|Sreg.preparacao~q\ : std_logic;
SIGNAL \U1|WideOr7~0_combout\ : std_logic;
SIGNAL \U1|WideOr8~0_combout\ : std_logic;
SIGNAL \dado[1]~input_o\ : std_logic;
SIGNAL \dado[0]~input_o\ : std_logic;
SIGNAL \U2|U5|MX_OUT[1]~0_combout\ : std_logic;
SIGNAL \U2|U2|memoria~22_combout\ : std_logic;
SIGNAL \U2|U2|memoria~16_q\ : std_logic;
SIGNAL \U2|U2|memoria~14feeder_combout\ : std_logic;
SIGNAL \U2|U2|memoria~14_q\ : std_logic;
SIGNAL \U2|U5|Equal2~0_combout\ : std_logic;
SIGNAL \U2|U5|Equal1~0_combout\ : std_logic;
SIGNAL \U2|U5|MX_OUT[5]~1_combout\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \U2|U4|MX_OUT[1]~1_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[1]~1_wirecell_combout\ : std_logic;
SIGNAL \U2|U2|memoria~18_q\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \U2|U4|MX_OUT[3]~3_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[3]~3_wirecell_combout\ : std_logic;
SIGNAL \U2|U2|memoria~14DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|memoria~21feeder_combout\ : std_logic;
SIGNAL \U2|U2|memoria~21_q\ : std_logic;
SIGNAL \U2|U2|memoria~17_q\ : std_logic;
SIGNAL \U2|U2|memoria~15_q\ : std_logic;
SIGNAL \U2|U1|U2|D[9]~4_combout\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \U2|U1|U2|D[9]~1_combout\ : std_logic;
SIGNAL \U2|U2|memoria~19_q\ : std_logic;
SIGNAL \U2|U2|memoria~20_q\ : std_logic;
SIGNAL \U2|U1|U2|D[9]~2_combout\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \U2|U1|U2|D[9]~3_combout\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \U2|U1|U2|D[9]~0_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~7_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[6]~10_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~6_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ[1]~1_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[5]~9_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~5_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[4]~8_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~4_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[2]~7_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~3_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~8_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~2_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|IQ~0_combout\ : std_logic;
SIGNAL \U1|WideNor1~combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[0]~0_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[2]~2_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[4]~4_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[5]~5_combout\ : std_logic;
SIGNAL \U2|U4|MX_OUT[6]~6_combout\ : std_logic;
SIGNAL \U2|U1|U3|IQ\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \U2|U1|U2|U1|IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U2|U3|IQ\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U2|U1|U2|U2|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U2|U1|U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\ : std_logic;
SIGNAL \U3|ALT_INV_r1_input~DUPLICATE_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~14DUPLICATE_q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.enviaNL~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_iniciar~input_o\ : std_logic;
SIGNAL \ALT_INV_dado[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dado[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_endereco[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_endereco[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_endereco[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_endereco[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_endereco[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_endereco[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operacao[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_operacao[1]~input_o\ : std_logic;
SIGNAL \U2|U1|U2|ALT_INV_D[9]~4_combout\ : std_logic;
SIGNAL \U2|U1|U2|ALT_INV_D[9]~3_combout\ : std_logic;
SIGNAL \U2|U1|U2|ALT_INV_D[9]~2_combout\ : std_logic;
SIGNAL \U2|U1|U2|ALT_INV_D[9]~1_combout\ : std_logic;
SIGNAL \U2|U1|U2|ALT_INV_D[9]~0_combout\ : std_logic;
SIGNAL \U2|U1|U2|U1|ALT_INV_IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U2|U4|ALT_INV_MX_OUT[6]~10_combout\ : std_logic;
SIGNAL \U2|U4|ALT_INV_MX_OUT[5]~9_combout\ : std_logic;
SIGNAL \U2|U4|ALT_INV_MX_OUT[4]~8_combout\ : std_logic;
SIGNAL \U2|U4|ALT_INV_MX_OUT[2]~7_combout\ : std_logic;
SIGNAL \U2|U1|U1|ALT_INV_Snext.preparacao~0_combout\ : std_logic;
SIGNAL \U2|U1|U4|ALT_INV_r1_input~q\ : std_logic;
SIGNAL \U2|U1|U4|ALT_INV_r0_input~q\ : std_logic;
SIGNAL \U2|U1|U1|ALT_INV_Sreg.inicial~q\ : std_logic;
SIGNAL \U2|U3|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \U2|U3|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \U2|U1|U3|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \U2|U1|U3|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \U2|U1|U1|ALT_INV_Sreg.espera~q\ : std_logic;
SIGNAL \U2|U1|U2|U2|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \U2|U1|U2|U2|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U1|ALT_INV_Sreg.espera~q\ : std_logic;
SIGNAL \U2|U3|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \U3|ALT_INV_r1_input~q\ : std_logic;
SIGNAL \U3|ALT_INV_r0_input~q\ : std_logic;
SIGNAL \U2|U1|U1|ALT_INV_Sreg.transmissao~q\ : std_logic;
SIGNAL \U2|U1|U1|ALT_INV_Sreg.preparacao~q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~21_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~20_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~19_q\ : std_logic;
SIGNAL \U2|U4|ALT_INV_MX_OUT[3]~3_combout\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~18_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~17_q\ : std_logic;
SIGNAL \U2|U4|ALT_INV_MX_OUT[1]~1_combout\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~16_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~15_q\ : std_logic;
SIGNAL \U2|U2|ALT_INV_memoria~14_q\ : std_logic;
SIGNAL \U1|ALT_INV_WideOr7~0_combout\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.esperaCR~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.selecionaCR~q\ : std_logic;
SIGNAL \U1|ALT_INV_WideOr8~0_combout\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.esperaNL~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.selecionaNL~q\ : std_logic;
SIGNAL \U2|U3|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \U2|U3|ALT_INV_IQ\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \U1|ALT_INV_Sreg.escreve_memoria~q\ : std_logic;
SIGNAL \U2|U1|U1|ALT_INV_Sreg.final~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.carrega_endereco~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.incrementa~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.enviaNL~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.enviaCR~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.envia~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.final~q\ : std_logic;
SIGNAL \U1|ALT_INV_Sreg.inicial~q\ : std_logic;
SIGNAL \U2|U1|U3|ALT_INV_IQ\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a1\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a2\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a3\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a4\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a5\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a6\ : std_logic;
SIGNAL \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_iniciar <= iniciar;
ww_operacao <= operacao;
ww_dado <= dado;
ww_endereco <= endereco;
saida_serial <= ww_saida_serial;
pronto <= ww_pronto;
db_reseta <= ww_db_reseta;
db_partida <= ww_db_partida;
db_zera <= ww_db_zera;
db_conta <= ww_db_conta;
db_carrega <= ww_db_carrega;
db_pronto <= ww_db_pronto;
db_we <= ww_db_we;
db_fim <= ww_db_fim;
db_q <= ww_db_q;
db_sel <= ww_db_sel;
db_dados <= ww_db_dados;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & vcc & \U2|U5|MX_OUT[5]~1_combout\ & \U2|U5|Equal1~0_combout\ & \U2|U5|Equal1~0_combout\ & \U2|U5|MX_OUT[1]~0_combout\ & \U2|U5|MX_OUT[1]~0_combout\ & \U2|U5|Equal2~0_combout\);

\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\U2|U3|IQ\(5) & \U2|U3|IQ\(4) & \U2|U3|IQ\(3) & \U2|U3|IQ\(2) & \U2|U3|IQ\(1) & \U2|U3|IQ\(0));

\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\U2|U3|IQ~0_combout\ & \U2|U3|IQ~1_combout\ & \U2|U3|IQ~2_combout\ & \U2|U3|IQ~3_combout\ & \U2|U3|IQ~5_combout\ & \U2|U3|IQ~4_combout\);

\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\ <= \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\U2|U1|U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\ <= NOT \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\;
\U3|ALT_INV_r1_input~DUPLICATE_q\ <= NOT \U3|r1_input~DUPLICATE_q\;
\U2|U2|ALT_INV_memoria~14DUPLICATE_q\ <= NOT \U2|U2|memoria~14DUPLICATE_q\;
\U1|ALT_INV_Sreg.enviaNL~DUPLICATE_q\ <= NOT \U1|Sreg.enviaNL~DUPLICATE_q\;
\ALT_INV_iniciar~input_o\ <= NOT \iniciar~input_o\;
\ALT_INV_dado[1]~input_o\ <= NOT \dado[1]~input_o\;
\ALT_INV_dado[0]~input_o\ <= NOT \dado[0]~input_o\;
\ALT_INV_endereco[1]~input_o\ <= NOT \endereco[1]~input_o\;
\ALT_INV_endereco[0]~input_o\ <= NOT \endereco[0]~input_o\;
\ALT_INV_endereco[2]~input_o\ <= NOT \endereco[2]~input_o\;
\ALT_INV_endereco[3]~input_o\ <= NOT \endereco[3]~input_o\;
\ALT_INV_endereco[4]~input_o\ <= NOT \endereco[4]~input_o\;
\ALT_INV_endereco[5]~input_o\ <= NOT \endereco[5]~input_o\;
\ALT_INV_operacao[0]~input_o\ <= NOT \operacao[0]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_operacao[1]~input_o\ <= NOT \operacao[1]~input_o\;
\U2|U1|U2|ALT_INV_D[9]~4_combout\ <= NOT \U2|U1|U2|D[9]~4_combout\;
\U2|U1|U2|ALT_INV_D[9]~3_combout\ <= NOT \U2|U1|U2|D[9]~3_combout\;
\U2|U1|U2|ALT_INV_D[9]~2_combout\ <= NOT \U2|U1|U2|D[9]~2_combout\;
\U2|U1|U2|ALT_INV_D[9]~1_combout\ <= NOT \U2|U1|U2|D[9]~1_combout\;
\U2|U1|U2|ALT_INV_D[9]~0_combout\ <= NOT \U2|U1|U2|D[9]~0_combout\;
\U2|U1|U2|U1|ALT_INV_IQ\(9) <= NOT \U2|U1|U2|U1|IQ\(9);
\U2|U4|ALT_INV_MX_OUT[6]~10_combout\ <= NOT \U2|U4|MX_OUT[6]~10_combout\;
\U2|U1|U2|U1|ALT_INV_IQ\(8) <= NOT \U2|U1|U2|U1|IQ\(8);
\U2|U4|ALT_INV_MX_OUT[5]~9_combout\ <= NOT \U2|U4|MX_OUT[5]~9_combout\;
\U2|U1|U2|U1|ALT_INV_IQ\(7) <= NOT \U2|U1|U2|U1|IQ\(7);
\U2|U4|ALT_INV_MX_OUT[4]~8_combout\ <= NOT \U2|U4|MX_OUT[4]~8_combout\;
\U2|U4|ALT_INV_MX_OUT[2]~7_combout\ <= NOT \U2|U4|MX_OUT[2]~7_combout\;
\U2|U1|U1|ALT_INV_Snext.preparacao~0_combout\ <= NOT \U2|U1|U1|Snext.preparacao~0_combout\;
\U2|U1|U4|ALT_INV_r1_input~q\ <= NOT \U2|U1|U4|r1_input~q\;
\U2|U1|U4|ALT_INV_r0_input~q\ <= NOT \U2|U1|U4|r0_input~q\;
\U2|U1|U1|ALT_INV_Sreg.inicial~q\ <= NOT \U2|U1|U1|Sreg.inicial~q\;
\U2|U1|U2|U1|ALT_INV_IQ\(2) <= NOT \U2|U1|U2|U1|IQ\(2);
\U2|U3|ALT_INV_Equal0~3_combout\ <= NOT \U2|U3|Equal0~3_combout\;
\U2|U3|ALT_INV_Equal0~2_combout\ <= NOT \U2|U3|Equal0~2_combout\;
\U2|U1|U3|ALT_INV_Equal0~1_combout\ <= NOT \U2|U1|U3|Equal0~1_combout\;
\U2|U1|U3|ALT_INV_Equal0~0_combout\ <= NOT \U2|U1|U3|Equal0~0_combout\;
\U2|U1|U1|ALT_INV_Sreg.espera~q\ <= NOT \U2|U1|U1|Sreg.espera~q\;
\U2|U1|U2|U2|ALT_INV_Equal0~0_combout\ <= NOT \U2|U1|U2|U2|Equal0~0_combout\;
\U2|U1|U2|U2|ALT_INV_IQ\(1) <= NOT \U2|U1|U2|U2|IQ\(1);
\U2|U1|U2|U2|ALT_INV_IQ\(2) <= NOT \U2|U1|U2|U2|IQ\(2);
\U2|U1|U2|U2|ALT_INV_IQ\(3) <= NOT \U2|U1|U2|U2|IQ\(3);
\U2|U1|U2|U2|ALT_INV_IQ\(0) <= NOT \U2|U1|U2|U2|IQ\(0);
\U1|ALT_INV_Sreg.espera~q\ <= NOT \U1|Sreg.espera~q\;
\U2|U3|ALT_INV_Equal0~1_combout\ <= NOT \U2|U3|Equal0~1_combout\;
\U3|ALT_INV_r1_input~q\ <= NOT \U3|r1_input~q\;
\U3|ALT_INV_r0_input~q\ <= NOT \U3|r0_input~q\;
\U2|U1|U1|ALT_INV_Sreg.transmissao~q\ <= NOT \U2|U1|U1|Sreg.transmissao~q\;
\U2|U1|U1|ALT_INV_Sreg.preparacao~q\ <= NOT \U2|U1|U1|Sreg.preparacao~q\;
\U2|U1|U2|U1|ALT_INV_IQ\(1) <= NOT \U2|U1|U2|U1|IQ\(1);
\U2|U2|ALT_INV_memoria~21_q\ <= NOT \U2|U2|memoria~21_q\;
\U2|U2|ALT_INV_memoria~20_q\ <= NOT \U2|U2|memoria~20_q\;
\U2|U2|ALT_INV_memoria~19_q\ <= NOT \U2|U2|memoria~19_q\;
\U2|U4|ALT_INV_MX_OUT[3]~3_combout\ <= NOT \U2|U4|MX_OUT[3]~3_combout\;
\U2|U2|ALT_INV_memoria~18_q\ <= NOT \U2|U2|memoria~18_q\;
\U2|U2|ALT_INV_memoria~17_q\ <= NOT \U2|U2|memoria~17_q\;
\U2|U4|ALT_INV_MX_OUT[1]~1_combout\ <= NOT \U2|U4|MX_OUT[1]~1_combout\;
\U2|U2|ALT_INV_memoria~16_q\ <= NOT \U2|U2|memoria~16_q\;
\U2|U2|ALT_INV_memoria~15_q\ <= NOT \U2|U2|memoria~15_q\;
\U2|U2|ALT_INV_memoria~14_q\ <= NOT \U2|U2|memoria~14_q\;
\U1|ALT_INV_WideOr7~0_combout\ <= NOT \U1|WideOr7~0_combout\;
\U1|ALT_INV_Sreg.esperaCR~q\ <= NOT \U1|Sreg.esperaCR~q\;
\U1|ALT_INV_Sreg.selecionaCR~q\ <= NOT \U1|Sreg.selecionaCR~q\;
\U1|ALT_INV_WideOr8~0_combout\ <= NOT \U1|WideOr8~0_combout\;
\U1|ALT_INV_Sreg.esperaNL~q\ <= NOT \U1|Sreg.esperaNL~q\;
\U1|ALT_INV_Sreg.selecionaNL~q\ <= NOT \U1|Sreg.selecionaNL~q\;
\U2|U3|ALT_INV_Equal0~0_combout\ <= NOT \U2|U3|Equal0~0_combout\;
\U2|U3|ALT_INV_IQ\(1) <= NOT \U2|U3|IQ\(1);
\U2|U3|ALT_INV_IQ\(0) <= NOT \U2|U3|IQ\(0);
\U2|U3|ALT_INV_IQ\(2) <= NOT \U2|U3|IQ\(2);
\U2|U3|ALT_INV_IQ\(3) <= NOT \U2|U3|IQ\(3);
\U2|U3|ALT_INV_IQ\(4) <= NOT \U2|U3|IQ\(4);
\U2|U3|ALT_INV_IQ\(5) <= NOT \U2|U3|IQ\(5);
\U1|ALT_INV_Sreg.escreve_memoria~q\ <= NOT \U1|Sreg.escreve_memoria~q\;
\U2|U1|U1|ALT_INV_Sreg.final~q\ <= NOT \U2|U1|U1|Sreg.final~q\;
\U1|ALT_INV_Sreg.carrega_endereco~q\ <= NOT \U1|Sreg.carrega_endereco~q\;
\U1|ALT_INV_Sreg.incrementa~q\ <= NOT \U1|Sreg.incrementa~q\;
\U1|ALT_INV_Sreg.enviaNL~q\ <= NOT \U1|Sreg.enviaNL~q\;
\U1|ALT_INV_Sreg.enviaCR~q\ <= NOT \U1|Sreg.enviaCR~q\;
\U1|ALT_INV_Sreg.envia~q\ <= NOT \U1|Sreg.envia~q\;
\U1|ALT_INV_Sreg.final~q\ <= NOT \U1|Sreg.final~q\;
\U1|ALT_INV_Sreg.inicial~q\ <= NOT \U1|Sreg.inicial~q\;
\U2|U1|U2|U1|ALT_INV_IQ\(0) <= NOT \U2|U1|U2|U1|IQ\(0);
\U2|U1|U2|U1|ALT_INV_IQ\(5) <= NOT \U2|U1|U2|U1|IQ\(5);
\U2|U1|U2|U1|ALT_INV_IQ\(3) <= NOT \U2|U1|U2|U1|IQ\(3);
\U2|U1|U3|ALT_INV_IQ\(0) <= NOT \U2|U1|U3|IQ\(0);
\U2|U1|U3|ALT_INV_IQ\(8) <= NOT \U2|U1|U3|IQ\(8);
\U2|U1|U3|ALT_INV_IQ\(7) <= NOT \U2|U1|U3|IQ\(7);
\U2|U1|U3|ALT_INV_IQ\(6) <= NOT \U2|U1|U3|IQ\(6);
\U2|U1|U3|ALT_INV_IQ\(5) <= NOT \U2|U1|U3|IQ\(5);
\U2|U1|U3|ALT_INV_IQ\(3) <= NOT \U2|U1|U3|IQ\(3);
\U2|U1|U3|ALT_INV_IQ\(2) <= NOT \U2|U1|U3|IQ\(2);
\U2|U1|U3|ALT_INV_IQ\(1) <= NOT \U2|U1|U3|IQ\(1);
\U2|U1|U3|ALT_INV_IQ\(4) <= NOT \U2|U1|U3|IQ\(4);
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a1\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\;
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a2\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\;
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a3\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\;
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a4\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\;
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a5\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\;
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a6\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\;
\U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ <= NOT \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\;

-- Location: IOOBUF_X36_Y45_N53
\saida_serial~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U1|U2|U1|ALT_INV_IQ\(0),
	devoe => ww_devoe,
	o => ww_saida_serial);

-- Location: IOOBUF_X46_Y45_N59
\pronto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|WideNor1~combout\,
	devoe => ww_devoe,
	o => ww_pronto);

-- Location: IOOBUF_X40_Y45_N59
\db_reseta~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|ALT_INV_Sreg.inicial~q\,
	devoe => ww_devoe,
	o => ww_db_reseta);

-- Location: IOOBUF_X38_Y45_N19
\db_partida~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|WideNor0~combout\,
	devoe => ww_devoe,
	o => ww_db_partida);

-- Location: IOOBUF_X38_Y45_N53
\db_zera~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|ALT_INV_Sreg.inicial~q\,
	devoe => ww_devoe,
	o => ww_db_zera);

-- Location: IOOBUF_X34_Y45_N19
\db_conta~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|Sreg.incrementa~q\,
	devoe => ww_devoe,
	o => ww_db_conta);

-- Location: IOOBUF_X44_Y45_N53
\db_carrega~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|Sreg.carrega_endereco~q\,
	devoe => ww_devoe,
	o => ww_db_carrega);

-- Location: IOOBUF_X50_Y45_N53
\db_pronto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U1|U1|Sreg.final~q\,
	devoe => ww_devoe,
	o => ww_db_pronto);

-- Location: IOOBUF_X43_Y45_N36
\db_we~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	devoe => ww_devoe,
	o => ww_db_we);

-- Location: IOOBUF_X44_Y45_N36
\db_fim~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|Equal0~0_combout\,
	devoe => ww_devoe,
	o => ww_db_fim);

-- Location: IOOBUF_X42_Y45_N19
\db_q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|IQ\(0),
	devoe => ww_devoe,
	o => ww_db_q(0));

-- Location: IOOBUF_X46_Y45_N93
\db_q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|IQ\(1),
	devoe => ww_devoe,
	o => ww_db_q(1));

-- Location: IOOBUF_X43_Y45_N2
\db_q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|IQ\(2),
	devoe => ww_devoe,
	o => ww_db_q(2));

-- Location: IOOBUF_X46_Y45_N42
\db_q[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|IQ\(3),
	devoe => ww_devoe,
	o => ww_db_q(3));

-- Location: IOOBUF_X36_Y45_N19
\db_q[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|IQ\(4),
	devoe => ww_devoe,
	o => ww_db_q(4));

-- Location: IOOBUF_X36_Y45_N2
\db_q[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U3|IQ\(5),
	devoe => ww_devoe,
	o => ww_db_q(5));

-- Location: IOOBUF_X40_Y45_N93
\db_sel[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|ALT_INV_WideOr8~0_combout\,
	devoe => ww_devoe,
	o => ww_db_sel(0));

-- Location: IOOBUF_X42_Y45_N2
\db_sel[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|ALT_INV_WideOr7~0_combout\,
	devoe => ww_devoe,
	o => ww_db_sel(1));

-- Location: IOOBUF_X38_Y45_N36
\db_dados[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(0));

-- Location: IOOBUF_X40_Y45_N76
\db_dados[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(1));

-- Location: IOOBUF_X46_Y45_N76
\db_dados[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(2));

-- Location: IOOBUF_X34_Y45_N36
\db_dados[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(3));

-- Location: IOOBUF_X43_Y45_N19
\db_dados[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(4));

-- Location: IOOBUF_X40_Y45_N42
\db_dados[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(5));

-- Location: IOOBUF_X50_Y45_N19
\db_dados[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|U4|MX_OUT[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_db_dados(6));

-- Location: IOIBUF_X22_Y0_N1
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G6
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

-- Location: MLABCELL_X42_Y41_N30
\U2|U1|U3|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~33_sumout\ = SUM(( \U2|U1|U3|IQ\(0) ) + ( VCC ) + ( !VCC ))
-- \U2|U1|U3|Add0~34\ = CARRY(( \U2|U1|U3|IQ\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(0),
	cin => GND,
	sumout => \U2|U1|U3|Add0~33_sumout\,
	cout => \U2|U1|U3|Add0~34\);

-- Location: MLABCELL_X42_Y41_N24
\U2|U1|U3|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Equal0~0_combout\ = ( !\U2|U1|U3|IQ\(2) & ( \U2|U1|U3|IQ\(4) & ( (!\U2|U1|U3|IQ\(6) & (!\U2|U1|U3|IQ\(3) & (!\U2|U1|U3|IQ\(1) & \U2|U1|U3|IQ\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U3|ALT_INV_IQ\(6),
	datab => \U2|U1|U3|ALT_INV_IQ\(3),
	datac => \U2|U1|U3|ALT_INV_IQ\(1),
	datad => \U2|U1|U3|ALT_INV_IQ\(5),
	datae => \U2|U1|U3|ALT_INV_IQ\(2),
	dataf => \U2|U1|U3|ALT_INV_IQ\(4),
	combout => \U2|U1|U3|Equal0~0_combout\);

-- Location: LABCELL_X40_Y40_N15
\U2|U1|U3|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Equal0~2_combout\ = ( \U2|U1|U3|Equal0~1_combout\ & ( \U2|U1|U3|Equal0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \U2|U1|U3|ALT_INV_Equal0~1_combout\,
	dataf => \U2|U1|U3|ALT_INV_Equal0~0_combout\,
	combout => \U2|U1|U3|Equal0~2_combout\);

-- Location: FF_X42_Y41_N32
\U2|U1|U3|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~33_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(0));

-- Location: MLABCELL_X42_Y41_N33
\U2|U1|U3|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~5_sumout\ = SUM(( \U2|U1|U3|IQ\(1) ) + ( GND ) + ( \U2|U1|U3|Add0~34\ ))
-- \U2|U1|U3|Add0~6\ = CARRY(( \U2|U1|U3|IQ\(1) ) + ( GND ) + ( \U2|U1|U3|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(1),
	cin => \U2|U1|U3|Add0~34\,
	sumout => \U2|U1|U3|Add0~5_sumout\,
	cout => \U2|U1|U3|Add0~6\);

-- Location: FF_X42_Y41_N35
\U2|U1|U3|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~5_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(1));

-- Location: MLABCELL_X42_Y41_N36
\U2|U1|U3|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~9_sumout\ = SUM(( \U2|U1|U3|IQ\(2) ) + ( GND ) + ( \U2|U1|U3|Add0~6\ ))
-- \U2|U1|U3|Add0~10\ = CARRY(( \U2|U1|U3|IQ\(2) ) + ( GND ) + ( \U2|U1|U3|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(2),
	cin => \U2|U1|U3|Add0~6\,
	sumout => \U2|U1|U3|Add0~9_sumout\,
	cout => \U2|U1|U3|Add0~10\);

-- Location: FF_X42_Y41_N38
\U2|U1|U3|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~9_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(2));

-- Location: MLABCELL_X42_Y41_N39
\U2|U1|U3|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~13_sumout\ = SUM(( \U2|U1|U3|IQ\(3) ) + ( GND ) + ( \U2|U1|U3|Add0~10\ ))
-- \U2|U1|U3|Add0~14\ = CARRY(( \U2|U1|U3|IQ\(3) ) + ( GND ) + ( \U2|U1|U3|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(3),
	cin => \U2|U1|U3|Add0~10\,
	sumout => \U2|U1|U3|Add0~13_sumout\,
	cout => \U2|U1|U3|Add0~14\);

-- Location: FF_X42_Y41_N41
\U2|U1|U3|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~13_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(3));

-- Location: MLABCELL_X42_Y41_N42
\U2|U1|U3|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~1_sumout\ = SUM(( \U2|U1|U3|IQ\(4) ) + ( GND ) + ( \U2|U1|U3|Add0~14\ ))
-- \U2|U1|U3|Add0~2\ = CARRY(( \U2|U1|U3|IQ\(4) ) + ( GND ) + ( \U2|U1|U3|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(4),
	cin => \U2|U1|U3|Add0~14\,
	sumout => \U2|U1|U3|Add0~1_sumout\,
	cout => \U2|U1|U3|Add0~2\);

-- Location: FF_X42_Y41_N44
\U2|U1|U3|IQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~1_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(4));

-- Location: MLABCELL_X42_Y41_N45
\U2|U1|U3|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~17_sumout\ = SUM(( \U2|U1|U3|IQ\(5) ) + ( GND ) + ( \U2|U1|U3|Add0~2\ ))
-- \U2|U1|U3|Add0~18\ = CARRY(( \U2|U1|U3|IQ\(5) ) + ( GND ) + ( \U2|U1|U3|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(5),
	cin => \U2|U1|U3|Add0~2\,
	sumout => \U2|U1|U3|Add0~17_sumout\,
	cout => \U2|U1|U3|Add0~18\);

-- Location: FF_X42_Y41_N47
\U2|U1|U3|IQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~17_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(5));

-- Location: MLABCELL_X42_Y41_N48
\U2|U1|U3|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~21_sumout\ = SUM(( \U2|U1|U3|IQ\(6) ) + ( GND ) + ( \U2|U1|U3|Add0~18\ ))
-- \U2|U1|U3|Add0~22\ = CARRY(( \U2|U1|U3|IQ\(6) ) + ( GND ) + ( \U2|U1|U3|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(6),
	cin => \U2|U1|U3|Add0~18\,
	sumout => \U2|U1|U3|Add0~21_sumout\,
	cout => \U2|U1|U3|Add0~22\);

-- Location: FF_X42_Y41_N50
\U2|U1|U3|IQ[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~21_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(6));

-- Location: MLABCELL_X42_Y41_N51
\U2|U1|U3|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~25_sumout\ = SUM(( \U2|U1|U3|IQ\(7) ) + ( GND ) + ( \U2|U1|U3|Add0~22\ ))
-- \U2|U1|U3|Add0~26\ = CARRY(( \U2|U1|U3|IQ\(7) ) + ( GND ) + ( \U2|U1|U3|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(7),
	cin => \U2|U1|U3|Add0~22\,
	sumout => \U2|U1|U3|Add0~25_sumout\,
	cout => \U2|U1|U3|Add0~26\);

-- Location: FF_X42_Y41_N53
\U2|U1|U3|IQ[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~25_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(7));

-- Location: MLABCELL_X42_Y41_N54
\U2|U1|U3|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Add0~29_sumout\ = SUM(( \U2|U1|U3|IQ\(8) ) + ( GND ) + ( \U2|U1|U3|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U2|U1|U3|ALT_INV_IQ\(8),
	cin => \U2|U1|U3|Add0~26\,
	sumout => \U2|U1|U3|Add0~29_sumout\);

-- Location: FF_X42_Y41_N56
\U2|U1|U3|IQ[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U3|Add0~29_sumout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sclr => \U2|U1|U3|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U3|IQ\(8));

-- Location: LABCELL_X41_Y41_N12
\U2|U1|U3|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U3|Equal0~1_combout\ = ( \U2|U1|U3|IQ\(0) & ( (\U2|U1|U3|IQ\(7) & \U2|U1|U3|IQ\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U3|ALT_INV_IQ\(7),
	datad => \U2|U1|U3|ALT_INV_IQ\(8),
	dataf => \U2|U1|U3|ALT_INV_IQ\(0),
	combout => \U2|U1|U3|Equal0~1_combout\);

-- Location: FF_X42_Y41_N4
\U2|U1|U2|U2|IQ[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U2|IQ~0_combout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U2|U1|U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\);

-- Location: MLABCELL_X42_Y40_N51
\U2|U1|U2|U2|IQ[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U2|IQ[1]~3_combout\ = ( \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( \U2|U1|U2|U2|IQ\(1) & ( !\U2|U1|U1|Sreg.transmissao~q\ ) ) ) # ( !\U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( \U2|U1|U2|U2|IQ\(1) ) ) # ( \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( 
-- !\U2|U1|U2|U2|IQ\(1) & ( \U2|U1|U1|Sreg.transmissao~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111111111111111111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Sreg.transmissao~q\,
	datae => \U2|U1|U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	dataf => \U2|U1|U2|U2|ALT_INV_IQ\(1),
	combout => \U2|U1|U2|U2|IQ[1]~3_combout\);

-- Location: FF_X42_Y41_N26
\U2|U1|U2|U2|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U1|U2|U2|IQ[1]~3_combout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U2|IQ\(1));

-- Location: MLABCELL_X42_Y41_N3
\U2|U1|U2|U2|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U2|IQ~0_combout\ = ( !\U2|U1|U2|U2|IQ\(0) & ( \U2|U1|U2|U2|IQ\(2) & ( (!\U2|U1|U2|U2|IQ\(3)) # (\U2|U1|U2|U2|IQ\(1)) ) ) ) # ( !\U2|U1|U2|U2|IQ\(0) & ( !\U2|U1|U2|U2|IQ\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011110000111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U2|U2|ALT_INV_IQ\(3),
	datad => \U2|U1|U2|U2|ALT_INV_IQ\(1),
	datae => \U2|U1|U2|U2|ALT_INV_IQ\(0),
	dataf => \U2|U1|U2|U2|ALT_INV_IQ\(2),
	combout => \U2|U1|U2|U2|IQ~0_combout\);

-- Location: FF_X42_Y41_N5
\U2|U1|U2|U2|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U2|IQ~0_combout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U2|U1|U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U2|IQ\(0));

-- Location: MLABCELL_X42_Y41_N9
\U2|U1|U2|U2|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U2|IQ~2_combout\ = ( \U2|U1|U2|U2|IQ\(2) & ( (!\U2|U1|U2|U2|IQ\(0) & ((!\U2|U1|U2|U2|IQ\(3)) # (\U2|U1|U2|U2|IQ\(1)))) # (\U2|U1|U2|U2|IQ\(0) & ((!\U2|U1|U2|U2|IQ\(1)))) ) ) # ( !\U2|U1|U2|U2|IQ\(2) & ( (\U2|U1|U2|U2|IQ\(0) & 
-- \U2|U1|U2|U2|IQ\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101111101011010101000000000010101011111010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U2|U2|ALT_INV_IQ\(0),
	datac => \U2|U1|U2|U2|ALT_INV_IQ\(3),
	datad => \U2|U1|U2|U2|ALT_INV_IQ\(1),
	datae => \U2|U1|U2|U2|ALT_INV_IQ\(2),
	combout => \U2|U1|U2|U2|IQ~2_combout\);

-- Location: FF_X42_Y41_N10
\U2|U1|U2|U2|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U2|IQ~2_combout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U2|U1|U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U2|IQ\(2));

-- Location: LABCELL_X41_Y40_N45
\U2|U1|U2|U2|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U2|IQ~1_combout\ = ( \U2|U1|U2|U2|IQ\(3) & ( \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( (!\U2|U1|U2|U2|IQ\(2)) # (!\U2|U1|U2|U2|IQ\(1)) ) ) ) # ( !\U2|U1|U2|U2|IQ\(3) & ( \U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( (\U2|U1|U2|U2|IQ\(2) & \U2|U1|U2|U2|IQ\(1)) ) 
-- ) ) # ( \U2|U1|U2|U2|IQ\(3) & ( !\U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( (!\U2|U1|U2|U2|IQ\(2)) # (\U2|U1|U2|U2|IQ\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011111100111100000011000000111111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U1|U2|U2|ALT_INV_IQ\(2),
	datac => \U2|U1|U2|U2|ALT_INV_IQ\(1),
	datae => \U2|U1|U2|U2|ALT_INV_IQ\(3),
	dataf => \U2|U1|U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	combout => \U2|U1|U2|U2|IQ~1_combout\);

-- Location: FF_X41_Y40_N46
\U2|U1|U2|U2|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U2|IQ~1_combout\,
	clrn => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U2|U1|U1|Sreg.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U2|IQ\(3));

-- Location: LABCELL_X41_Y40_N39
\U2|U1|U2|U2|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U2|Equal0~0_combout\ = ( \U2|U1|U2|U2|IQ\(2) & ( !\U2|U1|U2|U2|IQ[0]~DUPLICATE_q\ & ( (\U2|U1|U2|U2|IQ\(3) & !\U2|U1|U2|U2|IQ\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U1|U2|U2|ALT_INV_IQ\(3),
	datac => \U2|U1|U2|U2|ALT_INV_IQ\(1),
	datae => \U2|U1|U2|U2|ALT_INV_IQ\(2),
	dataf => \U2|U1|U2|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	combout => \U2|U1|U2|U2|Equal0~0_combout\);

-- Location: LABCELL_X41_Y41_N30
\U2|U1|U1|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U1|Selector1~0_combout\ = ( \U2|U1|U1|Sreg.espera~q\ & ( \U2|U1|U3|Equal0~0_combout\ & ( ((!\U2|U1|U2|U2|Equal0~0_combout\ & ((!\U2|U1|U3|Equal0~1_combout\) # (\U2|U1|U1|Sreg.transmissao~q\)))) # (\U2|U1|U1|Sreg.preparacao~q\) ) ) ) # ( 
-- !\U2|U1|U1|Sreg.espera~q\ & ( \U2|U1|U3|Equal0~0_combout\ & ( ((\U2|U1|U1|Sreg.transmissao~q\ & !\U2|U1|U2|U2|Equal0~0_combout\)) # (\U2|U1|U1|Sreg.preparacao~q\) ) ) ) # ( \U2|U1|U1|Sreg.espera~q\ & ( !\U2|U1|U3|Equal0~0_combout\ & ( 
-- (!\U2|U1|U2|U2|Equal0~0_combout\) # (\U2|U1|U1|Sreg.preparacao~q\) ) ) ) # ( !\U2|U1|U1|Sreg.espera~q\ & ( !\U2|U1|U3|Equal0~0_combout\ & ( ((\U2|U1|U1|Sreg.transmissao~q\ & !\U2|U1|U2|U2|Equal0~0_combout\)) # (\U2|U1|U1|Sreg.preparacao~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011100110011111111110011001101110111001100111111011100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.transmissao~q\,
	datab => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	datac => \U2|U1|U3|ALT_INV_Equal0~1_combout\,
	datad => \U2|U1|U2|U2|ALT_INV_Equal0~0_combout\,
	datae => \U2|U1|U1|ALT_INV_Sreg.espera~q\,
	dataf => \U2|U1|U3|ALT_INV_Equal0~0_combout\,
	combout => \U2|U1|U1|Selector1~0_combout\);

-- Location: IOIBUF_X34_Y0_N1
\operacao[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operacao(1),
	o => \operacao[1]~input_o\);

-- Location: IOIBUF_X33_Y0_N41
\iniciar~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iniciar,
	o => \iniciar~input_o\);

-- Location: LABCELL_X36_Y41_N27
\U3|r0_input~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3|r0_input~feeder_combout\ = ( \iniciar~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_iniciar~input_o\,
	combout => \U3|r0_input~feeder_combout\);

-- Location: FF_X36_Y41_N29
\U3|r0_input\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3|r0_input~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|r0_input~q\);

-- Location: FF_X37_Y41_N26
\U3|r1_input~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U3|r0_input~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|r1_input~DUPLICATE_q\);

-- Location: IOIBUF_X33_Y0_N75
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X37_Y41_N16
\U1|Sreg.enviaNL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1|Sreg.selecionaNL~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.enviaNL~q\);

-- Location: MLABCELL_X37_Y41_N57
\U1|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector6~0_combout\ = ( \U1|Sreg.enviaNL~q\ ) # ( !\U1|Sreg.enviaNL~q\ & ( (!\U2|U1|U1|Sreg.final~q\ & \U1|Sreg.esperaNL~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	datad => \U1|ALT_INV_Sreg.esperaNL~q\,
	dataf => \U1|ALT_INV_Sreg.enviaNL~q\,
	combout => \U1|Selector6~0_combout\);

-- Location: FF_X37_Y41_N59
\U1|Sreg.esperaNL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector6~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.esperaNL~q\);

-- Location: IOIBUF_X33_Y0_N58
\operacao[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operacao(0),
	o => \operacao[0]~input_o\);

-- Location: FF_X37_Y41_N25
\U3|r1_input\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U3|r0_input~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3|r1_input~q\);

-- Location: MLABCELL_X37_Y41_N0
\U1|Snext.carrega_endereco~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.carrega_endereco~0_combout\ = ( !\U3|r1_input~q\ & ( (\U3|r0_input~q\ & (!\operacao[1]~input_o\ & (!\U1|Sreg.inicial~q\ & \operacao[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U3|ALT_INV_r0_input~q\,
	datab => \ALT_INV_operacao[1]~input_o\,
	datac => \U1|ALT_INV_Sreg.inicial~q\,
	datad => \ALT_INV_operacao[0]~input_o\,
	dataf => \U3|ALT_INV_r1_input~q\,
	combout => \U1|Snext.carrega_endereco~0_combout\);

-- Location: FF_X37_Y41_N2
\U1|Sreg.carrega_endereco\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Snext.carrega_endereco~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.carrega_endereco~q\);

-- Location: MLABCELL_X37_Y41_N12
\U1|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector1~0_combout\ = ( \U1|Sreg.inicial~q\ & ( \U1|Sreg.incrementa~q\ ) ) # ( !\U1|Sreg.inicial~q\ & ( \U1|Sreg.incrementa~q\ ) ) # ( !\U1|Sreg.inicial~q\ & ( !\U1|Sreg.incrementa~q\ & ( (\U3|r0_input~q\ & (!\operacao[1]~input_o\ & 
-- (!\U3|r1_input~DUPLICATE_q\ & !\operacao[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U3|ALT_INV_r0_input~q\,
	datab => \ALT_INV_operacao[1]~input_o\,
	datac => \U3|ALT_INV_r1_input~DUPLICATE_q\,
	datad => \ALT_INV_operacao[0]~input_o\,
	datae => \U1|ALT_INV_Sreg.inicial~q\,
	dataf => \U1|ALT_INV_Sreg.incrementa~q\,
	combout => \U1|Selector1~0_combout\);

-- Location: FF_X37_Y41_N14
\U1|Sreg.envia\ : dffeas
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
	q => \U1|Sreg.envia~q\);

-- Location: MLABCELL_X37_Y41_N39
\U1|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector2~0_combout\ = ( \U2|U1|U1|Sreg.final~q\ & ( \U1|Sreg.envia~q\ ) ) # ( !\U2|U1|U1|Sreg.final~q\ & ( (\U1|Sreg.espera~q\) # (\U1|Sreg.envia~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.envia~q\,
	datad => \U1|ALT_INV_Sreg.espera~q\,
	dataf => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	combout => \U1|Selector2~0_combout\);

-- Location: FF_X37_Y41_N40
\U1|Sreg.espera\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.espera~q\);

-- Location: MLABCELL_X37_Y41_N30
\U1|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector3~0_combout\ = ( \U1|Sreg.espera~q\ & ( (\U2|U1|U1|Sreg.final~q\ & ((!\U2|U3|Equal0~1_combout\) # ((\U1|Sreg.esperaNL~q\ & !\U2|U3|Equal0~0_combout\)))) ) ) # ( !\U1|Sreg.espera~q\ & ( (\U1|Sreg.esperaNL~q\ & (\U2|U1|U1|Sreg.final~q\ & 
-- !\U2|U3|Equal0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000000000110000000000001011000010100000101100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_Equal0~1_combout\,
	datab => \U1|ALT_INV_Sreg.esperaNL~q\,
	datac => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	datad => \U2|U3|ALT_INV_Equal0~0_combout\,
	dataf => \U1|ALT_INV_Sreg.espera~q\,
	combout => \U1|Selector3~0_combout\);

-- Location: FF_X37_Y41_N31
\U1|Sreg.incrementa\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector3~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.incrementa~q\);

-- Location: IOIBUF_X34_Y0_N18
\endereco[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endereco(0),
	o => \endereco[0]~input_o\);

-- Location: LABCELL_X39_Y41_N57
\U2|U3|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|IQ~4_combout\ = (!\U1|Sreg.incrementa~q\ & ((!\U1|Sreg.carrega_endereco~q\ & ((\U2|U3|IQ\(0)))) # (\U1|Sreg.carrega_endereco~q\ & (\endereco[0]~input_o\)))) # (\U1|Sreg.incrementa~q\ & (((!\U2|U3|IQ\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011110001100001101111000110000110111100011000011011110001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_Sreg.carrega_endereco~q\,
	datab => \U1|ALT_INV_Sreg.incrementa~q\,
	datac => \ALT_INV_endereco[0]~input_o\,
	datad => \U2|U3|ALT_INV_IQ\(0),
	combout => \U2|U3|IQ~4_combout\);

-- Location: FF_X39_Y41_N59
\U2|U3|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U3|IQ~4_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U3|IQ\(0));

-- Location: IOIBUF_X36_Y0_N35
\endereco[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endereco(1),
	o => \endereco[1]~input_o\);

-- Location: MLABCELL_X37_Y41_N21
\U2|U3|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|IQ~5_combout\ = ( \U1|Sreg.carrega_endereco~q\ & ( \U1|Sreg.incrementa~q\ & ( !\U2|U3|IQ\(0) $ (!\U2|U3|IQ\(1)) ) ) ) # ( !\U1|Sreg.carrega_endereco~q\ & ( \U1|Sreg.incrementa~q\ & ( (!\U2|U3|Equal0~0_combout\ & (!\U2|U3|IQ\(0) $ (!\U2|U3|IQ\(1)))) 
-- ) ) ) # ( \U1|Sreg.carrega_endereco~q\ & ( !\U1|Sreg.incrementa~q\ & ( \endereco[1]~input_o\ ) ) ) # ( !\U1|Sreg.carrega_endereco~q\ & ( !\U1|Sreg.incrementa~q\ & ( \U2|U3|IQ\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100110000110000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_endereco[1]~input_o\,
	datab => \U2|U3|ALT_INV_IQ\(0),
	datac => \U2|U3|ALT_INV_Equal0~0_combout\,
	datad => \U2|U3|ALT_INV_IQ\(1),
	datae => \U1|ALT_INV_Sreg.carrega_endereco~q\,
	dataf => \U1|ALT_INV_Sreg.incrementa~q\,
	combout => \U2|U3|IQ~5_combout\);

-- Location: FF_X39_Y41_N26
\U2|U3|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U3|IQ~5_combout\,
	clrn => \U1|Sreg.inicial~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U3|IQ\(1));

-- Location: LABCELL_X39_Y41_N39
\U2|U3|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|Equal0~1_combout\ = ( \U2|U3|IQ\(1) & ( \U2|U3|IQ\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U3|ALT_INV_IQ\(0),
	dataf => \U2|U3|ALT_INV_IQ\(1),
	combout => \U2|U3|Equal0~1_combout\);

-- Location: IOIBUF_X36_Y0_N52
\endereco[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endereco(2),
	o => \endereco[2]~input_o\);

-- Location: MLABCELL_X37_Y41_N42
\U2|U3|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|IQ~3_combout\ = ( \U1|Sreg.carrega_endereco~q\ & ( \U1|Sreg.incrementa~q\ & ( !\U2|U3|Equal0~1_combout\ $ (!\U2|U3|IQ\(2)) ) ) ) # ( !\U1|Sreg.carrega_endereco~q\ & ( \U1|Sreg.incrementa~q\ & ( (!\U2|U3|Equal0~0_combout\ & 
-- (!\U2|U3|Equal0~1_combout\ $ (!\U2|U3|IQ\(2)))) ) ) ) # ( \U1|Sreg.carrega_endereco~q\ & ( !\U1|Sreg.incrementa~q\ & ( \endereco[2]~input_o\ ) ) ) # ( !\U1|Sreg.carrega_endereco~q\ & ( !\U1|Sreg.incrementa~q\ & ( \U2|U3|IQ\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000011110000111101000100100010000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_Equal0~1_combout\,
	datab => \U2|U3|ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_endereco[2]~input_o\,
	datad => \U2|U3|ALT_INV_IQ\(2),
	datae => \U1|ALT_INV_Sreg.carrega_endereco~q\,
	dataf => \U1|ALT_INV_Sreg.incrementa~q\,
	combout => \U2|U3|IQ~3_combout\);

-- Location: FF_X39_Y41_N50
\U2|U3|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U3|IQ~3_combout\,
	clrn => \U1|Sreg.inicial~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U3|IQ\(2));

-- Location: LABCELL_X39_Y41_N30
\U2|U3|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|Equal0~3_combout\ = ( \U2|U3|IQ\(0) & ( (\U2|U3|IQ\(2) & \U2|U3|IQ\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_IQ\(2),
	datac => \U2|U3|ALT_INV_IQ\(1),
	dataf => \U2|U3|ALT_INV_IQ\(0),
	combout => \U2|U3|Equal0~3_combout\);

-- Location: IOIBUF_X34_Y0_N52
\endereco[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endereco(3),
	o => \endereco[3]~input_o\);

-- Location: MLABCELL_X37_Y41_N27
\U2|U3|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|IQ~2_combout\ = ( \U1|Sreg.carrega_endereco~q\ & ( \U1|Sreg.incrementa~q\ & ( !\U2|U3|IQ\(3) $ (!\U2|U3|Equal0~3_combout\) ) ) ) # ( !\U1|Sreg.carrega_endereco~q\ & ( \U1|Sreg.incrementa~q\ & ( (!\U2|U3|Equal0~0_combout\ & (!\U2|U3|IQ\(3) $ 
-- (!\U2|U3|Equal0~3_combout\))) ) ) ) # ( \U1|Sreg.carrega_endereco~q\ & ( !\U1|Sreg.incrementa~q\ & ( \endereco[3]~input_o\ ) ) ) # ( !\U1|Sreg.carrega_endereco~q\ & ( !\U1|Sreg.incrementa~q\ & ( \U2|U3|IQ\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000001111111101001000010010000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_IQ\(3),
	datab => \U2|U3|ALT_INV_Equal0~0_combout\,
	datac => \U2|U3|ALT_INV_Equal0~3_combout\,
	datad => \ALT_INV_endereco[3]~input_o\,
	datae => \U1|ALT_INV_Sreg.carrega_endereco~q\,
	dataf => \U1|ALT_INV_Sreg.incrementa~q\,
	combout => \U2|U3|IQ~2_combout\);

-- Location: FF_X39_Y41_N29
\U2|U3|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U3|IQ~2_combout\,
	clrn => \U1|Sreg.inicial~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U3|IQ\(3));

-- Location: IOIBUF_X38_Y45_N1
\endereco[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endereco(4),
	o => \endereco[4]~input_o\);

-- Location: LABCELL_X39_Y41_N12
\U2|U3|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|Equal0~2_combout\ = ( \U2|U3|IQ\(2) & ( (\U2|U3|IQ\(1) & (\U2|U3|IQ\(0) & \U2|U3|IQ\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_IQ\(1),
	datab => \U2|U3|ALT_INV_IQ\(0),
	datac => \U2|U3|ALT_INV_IQ\(3),
	dataf => \U2|U3|ALT_INV_IQ\(2),
	combout => \U2|U3|Equal0~2_combout\);

-- Location: LABCELL_X39_Y41_N54
\U2|U3|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|IQ~1_combout\ = ( \U2|U3|Equal0~2_combout\ & ( (!\U1|Sreg.incrementa~q\ & ((!\U1|Sreg.carrega_endereco~q\ & ((\U2|U3|IQ\(4)))) # (\U1|Sreg.carrega_endereco~q\ & (\endereco[4]~input_o\)))) # (\U1|Sreg.incrementa~q\ & (((!\U2|U3|IQ\(4))))) ) ) # ( 
-- !\U2|U3|Equal0~2_combout\ & ( (!\U1|Sreg.carrega_endereco~q\ & (((\U2|U3|IQ\(4))))) # (\U1|Sreg.carrega_endereco~q\ & ((!\U1|Sreg.incrementa~q\ & (\endereco[4]~input_o\)) # (\U1|Sreg.incrementa~q\ & ((\U2|U3|IQ\(4)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010111111000001001011111100110111100011000011011110001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_Sreg.carrega_endereco~q\,
	datab => \U1|ALT_INV_Sreg.incrementa~q\,
	datac => \ALT_INV_endereco[4]~input_o\,
	datad => \U2|U3|ALT_INV_IQ\(4),
	dataf => \U2|U3|ALT_INV_Equal0~2_combout\,
	combout => \U2|U3|IQ~1_combout\);

-- Location: FF_X39_Y41_N56
\U2|U3|IQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U3|IQ~1_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U3|IQ\(4));

-- Location: IOIBUF_X36_Y45_N35
\endereco[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_endereco(5),
	o => \endereco[5]~input_o\);

-- Location: LABCELL_X39_Y41_N24
\U2|U3|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|IQ~0_combout\ = ( \U1|Sreg.incrementa~q\ & ( \U2|U3|Equal0~2_combout\ & ( !\U2|U3|IQ\(4) $ (!\U2|U3|IQ\(5)) ) ) ) # ( !\U1|Sreg.incrementa~q\ & ( \U2|U3|Equal0~2_combout\ & ( (!\U1|Sreg.carrega_endereco~q\ & ((\U2|U3|IQ\(5)))) # 
-- (\U1|Sreg.carrega_endereco~q\ & (\endereco[5]~input_o\)) ) ) ) # ( \U1|Sreg.incrementa~q\ & ( !\U2|U3|Equal0~2_combout\ & ( \U2|U3|IQ\(5) ) ) ) # ( !\U1|Sreg.incrementa~q\ & ( !\U2|U3|Equal0~2_combout\ & ( (!\U1|Sreg.carrega_endereco~q\ & 
-- ((\U2|U3|IQ\(5)))) # (\U1|Sreg.carrega_endereco~q\ & (\endereco[5]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000000001111111100000101111101010011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_endereco[5]~input_o\,
	datab => \U2|U3|ALT_INV_IQ\(4),
	datac => \U1|ALT_INV_Sreg.carrega_endereco~q\,
	datad => \U2|U3|ALT_INV_IQ\(5),
	datae => \U1|ALT_INV_Sreg.incrementa~q\,
	dataf => \U2|U3|ALT_INV_Equal0~2_combout\,
	combout => \U2|U3|IQ~0_combout\);

-- Location: FF_X39_Y41_N14
\U2|U3|IQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U3|IQ~0_combout\,
	clrn => \U1|Sreg.inicial~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U3|IQ\(5));

-- Location: LABCELL_X39_Y41_N51
\U2|U3|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U3|Equal0~0_combout\ = ( \U2|U3|IQ\(4) & ( \U2|U3|IQ\(5) & ( (\U2|U3|IQ\(2) & (\U2|U3|IQ\(3) & (\U2|U3|IQ\(0) & \U2|U3|IQ\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_IQ\(2),
	datab => \U2|U3|ALT_INV_IQ\(3),
	datac => \U2|U3|ALT_INV_IQ\(0),
	datad => \U2|U3|ALT_INV_IQ\(1),
	datae => \U2|U3|ALT_INV_IQ\(4),
	dataf => \U2|U3|ALT_INV_IQ\(5),
	combout => \U2|U3|Equal0~0_combout\);

-- Location: FF_X37_Y41_N20
\U1|Sreg.escreve_memoria\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	asdata => \U1|Sreg.carrega_endereco~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.escreve_memoria~q\);

-- Location: MLABCELL_X37_Y41_N51
\U1|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector4~0_combout\ = ( \U1|Sreg.escreve_memoria~q\ ) # ( !\U1|Sreg.escreve_memoria~q\ & ( (\U2|U1|U1|Sreg.final~q\ & (\U1|Sreg.esperaNL~q\ & \U2|U3|Equal0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	datac => \U1|ALT_INV_Sreg.esperaNL~q\,
	datad => \U2|U3|ALT_INV_Equal0~0_combout\,
	dataf => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	combout => \U1|Selector4~0_combout\);

-- Location: FF_X37_Y41_N53
\U1|Sreg.final\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector4~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.final~q\);

-- Location: MLABCELL_X37_Y41_N54
\U1|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector0~0_combout\ = ( !\U1|Sreg.final~q\ & ( ((!\operacao[1]~input_o\ & (!\U3|r1_input~DUPLICATE_q\ & \U3|r0_input~q\))) # (\U1|Sreg.inicial~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111010101010101011101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_Sreg.inicial~q\,
	datab => \ALT_INV_operacao[1]~input_o\,
	datac => \U3|ALT_INV_r1_input~DUPLICATE_q\,
	datad => \U3|ALT_INV_r0_input~q\,
	dataf => \U1|ALT_INV_Sreg.final~q\,
	combout => \U1|Selector0~0_combout\);

-- Location: FF_X40_Y41_N41
\U1|Sreg.inicial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1|Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.inicial~q\);

-- Location: FF_X41_Y41_N32
\U2|U1|U1|Sreg.espera\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U1|Selector1~0_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U1|Sreg.espera~q\);

-- Location: LABCELL_X41_Y41_N3
\U2|U1|U1|Snext.transmissao~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U1|Snext.transmissao~0_combout\ = ( \U2|U1|U3|Equal0~0_combout\ & ( \U2|U1|U3|Equal0~1_combout\ & ( \U2|U1|U1|Sreg.espera~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U1|U1|ALT_INV_Sreg.espera~q\,
	datae => \U2|U1|U3|ALT_INV_Equal0~0_combout\,
	dataf => \U2|U1|U3|ALT_INV_Equal0~1_combout\,
	combout => \U2|U1|U1|Snext.transmissao~0_combout\);

-- Location: FF_X41_Y41_N5
\U2|U1|U1|Sreg.transmissao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U1|Snext.transmissao~0_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U1|Sreg.transmissao~q\);

-- Location: LABCELL_X41_Y41_N51
\U2|U1|U1|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U1|Selector2~0_combout\ = ( \U2|U1|U3|Equal0~0_combout\ & ( \U2|U1|U3|Equal0~1_combout\ & ( (\U2|U1|U1|Sreg.transmissao~q\ & \U2|U1|U2|U2|Equal0~0_combout\) ) ) ) # ( !\U2|U1|U3|Equal0~0_combout\ & ( \U2|U1|U3|Equal0~1_combout\ & ( 
-- (\U2|U1|U2|U2|Equal0~0_combout\ & ((\U2|U1|U1|Sreg.espera~q\) # (\U2|U1|U1|Sreg.transmissao~q\))) ) ) ) # ( \U2|U1|U3|Equal0~0_combout\ & ( !\U2|U1|U3|Equal0~1_combout\ & ( (\U2|U1|U2|U2|Equal0~0_combout\ & ((\U2|U1|U1|Sreg.espera~q\) # 
-- (\U2|U1|U1|Sreg.transmissao~q\))) ) ) ) # ( !\U2|U1|U3|Equal0~0_combout\ & ( !\U2|U1|U3|Equal0~1_combout\ & ( (\U2|U1|U2|U2|Equal0~0_combout\ & ((\U2|U1|U1|Sreg.espera~q\) # (\U2|U1|U1|Sreg.transmissao~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000100110001001100010011000100110001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.transmissao~q\,
	datab => \U2|U1|U2|U2|ALT_INV_Equal0~0_combout\,
	datac => \U2|U1|U1|ALT_INV_Sreg.espera~q\,
	datae => \U2|U1|U3|ALT_INV_Equal0~0_combout\,
	dataf => \U2|U1|U3|ALT_INV_Equal0~1_combout\,
	combout => \U2|U1|U1|Selector2~0_combout\);

-- Location: FF_X41_Y41_N53
\U2|U1|U1|Sreg.final\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U1|Selector2~0_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U1|Sreg.final~q\);

-- Location: MLABCELL_X37_Y41_N48
\U1|Snext.selecionaCR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.selecionaCR~0_combout\ = ( \U1|Sreg.espera~q\ & ( (\U2|U1|U1|Sreg.final~q\ & (\U2|U3|IQ\(1) & \U2|U3|IQ\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	datac => \U2|U3|ALT_INV_IQ\(1),
	datad => \U2|U3|ALT_INV_IQ\(0),
	dataf => \U1|ALT_INV_Sreg.espera~q\,
	combout => \U1|Snext.selecionaCR~0_combout\);

-- Location: FF_X37_Y41_N49
\U1|Sreg.selecionaCR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Snext.selecionaCR~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.selecionaCR~q\);

-- Location: FF_X37_Y41_N11
\U1|Sreg.enviaCR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1|Sreg.selecionaCR~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.enviaCR~q\);

-- Location: MLABCELL_X37_Y41_N6
\U1|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Selector5~0_combout\ = ( \U2|U1|U1|Sreg.final~q\ & ( \U1|Sreg.enviaCR~q\ ) ) # ( !\U2|U1|U1|Sreg.final~q\ & ( (\U1|Sreg.esperaCR~q\) # (\U1|Sreg.enviaCR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U1|ALT_INV_Sreg.enviaCR~q\,
	datad => \U1|ALT_INV_Sreg.esperaCR~q\,
	dataf => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	combout => \U1|Selector5~0_combout\);

-- Location: FF_X37_Y41_N7
\U1|Sreg.esperaCR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Selector5~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.esperaCR~q\);

-- Location: MLABCELL_X37_Y41_N3
\U1|Snext.selecionaNL~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|Snext.selecionaNL~0_combout\ = ( \U1|Sreg.esperaCR~q\ & ( \U2|U1|U1|Sreg.final~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	dataf => \U1|ALT_INV_Sreg.esperaCR~q\,
	combout => \U1|Snext.selecionaNL~0_combout\);

-- Location: FF_X37_Y41_N5
\U1|Sreg.selecionaNL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1|Snext.selecionaNL~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.selecionaNL~q\);

-- Location: FF_X37_Y41_N17
\U1|Sreg.enviaNL~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1|Sreg.selecionaNL~q\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Sreg.enviaNL~DUPLICATE_q\);

-- Location: MLABCELL_X37_Y41_N9
\U1|WideNor0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|WideNor0~combout\ = ( \U1|Sreg.envia~q\ ) # ( !\U1|Sreg.envia~q\ & ( (\U1|Sreg.enviaCR~q\) # (\U1|Sreg.enviaNL~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|ALT_INV_Sreg.enviaNL~DUPLICATE_q\,
	datad => \U1|ALT_INV_Sreg.enviaCR~q\,
	dataf => \U1|ALT_INV_Sreg.envia~q\,
	combout => \U1|WideNor0~combout\);

-- Location: FF_X37_Y41_N47
\U2|U1|U4|r0_input\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1|WideNor0~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U4|r0_input~q\);

-- Location: FF_X41_Y41_N37
\U2|U1|U4|r1_input\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U1|U4|r0_input~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U4|r1_input~q\);

-- Location: LABCELL_X41_Y41_N9
\U2|U1|U1|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U1|Selector0~0_combout\ = ( \U2|U1|U1|Sreg.inicial~q\ & ( \U2|U1|U4|r1_input~q\ & ( !\U2|U1|U1|Sreg.final~q\ ) ) ) # ( \U2|U1|U1|Sreg.inicial~q\ & ( !\U2|U1|U4|r1_input~q\ & ( !\U2|U1|U1|Sreg.final~q\ ) ) ) # ( !\U2|U1|U1|Sreg.inicial~q\ & ( 
-- !\U2|U1|U4|r1_input~q\ & ( (!\U2|U1|U1|Sreg.final~q\ & \U2|U1|U4|r0_input~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.final~q\,
	datac => \U2|U1|U4|ALT_INV_r0_input~q\,
	datae => \U2|U1|U1|ALT_INV_Sreg.inicial~q\,
	dataf => \U2|U1|U4|ALT_INV_r1_input~q\,
	combout => \U2|U1|U1|Selector0~0_combout\);

-- Location: FF_X41_Y41_N11
\U2|U1|U1|Sreg.inicial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U1|Selector0~0_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U1|Sreg.inicial~q\);

-- Location: LABCELL_X41_Y41_N36
\U2|U1|U1|Snext.preparacao~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U1|Snext.preparacao~0_combout\ = ( \U2|U1|U4|r0_input~q\ & ( !\U2|U1|U1|Sreg.inicial~q\ & ( !\U2|U1|U4|r1_input~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U4|ALT_INV_r1_input~q\,
	datae => \U2|U1|U4|ALT_INV_r0_input~q\,
	dataf => \U2|U1|U1|ALT_INV_Sreg.inicial~q\,
	combout => \U2|U1|U1|Snext.preparacao~0_combout\);

-- Location: LABCELL_X41_Y41_N42
\U2|U1|U1|Sreg.preparacao~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U1|Sreg.preparacao~feeder_combout\ = \U2|U1|U1|Snext.preparacao~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Snext.preparacao~0_combout\,
	combout => \U2|U1|U1|Sreg.preparacao~feeder_combout\);

-- Location: FF_X41_Y41_N44
\U2|U1|U1|Sreg.preparacao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U1|Sreg.preparacao~feeder_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U1|Sreg.preparacao~q\);

-- Location: MLABCELL_X37_Y41_N33
\U1|WideOr7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|WideOr7~0_combout\ = ( !\U1|Sreg.enviaCR~q\ & ( (!\U1|Sreg.esperaCR~q\ & !\U1|Sreg.selecionaCR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|ALT_INV_Sreg.esperaCR~q\,
	datad => \U1|ALT_INV_Sreg.selecionaCR~q\,
	dataf => \U1|ALT_INV_Sreg.enviaCR~q\,
	combout => \U1|WideOr7~0_combout\);

-- Location: MLABCELL_X37_Y41_N36
\U1|WideOr8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|WideOr8~0_combout\ = ( !\U1|Sreg.enviaNL~DUPLICATE_q\ & ( (!\U1|Sreg.selecionaNL~q\ & !\U1|Sreg.esperaNL~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1|ALT_INV_Sreg.selecionaNL~q\,
	datad => \U1|ALT_INV_Sreg.esperaNL~q\,
	dataf => \U1|ALT_INV_Sreg.enviaNL~DUPLICATE_q\,
	combout => \U1|WideOr8~0_combout\);

-- Location: IOIBUF_X33_Y0_N92
\dado[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dado(1),
	o => \dado[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N35
\dado[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dado(0),
	o => \dado[0]~input_o\);

-- Location: LABCELL_X39_Y41_N36
\U2|U5|MX_OUT[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U5|MX_OUT[1]~0_combout\ = !\dado[1]~input_o\ $ (\dado[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001111111100000000111111110000000011111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_dado[1]~input_o\,
	datad => \ALT_INV_dado[0]~input_o\,
	combout => \U2|U5|MX_OUT[1]~0_combout\);

-- Location: LABCELL_X39_Y41_N21
\U2|U2|memoria~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|memoria~22_combout\ = ( !\U2|U3|IQ\(4) & ( !\U2|U3|IQ\(2) & ( (!\U2|U3|IQ\(3) & (!\U2|U3|IQ\(0) & (!\U2|U3|IQ\(5) & !\U2|U3|IQ\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U3|ALT_INV_IQ\(3),
	datab => \U2|U3|ALT_INV_IQ\(0),
	datac => \U2|U3|ALT_INV_IQ\(5),
	datad => \U2|U3|ALT_INV_IQ\(1),
	datae => \U2|U3|ALT_INV_IQ\(4),
	dataf => \U2|U3|ALT_INV_IQ\(2),
	combout => \U2|U2|memoria~22_combout\);

-- Location: FF_X39_Y41_N38
\U2|U2|memoria~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	d => \U2|U5|MX_OUT[1]~0_combout\,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~16_q\);

-- Location: LABCELL_X40_Y41_N48
\U2|U2|memoria~14feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|memoria~14feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \U2|U2|memoria~14feeder_combout\);

-- Location: FF_X40_Y41_N49
\U2|U2|memoria~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|memoria~14feeder_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~14_q\);

-- Location: LABCELL_X39_Y40_N24
\U2|U5|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U5|Equal2~0_combout\ = ( \dado[0]~input_o\ ) # ( !\dado[0]~input_o\ & ( !\dado[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_dado[1]~input_o\,
	dataf => \ALT_INV_dado[0]~input_o\,
	combout => \U2|U5|Equal2~0_combout\);

-- Location: LABCELL_X39_Y41_N45
\U2|U5|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U5|Equal1~0_combout\ = (!\dado[0]~input_o\) # (\dado[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111101010101111111110101010111111111010101011111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dado[1]~input_o\,
	datad => \ALT_INV_dado[0]~input_o\,
	combout => \U2|U5|Equal1~0_combout\);

-- Location: LABCELL_X39_Y40_N54
\U2|U5|MX_OUT[5]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U5|MX_OUT[5]~1_combout\ = ( \dado[0]~input_o\ & ( \dado[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_dado[1]~input_o\,
	dataf => \ALT_INV_dado[0]~input_o\,
	combout => \U2|U5|MX_OUT[5]~1_combout\);

-- Location: M10K_X38_Y41_N0
\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => "000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D00000000",
	mem_init0 => "2D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D000000002D0000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "campo_inicial.mif",
	init_file_layout => "port_a",
	logical_ram_name => "print_escreve_campo_fd:U2|memoria_jogo_16x7:U2|altsyncram:memoria_rtl_0|altsyncram_qrl1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 6,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 63,
	port_b_logical_ram_depth => 64,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => VCC,
	portbre => VCC,
	clk0 => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	clk1 => \clock~inputCLKENA0_outclk\,
	ena0 => VCC,
	portadatain => \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LABCELL_X40_Y41_N24
\U2|U4|MX_OUT[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[1]~1_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ & ( (!\U1|WideOr8~0_combout\) # ((\U1|WideOr7~0_combout\ & ((\U2|U2|memoria~14_q\) # (\U2|U2|memoria~16_q\)))) ) ) # ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ & ( 
-- (!\U1|WideOr8~0_combout\) # ((\U1|WideOr7~0_combout\ & (\U2|U2|memoria~16_q\ & !\U2|U2|memoria~14_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110111001100110011011100110011001101110111011100110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U1|ALT_INV_WideOr8~0_combout\,
	datac => \U2|U2|ALT_INV_memoria~16_q\,
	datad => \U2|U2|ALT_INV_memoria~14_q\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a1\,
	combout => \U2|U4|MX_OUT[1]~1_combout\);

-- Location: LABCELL_X40_Y41_N42
\U2|U4|MX_OUT[1]~1_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[1]~1_wirecell_combout\ = !\U2|U4|MX_OUT[1]~1_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U4|ALT_INV_MX_OUT[1]~1_combout\,
	combout => \U2|U4|MX_OUT[1]~1_wirecell_combout\);

-- Location: FF_X39_Y41_N47
\U2|U2|memoria~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	d => \U2|U5|Equal1~0_combout\,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~18_q\);

-- Location: LABCELL_X40_Y41_N6
\U2|U4|MX_OUT[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[3]~3_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\ & ( (!\U1|WideOr7~0_combout\) # (((!\U1|WideOr8~0_combout\) # (\U2|U2|memoria~18_q\)) # (\U2|U2|memoria~14_q\)) ) ) # ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\ & 
-- ( (!\U1|WideOr7~0_combout\) # ((!\U1|WideOr8~0_combout\) # ((!\U2|U2|memoria~14_q\ & \U2|U2|memoria~18_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110101110111111111010111011111111101111111111111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U2|U2|ALT_INV_memoria~14_q\,
	datac => \U2|U2|ALT_INV_memoria~18_q\,
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a3\,
	combout => \U2|U4|MX_OUT[3]~3_combout\);

-- Location: LABCELL_X40_Y41_N15
\U2|U4|MX_OUT[3]~3_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[3]~3_wirecell_combout\ = ( !\U2|U4|MX_OUT[3]~3_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \U2|U4|ALT_INV_MX_OUT[3]~3_combout\,
	combout => \U2|U4|MX_OUT[3]~3_wirecell_combout\);

-- Location: FF_X40_Y41_N50
\U2|U2|memoria~14DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U2|memoria~14feeder_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~14DUPLICATE_q\);

-- Location: LABCELL_X39_Y41_N6
\U2|U2|memoria~21feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U2|memoria~21feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \U2|U2|memoria~21feeder_combout\);

-- Location: FF_X39_Y41_N8
\U2|U2|memoria~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	d => \U2|U2|memoria~21feeder_combout\,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~21_q\);

-- Location: FF_X39_Y41_N32
\U2|U2|memoria~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	asdata => \U2|U5|MX_OUT[1]~0_combout\,
	sload => VCC,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~17_q\);

-- Location: FF_X39_Y41_N41
\U2|U2|memoria~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	asdata => \U2|U5|Equal2~0_combout\,
	sload => VCC,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~15_q\);

-- Location: LABCELL_X40_Y41_N30
\U2|U1|U2|D[9]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|D[9]~4_combout\ = ( \U1|WideOr8~0_combout\ & ( \U2|U2|memoria~15_q\ & ( (\U1|WideOr7~0_combout\ & ((!\U2|U2|memoria~21_q\ $ (\U2|U2|memoria~17_q\)) # (\U2|U2|memoria~14_q\))) ) ) ) # ( !\U1|WideOr8~0_combout\ & ( \U2|U2|memoria~15_q\ & ( 
-- !\U1|WideOr7~0_combout\ ) ) ) # ( \U1|WideOr8~0_combout\ & ( !\U2|U2|memoria~15_q\ & ( (\U1|WideOr7~0_combout\ & ((!\U2|U2|memoria~21_q\ $ (!\U2|U2|memoria~17_q\)) # (\U2|U2|memoria~14_q\))) ) ) ) # ( !\U1|WideOr8~0_combout\ & ( !\U2|U2|memoria~15_q\ & ( 
-- !\U1|WideOr7~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000001100000111111110000111100000000100100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_memoria~21_q\,
	datab => \U2|U2|ALT_INV_memoria~17_q\,
	datac => \U1|ALT_INV_WideOr7~0_combout\,
	datad => \U2|U2|ALT_INV_memoria~14_q\,
	datae => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U2|U2|ALT_INV_memoria~15_q\,
	combout => \U2|U1|U2|D[9]~4_combout\);

-- Location: LABCELL_X40_Y41_N36
\U2|U1|U2|D[9]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|D[9]~1_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ & ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ & ( (\U2|U1|U2|D[9]~4_combout\ & ((!\U2|U2|memoria~14DUPLICATE_q\) # ((!\U1|WideOr7~0_combout\) # 
-- (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\)))) ) ) ) # ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ & ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ & ( (\U2|U1|U2|D[9]~4_combout\ & ((!\U2|U2|memoria~14DUPLICATE_q\) # 
-- ((!\U1|WideOr7~0_combout\) # (!\U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\)))) ) ) ) # ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ & ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ & ( (\U2|U1|U2|D[9]~4_combout\ & 
-- ((!\U2|U2|memoria~14DUPLICATE_q\) # ((!\U1|WideOr7~0_combout\) # (!\U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\)))) ) ) ) # ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ & ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ & ( 
-- (\U2|U1|U2|D[9]~4_combout\ & ((!\U2|U2|memoria~14DUPLICATE_q\) # ((!\U1|WideOr7~0_combout\) # (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000110011001100110011001000110011001100100011001000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	datab => \U2|U1|U2|ALT_INV_D[9]~4_combout\,
	datac => \U1|ALT_INV_WideOr7~0_combout\,
	datad => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	datae => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	combout => \U2|U1|U2|D[9]~1_combout\);

-- Location: FF_X39_Y41_N20
\U2|U2|memoria~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	asdata => \U2|U5|Equal1~0_combout\,
	sload => VCC,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~19_q\);

-- Location: FF_X39_Y41_N23
\U2|U2|memoria~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \U1|ALT_INV_Sreg.escreve_memoria~q\,
	asdata => \U2|U5|MX_OUT[5]~1_combout\,
	sload => VCC,
	ena => \U2|U2|memoria~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U2|memoria~20_q\);

-- Location: LABCELL_X39_Y41_N42
\U2|U1|U2|D[9]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|D[9]~2_combout\ = ( \U2|U2|memoria~16_q\ & ( !\U2|U2|memoria~18_q\ $ (!\U2|U2|memoria~19_q\ $ (!\U2|U2|memoria~20_q\)) ) ) # ( !\U2|U2|memoria~16_q\ & ( !\U2|U2|memoria~18_q\ $ (!\U2|U2|memoria~19_q\ $ (\U2|U2|memoria~20_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011000011001111001100001111000011001111001100001100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U2|ALT_INV_memoria~18_q\,
	datac => \U2|U2|ALT_INV_memoria~19_q\,
	datad => \U2|U2|ALT_INV_memoria~20_q\,
	dataf => \U2|U2|ALT_INV_memoria~16_q\,
	combout => \U2|U1|U2|D[9]~2_combout\);

-- Location: LABCELL_X39_Y41_N3
\U2|U1|U2|D[9]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|D[9]~3_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\ & ( (!\U2|U2|memoria~14DUPLICATE_q\ & (\U2|U1|U2|D[9]~2_combout\)) # (\U2|U2|memoria~14DUPLICATE_q\ & ((!\U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\))) ) ) # ( 
-- !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\ & ( (!\U2|U2|memoria~14DUPLICATE_q\ & (\U2|U1|U2|D[9]~2_combout\)) # (\U2|U2|memoria~14DUPLICATE_q\ & ((\U2|U2|memoria_rtl_0|auto_generated|ram_block1a3\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000111111001100000011111100111111001100000011111100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U1|U2|ALT_INV_D[9]~2_combout\,
	datac => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	datad => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a3\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	combout => \U2|U1|U2|D[9]~3_combout\);

-- Location: LABCELL_X40_Y41_N54
\U2|U1|U2|D[9]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|D[9]~0_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\ & ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ & ( (\U1|WideOr8~0_combout\ & ((!\U1|WideOr7~0_combout\) # (\U2|U1|U2|D[9]~3_combout\))) ) ) ) # ( 
-- !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\ & ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ & ( (\U1|WideOr8~0_combout\ & ((!\U1|WideOr7~0_combout\) # (!\U2|U1|U2|D[9]~3_combout\ $ (!\U2|U2|memoria~14DUPLICATE_q\)))) ) ) ) # ( 
-- \U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\ & ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ & ( (\U1|WideOr8~0_combout\ & ((!\U1|WideOr7~0_combout\) # (!\U2|U1|U2|D[9]~3_combout\ $ (!\U2|U2|memoria~14DUPLICATE_q\)))) ) ) ) # ( 
-- !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\ & ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a1\ & ( (\U1|WideOr8~0_combout\ & ((!\U1|WideOr7~0_combout\) # (\U2|U1|U2|D[9]~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111011000000001011111000000000101111100000000010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U2|U1|U2|ALT_INV_D[9]~3_combout\,
	datac => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	datae => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a1\,
	combout => \U2|U1|U2|D[9]~0_combout\);

-- Location: LABCELL_X40_Y41_N51
\U2|U1|U2|U1|IQ~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~7_combout\ = ( \U2|U1|U2|D[9]~0_combout\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((!\U2|U1|U1|Sreg.transmissao~q\ & \U2|U1|U2|U1|IQ\(9))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (\U2|U1|U2|D[9]~1_combout\)) ) ) # ( !\U2|U1|U2|D[9]~0_combout\ & ( 
-- (!\U2|U1|U1|Sreg.preparacao~q\ & (((!\U2|U1|U1|Sreg.transmissao~q\ & \U2|U1|U2|U1|IQ\(9))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (!\U2|U1|U2|D[9]~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010011100100010001001110010000010001101100010001000110110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	datab => \U2|U1|U2|ALT_INV_D[9]~1_combout\,
	datac => \U2|U1|U1|ALT_INV_Sreg.transmissao~q\,
	datad => \U2|U1|U2|U1|ALT_INV_IQ\(9),
	dataf => \U2|U1|U2|ALT_INV_D[9]~0_combout\,
	combout => \U2|U1|U2|U1|IQ~7_combout\);

-- Location: FF_X40_Y41_N53
\U2|U1|U2|U1|IQ[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~7_combout\,
	clrn => \U1|Sreg.inicial~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(9));

-- Location: LABCELL_X39_Y41_N0
\U2|U4|MX_OUT[6]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[6]~10_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\ & ( (\U2|U2|memoria~14DUPLICATE_q\) # (\U2|U2|memoria~21_q\) ) ) # ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\ & ( (\U2|U2|memoria~21_q\ & 
-- !\U2|U2|memoria~14DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U2|ALT_INV_memoria~21_q\,
	datad => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	combout => \U2|U4|MX_OUT[6]~10_combout\);

-- Location: LABCELL_X40_Y41_N0
\U2|U1|U2|U1|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~6_combout\ = ( \U2|U4|MX_OUT[6]~10_combout\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(9))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (!\U1|WideOr7~0_combout\ $ (((!\U1|WideOr8~0_combout\))))) ) ) # ( !\U2|U4|MX_OUT[6]~10_combout\ 
-- & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(9))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (((\U1|WideOr8~0_combout\)) # (\U1|WideOr7~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101101011111000110110101111100011011010011100001101101001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	datab => \U1|ALT_INV_WideOr7~0_combout\,
	datac => \U2|U1|U2|U1|ALT_INV_IQ\(9),
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U2|U4|ALT_INV_MX_OUT[6]~10_combout\,
	combout => \U2|U1|U2|U1|IQ~6_combout\);

-- Location: LABCELL_X41_Y40_N27
\U2|U1|U2|U1|IQ[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ[1]~1_combout\ = ( \U2|U1|U1|Sreg.transmissao~q\ ) # ( !\U2|U1|U1|Sreg.transmissao~q\ & ( \U2|U1|U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|U1|ALT_INV_Sreg.transmissao~q\,
	combout => \U2|U1|U2|U1|IQ[1]~1_combout\);

-- Location: FF_X40_Y41_N1
\U2|U1|U2|U1|IQ[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~6_combout\,
	clrn => \U1|Sreg.inicial~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(8));

-- Location: LABCELL_X39_Y41_N15
\U2|U4|MX_OUT[5]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[5]~9_combout\ = ( \U2|U2|memoria~20_q\ & ( (!\U2|U2|memoria~14DUPLICATE_q\) # (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\) ) ) # ( !\U2|U2|memoria~20_q\ & ( (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\ & 
-- \U2|U2|memoria~14DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	datad => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	dataf => \U2|U2|ALT_INV_memoria~20_q\,
	combout => \U2|U4|MX_OUT[5]~9_combout\);

-- Location: LABCELL_X40_Y41_N12
\U2|U1|U2|U1|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~5_combout\ = ( \U2|U4|MX_OUT[5]~9_combout\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (\U2|U1|U2|U1|IQ\(8))) # (\U2|U1|U1|Sreg.preparacao~q\ & ((!\U1|WideOr7~0_combout\ $ (!\U1|WideOr8~0_combout\)))) ) ) # ( !\U2|U4|MX_OUT[5]~9_combout\ & ( 
-- (!\U2|U1|U1|Sreg.preparacao~q\ & (\U2|U1|U2|U1|IQ\(8))) # (\U2|U1|U1|Sreg.preparacao~q\ & (((\U1|WideOr8~0_combout\) # (\U1|WideOr7~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011101110111001001110111011100100111011100100010011101110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	datab => \U2|U1|U2|U1|ALT_INV_IQ\(8),
	datac => \U1|ALT_INV_WideOr7~0_combout\,
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U2|U4|ALT_INV_MX_OUT[5]~9_combout\,
	combout => \U2|U1|U2|U1|IQ~5_combout\);

-- Location: FF_X40_Y41_N14
\U2|U1|U2|U1|IQ[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~5_combout\,
	clrn => \U1|Sreg.inicial~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(7));

-- Location: LABCELL_X39_Y41_N9
\U2|U4|MX_OUT[4]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[4]~8_combout\ = ( \U2|U2|memoria~19_q\ & ( (!\U2|U2|memoria~14DUPLICATE_q\) # (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\) ) ) # ( !\U2|U2|memoria~19_q\ & ( (\U2|U2|memoria~14DUPLICATE_q\ & 
-- \U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	datad => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	dataf => \U2|U2|ALT_INV_memoria~19_q\,
	combout => \U2|U4|MX_OUT[4]~8_combout\);

-- Location: LABCELL_X40_Y41_N27
\U2|U1|U2|U1|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~4_combout\ = ( \U2|U4|MX_OUT[4]~8_combout\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(7))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (!\U1|WideOr7~0_combout\ $ ((!\U1|WideOr8~0_combout\)))) ) ) # ( !\U2|U4|MX_OUT[4]~8_combout\ & ( 
-- (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(7))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (((\U1|WideOr8~0_combout\)) # (\U1|WideOr7~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101110111000011110111011100001111011001100000111101100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U1|ALT_INV_WideOr8~0_combout\,
	datac => \U2|U1|U2|U1|ALT_INV_IQ\(7),
	datad => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U4|ALT_INV_MX_OUT[4]~8_combout\,
	combout => \U2|U1|U2|U1|IQ~4_combout\);

-- Location: FF_X40_Y41_N29
\U2|U1|U2|U1|IQ[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~4_combout\,
	clrn => \U1|Sreg.inicial~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(6));

-- Location: FF_X40_Y41_N16
\U2|U1|U2|U1|IQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U4|MX_OUT[3]~3_wirecell_combout\,
	asdata => \U2|U1|U2|U1|IQ\(6),
	clrn => \U1|Sreg.inicial~q\,
	sload => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(5));

-- Location: LABCELL_X39_Y41_N33
\U2|U4|MX_OUT[2]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[2]~7_combout\ = ( \U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ & ( (\U2|U2|memoria~14DUPLICATE_q\) # (\U2|U2|memoria~17_q\) ) ) # ( !\U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\ & ( (\U2|U2|memoria~17_q\ & 
-- !\U2|U2|memoria~14DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2|U2|ALT_INV_memoria~17_q\,
	datac => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	dataf => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	combout => \U2|U4|MX_OUT[2]~7_combout\);

-- Location: LABCELL_X40_Y41_N3
\U2|U1|U2|U1|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~3_combout\ = ( \U2|U4|MX_OUT[2]~7_combout\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(5))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (\U1|WideOr7~0_combout\ & ((!\U1|WideOr8~0_combout\)))) ) ) # ( !\U2|U4|MX_OUT[2]~7_combout\ & ( 
-- (!\U2|U1|U1|Sreg.preparacao~q\ & ((\U2|U1|U2|U1|IQ\(5)))) # (\U2|U1|U1|Sreg.preparacao~q\ & (\U1|WideOr7~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000010100001101100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	datab => \U1|ALT_INV_WideOr7~0_combout\,
	datac => \U2|U1|U2|U1|ALT_INV_IQ\(5),
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U2|U4|ALT_INV_MX_OUT[2]~7_combout\,
	combout => \U2|U1|U2|U1|IQ~3_combout\);

-- Location: FF_X40_Y41_N4
\U2|U1|U2|U1|IQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~3_combout\,
	clrn => \U1|Sreg.inicial~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(4));

-- Location: FF_X40_Y41_N44
\U2|U1|U2|U1|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U4|MX_OUT[1]~1_wirecell_combout\,
	asdata => \U2|U1|U2|U1|IQ\(4),
	clrn => \U1|Sreg.inicial~q\,
	sload => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(3));

-- Location: LABCELL_X40_Y41_N18
\U2|U1|U2|U1|IQ~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~8_combout\ = ( !\U2|U2|memoria~14_q\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(3))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (\U1|WideOr7~0_combout\ & (((!\U2|U2|memoria~15_q\) # (!\U1|WideOr8~0_combout\))))) ) ) # ( 
-- \U2|U2|memoria~14_q\ & ( (!\U2|U1|U1|Sreg.preparacao~q\ & (((\U2|U1|U2|U1|IQ\(3))))) # (\U2|U1|U1|Sreg.preparacao~q\ & (\U1|WideOr7~0_combout\ & (((!\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\) # (!\U1|WideOr8~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0011001100110011001100110011001101010101010100000101010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U2|U1|U2|U1|ALT_INV_IQ\(3),
	datac => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	datae => \U2|U2|ALT_INV_memoria~14_q\,
	dataf => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	datag => \U2|U2|ALT_INV_memoria~15_q\,
	combout => \U2|U1|U2|U1|IQ~8_combout\);

-- Location: FF_X40_Y41_N19
\U2|U1|U2|U1|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~8_combout\,
	clrn => \U1|Sreg.inicial~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(2));

-- Location: LABCELL_X41_Y41_N21
\U2|U1|U2|U1|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~2_combout\ = ( \U2|U1|U2|U1|IQ\(2) ) # ( !\U2|U1|U2|U1|IQ\(2) & ( \U2|U1|U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|U2|U1|ALT_INV_IQ\(2),
	combout => \U2|U1|U2|U1|IQ~2_combout\);

-- Location: FF_X40_Y41_N47
\U2|U1|U2|U1|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U2|U1|U2|U1|IQ~2_combout\,
	clrn => \U1|Sreg.inicial~q\,
	sload => VCC,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(1));

-- Location: LABCELL_X41_Y41_N54
\U2|U1|U2|U1|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U1|U2|U1|IQ~0_combout\ = ( \U2|U1|U2|U1|IQ\(1) & ( !\U2|U1|U1|Sreg.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U2|U1|U1|ALT_INV_Sreg.preparacao~q\,
	dataf => \U2|U1|U2|U1|ALT_INV_IQ\(1),
	combout => \U2|U1|U2|U1|IQ~0_combout\);

-- Location: FF_X41_Y41_N55
\U2|U1|U2|U1|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2|U1|U2|U1|IQ~0_combout\,
	clrn => \U1|Sreg.inicial~q\,
	ena => \U2|U1|U2|U1|IQ[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|U1|U2|U1|IQ\(0));

-- Location: LABCELL_X41_Y41_N24
\U1|WideNor1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1|WideNor1~combout\ = ( \U1|Sreg.final~q\ ) # ( !\U1|Sreg.final~q\ & ( !\U1|Sreg.inicial~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111111111111111111111000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U1|ALT_INV_Sreg.inicial~q\,
	datae => \U1|ALT_INV_Sreg.final~q\,
	combout => \U1|WideNor1~combout\);

-- Location: LABCELL_X41_Y41_N57
\U2|U4|MX_OUT[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[0]~0_combout\ = ( \U2|U2|memoria~14_q\ & ( (!\U1|WideOr7~0_combout\) # ((\U2|U2|memoria_rtl_0|auto_generated|ram_block1a0~portbdataout\ & \U1|WideOr8~0_combout\)) ) ) # ( !\U2|U2|memoria~14_q\ & ( (!\U1|WideOr7~0_combout\) # 
-- ((\U2|U2|memoria~15_q\ & \U1|WideOr8~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110011111100001111001111110000111101011111000011110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	datab => \U2|U2|ALT_INV_memoria~15_q\,
	datac => \U1|ALT_INV_WideOr7~0_combout\,
	datad => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U2|U2|ALT_INV_memoria~14_q\,
	combout => \U2|U4|MX_OUT[0]~0_combout\);

-- Location: LABCELL_X41_Y41_N15
\U2|U4|MX_OUT[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[2]~2_combout\ = ( \U2|U2|memoria~14_q\ & ( (!\U1|WideOr7~0_combout\) # ((\U1|WideOr8~0_combout\ & \U2|U2|memoria_rtl_0|auto_generated|ram_block1a2\)) ) ) # ( !\U2|U2|memoria~14_q\ & ( (!\U1|WideOr7~0_combout\) # ((\U1|WideOr8~0_combout\ & 
-- \U2|U2|memoria~17_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110101111100001111010111110001111100011111000111110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr8~0_combout\,
	datab => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	datac => \U1|ALT_INV_WideOr7~0_combout\,
	datad => \U2|U2|ALT_INV_memoria~17_q\,
	dataf => \U2|U2|ALT_INV_memoria~14_q\,
	combout => \U2|U4|MX_OUT[2]~2_combout\);

-- Location: LABCELL_X40_Y41_N9
\U2|U4|MX_OUT[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[4]~4_combout\ = ( \U2|U2|memoria~19_q\ & ( (!\U1|WideOr7~0_combout\ & (((!\U1|WideOr8~0_combout\)))) # (\U1|WideOr7~0_combout\ & (\U1|WideOr8~0_combout\ & ((!\U2|U2|memoria~14_q\) # (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\)))) ) ) 
-- # ( !\U2|U2|memoria~19_q\ & ( (!\U1|WideOr7~0_combout\ & (((!\U1|WideOr8~0_combout\)))) # (\U1|WideOr7~0_combout\ & (\U2|U2|memoria~14_q\ & (\U1|WideOr8~0_combout\ & \U2|U2|memoria_rtl_0|auto_generated|ram_block1a4\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100001101000001010000110100100101001011010010010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U2|U2|ALT_INV_memoria~14_q\,
	datac => \U1|ALT_INV_WideOr8~0_combout\,
	datad => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	dataf => \U2|U2|ALT_INV_memoria~19_q\,
	combout => \U2|U4|MX_OUT[4]~4_combout\);

-- Location: LABCELL_X39_Y42_N15
\U2|U4|MX_OUT[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[5]~5_combout\ = ( \U1|WideOr8~0_combout\ & ( \U1|WideOr7~0_combout\ & ( (!\U2|U2|memoria~14DUPLICATE_q\ & ((\U2|U2|memoria~20_q\))) # (\U2|U2|memoria~14DUPLICATE_q\ & (\U2|U2|memoria_rtl_0|auto_generated|ram_block1a5\)) ) ) ) # ( 
-- !\U1|WideOr8~0_combout\ & ( !\U1|WideOr7~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	datac => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	datad => \U2|U2|ALT_INV_memoria~20_q\,
	datae => \U1|ALT_INV_WideOr8~0_combout\,
	dataf => \U1|ALT_INV_WideOr7~0_combout\,
	combout => \U2|U4|MX_OUT[5]~5_combout\);

-- Location: LABCELL_X40_Y41_N45
\U2|U4|MX_OUT[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2|U4|MX_OUT[6]~6_combout\ = ( \U2|U2|memoria~14DUPLICATE_q\ & ( (!\U1|WideOr7~0_combout\ & (!\U1|WideOr8~0_combout\)) # (\U1|WideOr7~0_combout\ & (\U1|WideOr8~0_combout\ & \U2|U2|memoria_rtl_0|auto_generated|ram_block1a6\)) ) ) # ( 
-- !\U2|U2|memoria~14DUPLICATE_q\ & ( (!\U1|WideOr7~0_combout\ & (!\U1|WideOr8~0_combout\)) # (\U1|WideOr7~0_combout\ & (\U1|WideOr8~0_combout\ & \U2|U2|memoria~21_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010011001100010001001100110001001100010011000100110001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1|ALT_INV_WideOr7~0_combout\,
	datab => \U1|ALT_INV_WideOr8~0_combout\,
	datac => \U2|U2|memoria_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	datad => \U2|U2|ALT_INV_memoria~21_q\,
	dataf => \U2|U2|ALT_INV_memoria~14DUPLICATE_q\,
	combout => \U2|U4|MX_OUT[6]~6_combout\);

-- Location: LABCELL_X41_Y32_N3
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

