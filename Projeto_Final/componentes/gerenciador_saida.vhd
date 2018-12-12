library IEEE;
use IEEE.std_logic_1164.all;

entity gerenciador_saida is
  port (
    clock, reset                                   : in std_logic;
    campo_local, campo_adv, msg                    : in std_logic;
    en_campo_local, en_campo_adv, en_msg           : in std_logic;
    saida_serial_terminal, saida_serial_adversario : out std_logic
  );
end gerenciador_saida;

architecture gerenciador_s_arch of gerenciador_saida is
  signal en_cp, en_ca, en_msg : std_logic;
  
  component registrador_jk is
    port( J,K: in  std_logic;
          Reset: in std_logic;
          Clock_enable: in std_logic;
          Clock: in std_logic;
          Q: out std_logic);
  end component;
  
  

begin

  EN_CP: registrador_jk port map (en_campo_local, reset, reset, '1', clock, en_cp);
  EN_CA: registrador_jk port map (en_campo_adversario, reset, reset, '1', clock, en_ca);
  EN_MSG: registrador_jk port map (en_msg, reset, reset, '1', clock, en_msg);

  saida_serial_terminal <= (campo_local and en_cp) or (campo_adv and en_ca);
  saida_serial_adversario <= en_msg and msg;

end gerenciador_s_arch ; -- gerenciador_s_arch