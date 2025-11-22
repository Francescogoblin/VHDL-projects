library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_register is
    Port (
        clk   : in  std_logic;
        reset : in  std_logic;
        d     : in  std_logic_vector;
        q     : out std_logic_vector
    );
end my_register;

architecture Behavioral of my_register is
  
    signal n1 : std_logic_vector;  -- creo segnale di supporto

begin

    process(clk, reset)
    begin
        if reset = '1' then
            reg <= (Others => '0');          -- azzera il registro
        elsif rising_edge(clk) then
            reg <= d;                        -- carica il valore in ingresso
        end if;
    end process;

    q <= reg;  -- uscita
      
end beh;
