library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity BatalhaNaval is
  port (clock, reset : in std_logic;
			entrada_serial : in std_logic;
			saida_serial : out std_logic;
			
			inicia : in std_logic;
    HEX5_Jogada                 : out std_logic_vector (6 downto 0);
    HEX4_Jogada                 : out std_logic_vector (6 downto 0);
    HEX3_Resultado              : out std_logic_vector (6 downto 0);
end BatalhaNaval;

architecture BatalhaNavalArch of BatalhaNaval is

	component BatalhaNaval_fd is
		port(	clock, reset : in std_logic;
				entrada_serial : in std_logic;
				
				enableRecJog, enableEnvMen, enableRecMen, enableOpCam : in std_logic;
				
				end1, end0 : out std_logic_vector(2 DOWNTO 0);
				menRec : out std_logic_vector(6 downto 0);
				saida_serial : out std_logic;
				
				prontoRecJog, prontoEnvMen, prontoRecMen, prontoOpCam : out std_logic);
	end component;

	component BatalhaNaval_uc is
		port(	
			clock, reset, pronto 					: in  std_logic;
			iniciou 										: in  std_logic;
			enable_r_m, enable_r_j, enable_e_m	: out std_logic;
			mensagem_sel										: out std_logic_vector(2 downto 0)
	);
				
	end component;

	signal s_enableRecJog, s_enableRecMen, s_enableEnvMen, s_enableOpCam : std_logic;
	signal s_prontoRecJog, s_prontoEnvMen, s_prontoRecMen, s_prontoOpCam : std_logic;
	signal s_prontos : std_logic;

begin
	FD : BatalhaNaval_fd
		port map(clock, reset,
					entrada_serial,
					
					s_enableRecJog, s_enableRecMen, s_enableEnvMen, s_enableOpCam,
					
					end1, end0,
					menRec,
					saida_serial,
					
					s_prontoRecJog, s_prontoEnvMen, s_prontoRecMen, s_prontoOpCam);
	UC : BatalhaNaval_uc
		port map(clock reset, s_prontos, inicia, s_enableRecMen, s_enableRecJog, s_enableEnvMen, open, open);
				
end BatalhaNavalArch ; -- BatalhaNavalArch