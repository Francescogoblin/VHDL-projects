library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is

    Port (
    
    op_sel : in std_logic_vector(1 DOWNTO 0);
    a : in  signed(7 DOWNTO 0);
    b : in  signed(7 DOWNTO 0);
    c : out signed(7 DOWNTO 0)

          );

end ALU;

architecture Behavioral of ALU is

      signal add, sub : signed(7 DOWNTO 0);
      signal mul      : signed(15 DOWNTO 0);
      
begin

    add <= a + b;
    sub <= a - b;
    mul <= a * b;
    
    with op_sel select c <= add when "00",
                            sub when "01",
                            mul(c'RANGE) when "10",
                            (Others => '0') when "11";
end Behavioral;
