Library IEEE;
use IEEE.std_logic_1164.all ;

entity FIFO is
  
  Generic(
    FIFO_WIDTH : integer := 8;
    FIFO_DEPTH : integer := 16
    );

  Port(
    reset : in std_logic;
    clk   : in std_logic;
    
    din   : in std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
    dout  : out std_logic_vector(FIFO_WIDTH-1 DOWNTO 0); --parola in uscita
    
    rd_en : in std_logic; --quando espellere
    wr_en : in std_logic; --quando memorizzare
    full  : out std_logic; --quando memoria piena ( non posso memorizzare)
    empty : out std_logic  --quando memoria vuota ( non posso espellere ) 
    );

end FIFO;

architecture Behavioral of FIFO is
  
begin

end Behavioral;
