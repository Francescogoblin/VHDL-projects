library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
  
  Port (
    
     a_fa      : in    std_logic; 
     b_fa      : in    std_logic;
     c_in_fa   : in    std_logic;
     sum_fa    : out   std_logic;
     c_out_fa  : out   std_logic 

  );
    
end full_adder;

architecture Behavioral of full_adder is
  signal sig_c_out1  : std_logic;
  signal sig_c_out2  : std_logic;
  signal sig_sum     : std_logic;

  component half_adder is
    
    Port (
       a       : in  std_logic;
       b       : in  std_logic;
       sum     : out std_logic;
       c_out   : out std_logic
     );
    
  end component;

begin
  
  ha_inst1: half_adder
    
    port map(
      a => a_fa,
      b => b_fa,
      sum => sig_sum,
      c_out => sig_c_out1
    );
    
    ha_inst2: half_adder
      port map(
        a => sig_sum,
        b => c_in_fa,
        sum => sum_fa,
        c_out => sig_c_out2
      );

      c_out_fa <= sig_c_out1 or sig_c_out2;

end Behavioral;
