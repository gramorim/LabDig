library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity BatalhaNaval is
	generic( constant ratio 		: integer := 434;
				constant log2_ratio 	: integer := 9);
  port (clock, reset : in std_logic;
		entrada_serial : in std_logic;
		saida_serial : out std_logic;
		
		inicia : in std_logic;
		HEX5_Jogada                 : out std_logic_vector (6 downto 0);
		HEX4_Jogada                 : out std_logic_vector (6 downto 0);
		HEX3_Resultado              : out std_logic_vector (6 downto 0);
			
			o_estado : out std_logic_vector(3 downto 0)
  );
end BatalhaNaval;

architecture BatalhaNavalArch of BatalhaNaval is

	component BatalhaNaval_fd is
	generic( constant ratio 		: integer;
				constant log2_ratio 	: integer);
		port(	clock, reset : in std_logic;
				entrada_serial : in std_logic;
				
				enableRecJog, enableEnvMen, enableRecMen, enableOpCam : in std_logic;
				i_mensagem : in std_logic_vector(2 downto 0);
				
				end1, end0 : out std_logic_vector(6 DOWNTO 0);
				menRec : out std_logic_vector(6 downto 0);
				saida_serial : out std_logic;
				
				prontoRecJog, prontoEnvMen, prontoRecMen, prontoOpCam : out std_logic);
	end component;

	component BatalhaNaval_uc is
		port(	
			clock, reset, pronto 					: in  std_logic;
			iniciou 										: in  std_logic;
			enable_r_m, enable_r_j, enable_e_m	: out std_logic;
			mensagem_sel										: out std_logic_vector(2 downto 0);
			
			o_estado : out std_logic_vector(3 downto 0)
	);
				
	end component;

	component ascii_to_7seg is

		port ( jogada_linha, jogada_coluna: in std_logic_vector(6 downto 0);
			linha, coluna: out std_logic_vector (6 downto 0) 
	 	);
	  
	  
	end component;

	signal s_enableRecJog, s_enableRecMen, s_enableEnvMen, s_enableOpCam : std_logic;
	signal s_prontoRecJog, s_prontoEnvMen, s_prontoRecMen, s_prontoOpCam : std_logic;
	signal s_prontos : std_logic;
	signal s_mensagem_sel : std_logic_vector(2 downto 0);
	signal s_jogada_linha, s_jogada_coluna, s_menRec : std_logic_vector(6 downto 0);
begin
  s_prontos <= s_prontoRecJog or s_prontoEnvMen or s_prontoRecMen;
	FD : BatalhaNaval_fd
		generic map(ratio,log2_ratio)
		port map(clock, NOT reset,
					entrada_serial,
					
					s_enableRecJog, s_enableRecMen, s_enableEnvMen, s_enableOpCam,
					s_mensagem_sel,
					
					s_jogada_linha, 
					s_jogada_coluna,
					s_menRec,
					saida_serial,
					
          s_prontoRecJog, s_prontoEnvMen, s_prontoRecMen, s_prontoOpCam
    );
          
	UC : BatalhaNaval_uc
		port map(clock, NOT reset, 
					s_prontos, 
					NOT inicia, 
					s_enableRecMen, s_enableRecJog, s_enableEnvMen, s_mensagem_sel,
					o_estado);
	
	U1: ascii_to_7seg
		port map(s_jogada_linha, s_jogada_coluna, HEX5_Jogada, HEX4_Jogada);
	
	Umen: ascii_to_7seg
		port map(s_menRec, s_menRec, open, HEX3_Resultado);
	
end BatalhaNavalArch ; -- BatalhaNavalArch