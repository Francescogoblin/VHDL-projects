Library IEEE;
use IEEE.std_logic_1164.all;

entity EdgeDetector is
  Port( 
    clk : in std_logic;
    reset : in std_logic;

    signal_in : in std_logic;
    upEdge    : out std_logic;
    downEdge  : out std_logic;
    );
end EdgeDetector;

  architecture Behavioral of EdgeDetector is

    begin


end Behavioral;
  
