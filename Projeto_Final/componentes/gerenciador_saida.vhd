entity gerenciador_saida is
  port (
    clock, reset                                   : in std_logic;
    campo_local, campo_adv, msg                    : in std_logic;
    en_campo_local, en_campo_adv, en_msg           : in std_logic;
    saida_serial_terminal, saida_serial_adversario : out std_logic
  );
end gerenciador_saida;
